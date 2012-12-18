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
import jetbrains.mps.smodel.search.ConceptAndSuperConceptsScope;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.Condition;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.*;

public abstract class BaseAdapter implements INodeAdapter {
  private static final Logger LOG = Logger.getLogger(BaseAdapter.class);

  private SNode myNode;

  public BaseAdapter(SNode node) {
    myNode = node;
  }

  @NotNull
  public SNode getNode() {
    return myNode;
  }

  public String getDebugText() {
    return myNode.getDebugText();
  }

  public String getName() {
    return myNode.getName();
  }

  public String getShortConceptName() {
    return myNode.getConceptShortName();
  }

  public SModel getModel() {
    return myNode.getModel();
  }

  public String getId() {
    return myNode.getId();
  }

  public String getAlias() {
    return SModelUtil_new.getAlias(getNode().getConceptDeclarationNode());
  }

  public INodeAdapter getParent() {
    if (myNode.getParent() == null) {
      return null;
    }
    return myNode.getParent().getAdapter();
  }

  public <BA extends INodeAdapter> BA findParent(Class<BA> cls) {
    return getParent(cls, false);
  }

  public <BA extends INodeAdapter> BA getParent(Class<BA> cls) {
    return getParent(cls, true);
  }

  public <BA extends INodeAdapter> BA getParent(Class<BA> cls, boolean checkThis) {
    INodeAdapter current;
    if (checkThis) {
      current = this;
    } else {
      current = getParent();
    }

    while (current != null) {
      if (cls.isInstance(current)) {
        return (BA) current;
      }
      current = current.getParent();
    }

    return null;
  }

  public INodeAdapter findParent(final Condition<INodeAdapter> ba) {
    return BaseAdapter.fromNode(myNode.findParent(new Condition<SNode>() {
      public boolean met(SNode object) {
        return ba.met(BaseAdapter.fromNode(object));
      }
    }));
  }

  public INodeAdapter findFirstParent(Class[] classes) {
    INodeAdapter node = this;
    INodeAdapter parent = node.getParent();
    while (parent != null) {
      for (Class clazz : classes) {
        if (clazz.isAssignableFrom(parent.getClass())) {
          return parent;
        }
      }
      parent = parent.getParent();
    }
    return null;
  }

  public <T extends INodeAdapter> List<T> findParents(Class<T> aClass) {
    List<T> list = new ArrayList<T>();
    T currNode = getParent(aClass);
    for (; currNode != null; currNode = currNode.getParent(aClass, false)) {
      list.add(currNode);
    }
    return list;
  }

  public void replaceChild(INodeAdapter oldChild, INodeAdapter newChild) {
    getNode().replaceChild(oldChild.getNode(), newChild.getNode());
  }

  public INodeAdapter getContainingRoot() {
    return BaseAdapter.fromNode(getNode().getContainingRoot());
  }

  @NotNull
  public <E extends INodeAdapter> List<E> getDescendants(final Class<E> cls) {
    return toAdapters(cls, getNode().getDescendants(new Condition<SNode>() {
      public boolean met(SNode object) {
        return cls.isInstance(object.getAdapter());
      }
    }));
  }

  @NotNull
  public <E extends INodeAdapter> List<E> getDescendants(final Condition<INodeAdapter> condition) {
    return toAdapters(myNode.getDescendants(new Condition<SNode>() {
      public boolean met(SNode object) {
        return condition.met(BaseAdapter.fromNode(object));
      }
    }));
  }

  public void delete() {
    myNode.delete();
  }

  public void addNextSibling(INodeAdapter a) {
    myNode.addNextSibling(a.getNode());
  }

  public void addPrevSibling(INodeAdapter a) {
    myNode.addPrevSibling(a.getNode());
  }

  public boolean hasConceptProperty(String propertyName) {
    return myNode.hasConceptProperty(propertyName);
  }

  public String getConceptProperty(String propertyName) {
    return myNode.getConceptProperty(propertyName);
  }

  public String getProperty(@NotNull String propertyName) {
    return myNode.getProperty(propertyName);
  }

  public void setProperty(@NotNull String propertyName, String propertyValue) {
    myNode.setProperty(propertyName, propertyValue);
  }

  protected boolean getBooleanProperty(@NotNull String propertyName) {
    return myNode.getBooleanProperty(propertyName);
  }

  protected void setBooleanProperty(@NotNull String propertyName, boolean value) {
    myNode.setBooleanProperty(propertyName, value);
  }

  protected int getIntegerProperty(@NotNull String propertyName) {
    return myNode.getIntegerProperty(propertyName);
  }

  protected void setIntegerProperty(@NotNull String propertyName, int value) {
    myNode.setIntegerProperty(propertyName, value);
  }

  protected void setChild(@NotNull String role, INodeAdapter childNode) {
    if (childNode == null) {
      myNode.setChild(role, null);
    } else {
      myNode.setChild(role, childNode.getNode());
    }
  }

  public <C extends INodeAdapter> INodeAdapter getChild(Class<C> requiredClass, @NotNull String role) {
    SNode result = myNode.getChild(role);
    if (result == null) {
      return null;
    }
    return ensureAdapter(requiredClass, role, result.getAdapter());
  }


  @Deprecated
  public INodeAdapter getChild(@NotNull String role) {
    return getChild(BaseAdapter.class, role);
  }

  public void removeChild(@NotNull INodeAdapter child) {
    myNode.removeChild(child.getNode());
  }

  public void addChild(@NotNull String role,
                       @NotNull INodeAdapter child) {
    myNode.addChild(role, child.getNode());
  }


  public void insertChild(@Nullable INodeAdapter anchorChild,
                          @NotNull String role,
                          @NotNull INodeAdapter child,
                          boolean insertBefore) {
    myNode.insertChild(BaseAdapter.fromAdapter(anchorChild), role, BaseAdapter.fromAdapter(child), insertBefore);
  }


  public void insertChild(@Nullable INodeAdapter anchorChild,
                          @NotNull String role,
                          @NotNull INodeAdapter child) {
    SNode anchorNode = null;
    if (anchorChild != null) {
      anchorNode = anchorChild.getNode();
    }
    myNode.insertChild(anchorNode, role, child.getNode());
  }

  public int getChildCount(@NotNull String role) {
    return myNode.getChildCount(role);
  }

  public List<INodeAdapter> getChildren() {
    return toAdapters(getNode().getChildren());
  }

  @NotNull
  public <N extends INodeAdapter> List<N> getChildren(Class<N> cls) {
    return CollectionUtil.filter(cls, getChildren());
  }


  @Deprecated
  public <T extends INodeAdapter> List<T> getChildren(@NotNull String role) {
    return (List<T>) getChildren(INodeAdapter.class, role);
  }


  public <T extends INodeAdapter> List<T> getChildren(Class<T> requiredClass, @NotNull String role) {
    List<T> result = new ArrayList<T>();
    for (INodeAdapter na : toAdapters(myNode.getChildren(role))) {
      T t = ensureAdapter(requiredClass, role, na);
      if (t != null) {
        result.add(t);
      }
    }
    return result;
  }

  @Deprecated
  public <T extends INodeAdapter> Iterator<T> children(@NotNull String role) {
    return (Iterator<T>) children(INodeAdapter.class, role);
  }

  public <T extends INodeAdapter> Iterator<T> children(Class<T> requiredClass, @NotNull String role) {
    return getChildren(requiredClass, role).iterator();
  }

  @Deprecated
  protected INodeAdapter getReferent(String role) {
    return getReferent(INodeAdapter.class, role);
  }

  protected <C extends INodeAdapter> INodeAdapter getReferent(Class<C> requiredClass, String role) {
    SNode result = myNode.getReferent(role);
    if (result == null) {
      return null;
    }
    return ensureAdapter(requiredClass, role, result.getAdapter());
  }

  protected <C extends INodeAdapter> C ensureAdapter(Class<C> requiredClass, String role, INodeAdapter adapter) {
    if (requiredClass.isInstance(adapter)) {
      return (C) adapter;
    }
    LOG.error("Incorrect type in role " + role + ". " + requiredClass.getName() + " required", adapter);
    return null;
  }

  protected void setReferent(@NotNull String role, INodeAdapter newValue) {
    if (newValue == null) {
      myNode.setReferent(role, null);
    } else {
      myNode.setReferent(role, newValue.getNode());
    }
  }

  // ---
  // -- attributes
  // ---

  public List<INodeAdapter> getAllAttributes() {
    return toAdapters(AttributeOperations.getAllAttributes(getNode()));
  }

  // ---
  // node attributes
  // ---

  @Nullable
  public INodeAdapter getAttribute(String role) {
    SNode result = AttributeOperations.getNodeAttribute(myNode, role);
    if (result == null) {
      return null;
    }
    return result.getAdapter();
  }

  @NotNull
  public List<? extends INodeAdapter> getAttributes(String role) {
    return toAdapters(AttributeOperations.getNodeAttributes(myNode, role));
  }

  public void setAttribute(String role, INodeAdapter attribute) {
    if (attribute == null) {
      AttributeOperations.setNodeAttribute(myNode, role, null);
    } else {
      AttributeOperations.setNodeAttribute(myNode, role, attribute.getNode());
    }
  }

  public void addAttribute(String role, INodeAdapter attribute) {
    AttributeOperations.addNodeAttribute(myNode, role, attribute.getNode());
  }

  // ---
  // property attributes
  // ---

  public INodeAdapter getPropertyAttribute(String role, String propertyName) {
    SNode node = AttributeOperations.getPropertyAttribute(myNode, role, propertyName);
    if (node == null) {
      return null;
    } else {
      return node.getAdapter();
    }
  }

  @NotNull
  public List<? extends INodeAdapter> getPropertyAttributes(String role, String propertyName) {
    return toAdapters(AttributeOperations.getPropertyAttributes(myNode, role, propertyName));
  }

  public void setPropertyAttribute(String role, String propertyName, INodeAdapter propertyAttribute) {
    if (propertyAttribute == null) {
      AttributeOperations.setPropertyAttribute(myNode, role, propertyName, null);
    } else {
      AttributeOperations.setPropertyAttribute(myNode, role, propertyName, propertyAttribute.getNode());
    }
  }

  public void addPropertyAttribute(String role, String propertyName, INodeAdapter propertyAttribute) {
    AttributeOperations.addPropertyAttribute(myNode, role, propertyName, propertyAttribute.getNode());
  }

  // ---
  // link attributes
  // ---

  public INodeAdapter getLinkAttribute(String linkAttributeRole, String linkRole) {
    SNode node = AttributeOperations.getLinkAttribute(myNode, linkAttributeRole, linkRole);
    if (node == null) {
      return null;
    } else {
      return node.getAdapter();
    }
  }

  public void setLinkAttribute(String linkAttributeRole, String linkRole, INodeAdapter linkAttribute) {
    if (linkAttribute == null) {
      AttributeOperations.setLinkAttribute(myNode, linkAttributeRole, linkRole, null);
    } else {
      AttributeOperations.setLinkAttribute(myNode, linkAttributeRole, linkRole, linkAttribute.getNode());
    }
  }

  public void addLinkAttribute(String linkAttributeRole, String linkRole, INodeAdapter propertyAttribute) {
    AttributeOperations.addLinkAttribute(myNode, linkAttributeRole, linkRole, propertyAttribute.getNode());
  }

  public List<? extends INodeAdapter> getLinkAttributes(String linkAttributeRole, String linkRole) {
    return toAdapters(AttributeOperations.getLinkAttributes(myNode, linkAttributeRole, linkRole));
  }


  public boolean equals(Object obj) {
    if (!(obj instanceof INodeAdapter)) return false;
    INodeAdapter other = (INodeAdapter) obj;
    return other.getNode() == getNode();
  }


  public int hashCode() {
    return getNode().hashCode();
  }


  public String toString() {
    return getNode().toString();
  }


  public static <T extends INodeAdapter> List<T> toAdapters(List<? extends SNode> list) {
    List<T> result = new ArrayList<T>(list.size());
    for (SNode node : list) {
      result.add((T) node.getAdapter());
    }
    return result;
  }

  public static <T extends INodeAdapter> Set<T> toAdapters(Set<? extends SNode> list) {
    Set<T> result = new HashSet<T>(list.size());
    for (SNode node : list) {
      if (node != null) {
        result.add((T) node.getAdapter());
      }
    }
    return result;
  }

  public static <T extends INodeAdapter> List<T> toAdapters(Class<T> cls, List<? extends SNode> list) {
    List<T> result = new ArrayList<T>(list.size());
    for (SNode node : list) {
      result.add((T) node.getAdapter());
    }
    return result;
  }

  public static <T extends INodeAdapter> Set<T> toAdapters(Class<T> cls, Set<? extends SNode> list) {
    Set<T> result = new HashSet<T>(list.size());
    for (SNode node : list) {
      result.add((T) node.getAdapter());
    }
    return result;
  }


  public static List<SNode> toNodes(List<? extends INodeAdapter> list) {
    List<SNode> result = new ArrayList<SNode>(list.size());
    for (INodeAdapter ba : list) {
      result.add(ba.getNode());
    }
    return result;
  }

  public static Set<SNode> toNodes(Set<? extends INodeAdapter> list) {
    Set<SNode> result = new HashSet<SNode>(list.size());
    for (INodeAdapter ba : list) {
      result.add(ba.getNode());
    }
    return result;
  }

  @Deprecated
  public static INodeAdapter fromNode(SNode node) {
    if (node == null) {
      return null;
    } else {
      return node.getAdapter();
    }
  }

  public static SNode fromAdapter(INodeAdapter ba) {
    if (ba == null) {
      return null;
    } else {
      return ba.getNode();
    }
  }

  public static Condition<SNode> nodeCondition(final Condition<INodeAdapter> bn) {
    return new Condition<SNode>() {
      public boolean met(SNode object) {
        return bn.met(BaseAdapter.fromNode(object));
      }
    };
  }

  public static <T extends INodeAdapter> Condition<T> adapterCondition(final Condition<SNode> bn) {
    return new Condition<T>() {
      public boolean met(T object) {
        return bn.met(BaseAdapter.fromAdapter(object));
      }
    };
  }

  @Deprecated
  public static boolean isInstance(SNode node, Class<? extends INodeAdapter> cls) {
    return cls.isInstance(fromNode(node));
  }

  public String getRole_() {
    return myNode.getRole_();
  }

  public Object getUserObject(@NotNull Object key) {
    return myNode.getUserObject(key);
  }

  public void removeUserObject(@NotNull Object key) {
    myNode.removeUserObject(key);
  }

  public void putUserObject(@NotNull Object key, @Nullable Object value) {
    myNode.putUserObject(key, value);
  }

  public boolean isRoot() {
    return myNode.isRoot();
  }


  public String getConceptFQName() {
    return myNode.getConceptFqName();
  }

  public static List<SNode> getConceptLinks(final SNode node, final String linkName, boolean lookupHierarchy) {
    SNode conceptDeclaration = node;
    if (!(SNodeUtil.isInstanceOfAbstractConceptDeclaration(conceptDeclaration))) {
      conceptDeclaration = conceptDeclaration.getConceptDeclarationNode();
    }

    if (lookupHierarchy) {
      return new ConceptAndSuperConceptsScope(conceptDeclaration).
        getNodes(new Condition<SNode>() {
          public boolean met(SNode n) {
            if (SNodeUtil.isInstanceOfConceptLink(n)) {
              SNode conceptLinkDeclaration = SNodeUtil.getConceptLink_Declaration(n);
              return (conceptLinkDeclaration != null && linkName.equals(conceptLinkDeclaration.getName()));
            }
            return false;
          }
        });
    }

    List<SNode> result = new ArrayList<SNode>();
    Iterable<SNode> conceptLinks = SNodeUtil.getConcept_ConceptLinks(conceptDeclaration);
    for(SNode conceptLink : conceptLinks) {
      SNode conceptLinkDeclaration = SNodeUtil.getConceptLink_Declaration(conceptLink);
      if (conceptLinkDeclaration != null && linkName.equals(conceptLinkDeclaration.getName())) {
        result.add(conceptLink);
      }
    }
    return result;
  }

  public static List<SNode> getConceptLinkTargets(final SNode node, String linkName, boolean lookupHierarchy) {
    List<SNode> result = new ArrayList<SNode>();
    List<SNode> conceptLinks = getConceptLinks(node, linkName, lookupHierarchy);
    for (SNode conceptLink : conceptLinks) {
      SNode target = SModelUtil.getConceptLinkTarget(conceptLink);
      if (target != null) {
        result.add(target);
      }
    }
    return result;
  }
}
