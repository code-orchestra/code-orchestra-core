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
package jetbrains.mps.findUsages;

import jetbrains.mps.ide.progress.IAdaptiveProgressMonitor;
import jetbrains.mps.ide.progress.util.ModelsProgressUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.CollectionUtil;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.*;

class DefaultFindUsagesManager extends FindUsagesManager {
  private static final Logger LOG = Logger.getLogger(DefaultFindUsagesManager.class);

  private HashMap<SNode, Map<SModelDescriptor, Set<SNode>>> myConceptsToKnownDescendantsInModelDescriptors = new HashMap<SNode, Map<SModelDescriptor, Set<SNode>>>();
  private ClassLoaderManager myClassLoaderManager;
  private ReloadAdapter myReloadHandler = new ReloadAdapter() {
    public void unload() {
      DefaultFindUsagesManager.invalidateCaches();
    }
  };

  public DefaultFindUsagesManager(ClassLoaderManager manager) {
    myClassLoaderManager = manager;
  }

  public void initComponent() {
    myClassLoaderManager.addReloadHandler(myReloadHandler);
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "MPS Find Usages Manager";
  }

  public void disposeComponent() {
    myClassLoaderManager.removeReloadHandler(myReloadHandler);
  }

  public Set<SNode> findDescendants(SNode node, IScope scope) {
    LOG.assertCanRead();
    Map<SModelDescriptor, Set<SNode>> knownDescendantsInModelDescriptors = myConceptsToKnownDescendantsInModelDescriptors.get(node);
    if (knownDescendantsInModelDescriptors == null) {
      knownDescendantsInModelDescriptors = new HashMap<SModelDescriptor, Set<SNode>>();
      myConceptsToKnownDescendantsInModelDescriptors.put(node, knownDescendantsInModelDescriptors);
    }
    Set<SNode> result = new HashSet<SNode>();
    for (SModelDescriptor model : scope.getModelDescriptors()) {
      if (SModelStereotype.isStubModelStereotype(model.getStereotype())) continue;
      Set<SNode> descendantsKnownInModel = knownDescendantsInModelDescriptors.get(model);
      if (descendantsKnownInModel == null) {
        descendantsKnownInModel = new HashSet<SNode>();
        knownDescendantsInModelDescriptors.put(model, descendantsKnownInModel);
      }
      result.addAll(new ModelFindOperations(model).findDescendants(node, descendantsKnownInModel));
    }

    return result;
  }

  public Set<SReference> findUsages(SNode node, IScope scope) {
    return findUsages(node, scope, (IAdaptiveProgressMonitor) null);
  }

  /**
   * Fully equivalent to <code>findUsages(CollectionsUtil.asSet(node),scope,progress)</code>
   * <p>
   * <strong>NB!</strong> This method is long-running, don't use where execution time is critical.
   * </p>
   *
   * @param node
   * @param scope
   * @param progress
   * @return
   */
  public Set<SReference> findUsages(SNode node, IScope scope, IAdaptiveProgressMonitor progress) {
    LOG.assertCanRead();
    return findUsages(CollectionUtil.set(node), scope, progress, true);
  }

  public Set<SReference> findUsages(Set<SNode> nodes, IScope scope, IAdaptiveProgressMonitor progress, boolean manageTasks) {
    LOG.assertCanRead();
    Set<SReference> result = new HashSet<SReference>();
    //noinspection EmptyFinallyBlock
    try {
      if (progress == null) progress = IAdaptiveProgressMonitor.NULL_PROGRESS_MONITOR;
      Iterable<SModelDescriptor> models = scope.getModelDescriptors();

      if (manageTasks) {
        long estimatedTime = ModelsProgressUtil.estimateFindNodeUsagesTimeMillis(models);
        progress.startTaskAnyway(ModelsProgressUtil.TASK_KIND_FIND_NODE_USAGES, null, estimatedTime);
        progress.addText("Finding usages...");
      }

      for (SModelDescriptor model : models) {
        String taskName = ModelsProgressUtil.findNodeUsagesModelTaskName(model);
        if (manageTasks) progress.startLeafTask(taskName, ModelsProgressUtil.TASK_KIND_FIND_NODE_USAGES);
        result.addAll(new ModelFindOperations(model).findUsages(nodes));
        if (progress.isCanceled()) {
          if (manageTasks) progress.finishAnyway();
          return result;
        }
        if (manageTasks) progress.finishTask(taskName);
      }
      if (manageTasks) progress.finishTask(ModelsProgressUtil.TASK_KIND_FIND_NODE_USAGES);
      return result;
    } finally {
      // progress.finishSomehow();
    }
  }

  /**
   * Fully equivalent to <code>findInstances((ConceptDeclaration) BaseAdapter.fromNode(conceptDeclaration), scope, null)</code>
   * <p>
   * <strong>NB!</strong> This method is long-running, don't use where execution time is critical.
   * </p>
   *
   * @param conceptDeclaration
   * @param scope
   * @return
   */
  public List<SNode> findInstances(SNode conceptDeclaration, IScope scope) {
    Set<SNode> set = findInstances(conceptDeclaration, scope, null, true);
    return new ArrayList<SNode>(set);
  }

  /**
   * Fully equivalent to <code>findInstances((ConceptDeclaration) BaseAdapter.fromNode(conceptDeclaration), scope, null)</code>
   * <p>
   * <strong>NB!</strong> This method is long-running, don't use where execution time is critical.
   * </p>
   *
   * @param conceptDeclaration
   * @param scope
   * @param monitor
   * @return
   */
  public List<SNode> findInstances(SNode conceptDeclaration, IScope scope, IAdaptiveProgressMonitor monitor) {
    Set<SNode> set = findInstances(conceptDeclaration, scope, monitor, true);
    return new ArrayList<SNode>(set);
  }

  public Set<SNode> findInstances(SNode concept, IScope scope, IAdaptiveProgressMonitor progress, boolean manageTasks) {
    LOG.assertCanRead();
    Set<SNode> result = new HashSet<SNode>();
    //noinspection EmptyFinallyBlock
    try {
      if (progress == null) progress = IAdaptiveProgressMonitor.NULL_PROGRESS_MONITOR;
      Iterable<SModelDescriptor> models = scope.getModelDescriptors();

      if (manageTasks) {
        long estimatedTime = ModelsProgressUtil.estimateFindInstancesTimeMillis(models);
        progress.startTaskAnyway(ModelsProgressUtil.TASK_KIND_FIND_INSTANCES, null, estimatedTime);
        progress.addText("Finding Instances...");
      }

      for (SModelDescriptor model : models) {
        String taskName = ModelsProgressUtil.findInstancesModelTaskName(model);
        if (manageTasks) progress.startLeafTask(taskName, ModelsProgressUtil.TASK_KIND_FIND_INSTANCES);
        result.addAll(new ModelFindOperations(model).findInstances(concept, scope));
        if (progress.isCanceled()) {
          if (manageTasks) progress.finishAnyway();
          return result;
        } else {
          if (manageTasks) progress.finishTask(taskName);
        }
      }
      if (manageTasks) progress.finishTask(ModelsProgressUtil.TASK_KIND_FIND_INSTANCES);
      return result;
    } finally {
      // progress.finishSomehow();
    }
  }

  public Set<SNode> findExactInstances(SNode concept, IScope scope, IAdaptiveProgressMonitor progress, boolean manageTasks) {
    LOG.assertCanRead();
    Set<SNode> result = new HashSet<SNode>();
    //noinspection EmptyFinallyBlock
    try {
      if (progress == null) progress = IAdaptiveProgressMonitor.NULL_PROGRESS_MONITOR;
      Iterable<SModelDescriptor> models = scope.getModelDescriptors();

      if (manageTasks) {
        long estimatedTime = ModelsProgressUtil.estimateFindExactInstancesTimeMillis(models);
        progress.startTaskAnyway(ModelsProgressUtil.TASK_KIND_FIND_EXACT_INSTANCES, null, estimatedTime);
        progress.addText("Finding Instances...");
      }

      for (SModelDescriptor model : models) {
        String taskName = ModelsProgressUtil.findExactInstancesModelTaskName(model);
        if (manageTasks) progress.startLeafTask(taskName, ModelsProgressUtil.TASK_KIND_FIND_EXACT_INSTANCES);
        result.addAll(new ModelFindOperations(model).findExactInstances(concept, scope));
        if (progress.isCanceled()) {
          if (manageTasks) progress.finishAnyway();
          return result;
        } else {
          if (manageTasks) progress.finishTask(taskName);
        }
      }
      if (manageTasks) progress.finishTask(ModelsProgressUtil.TASK_KIND_FIND_EXACT_INSTANCES);
      return result;
    } finally {
      // progress.finishSomehow();
    }
  }

  private static void invalidateCaches() {
  }
}
