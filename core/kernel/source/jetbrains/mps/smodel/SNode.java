/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.smodel;

import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ModuleId;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.language.ConceptRegistry;
import jetbrains.mps.smodel.runtime.PropertyConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.ReferenceConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.illegal.IllegalReferenceConstraintsDescriptor;
import jetbrains.mps.smodel.search.SModelSearchUtil;
import jetbrains.mps.util.*;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.util.annotation.UseCarefully;
import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

public final class SNode {
  private static final Logger LOG = Logger.getLogger(SNode.class);

  @Deprecated
  public static final String PACK = SNodeUtil.property_BaseConcept_virtualPackage;

  public static final SNode[] EMPTY_ARRAY = new SNode[0];

  private static NodeMemberAccessModifier ourMemberAccessModifier = null;

  private static ThreadLocal<Set<Pair<SNode, String>>> ourPropertySettersInProgress = new InProgressThreadLocal();
  private static ThreadLocal<Set<Pair<SNode, String>>> ourPropertyGettersInProgress = new InProgressThreadLocal();
  private static ThreadLocal<Set<Pair<SNode, String>>> ourSetReferentEventHandlersInProgress = new InProgressThreadLocal();
  private static final String[] EMPTY_STRING_ARRAY = new String[0];

  public static void setNodeMemberAccessModifier(NodeMemberAccessModifier modifier) {
    ourMemberAccessModifier = modifier;
  }

  private String myRoleInParent;
  private SNode myParent;

  /**
   * access only in getFirstChild()
   */
  private SNode myFirstChild;

  private SNode myNextSibling;  // == null only for the last child in the list
  private SNode myPrevSibling;  // notNull, myFirstChild.myPrevSibling = the last child
  private SReference[] myReferences = SReference.EMPTY_ARRAY;

  private String[] myProperties = null;

  private boolean myDisposed = false;
  private boolean myRegisteredInModelFlag;
  private SModel myModel;
  private SNodeId myId;

  private Object[] myUserObjects; // key,value,key,value ; !copy-on-write

  @NotNull
  private String myConceptFqName;

  private BaseAdapter myAdapter;

  public SNode(SModel model, @NotNull String conceptFqName, boolean callIntern) {
    myModel = model;
    if (callIntern) {
      myConceptFqName = InternUtil.intern(conceptFqName);
    } else {
      myConceptFqName = conceptFqName;
    }
  }

  public SNode(SModel model, String conceptFqName) {
    this(model, conceptFqName, true);
  }

  @CodeOrchestraPatch
  public IModule getSourceModule() {
    String sourceModuleUID = getSourceModuleUID();
    if (StringUtils.isNotEmpty(sourceModuleUID)) {
      ModuleId moduleId = ModuleId.fromString(sourceModuleUID);
      IModule moduleByID = MPSModuleRepository.getInstance().getModuleById(moduleId);
      if (moduleByID != null) {
        return moduleByID;
      }
    }

    SModel model = getModel();
    if (model != null) {
      SModelDescriptor modelDescriptor = model.getModelDescriptor();
      if (modelDescriptor != null) {
        return modelDescriptor.getModule();
      }
    }

    return null;
  }

  @CodeOrchestraPatch
  public String getSourceModuleUID() {
    Set<String> sourceModuleUIDs = getSourceModuleUIDs();
    if (sourceModuleUIDs.isEmpty()) {
      return null;
    }
    return sourceModuleUIDs.iterator().next();
  }

  @CodeOrchestraPatch
  public void clearSourceModuleUIDs() {
    setProperty(SNodeUtil.property_sourceModule, "");
  }

  @CodeOrchestraPatch
  public void addSourceModuleUID(String newUID) {
    Set<String> uids = new HashSet<String>();

    // Unserialize
    String uidsInOneString = getProperty(SNodeUtil.property_sourceModule);
    if (StringUtils.isNotEmpty(uidsInOneString)) {
      String[] uidsArray = StringUtils.split(uidsInOneString, ",");
      for (String persistentUID : uidsArray) {
        uids.add(persistentUID);
      }
    }

    // Serialize
    uids.add(newUID);
    setProperty(SNodeUtil.property_sourceModule, StringUtils.join(uids, ","));
  }

  @CodeOrchestraPatch
  @NotNull
  public Set<String> getSourceModuleUIDs() {
    Set<String> uids = new HashSet<String>();

    String uidsInOneString = getProperty(SNodeUtil.property_sourceModule);
    if (StringUtils.isNotEmpty(uidsInOneString)) {
      String[] uidsArray = StringUtils.split(uidsInOneString, ",");
      for (String uid : uidsArray) {
        uids.add(uid);
      }
    }

    return uids;
  }

  public void changeModel(SModel newModel) {
    if (myModel == newModel) return;
    LOG.assertLog(!isRegistered(), "couldn't change model of registered node " + getDebugText());

    SModel wasModel = myModel;
    myModel = newModel;
    ModelChangedCaster.getInstance().fireModelChanged(this, wasModel);

    for (SNode child = getFirstChild(); child != null; child = child.myNextSibling) {
      child.changeModel(newModel);
    }
  }

  public boolean isRoot() {
    return myRegisteredInModelFlag && myParent == null && myModel.isRoot(this);
  }

  public void addNextSibling(SNode newSibling) {
    myParent.insertChild(this, myRoleInParent, newSibling);
  }

  public void addPrevSibling(SNode newSibling) {
    myParent.insertChild(this, myRoleInParent, newSibling, true);
  }

  public SModel getModel() {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    return myModel;
  }

  //MUST NOT be used,except from ModelAccess

  SModel getModelInternal() {
    return myModel;
  }

  public SModel getModelInternal_() {
    return myModel;
  }

  public boolean isModelLoading() {
    return myModel.isLoading();
  }

  public String getRoleOf(SNode node) {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    fireNodeUnclassifiedReadAccess();
    if (node.getParent() == this) {
      String role = node.getRole_();
      assert role != null;
      return role;
    }
    if (myReferences != null) {
      for (SReference reference : myReferences) {
        if (reference.getTargetNode() == node) return reference.getRole();
      }
    }

    return "<no role>";
  }

  public Set<String> getChildRoles(boolean includeAttributeRoles) {
    return addChildRoles(new HashSet<String>(), includeAttributeRoles);
  }

  public Set<String> addChildRoles(final Set<String> augend, boolean includeAttributeRoles) {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    fireNodeUnclassifiedReadAccess();

    for (SNode child = getFirstChild(); child != null; child = child.myNextSibling) {
      String roleOf = child.getRole_();
      assert roleOf != null;
      if (includeAttributeRoles || !(AttributeOperations.isAttribute(child))) {
        augend.add(roleOf);
      }
    }
    return augend;
  }

  public Set<String> getChildRoles() {
    return getChildRoles(false);
  }

  public Set<String> addChildRoles(final Set<String> augend) {
    return addChildRoles(augend, false);
  }

  public Set<String> getReferenceRoles() {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    Set<String> result = new HashSet<String>();
    if (myReferences != null) {
      for (SReference ref : myReferences) {
        result.add(ref.getRole());
      }
    }
    result.addAll(AttributeOperations.getLinkNamesFromAttributes(this));
    return result;
  }

  public boolean isAncestorOf(SNode child) {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    if (child == this) return true;
    SNode parentOfChild = child.getParent();
    if (parentOfChild == null) return false;
    return isAncestorOf(parentOfChild);
  }

  @NotNull
  public final SNode getTopmostAncestor() {
    SNode current = this;
    while (current.myParent != null) {
      assert current != current.myParent;
      current = current.myParent;
    }
    return current;
  }

  public SNode getContainingRoot() {
    ModelAccess.assertLegalRead(this);

    SNode current = this;

    while (true) {
      current.fireNodeReadAccess();
      if (current.myParent == null) {
        if (getModel().isRoot(current)) {
          return current;
        } else {
          return null;
        }
      } else {
        current = current.myParent;
      }
    }
  }

  public List<SNode> getAncestors(boolean includeThis) {
    List<SNode> result = new ArrayList<SNode>();
    if (includeThis) {
      result.add(this);
    }
    if (myParent != null) {
      result.addAll(myParent.getAncestors(true));
    }
    return result;
  }

  public void replaceChild(SNode oldChild, SNode newChild) {
    SNode anchor = oldChild == getFirstChild() ? null : oldChild.myPrevSibling;
    String role = oldChild.getRole_();
    assert role != null;
    // old and new child can have the same node Id
    // thus it is important to remove old child first  
    removeChild(oldChild);
    insertChild(anchor, role, newChild);
  }

  public void replaceChild(SNode oldChild, List<SNode> newChildren) {
    assert oldChild.myParent == this;
    String oldChildRole = oldChild.getRole_();
    assert oldChildRole != null;
    SNode prevChild = oldChild;
    for (SNode newChild : newChildren) {
      insertChild(prevChild, oldChildRole, newChild);
      prevChild = newChild;
    }
    removeChild(oldChild);
  }

  public void setName(String name) {
    setProperty(SNodeUtil.property_INamedConcept_name, name);
  }

  public String getName() {
    return getProperty(SNodeUtil.property_INamedConcept_name);
  }

  public String getResolveInfo() {
    String resolveInfo = SNodeUtil.getResolveInfo(this);
    if (resolveInfo != null) {
      return resolveInfo;
    }
    // tmp hack
    return getPersistentProperty(SNodeUtil.property_INamedConcept_name);
  }

  public String getRole_() {
    return myRoleInParent;
  }

  public SNode getRoleLink() {
    if (getRole_() == null) return null;
    if (getParent() == null) return null;
    return getParent().getLinkDeclaration(getRole_());
  }

  public Map<String, String> getProperties() {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    if (myProperties == null) return Collections.emptyMap();
    return new PropertiesMap(myProperties);
  }

  public void putProperties(SNode fromNode) {
    ModelChange.assertLegalNodeChange(this);

    if (fromNode == null || fromNode.myProperties == null) return;

    String[] addedProps = fromNode.myProperties;
    String[] oldProperties = myProperties == null ? EMPTY_STRING_ARRAY : myProperties;
    myProperties = new String[oldProperties.length + addedProps.length];
    System.arraycopy(oldProperties, 0, myProperties, 0, oldProperties.length);
    System.arraycopy(addedProps, 0, myProperties, oldProperties.length, addedProps.length);
  }

  public Set<String> getPropertyNames() {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    Set<String> result = AttributeOperations.getPropertyNamesFromAttributes(this);
    if (myProperties != null) {
      for (int i = 0; i < myProperties.length; i += 2) {
        result.add(myProperties[i]);
      }
    }
    return result;
  }

  public boolean getBooleanProperty(String propertyName) {
    String value = getProperty(propertyName);
    return "true".equals(value);
  }

  public void setBooleanProperty(String propertyName, boolean value) {
    setProperty(propertyName, value ? "" + value : null);
  }

  public int getIntegerProperty(String propertyName) {
    String value = getProperty(propertyName);
    try {
      return Integer.parseInt(value);
    } catch (Exception e) {
      return 0;
    }
  }

  public void setIntegerProperty(String propertyName, int value) {
    setProperty(propertyName, "" + value);
  }

  public final boolean hasProperty(String propertyName) {
    ModelAccess.assertLegalRead(this);

    NodeReadAccessCasterInEditor.firePropertyReadAccessed(this, propertyName, true);
    String property_internal = getProperty_internal(propertyName);
    return !SModelUtil_new.isEmptyPropertyValue(property_internal);
  }

  public final String getProperty(String propertyName) {
    ModelAccess.assertLegalRead(this);

    NodeReadAccessCasterInEditor.firePropertyReadAccessed(this, propertyName, false);

    try {
      String propertyValue = getProperty_internal(propertyName);
      NodeReadEventsCaster.fireNodePropertyReadAccess(this, propertyName, propertyValue);
      return propertyValue;
    } catch (Throwable t) {
      LOG.error(t);
      return getPersistentProperty(propertyName);
    }
  }

  private String getProperty_internal(String propertyName) {
    Set<Pair<SNode, String>> getters = ourPropertyGettersInProgress.get();
    Pair<SNode, String> current = new Pair<SNode, String>(this, propertyName);
    if (getters.contains(current)) return getPersistentProperty(propertyName);

    getters.add(current);
    try {
      PropertyConstraintsDescriptor descriptor = ConceptRegistry.getInstance().getConstraintsDescriptor(this.getConceptFqName()).getProperty(propertyName);
      Object getterValue = descriptor.getValue(this, GlobalScope.getInstance());
      return getterValue == null ? null : String.valueOf(getterValue);
    } finally {
      getters.remove(current);
    }
  }

  public String getPersistentProperty(String propertyName) {
    if (myProperties == null) return null;
    if (ourMemberAccessModifier != null) {
      propertyName = ourMemberAccessModifier.getNewPropertyName(myModel, myConceptFqName, propertyName);
    }
    return getProperty_simple(propertyName);
  }

  private String getProperty_simple(String propertyName) {
    int index = getPropertyIndex(propertyName);
    if (index == -1) return null;
    return myProperties[index + 1];
  }

  private int getPropertyIndex(String propertyName) {
    if (myProperties == null) return -1;
    for (int i = 0; i < myProperties.length; i += 2) {
      if (ObjectUtils.equals(myProperties[i], propertyName)) return i;
    }
    return -1;
  }

  void changePropertyName(String oldPropertyName, String newPropertyName) {
    //todo make undo?
    if (myProperties == null) return;
    int index = getPropertyIndex(oldPropertyName);
    if (index == -1) return;
    myProperties[index] = newPropertyName;
  }

  public void setProperty(final String propertyName, String propertyValue) {
    setProperty(propertyName, propertyValue, true);
  }

  public void setProperty(String propertyName, String propertyValue, boolean usePropertySetter) {
    propertyName = InternUtil.intern(propertyName);
    ModelChange.assertLegalNodeChange(this);
    propertyValue = InternUtil.intern(propertyValue);
    if (usePropertySetter) {
      Set<Pair<SNode, String>> threadSet = ourPropertySettersInProgress.get();
      Pair<SNode, String> pair = new Pair<SNode, String>(this, propertyName);
      if (!threadSet.contains(pair) && !myModel.isLoading()) {
        PropertyConstraintsDescriptor descriptor = ConceptRegistry.getInstance().getConstraintsDescriptor(this.getConceptFqName()).getProperty(propertyName);
        threadSet.add(pair);
        try {
          descriptor.setValue(this, propertyValue, GlobalScope.getInstance());
          return;
        } catch (Exception t) {
          LOG.error(t);
        } finally {
          threadSet.remove(pair);
        }
      }
    }
    if (ourMemberAccessModifier != null) {
      propertyName = ourMemberAccessModifier.getNewPropertyName(myModel, myConceptFqName, propertyName);
    }
    int index = getPropertyIndex(propertyName);
    final String oldValue = index == -1 ? null : myProperties[index + 1];
    if (propertyValue == null && oldValue == null) return;

    if (propertyValue == null) {
      removeProperty(index);
    } else if (oldValue == null) {
      addProperty(propertyName, propertyValue);
    } else {
      myProperties[index + 1] = propertyValue;
    }

    if (UndoHelper.getInstance().needRegisterUndo(getModel())) {
      UndoHelper.getInstance().addUndoableAction(new PropertyChangeUndoableAction(this, propertyName, oldValue, propertyValue));
    }

    if (ModelChange.needFireEvents(getModel(), this)) {
      getModel().firePropertyChangedEvent(this, propertyName, oldValue, propertyValue);
    }
  }

  private void removeProperty(int index) {
    String[] oldProperties = myProperties;
    int newLength = oldProperties.length - 2;
    if (newLength == 0) {
      myProperties = null;
      return;
    }
    myProperties = new String[newLength];
    System.arraycopy(oldProperties, 0, myProperties, 0, index);
    System.arraycopy(oldProperties, index + 2, myProperties, index, newLength - index);
  }

  private void addProperty(String propertyName, String propertyValue) {
    String[] oldProperties = myProperties == null ? EMPTY_STRING_ARRAY : myProperties;
    myProperties = new String[oldProperties.length + 2];
    System.arraycopy(oldProperties, 0, myProperties, 0, oldProperties.length);
    myProperties[myProperties.length - 2] = propertyName;
    myProperties[myProperties.length - 1] = propertyValue;
  }

  final public SNode getParent() {
    return myParent;
  }

  private void enforceModelLoad() {
    if (!isRoot()) return;
    myModel.enforceFullLoad();
  }

  //all access to myFirstChild should be via this method
  private SNode getFirstChild() {
    enforceModelLoad();
    return myFirstChild;
  }

  public void setChild(String role, SNode childNode) {
    SNode oldChild = getChild(role);
    if (oldChild != null) {
      removeChild(oldChild);
    }
    if (childNode != null) {
      addChild(role, childNode);
    }
  }

  public SNode getChild(String role) {
    ModelAccess.assertLegalRead(this);
    if (ourMemberAccessModifier != null) {
      role = ourMemberAccessModifier.getNewChildRole(myModel, myConceptFqName, role);
    }
    fireNodeReadAccess();
    int count = 0;
    SNode foundChild = null;
    boolean isOldAttributeRole = AttributeOperations.isOldAttributeRole(role);
    for (SNode child = getFirstChild(); child != null; child = child.myNextSibling) {
      if (role.equals(child.getRole_())) {
        foundChild = child;
        count++;
      } else if (isOldAttributeRole && AttributeOperations.isOldRoleForNewAttribute(child, role)) {
        foundChild = child;
        count++;
      }
    }
    if (count > 1) {
      String errorMessage = "ERROR: " + count + " children for role " + role + " in " + NameUtil.shortNameFromLongName(getClass().getName()) + "[" + getId() + "] " + getModel().getSModelReference() + "\n";
      errorMessage += "they are : " + getChildren(role);
      LOG.error(errorMessage, this);
    }
    NodeReadEventsCaster.fireNodeChildReadAccess(this, role, foundChild);
    return foundChild;
  }

  public SNode getChildAt(int index) {
    for (SNode child = getFirstChild(); child != null; child = child.myNextSibling) {
      if (index-- == 0) {
        return child;
      }
    }
    return null;
  }

  public void addChild(String role, SNode child) {
    SNode firstChild = getFirstChild();
    insertChild(firstChild == null ? null : firstChild.myPrevSibling, role, child);
  }

  public void insertChild(SNode anchorChild, String role, SNode child, boolean insertBefore) {
    if (insertBefore) {
      insertChild(getFirstChild() == anchorChild ? null : anchorChild.myPrevSibling, role, child);
    } else {
      insertChild(anchorChild, role, child);
    }
  }

  public int getChildCount(String role) {
    if (ourMemberAccessModifier != null) {
      role = ourMemberAccessModifier.getNewChildRole(myModel, myConceptFqName, role);
    }
    int count = 0;

    boolean isOldAttributeRole = AttributeOperations.isOldAttributeRole(role);
    for (SNode child = getFirstChild(); child != null; child = child.myNextSibling) {
      if (role.equals(child.getRole_())) {
        count++;
      } else if (isOldAttributeRole && AttributeOperations.isOldRoleForNewAttribute(child, role)) {
        count++;
      }
    }
    return count;
  }

  public int getIndexOfChild(SNode child_) {
    ModelAccess.assertLegalRead(this);
    fireNodeReadAccess();
    fireNodeUnclassifiedReadAccess();

    String role_ = child_.getRole_();
    if (role_ == null) return -1;
    int count = 0;

    for (SNode child = getFirstChild(); child != null; child = child.myNextSibling) {
      if (child == child_) return count;
      if (role_.equals(child.getRole_())) {
        count++;
      }
    }
    return -1;
  }

  public List<SNode> getChildren() {
    return getChildren(true);
  }

  private List<SReference> _reference() {
    return new MyReferencesWrapper();
  }

  public Iterable<SNode> getChildrenIterable() {
    return new Iterable<SNode>() {
      public Iterator<SNode> iterator() {
        return new Iterator<SNode>() {
          private SNode current = getFirstChild();

          public boolean hasNext() {
            return current != null;
          }

          public SNode next() {
            SNode result = current;
            current = current.myNextSibling;
            return result;
          }

          public void remove() {
            throw new UnsupportedOperationException();
          }
        };
      }
    };
  }

  public List<SNode> getChildren(boolean includeAttributes) {
    ModelAccess.assertLegalRead(this);
    fireNodeReadAccess();
    fireNodeUnclassifiedReadAccess();

    SNode firstChild = getFirstChild();
    if (includeAttributes) {
      return new ChildrenList(firstChild);
    } else {
      return new SkipAttributesChildrenList(firstChild);
    }
  }

  private void fireNodeUnclassifiedReadAccess() {
    if (myModel.isLoading()) return;
    NodeReadEventsCaster.fireNodeUnclassifiedReadAccess(this);
  }

  public int getChildCount() {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    fireNodeUnclassifiedReadAccess();

    int count = 0;

    for (SNode child = getFirstChild(); child != null; child = child.myNextSibling) {
      count++;
    }
    return count;
  }

  private void fireNodeReadAccess() {
    if (myModel.isLoading()) return;
    NodeReadAccessCasterInEditor.fireNodeReadAccessed(this);
  }

  @NotNull
  public List<SNode> getChildren(String role) {
    ModelAccess.assertLegalRead(this);
    if (ourMemberAccessModifier != null) {
      role = ourMemberAccessModifier.getNewChildRole(myModel, myConceptFqName, role);
    }
    fireNodeReadAccess();
    fireNodeUnclassifiedReadAccess();
    SNode firstChild = getFirstChild();
    if (firstChild == null) return Collections.emptyList();
    List<SNode> result = new ArrayList<SNode>();

    boolean isOldAttributeRole = AttributeOperations.isOldAttributeRole(role);
    for (SNode child = firstChild; child != null; child = child.myNextSibling) {
      if (role.equals(child.getRole_())) {
        result.add(child);
        child.fireNodeReadAccess();
        NodeReadEventsCaster.fireNodeChildReadAccess(this, role, child);
      } else if (isOldAttributeRole && AttributeOperations.isOldRoleForNewAttribute(child, role)) {
        result.add(child);
        child.fireNodeReadAccess();
        NodeReadEventsCaster.fireNodeChildReadAccess(this, role, child);
      }
    }
    return result;
  }

  public SNode getNextChild(SNode child) {
    String childRole = child.getRole_();
    assert childRole != null : "role must be not null";
    List<SNode> children = getChildren(childRole);
    int index = children.indexOf(child);
    if (index < 0 || index >= children.size() - 1) return null;
    return children.get(index + 1);
  }

  public SNode getPrevChild(SNode child) {
    String childRole = child.getRole_();
    assert childRole != null : "role must be not null";
    List<SNode> children = getChildren(childRole);
    int index = children.indexOf(child);
    if (index <= 0) return null;
    return children.get(index - 1);
  }

  /**
   * Removes child from current node. This affects only link between current node and its child, but not links in
   * subtree of child node.
   * <p/>
   * Differs from {@link SNode#delete()}.
   *
   * @param wasChild
   */
  public void removeChild(SNode wasChild) {
    if (wasChild.myParent != this) return;
    ModelChange.assertLegalNodeChange(this);
    final String wasRole = wasChild.getRole_();
    SNode anchor = getFirstChild() == wasChild ? null : wasChild.myPrevSibling;

    assert wasRole != null;
    if (ModelChange.needFireEvents(getModel(), this)) {
      getModel().fireBeforeChildRemovedEvent(this, wasRole, wasChild, anchor);
    }

    children_remove(wasChild);
    wasChild.myRoleInParent = null;
    wasChild.unRegisterFromModel();

    if (UndoHelper.getInstance().needRegisterUndo(getModel())) {
      UndoHelper.getInstance().addUndoableAction(new RemoveChildUndoableAction(this, anchor, wasRole, wasChild));
    }

    if (ModelChange.needFireEvents(getModel(), this)) {
      getModel().fireChildRemovedEvent(this, wasRole, wasChild, anchor);
    }
  }

  public void insertChild(final SNode anchor, String _role, final SNode child) {
    enforceModelLoad();

    if (ourMemberAccessModifier != null) {
      _role = ourMemberAccessModifier.getNewChildRole(myModel, myConceptFqName, _role);
    }
    final String role = _role;
    SNode parentOfChild = child.getParent();
    if (parentOfChild != null) {
      throw new RuntimeException(child.getDebugText() + " already has parent: " + parentOfChild.getDebugText() + "\n" +
        "Couldn't add it to: " + this.getDebugText());
    }

    if (child.isRoot()) {
      throw new RuntimeException(child.getDebugText() + " is root node. Can't add it as a child");
    }

    if (getTopmostAncestor() == child) {
      throw new RuntimeException("Trying to create a cyclic tree");
    }

    ModelChange.assertLegalNodeChange(this);

    children_insertAfter(anchor, child);
    child.myRoleInParent = InternUtil.intern(role);

    if (isRegistered()) {
      child.registerInModel(getModel());
    } else {
      child.changeModel(getModel());
    }

    if (UndoHelper.getInstance().needRegisterUndo(getModel())) {
      UndoHelper.getInstance().addUndoableAction(new InsertChildAtUndoableAction(this, anchor, _role, child));
    }

    if (ModelChange.needFireEvents(getModel(), this)) {
      getModel().fireChildAddedEvent(this, role, child, anchor);
    }
  }

  void unRegisterFromModel() {
    if (!myRegisteredInModelFlag) return;
    UnregisteredNodes.instance().put(this);
    myRegisteredInModelFlag = false;

    if (myAdapter != null) {
      UnregisteredNodesWithAdapters.getInstance().add(this);
    }

    myModel.unregisterNode(this);

    for (SNode child = getFirstChild(); child != null; child = child.myNextSibling) {
      child.unRegisterFromModel();
    }
  }

  void registerInModel(SModel model) {
    registerInModel_internal(model);

    // add language because typesystem needs it to invalidate/revalidate its caches
    //todo this is a hack
    SModelOperations.validateLanguages(model, this);
  }

  private void registerInModel_internal(SModel model) {
    if (myRegisteredInModelFlag) {
      if (model != myModel) {
        LOG.errorWithTrace("couldn't register node which is already registered in '" + myModel.getSModelReference() + "'");
      }
      return;
    }

    SModel wasModel = myModel;
    myModel = model;
    myModel.registerNode(this);
    myRegisteredInModelFlag = true;

    UnregisteredNodes.instance().remove(this);

    if (myAdapter != null) {
      UnregisteredNodesWithAdapters.getInstance().remove(this);
    }

    if (wasModel != model) {
      ModelChangedCaster.getInstance().fireModelChanged(this, wasModel);
    }
    for (SNode child = getFirstChild(); child != null; child = child.myNextSibling) {
      child.registerInModel_internal(model);
    }
  }

  void dispose() {
    //myModel = null;
    //myRegisteredInModelFlag = false;
    //myChildren = null;
    //myReferences = null;
    //myProperties = null;
    myDisposed = true;
    myAdapter = null;
    myUserObjects = null;
  }

  public boolean isDisposed() {
    return myDisposed;
  }

  public boolean shouldHaveBeenDisposed() {
    return isDisposed() || myModel.isDisposed();
  }

  public boolean isDetached() {
    return getContainingRoot() == null;
  }

  public boolean isRegistered() {
    return myRegisteredInModelFlag;
  }

  public List<SReference> getReferences() {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    fireNodeUnclassifiedReadAccess();
    return new ArrayList<SReference>(_reference());
  }

  public SReference[] getReferencesArray() {
    SReference[] references = new SReference[myReferences.length];
    System.arraycopy(myReferences, 0, references, 0, myReferences.length);
    return references;
  }

  public Collection<SReference> getReferencesIterable() {
    return new AbstractList<SReference>() {
      public SReference get(int index) {
        return myReferences[index];
      }

      public int size() {
        return myReferences.length;
      }
    };
  }

  public SReference setReferent(String role, SNode newReferent) {
    return setReferent(role, newReferent, true);
  }

  public SReference setReferent(String role, SNode newReferent, boolean useHandler) {
    if (ourMemberAccessModifier != null) {
      role = ourMemberAccessModifier.getNewReferentRole(myModel, myConceptFqName, role);
    }
    // remove old references
    List<SReference> toDelete = new ArrayList<SReference>();
    if (myReferences != null) {
      for (SReference reference : myReferences) {
        if (reference.getRole().equals(role)) {
          toDelete.add(reference);
        }
      }
    }
    SNode oldReferent = null;
    if (!toDelete.isEmpty()) {
      oldReferent = toDelete.get(0).getTargetNode();
    }
    if (toDelete.size() > 1) {
      LOG.errorWithTrace("ERROR! " + toDelete.size() + " references found for role '" + role + "' in " + this.getDebugText());
    }
    SReference resultReference = null;
    boolean handlerFound = false;

    if (useHandler && !getModel().isLoading()) {
      // invoke custom referent set event handler
      Set<Pair<SNode, String>> threadSet = ourSetReferentEventHandlersInProgress.get();
      Pair<SNode, String> pair = new Pair<SNode, String>(this, role);
      if (!threadSet.contains(pair)) {
        ReferenceConstraintsDescriptor descriptor = ConceptRegistry.getInstance().getConstraintsDescriptor(this.getConceptFqName()).getReference(role);

        if (!(descriptor instanceof IllegalReferenceConstraintsDescriptor)) {
          handlerFound = true;
          threadSet.add(pair);

          try {
            if (descriptor.validate(this, oldReferent, newReferent, GlobalScope.getInstance())) {
              resultReference = doSetReference(role, newReferent, toDelete);
              descriptor.onReferenceSet(this, oldReferent, newReferent, GlobalScope.getInstance());
            } else {
              if (myReferences != null) {
                for (SReference reference : myReferences) {
                  if (reference.getRole().equals(role)) {
                    resultReference = reference;
                    break;
                  }
                }
              }
            }
          } finally {
            threadSet.remove(pair);
          }
        } else {
          // todo: ?
        }
      }
    }

    if (!handlerFound) {
      resultReference = doSetReference(role, newReferent, toDelete);
    }

    return resultReference;
  }

  private SReference doSetReference(String role, SNode newReferent, List<SReference> toDelete) {
    for (SReference reference : toDelete) {
      int index = _reference().indexOf(reference);
      removeReferenceAt(index);
    }

    SReference resultReference = null;
    if (newReferent != null) {
      resultReference = SReference.create(role, this, newReferent);
      insertReferenceAt(myReferences == null ? 0 : myReferences.length, resultReference);
    }
    return resultReference;
  }

  public SNode getReferent(String role) {
    SReference reference = getReference(role);
    SNode result = reference == null ? null : reference.getTargetNode();
    if (result != null) {
      NodeReadEventsCaster.fireNodeReferentReadAccess(this, role, result);
    }
    return result;
  }

  public SReference getReference(String role) {
    ModelAccess.assertLegalRead(this);
    if (ourMemberAccessModifier != null) {
      role = ourMemberAccessModifier.getNewReferentRole(myModel, myConceptFqName, role);
    }
    fireNodeReadAccess();
    SReference result = null;
    int count = 0; // paranoid check
    if (myReferences != null) {
      for (SReference reference : myReferences) {
        if (reference.getRole().equals(role)) {
          result = reference;
          count++;
        }
      }
    }

    if (count > 1) {
      LOG.errorWithTrace("ERROR: " + count + " referents for role '" + role + "' in " + getDebugText());
    }

    NodeReadEventsCaster.fireNodeReferentReadAccess(this, role, null);
    return result;
  }

  public void addReference(SReference reference) {
    assert reference.getSourceNode() == this;
    insertReferenceAt(myReferences == null ? 0 : myReferences.length, reference);
  }

  public void removeReferent(String role) {
    if (ourMemberAccessModifier != null) {
      role = ourMemberAccessModifier.getNewReferentRole(myModel, myConceptFqName, role);
    }
    if (myReferences != null) {
      for (SReference reference : myReferences) {
        if (reference.getRole().equals(role)) {
          int index = _reference().indexOf(reference);
          removeReferenceAt(index);
          break;
        }
      }
    }
  }

  public void removeReference(SReference referenceToRemove) {
    if (myReferences != null) {
      for (SReference reference : myReferences) {
        if (reference.equals(referenceToRemove)) {
          int index = _reference().indexOf(reference);
          removeReferenceAt(index);
          break;
        }
      }
    }
  }

  public void replaceReference(SReference referenceToRemove, @NotNull SReference referenceToAdd) {
    if (myReferences != null) {
      for (SReference reference : myReferences) {
        if (reference.equals(referenceToRemove)) {
          int index = _reference().indexOf(reference);
          replaceReferenceAt(index, referenceToAdd);
          break;
        }
      }
    }
  }

  public List<SNode> getReferents() {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    fireNodeUnclassifiedReadAccess();
    List<SNode> result = new ArrayList<SNode>();
    if (myReferences != null) {
      for (SReference reference : myReferences) {
        SNode targetNode = reference.getTargetNode();
        if (targetNode != null) result.add(targetNode);
      }
    }
    return result;
  }

  void insertReferenceAt(final int i, final SReference reference) {
    ModelChange.assertLegalNodeChange(this);
    _reference().add(i, reference);

    if (UndoHelper.getInstance().needRegisterUndo(getModel())) {
      UndoHelper.getInstance().addUndoableAction(new InsertReferenceAtUndoableAction(this, i, reference));
    }

    if (ModelChange.needFireEvents(getModel(), this)) {
      getModel().fireReferenceAddedEvent(reference);
    }
  }

  private void replaceReferenceAt(int index, @NotNull SReference referenceToAdd) {
    ModelChange.assertLegalNodeChange(this);

    if (UndoHelper.getInstance().needRegisterUndo(getModel()) || ModelChange.needFireEvents(getModel(), this)) {
      removeReferenceAt(index);
      insertReferenceAt(index, referenceToAdd);
    } else {
      myReferences[index] = referenceToAdd;
    }
  }

  void removeReferenceAt(final int i) {
    ModelChange.assertLegalNodeChange(this);
    final SReference reference = myReferences[i];
    _reference().remove(reference);

    if (UndoHelper.getInstance().needRegisterUndo(getModel())) {
      UndoHelper.getInstance().addUndoableAction(new RemoveReferenceAtUndoableAction(this, i, reference));
    }

    if (ModelChange.needFireEvents(getModel(), this)) {
      getModel().fireReferenceRemovedEvent(reference);
    }
  }

  /**
   * Deletes all nodes in subtree starting with current. Differs from {@link SNode#removeChild(SNode)}.
   */
  public void delete() {
    delete_internal();
  }

  private void delete_internal() {
    //delete all children
    List<SNode> children = new ArrayList<SNode>(getChildren());
    for (SNode child : children) {
      child.delete_internal();
    }

    //remove all references
    removeAllReferences();

    //remove from parent
    SNode parent = getParent();
    if (parent != null) {
      parent.removeChild(this);
    } else if (getModel().isRoot(this)) {
      getModel().removeRoot(this);
    }

    // really delete
    UnregisteredNodes.instance().remove(this);
  }


  private void removeAllReferences() {
    while (_reference().size() > 0) {
      removeReferenceAt(0);
    }
  }


  public boolean isDeleted() {
    return (_reference().size() == 0) && myParent == null && !getModel().isRoot(this);
  }

  public String getDebugText() {
    String roleText = "";
    if (isRegistered()) {
      String s = getRole_();
      roleText = s == null ? "[root]" : "[" + s + "]";
    }
    String nameText;
    try {
      if ("jetbrains.mps.bootstrap.structureLanguage.structure.LinkDeclaration".equals(getConceptFqName())) {
        // !!! use *safe* getRole !!!
        String role = myProperties == null ? null : getProperty_simple("role");
        nameText = (role == null) ? "<no role>" : '"' + role + '"';
      } else {
        // !!! use *safe* getName !!!
        String name = myProperties == null ? null : getProperty_simple("name");
        nameText = (name == null) ? "<no name>" : '"' + name + '"';
      }
      // !!! use *safe* getId !!!
      nameText = nameText + "[" + myId + "]";

    } catch (Exception e) {
      //e.printStackTrace();
      nameText = "<??name??>";
    }
    return roleText + " " + NameUtil.shortNameFromLongName(getConceptShortName()) + " " + nameText + " in " + myModel.getSModelFqName();
  }

  public boolean hasId() {
    return myId != null;
  }

  public String getId() {
    return getSNodeId().toString();
  }

  public SNodeId getId_() {
    return myId;
  }

  public SNodeId getSNodeId() {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    if (myId == null && !isRegistered()) {
      // TODO remove id generation
      myId = SModel.generateUniqueId();
      //LOG.error(new IllegalStateException("cannot generate id for unregistered node"));
    }
    return myId;
  }

  public void setId(@Nullable SNodeId id) {
    if (ObjectUtils.equals(id, myId)) return;

    if (!isRegistered()) {
      myId = id;
    } else {
      LOG.error("can't set id to registered node " + getDebugText(), new Throwable());
    }
  }

  public String getPresentation() {
    return getPresentation(false);
  }

  public String getPresentation(boolean detailed) {
    if (SNodeOperations.isUnknown(this)) {
      String persistentName = getPersistentProperty(SNodeUtil.property_INamedConcept_name);
      if (persistentName == null) {
        return "?" + getConceptShortName() + "?";
      }
      return "?" + persistentName + "?";
    }

    try {
/*
 Warning:
 BaseConcept_Behavior class will be loaded using platform classloader here.
 As a result this class will be loaded twice - once using own BundleClassLoader and one more time - here.
 */
      if (detailed) {
        return "" + SNodeUtil.getDetailedPresentation(this);
      } else {
        return "" + SNodeUtil.getPresentation(this);
      }
    } catch (RuntimeException t) {
      LOG.error(t);
      return "[can't calculate presentation : " + t.getMessage() + "]";
    }
  }

  public String toString() {
    ModelAccess.assertLegalRead(this);
    fireNodeReadAccess();

    String s = null;
    try {
      s = getPersistentProperty(SNodeUtil.property_BaseConcept_alias);
      if (s == null) {
        s = getPresentation();
      }
    } catch (RuntimeException t) {
      LOG.error(t, this);
    }
    if (s == null) {
      return "???";
    }
    return s;
  }

  public List<SNode> getDescendants() {
    return getDescendants(null);
  }

  public Iterable<SNode> getDescendantsIterable(@Nullable final Condition<SNode> condition, final boolean includeFirst) {
    return new DescendantsIterable(this, includeFirst ? this : getFirstChild(), condition);
  }

  public List<SNode> getDescendants(Condition<SNode> condition) {
    ModelAccess.assertLegalRead(this);
    fireNodeReadAccess();
    fireNodeUnclassifiedReadAccess();

    List<SNode> list = new ArrayList<SNode>();
    collectDescendants(condition, list);
    return list;
  }

  private void collectDescendants(Condition<SNode> condition, List<SNode> list) {
    // depth-first traversal
    for (SNode child = getFirstChild(); child != null; child = child.myNextSibling) {
      if (condition == null || condition == Condition.TRUE_CONDITION || condition.met(child)) {
        list.add(child);
      }
      child.collectDescendants(condition, list);
    }
  }

  public boolean isDescendantOf(SNode node, boolean includeThis) {
    SNode current;
    if (includeThis) {
      current = this;
    } else {
      current = getParent();
    }
    while (current != null) {
      if (current == node) {
        return true;
      }
      current = current.getParent();
    }
    return false;
  }

  public Language getNodeLanguage() {
    SNode concept = getConceptDeclarationNode();
    return SModelUtil.getDeclaringLanguage(concept);
  }

  @NotNull
  public String getConceptFqName() {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    fireNodeUnclassifiedReadAccess();
    return myConceptFqName;
  }

  public ModuleReference getConceptLanguage() {
    return new ModuleReference(getLanguageNamespace());
  }

  @NotNull
  public String getConceptShortName() {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    return NameUtil.shortNameFromLongName(myConceptFqName);
  }

  @NotNull
  public String getLanguageNamespace() {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    return InternUtil.intern(NameUtil.namespaceFromConceptFQName(myConceptFqName));
  }

  @UseCarefully
  void setConceptFqName(@NotNull String conceptFQName) {
    myConceptFqName = InternUtil.intern(conceptFQName);
    myAdapter = null;
    SModelRepository.getInstance().markChanged(getModel());
  }

  public boolean isInstanceOfConcept(SNode concept) {
    return isInstanceOfConcept(NameUtil.nodeFQName(concept));
  }

  public boolean isInstanceOfConcept(String conceptFqName) {
    return SModelUtil.isAssignableConcept(myConceptFqName, conceptFqName);
  }

  public SNode getConceptDeclarationNode() {
    return SModelUtil.findConceptDeclaration(getConceptFqName(), GlobalScope.getInstance());
  }

  public SNode getPropertyDeclaration(String propertyName) {
    return SModelSearchUtil.findPropertyDeclaration(getConceptDeclarationNode(), propertyName);
  }

  public SNode getLinkDeclaration(String role) {
    return SModelSearchUtil.findLinkDeclaration(getConceptDeclarationNode(), role);
  }

  public SNode findParent(Condition<SNode> condition) {
    SNode parent = getParent();
    while (parent != null) {
      if (condition.met(parent)) {
        return parent;
      }
      parent = parent.getParent();
    }
    return null;
  }

  public SNode findChildByPath(String path) {
    if (path == null) return null;
    String residual = path;
    SNode current = this;
    while (!residual.equals("") && current != null) {
      residual = residual.substring(1);
      int index = residual.indexOf("/");
      String roleAndNumber = index == -1 ? residual : residual.substring(0, index);
      residual = residual.substring(roleAndNumber.length());

      int numberIndex = roleAndNumber.indexOf("#");
      String role = numberIndex == -1 ? roleAndNumber : roleAndNumber.substring(0, numberIndex);
      String numberString = numberIndex == -1 ? "-1" : roleAndNumber.substring(numberIndex + 1);
      int number = Integer.parseInt(numberString);

      if (number == -1) {
        current = current.getChild(role);
      } else {
        List<SNode> childrenForRole = current.getChildren(role);
        if (number < childrenForRole.size()) {
          current = childrenForRole.get(number);
        } else {
          current = null;
        }
      }
    }
    return current;
  }

  public String getNodePath(SNode child) {
    StringBuilder sb = new StringBuilder();
    SNode current = child;
    while (current != this && current != null) {
      String role = current.getRole_();
      SNode currentParent = current.getParent();
      List<SNode> children = currentParent == null || role == null ? new ArrayList<SNode>() : currentParent.getChildren(role);
      String numberString = children.size() <= 1 ? "" : "#" + children.indexOf(current);
      sb.insert(0, "/" + role + numberString);
      current = currentParent;
    }
    return sb.toString();
  }

  public boolean isReferentRequired(String role) {
    SNode conceptDeclaration = getConceptDeclarationNode();
    SNode linkDeclaration = SModelSearchUtil.findLinkDeclaration(conceptDeclaration, role);
    if (linkDeclaration == null) {
      LOG.error("couldn't find link declaration for role \"" + role + "\" in hierarchy of concept " + conceptDeclaration.getDebugText());
      return false;
    }
    SNode genuineLinkDeclaration = SModelUtil.getGenuineLinkDeclaration(linkDeclaration);
    return SNodeUtil.getLinkDeclaration_IsAtLeastOneMultiplicity(genuineLinkDeclaration);
  }

  public Language getLanguage() {
    String languageNamespace = getLanguageNamespace();
    return MPSModuleRepository.getInstance().getLanguage(languageNamespace);
  }

  public void setRoleInParent(String newRoleInParent) {//todo add undo
    myRoleInParent = InternUtil.intern(newRoleInParent);
  }

  public SNode prevSibling() {
    if (myParent == null) return null;
    return myParent.getFirstChild() == this ? null : myPrevSibling;
  }

  public SNode nextSibling() {
    return myNextSibling;
  }

  private class MyReferencesWrapper extends ArrayWrapper<SReference> {
    protected SReference[] getArray() {
      return myReferences;
    }

    protected void setArray(SReference[] newArray) {
      myReferences = newArray;
    }

    protected SReference[] newArray(int size) {
      return new SReference[size];
    }
  }

  private void children_insertAfter(SNode anchor, @NotNull SNode node) {
    //be sure that getFirstChild is called before any access to myFirstChild
    SNode firstChild = getFirstChild();
    if (anchor == null) {
      if (firstChild != null) {
        node.myPrevSibling = firstChild.myPrevSibling;
        firstChild.myPrevSibling = node;
      } else {
        node.myPrevSibling = node;
      }
      node.myNextSibling = firstChild;
      myFirstChild = node;
    } else {
      node.myPrevSibling = anchor;
      node.myNextSibling = anchor.myNextSibling;
      if (anchor.myNextSibling == null) {
        firstChild.myPrevSibling = node;
      } else {
        anchor.myNextSibling.myPrevSibling = node;
      }
      anchor.myNextSibling = node;
    }
    node.myParent = this;
  }

  private void children_remove(@NotNull SNode node) {
    //be sure that getFirstChild is called before any access to myFirstChild
    SNode firstChild = getFirstChild();
    if (firstChild == node) {
      myFirstChild = node.myNextSibling;
      if (myFirstChild != null) {
        myFirstChild.myPrevSibling = node.myPrevSibling;
      }
    } else {
      node.myPrevSibling.myNextSibling = node.myNextSibling;
      if (node.myNextSibling != null) {
        node.myNextSibling.myPrevSibling = node.myPrevSibling;
      } else {
        firstChild.myPrevSibling = node.myPrevSibling;
      }
    }
    node.myPrevSibling = node.myNextSibling = null;
    node.myParent = null;
  }

  private static class ChildrenList extends AbstractImmutableList<SNode> {
    public ChildrenList(SNode first) {
      super(first);
    }

    public ChildrenList(SNode first, int size) {
      super(first, size);
    }

    @Override
    protected SNode next(SNode node) {
      return node.myNextSibling;
    }

    @Override
    protected SNode prev(SNode node) {
      return node.myPrevSibling;
    }

    @Override
    protected AbstractImmutableList<SNode> subList(SNode elem, int size) {
      return new ChildrenList(elem, size);
    }
  }

  private static class SkipAttributesChildrenList extends AbstractImmutableList<SNode> {
    public SkipAttributesChildrenList(SNode first) {
      super(skipAttributes(first));
    }

    public SkipAttributesChildrenList(SNode first, int size) {
      super(skipAttributes(first), size);
    }

    private static SNode skipAttributes(SNode node) {
      while (node != null && AttributeOperations.isAttribute(node)) {
        node = node.myNextSibling;
      }
      return node;
    }

    protected SNode next(SNode node) {
      return skipAttributes(node.myNextSibling);
    }

    protected SNode prev(SNode node) {
      SNode result = myFirst == node ? null : node.myPrevSibling;
      while (result != null && AttributeOperations.isAttribute(result)) {
        result = myFirst == result ? null : result.myPrevSibling;
      }
      return result;
    }

    protected AbstractImmutableList<SNode> subList(SNode elem, int size) {
      return new SkipAttributesChildrenList(elem, size);
    }
  }

  private static class InProgressThreadLocal extends ThreadLocal<Set<Pair<SNode, String>>> {
    protected Set<Pair<SNode, String>> initialValue() {
      return new HashSet<Pair<SNode, String>>();
    }
  }

  private static class DescendantsIterable implements /* RF-758 */ TreeIterator<SNode>, Iterable<SNode> {
    private SNode original;
    private SNode current;
    private Condition<SNode> condition;
    private SNode prev;

    DescendantsIterable(SNode original, SNode first, @Nullable Condition<SNode> condition) {
      this.original = original;
      this.current = first;
      this.condition = condition;
      while (current != null && condition != null && !condition.met(current)) {
        current = nextInternal(current, false);
      }
    }

    public boolean hasNext() {
      return current != null;
    }

    public SNode next() {
      SNode result = current;
      do {
        current = nextInternal(current, false);
      } while (current != null && condition != null && !condition.met(current));
      prev = result;
      return result;
    }

    public void skipChildren() {
      if(prev == null) throw new IllegalStateException("no element");
      current = nextInternal(prev, true);
      while (current != null && condition != null && !condition.met(current)) {
        current = nextInternal(current, false);
      }
    }

    private SNode nextInternal(SNode curr, boolean skipChildren) {
      if (curr == null) return null;
      if (!skipChildren) {
        SNode firstChild = curr.getFirstChild();
        if (firstChild != null) return firstChild;
      }
      if (curr == original) return null;
      do {
        if (curr.myNextSibling != null) {
          return curr.myNextSibling;
        }
        curr = curr.myParent;
      } while (curr != original);
      return null;
    }

    public void remove() {
      throw new UnsupportedOperationException();
    }

    public Iterator<SNode> iterator() {
      return this;
    }
  }

  //------------adapters-------------

  public BaseAdapter getAdapter() {
    ModelAccess.assertLegalRead(this);
    BaseAdapter adapter = myAdapter;
    if (adapter != null) return adapter;
    Constructor c = QueryMethodGenerated.getAdapterConstructor(getConceptFqName());
    if (c == null) c = QueryMethodGenerated.getAdapterConstructor(SNodeUtil.concept_BaseConcept);
    if (c == null) return new BaseAdapter(this) {
    };

    synchronized (this) {
      adapter = myAdapter;
      if (adapter != null) return adapter;
      try {
        adapter = (BaseAdapter) c.newInstance(this);
        assert adapter.getNode() == this;

        if (!myRegisteredInModelFlag) {
          UnregisteredNodesWithAdapters.getInstance().add(this);
        }
        myAdapter = adapter;
        return adapter;
      } catch (IllegalAccessException e) {
        LOG.error(e);
      } catch (InvocationTargetException e) {
        LOG.error(e);
      } catch (InstantiationException e) {
        LOG.error(e);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
    return new BaseAdapter(this) {
    };
  }


  void clearAdapter() {
    myAdapter = null;
  }

  //------------user objects-------------

  public Object getUserObject(Object key) {
    ModelAccess.assertLegalRead(this);

    fireNodeReadAccess();
    if (myUserObjects == null) return null;
    for (int i = 0; i < myUserObjects.length; i += 2) {
      if (myUserObjects[i].equals(key)) {
        return myUserObjects[i + 1];
      }
    }
    return null;
  }

  public void putUserObject(Object key, Object value) {
    if (value == null) {
      removeUserObject(key);
      return;
    }
    if (myUserObjects == null) {
      myUserObjects = new Object[]{key, value};
    } else {
      for (int i = 0; i < myUserObjects.length; i += 2) {
        if (myUserObjects[i].equals(key)) {
          myUserObjects = Arrays.copyOf(myUserObjects, myUserObjects.length, Object[].class);
          myUserObjects[i + 1] = value;
          return;
        }
      }
      Object[] newarr = new Object[myUserObjects.length + 2];
      System.arraycopy(myUserObjects, 0, newarr, 2, myUserObjects.length);
      newarr[0] = key;
      newarr[1] = value;
      myUserObjects = newarr;
    }
  }

  public void putUserObjects(SNode fromNode) {
    if (fromNode == null || fromNode.myUserObjects == null) return;
    if (myUserObjects == null) {
      myUserObjects = fromNode.myUserObjects;
    } else {
      for (int i = 0; i < fromNode.myUserObjects.length; i += 2) {
        putUserObject(fromNode.myUserObjects[i], fromNode.myUserObjects[i + 1]);
      }
    }
  }

  public void removeUserObject(Object key) {
    if (myUserObjects == null) return;
    for (int i = 0; i < myUserObjects.length; i += 2) {
      if (myUserObjects[i].equals(key)) {
        Object[] newarr = new Object[myUserObjects.length - 2];
        if (i > 0) {
          System.arraycopy(myUserObjects, 0, newarr, 0, i);
        }
        if (i + 2 < myUserObjects.length) {
          System.arraycopy(myUserObjects, i + 2, newarr, i, newarr.length - i);
        }
        myUserObjects = newarr;
        break;
      }
    }
    if (myUserObjects.length == 0) {
      myUserObjects = null;
    }
  }

  public void removeAllUserObjects() {
    myUserObjects = null;
  }

  //------------concept properties-------------

  public boolean hasConceptProperty(String propertyName) {
    if ("root".equals(propertyName)) {
      if (SNodeUtil.isInstanceOfConceptDeclaration(this)) {
        return SNodeUtil.getConceptDeclaration_IsRootable(this);
      } else {
        SNode conceptDeclaration = getConceptDeclarationNode();
        if (SNodeUtil.isInstanceOfConceptDeclaration(conceptDeclaration)) {
          return SNodeUtil.getConceptDeclaration_IsRootable(conceptDeclaration);
        }
      }
      return false;
    }

    return findConceptProperty(propertyName) != null;
  }

  public String getConceptProperty(String propertyName) {
    SNode conceptProperty = findConceptProperty(propertyName);
    Object o = SNodeUtil.getConceptPropertyValue(conceptProperty);
    return o != null ? o.toString() : null;
  }

  public SNode findConceptProperty(String propertyName) {
    SNode conceptDeclaration;
    if (myConceptFqName.equals(SNodeUtil.concept_ConceptDeclaration) || myConceptFqName.equals(SNodeUtil.concept_InterfaceConceptDeclaration)) {
      conceptDeclaration = this;
    } else {
      conceptDeclaration = SModelUtil.findConceptDeclaration(myConceptFqName, GlobalScope.getInstance());
    }
    return SModelSearchUtil.findConceptProperty(conceptDeclaration, propertyName);
  }

}
