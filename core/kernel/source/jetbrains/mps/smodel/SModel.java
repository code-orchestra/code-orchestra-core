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

import jetbrains.mps.MPSCore;
import jetbrains.mps.generator.TransientSModel;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ModuleId;
import jetbrains.mps.project.dependency.ModelDependenciesManager;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.refactoring.StructureModificationHistory;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.smodel.event.*;
import jetbrains.mps.smodel.nodeidmap.INodeIdToNodeMap;
import jetbrains.mps.smodel.nodeidmap.UniversalOptimizedNodeIdMap;
import jetbrains.mps.smodel.persistence.RoleIdsComponent;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.apache.commons.collections.CollectionUtils;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.security.SecureRandom;
import java.util.*;
import java.util.concurrent.atomic.AtomicLong;

public class SModel {
  private static final Logger LOG = Logger.getLogger(SModel.class);

  private Set<SNode> myRoots = new LinkedHashSet<SNode>();
  private SModelReference myReference;

  private boolean myDisposed;
  private volatile boolean myLoading;

  private FastNodeFinder myFastNodeFinder;

  private int myMaxImportIndex;
  private List<ModuleReference> myLanguages = new ArrayList<ModuleReference>();
  private List<ModuleReference> myLanguagesEngagedOnGeneration = new ArrayList<ModuleReference>();
  private List<ModuleReference> myDevKits = new ArrayList<ModuleReference>();
  private List<ImportElement> myImports = new ArrayList<ImportElement>();
  private List<ImportElement> myImplicitImports = new ArrayList<ImportElement>();

  private INodeIdToNodeMap myIdToNodeMap = createNodeIdMap();

  private StructureModificationHistory myStructureModificationHistory = new StructureModificationHistory();

  private final SModelHeader myHeader = new SModelHeader();

  private SModelDescriptor myModelDescriptor;

  private Throwable myDisposedStacktrace = null;

  public SModel(@NotNull SModelReference modelReference) {
    this(modelReference, new UniversalOptimizedNodeIdMap());
  }

  @CodeOrchestraPatch
  public SModel(@NotNull SModelReference modelReference, INodeIdToNodeMap map) {
    myReference = modelReference;

    // RF-710
    // Ignore external map, use UniversalOptimizedNodeIdMap
    // myIdToNodeMap = map;
    myIdToNodeMap = new UniversalOptimizedNodeIdMap();
  }

  //---------common properties--------

  @NotNull
  public SModelReference getSModelReference() {
    return myReference;
  }

  public SModelFqName getSModelFqName() {
    return getSModelReference().getSModelFqName();
  }

  public SModelId getSModelId() {
    return getSModelReference().getSModelId();
  }

  @NotNull
  public String getStereotype() {
    return myReference.getStereotype();
  }

  @NotNull
  public String getLongName() {
    return myReference.getLongName();
  }

  public boolean isTransient() {
    return false;
  }

  public boolean isNotEditable() {
    assert !isDisposed();
    return !(getModelDescriptor() instanceof EditableSModelDescriptor)
      || ((EditableSModelDescriptor) getModelDescriptor()).isPackaged();
  }

  public boolean isDisposed() {
    return myDisposed;
  }

  public Throwable getDisposedStacktrace() {
    return myDisposedStacktrace;
  }

  public SModelDescriptor getModelDescriptor() {
    return myModelDescriptor;
  }

  public synchronized void setModelDescriptor(SModelDescriptor modelDescriptor) {
    myModelDescriptor = modelDescriptor;
  }

  //---------incremental load--------

  //todo try to remove as many usages as possible

  void enforceFullLoad() {
    if (!(myModelDescriptor instanceof DefaultSModelDescriptor)) return;
    DefaultSModelDescriptor dmd = (DefaultSModelDescriptor) myModelDescriptor;
    if (dmd.getLoadingState() == ModelLoadingState.FULLY_LOADED) return;
    dmd.enforceFullLoad();
  }

  //---------roots manipulation--------

  private void fireModelNodesReadAccess() {
    if (isLoading()) return;
    NodeReadEventsCaster.fireModelNodesReadAccess(this);
  }

  public final Iterable<SNode> roots() {
    return new Iterable<SNode>() {
      public Iterator<SNode> iterator() {
        return rootsIterator();
      }
    };
  }

  public Iterator<SNode> rootsIterator() {
    fireModelNodesReadAccess();
    return myRoots.iterator();
  }

  public void addRoot(@NotNull SNode node) {
    ModelChange.assertLegalNodeRegistration(this, node);
    enforceFullLoad();
    if (myRoots.contains(node)) return;
    if (node.getModel() != this && node.isRoot()) {
      node.getModel().removeRoot(node);
    } else {
      SNode parent = node.getParent();
      if (parent != null) {
        parent.removeChild(node);
      }
    }

    myRoots.add(node);
    node.registerInModel(this);
    if (UndoHelper.getInstance().needRegisterUndo(this)) {
      UndoHelper.getInstance().addUndoableAction(new AddRootUndoableAction(node));
    }
    fireRootAddedEvent(node);
  }

  public void removeRoot(@NotNull SNode node) {
    ModelChange.assertLegalNodeUnRegistration(this, node);
    enforceFullLoad();
    if (myRoots.contains(node)) {
      myRoots.remove(node);
      node.unRegisterFromModel();
      if (UndoHelper.getInstance().needRegisterUndo(this)) {
        UndoHelper.getInstance().addUndoableAction(new RemoveRootUndoableAction(node));
      }
      fireRootRemovedEvent(node);
    }
  }

  public int rootsCount() {
    // RF-502
    if (myIdToNodeMap == null || myRoots == null) {
      return 0;
    }
    return myRoots.size();
  }

  //---------nodes manipulation--------

  public final Iterable<SNode> nodes() {
    return new NodesIterable(this);
  }

  public Iterator<SNode> nodesIterator() {
    return new NodesIterator(rootsIterator());
  }

  public int registeredNodesCount() {
    enforceFullLoad();
    return myIdToNodeMap.size();
  }

  public void clearAdaptersAndUserObjects() {
    for (SNode node : myIdToNodeMap.values()) {
      node.clearAdapter();
      node.removeAllUserObjects();
    }
  }

  //---------loading state--------

  public void runLoadingAction(@NotNull Runnable runnable) {
    boolean wasLoading = setLoading(true);
    try {
      runnable.run();
    } finally {
      setLoading(wasLoading);
    }
  }

  public synchronized boolean setLoading(boolean loading) {
    boolean wasLoading = myLoading;
    myLoading = loading;
    if (wasLoading != loading) {
      fireLoadingStateChanged();
    }
    return wasLoading;
  }

  public boolean isLoading() {
    return myLoading;
  }

  @CodeOrchestraPatch
  private boolean canFireEvent(SModelListener sModelListener) {
    // RE-4209
    if (sModelListener instanceof TransientSModelListener) {
      return true;
    }
    return !myLoading;
  }

  //---------listeners--------

  private List<SModelListener> getModelListeners() {
    BaseSModelDescriptor modelDescriptor = (BaseSModelDescriptor) getModelDescriptor();
    return modelDescriptor != null ? modelDescriptor.getModelListeners() : Collections.<SModelListener>emptyList();
  }

  private void fireLoadingStateChanged() {
    for (SModelListener sModelListener : getModelListeners()) {
      try {
        sModelListener.loadingStateChanged(getModelDescriptor(), isLoading());
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  //todo code in the following methods should be written w/o duplication

  private void fireDevKitAddedEvent(@NotNull ModuleReference ref) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        sModelListener.devkitAdded(new SModelDevKitEvent(this, ref));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireDevKitRemovedEvent(@NotNull ModuleReference ref) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        sModelListener.devkitRemoved(new SModelDevKitEvent(this, ref));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireLanguageAddedEvent(@NotNull ModuleReference ref) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        sModelListener.languageAdded(new SModelLanguageEvent(this, ref));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireLanguageRemovedEvent(@NotNull ModuleReference ref) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        sModelListener.languageRemoved(new SModelLanguageEvent(this, ref));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireImportAddedEvent(@NotNull SModelReference modelReference) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        sModelListener.importAdded(new SModelImportEvent(this, modelReference));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireImportRemovedEvent(@NotNull SModelReference modelReference) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        sModelListener.importAdded(new SModelImportEvent(this, modelReference));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireRootAddedEvent(@NotNull SNode root) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        sModelListener.rootAdded(new SModelRootEvent(this, root, true));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireRootRemovedEvent(@NotNull SNode root) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        sModelListener.rootRemoved(new SModelRootEvent(this, root, false));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  void firePropertyChangedEvent(@NotNull SNode node, @NotNull String property, @Nullable String oldValue, @Nullable String newValue) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        sModelListener.propertyChanged(new SModelPropertyEvent(this, property, node, oldValue, newValue));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  void fireChildAddedEvent(@NotNull SNode parent, @NotNull String role, @NotNull SNode child, SNode anchor) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        int childIndex = anchor == null ? 0 : parent.getChildren().indexOf(anchor) + 1;
        sModelListener.childAdded(new SModelChildEvent(this, true, parent, role, childIndex, child));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  void fireChildRemovedEvent(@NotNull SNode parent, @NotNull String role, @NotNull SNode child, SNode anchor) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        int childIndex = anchor == null ? 0 : parent.getChildren().indexOf(anchor) + 1;
        sModelListener.childRemoved(new SModelChildEvent(this, false, parent, role, childIndex, child));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  void fireBeforeChildRemovedEvent(@NotNull SNode parent, @NotNull String role, @NotNull SNode child, SNode anchor) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        int childIndex = anchor == null ? 0 : parent.getChildren().indexOf(anchor) + 1;
        sModelListener.beforeChildRemoved(new SModelChildEvent(this, false, parent, role, childIndex, child));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  void fireReferenceAddedEvent(@NotNull SReference reference) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        sModelListener.referenceAdded(new SModelReferenceEvent(this, reference, true));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  void fireReferenceRemovedEvent(@NotNull SReference reference) {
    for (SModelListener sModelListener : getModelListeners()) {
      if (!canFireEvent(sModelListener)) continue; // RE-4209
      try {
        sModelListener.referenceRemoved(new SModelReferenceEvent(this, reference, false));
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  //---------fast node finder--------

  public final synchronized FastNodeFinder getFastNodeFinder() {
    if (myFastNodeFinder == null) {
      myFastNodeFinder = createFastNodeFinder();
    }
    fireModelNodesReadAccess();
    return myFastNodeFinder;
  }

  protected FastNodeFinder createFastNodeFinder() {
    return new DefaultFastNodeFinder(this);
  }

  public synchronized void disposeFastNodeFinder() {
    if (myFastNodeFinder != null) {
      myFastNodeFinder.dispose();
      myFastNodeFinder = null;
    }
  }

  //---------node id--------

  private static AtomicLong ourCounter = new AtomicLong();

  static {
    resetIdCounter();
  }

  protected final INodeIdToNodeMap createNodeIdMap() {
    return new UniversalOptimizedNodeIdMap();
  }

  static void resetIdCounter() {
    ourCounter.set(Math.abs(new SecureRandom().nextLong()));
  }

  public static SNodeId generateUniqueId() {
    long id = Math.abs(ourCounter.incrementAndGet());
    return new SNodeId.Regular(id);
  }

  @Nullable
  public SNode getNodeById(@NotNull SNodeId nodeId) {
    checkNotDisposed();
    if (myDisposed) return null;

    SNode node = myIdToNodeMap.get(nodeId);
    if (node != null) return node;
    enforceFullLoad();
    return myIdToNodeMap.get(nodeId);
  }

  //---------node registration--------

  void registerNode(@NotNull SNode node) {
    checkNotDisposed();
    if (myDisposed) return;

    enforceFullLoad();
    SNodeId id = node.hasId() ? node.getSNodeId() : null;
    SNode existingNode = id != null ? myIdToNodeMap.get(id) : null;
    if (id == null || existingNode != null && existingNode != node) {
      id = generateUniqueId();
      while (myIdToNodeMap.containsKey(id)) {
        resetIdCounter();
        id = generateUniqueId();
      }
      node.setId(id);
    }
    myIdToNodeMap.put(id, node);
  }

  void unregisterNode(@NotNull SNode node) {
    checkNotDisposed();

    enforceFullLoad();
    SNodeId id = node.getSNodeId();
    if (myDisposed || id == null) return;
    myIdToNodeMap.remove(id);
  }

  //---------imports manipulation--------

  public ModelDependenciesManager getModelDepsManager() {
    return new ModelDependenciesManager(this);
  }

  //language

  public List<ModuleReference> importedLanguages() {
    return Collections.unmodifiableList(myLanguages);
  }

  public void deleteLanguage(@NotNull ModuleReference ref) {
    ModelChange.assertLegalChange(this);

    myLanguages.remove(ref);
    //calculateImplicitImports();
    fireLanguageRemovedEvent(ref);
  }

  @CodeOrchestraPatch
  public void addLanguage(@NotNull ModuleReference ref) {
    ModelChange.assertLegalChange(this);
    if (SModelOperations.hasLanguage(this, ref)) return;

    // CO-5033
    /*
    if (ref.getModuleId() == null) {
      LOG.warning("Attempt to add language reference to a language without id in model " + getSModelFqName() + ". Language = " + ref);
    }
    */

    if (!myLanguages.contains(ref)) {
      myLanguages.add(ref);
      fireLanguageAddedEvent(ref);
    }
  }

  //devkit

  public List<ModuleReference> importedDevkits() {
    return Collections.unmodifiableList(myDevKits);
  }

  public void addDevKit(@NotNull ModuleReference ref) {
    ModelChange.assertLegalChange(this);

    if (!myDevKits.contains(ref)) {
      myDevKits.add(ref);
      fireDevKitAddedEvent(ref);
    }
  }

  public void deleteDevKit(@NotNull ModuleReference ref) {
    ModelChange.assertLegalChange(this);

    myDevKits.remove(ref);
    fireDevKitRemovedEvent(ref);
  }

  //model

  public List<ImportElement> importedModels() {
    return Collections.unmodifiableList(myImports);
  }

  public void addModelImport(@NotNull SModelReference modelReference, boolean firstVersion) {
    ModelChange.assertLegalChange(this);

    ImportElement importElement = SModelOperations.getImportElement(this, modelReference);
    if (importElement != null) return;
    importElement = SModelOperations.getAdditionalModelElement(this, modelReference);
    if (importElement == null) {
      SModelDescriptor modelDescriptor = MPSCore.getInstance().isMergeDriverMode() ? null : SModelRepository.getInstance().getModelDescriptor(modelReference);
      int usedVersion = -1;
      if (modelDescriptor instanceof EditableSModelDescriptor) {
        usedVersion = ((EditableSModelDescriptor) modelDescriptor).getVersion();
      }
      importElement = new ImportElement(modelReference, ++myMaxImportIndex, firstVersion ? -1 : usedVersion);
    }
    if (importElement.getReferenceID() < 0) { // fix for persistence <6
      importElement.setReferenceID(++myMaxImportIndex);
    }

    myImports.add(importElement);
    fireImportAddedEvent(importElement.getModelReference());
  }

  public void deleteModelImport(@NotNull SModelReference modelReference) {
    ModelChange.assertLegalChange(this);

    ImportElement importElement = SModelOperations.getImportElement(this, modelReference);
    if (importElement != null) {
      myImports.remove(importElement);
      myImplicitImports.add(importElement);  // to save version and ID if model was imported implicitly
      fireImportRemovedEvent(modelReference);
    }
  }

  @NotNull
  private static Set<SModelReference> collectUsedModels(@NotNull SModel model, @NotNull Set<SModelReference> result) {
    for (SNode node : model.nodes()) {
      if (RoleIdsComponent.isEnabled()) {
        result.add(RoleIdsComponent.getConceptPointer(node).getModelReference());
        for (String propname : node.getProperties().keySet()) {
          result.add(RoleIdsComponent.getPropertyNamePointer(node, propname).getModelReference());
        }
        for (SReference ref : node.getReferencesIterable()) {
          if (ref.getTargetSModelReference() != null) {
            result.add(ref.getTargetSModelReference());
          }
          result.add(RoleIdsComponent.getReferenceRolePointer(ref).getModelReference());
        }
        for (SNode child : node.getChildrenIterable()) {
          result.add(RoleIdsComponent.getNodeRolePointer(child).getModelReference());
        }
      } else {
        SNode concept = node.getConceptDeclarationNode();
        if (concept == null) {
          LOG.error("concept not found for node " + node.getDebugText());
        } else {
          result.add(concept.getModel().getSModelReference());
        }
        for (String propname : node.getProperties().keySet()) {
          SNode decl = node.getPropertyDeclaration(propname);
          if (decl == null) {
            // RE-1979
            if (!("sourceModule".equals(propname) || "package".equals(propname))) {
              LOG.error("undeclared property: '" + propname + "' in node " + node.getDebugText());
            }
          } else {
            result.add(decl.getModel().getSModelReference());
          }
        }
        for (SReference ref : node.getReferencesIterable()) {
          SModelReference targetModelRef = ref.getTargetSModelReference();
          if (targetModelRef == null) {
            LOG.error("target model of reference '" + ref.getRole() + "' is null in node " + node.getDebugText());
          } else {
            result.add(targetModelRef);
          }
          SNode decl = node.getLinkDeclaration(ref.getRole());
          if (decl == null) {
            LOG.error("undeclared link role: '" + ref.getRole() + "' in node " + node.getDebugText());
          } else {
            result.add(decl.getModel().getSModelReference());
          }
        }
        for (SNode child : node.getChildrenIterable()) {
          SNode decl = child.getRoleLink();
          if (decl == null) {
            LOG.error("undeclared child role: '" + child.getRole_() + "' in node " + node.getDebugText());
          } else {
            result.add(decl.getModel().getSModelReference());
          }
        }
      }
    }
    return result;
  }

  // create new implicit import list based on used models, explicit import and old implicit import list
  public void calculateImplicitImports() {
    Set<SModelReference> usedModels = collectUsedModels(this, new HashSet<SModelReference>());
    if (myModelDescriptor == null || !LanguageAspect.STRUCTURE.is(myModelDescriptor))
      usedModels.remove(myReference);   // do not import self if not structure
    for (ImportElement elem : myImports) {
      usedModels.remove(elem.getModelReference());    // do not add explicit imports to implicit
    }
    List<ImportElement> implicitImports = new ArrayList<ImportElement>(usedModels.size());
    for (ImportElement elem : myImplicitImports) {
      if (usedModels.remove(elem.getModelReference())) {
        implicitImports.add(elem);   // already added elements save their version and id
      }
    }
    for (SModelReference ref : usedModels) {
      int version;
      if (RoleIdsComponent.isEnabled()) {
        version = RoleIdsComponent.getModelVersion(ref);
      } else {
        SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(ref);
        version = modelDescriptor instanceof EditableSModelDescriptor ? ((EditableSModelDescriptor) modelDescriptor).getVersion() : -1;
      }
      implicitImports.add(new ImportElement(ref, -1, version));  // for compatibility index will be assigned on save
    }
    myImplicitImports = implicitImports;
  }

  public List<ModuleReference> engagedOnGenerationLanguages() {
    return myLanguagesEngagedOnGeneration;
  }

  public void addEngagedOnGenerationLanguage(ModuleReference ref) {
    ModelChange.assertLegalChange(this);

    if (!myLanguagesEngagedOnGeneration.contains(ref)) {
      myLanguagesEngagedOnGeneration.add(ref);
      // don't send event but mark model as changed
      if (!isLoading()) {
        SModelRepository.getInstance().markChanged(this);
      }
    }
  }

  public void removeEngagedOnGenerationLanguage(ModuleReference ref) {
    ModelChange.assertLegalChange(this);

    if (myLanguagesEngagedOnGeneration.contains(ref)) {
      myLanguagesEngagedOnGeneration.remove(ref);
      // don't send event but mark model as changed
      if (!isLoading()) {
        SModelRepository.getInstance().markChanged(this);
      }
    }
  }

  //aspects / additional

  public List<ImportElement> getAdditionalModelVersions() {
    return Collections.unmodifiableList(myImplicitImports);
  }

  public void addAdditionalModelVersion(@NotNull SModelReference modelReference, int usedVersion) {
    addAdditionalModelVersion(new ImportElement(modelReference, -1, usedVersion));
  }

  public void addAdditionalModelVersion(@NotNull ImportElement element) {
    ModelChange.assertLegalChange(this);
    myImplicitImports.add(element);
  }

  //other

  public static class ImportElement {
    private SModelReference myModelReference;
    private int myReferenceID;  // persistence related index
    private int myUsedVersion;

    public ImportElement(SModelReference modelReference, int referenceID) {
      this(modelReference, referenceID, -1);
    }

    public ImportElement(SModelReference modelReference, int referenceID, int usedVersion) {
      myModelReference = modelReference;
      myReferenceID = referenceID;
      myUsedVersion = usedVersion;
    }

    public SModelReference getModelReference() {
      return myModelReference;
    }

    public void setModelReference(SModelReference modelReference) {
      myModelReference = modelReference;
    }

    public int getReferenceID() {
      return myReferenceID;
    }

    public void setReferenceID(int referenceID) {
      myReferenceID = referenceID;
    }

    public int getUsedVersion() {
      return myUsedVersion;
    }

    public String toString() {
      return "ImportElement(" +
        "uid=" + myModelReference + ", " +
        "referenceId=" + myReferenceID + ", " +
        "usedVersion=" + myUsedVersion + ")";
    }

    @Override
    public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      ImportElement that = (ImportElement) o;

      if (myReferenceID != that.myReferenceID) return false;
      if (myUsedVersion != that.myUsedVersion) return false;
      if (myModelReference != null ? !myModelReference.equals(that.myModelReference) : that.myModelReference != null)
        return false;

      return true;
    }

    @Override
    public int hashCode() {
      int result = myModelReference != null ? myModelReference.hashCode() : 0;
      result = 31 * result + myReferenceID;
      result = 31 * result + myUsedVersion;
      return result;
    }
  }

  //---------persistance-related refactorings--------

  public void setPersistenceVersion(int persistenceVersion) {
    myHeader.setPersistenceVersion(persistenceVersion);
  }

  public int getPersistenceVersion() {
    return myHeader.getPersistenceVersion();
  }

  public SModelHeader getSModelHeader() {
    return myHeader;
  }

  public void refreshRefactoringHistory() {
    ModelChange.assertLegalChange(this);

    try {
      Element e = myStructureModificationHistory.toElement();
      myStructureModificationHistory = new StructureModificationHistory();
      myStructureModificationHistory.fromElement(e);
    } catch (Throwable t) {
      LOG.error("refactoring history refresh failed " + this, t, this);
    }
  }

  public void updateImportedModelUsedVersion(SModelReference sModelReference, int currentVersion) {
    ModelChange.assertLegalChange(this);

    ImportElement importElement = SModelOperations.getImportElement(this, sModelReference);
    if (importElement == null) {
      importElement = SModelOperations.getAdditionalModelElement(this, sModelReference);
    }

    if (importElement != null) {
      importElement.myUsedVersion = currentVersion;
    } else {
      addAdditionalModelVersion(sModelReference, currentVersion);
    }
    fireImportAddedEvent(myReference);
  }

  //--------- stuff --------

  @NotNull
  public String toString() {
    return getSModelReference().toString();
  }

  public void dispose() {
    ModelChange.assertLegalChange(this);
    if (myDisposed) return;

    myDisposed = true;
    myDisposedStacktrace = new Throwable();
    for (SNode sn : myIdToNodeMap.values()) {
      sn.dispose();
    }
    disposeFastNodeFinder();
    myIdToNodeMap = null;
    myRoots.clear();
  }

  public boolean updateSModelReferences() {
    ModelChange.assertLegalChange(this);
    enforceFullLoad();

    boolean changed = false;
    for (SNode node : myIdToNodeMap.values()) {
      for (SReference reference : node.getReferences()) {
        SModelReference oldReference = reference.getTargetSModelReference();
        if (oldReference == null) continue;
        SModelReference newRef = oldReference.update();
        if (newRef.differs(oldReference)) {
          changed = true;
          reference.setTargetSModelReference(newRef);
        }
      }
    }

    for (ImportElement e : myImports) {
      SModelReference oldReference = e.myModelReference;
      SModelReference newRef = oldReference.update();
      if (newRef.differs(oldReference)) {
        changed = true;
        e.myModelReference = newRef;
      }
    }

    for (ImportElement e : myImplicitImports) {
      SModelReference oldReference = e.myModelReference;
      SModelReference newRef = oldReference.update();
      if (newRef.differs(oldReference)) {
        changed = true;
        e.myModelReference = newRef;
      }
    }

    return changed;
  }

  public boolean updateModuleReferences() {
    ModelChange.assertLegalChange(this);

    boolean changed = false;

    if (updateRefs(myDevKits)) {
      changed = true;
    }

    if (updateRefs(myLanguages)) {
      changed = true;
    }

    if (updateRefs(myLanguagesEngagedOnGeneration)) {
      changed = true;
    }

    return changed;
  }

  //this method is only for access from SNode. Use SNode.isRoot from outer code

  boolean isRoot(@Nullable SNode node) {
    return myRoots.contains(node);
  }

  void changeModelReference(SModelReference newModelReference) {
    enforceFullLoad();
    SModelReference oldReference = myReference;
    myReference = newModelReference;
    for (SNode node : myIdToNodeMap.values()) {
      for (SReference reference : node.getReferences()) {
        if (oldReference.equals(reference.getTargetSModelReference())) {
          reference.setTargetSModelReference(newModelReference);
        }
      }
    }
  }

  private boolean updateRefs(List<ModuleReference> refs) {
    boolean changed = false;
    for (int i = 0; i < refs.size(); i++) {
      ModuleReference ref = refs.get(i);
      IModule module = MPSModuleRepository.getInstance().getModule(ref);
      if (module != null) {
        ModuleReference newRef = module.getModuleReference();
        refs.set(i, newRef);
        changed = changed || ref.differs(newRef);
      }
    }
    return changed;
  }

  private void checkNotDisposed() {
    if (!myDisposed) return;
    LOG.error(new IllegalModelAccessError("accessing disposed model"));
  }

  //---------deprecated--------

  @Deprecated
  //to use in old persistence
  public void addModelImport(ImportElement importElement) {
    ModelChange.assertLegalChange(this);

    myImports.add(importElement);
    fireImportAddedEvent(importElement.getModelReference());
  }

  @Deprecated
  //to use in old persistence
  public void setMaxImportIndex(int i) {
    myMaxImportIndex = i;
  }

  @Deprecated
  //to use in old persistence
  public int getMaxImportIndex() {
    return myMaxImportIndex;
  }

  /**
   * @deprecated Use SModelDescriptor.getRefactoringsHistory()
   */
  @Deprecated
  public StructureModificationHistory getRefactoringHistory() {
    return myStructureModificationHistory;
  }

  @Deprecated
  public void setRefactoringHistory(StructureModificationHistory history) {
    ModelChange.assertLegalChange(this);

    myStructureModificationHistory = history;
  }

  @Deprecated
  //use roots() instead
  public <N extends INodeAdapter> List<N> getRootsAdapters(@NotNull Class<N> cls) {
    List<N> result = new ArrayList<N>();
    for (SNode root : roots()) {
      INodeAdapter a = root.getAdapter();
      if (cls.isInstance(a)) {
        result.add((N) a);
      }
    }
    return result;
  }

  @Nullable
  public SNode getNodeById(String idString) {
    SNodeId nodeId = SNodeId.fromString(idString);
    assert nodeId != null : "wrong node id string";
    return getNodeById(nodeId);
  }

  @CodeOrchestraPatch
  public List<SNode> rootsIncludedImportedInModule(IScope scope, String conceptFqName, @NotNull SNode contextNode) {
    List<SNode> result = jetbrains.mps.lang.smodel.generator.smodelAdapter.SModelOperations.getRootsIncludingImported(this, scope, conceptFqName);

    // No fooling around with the transient models
    if (isTransient()) {
      return result;
    }

    // Locate context root node
    SNode contextRoot = null;
    if (contextNode.isRoot()) {
      contextRoot = contextNode;
    } else {
      contextRoot = contextNode.getContainingRoot();
    }

    // Get the context root source module UID
    Set<String> sourceModuleUIDs = contextRoot.getSourceModuleUIDs();
    if (sourceModuleUIDs.isEmpty()) {
      return result;
    }

    // Locate the context node model owner module
    IModule contextNodeModelOwner = null;
    for (IModule owner : SModelRepository.getInstance().getModules(contextNode.getModel().getModelDescriptor())) {
      if (owner != null) {
        String uuid = owner.getUUID();
        if (uuid != null && sourceModuleUIDs.contains(uuid)) {
          contextNodeModelOwner = owner;
          break;
        }
      }
    }
    if (contextNodeModelOwner == null) {
      return result;
    }

    // Find out the module dependencies of the context node model owner module
    Set<String> dependenciesUIDS = new HashSet<String>();
    dependenciesUIDS.addAll(sourceModuleUIDs);
    for (Dependency dependency : contextNodeModelOwner.getDependOn()) {
      IModule dependencyModule = MPSModuleRepository.getInstance().getModule(dependency.getModuleRef());
      // RE-2642
      if (dependencyModule != null) {
        dependenciesUIDS.add(dependencyModule.getUUID());
      }
    }

    // Filter the roots list by the source module UID
    Iterator<SNode> rootIterator = result.iterator();
    while (rootIterator.hasNext()) {
      Set<String> candidateRootSourceModuleUIDs = rootIterator.next().getSourceModuleUIDs();

      if (!candidateRootSourceModuleUIDs.isEmpty()) {
        // If dependenciesUIDS does not contain any of the candidateRootSourceModuleUIDs
        if (!CollectionUtils.containsAny(dependenciesUIDS, candidateRootSourceModuleUIDs)) {
          rootIterator.remove();
        }
      }
    }

    return result;
  }


}
