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
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SReference;
import org.jetbrains.annotations.NotNull;

import java.util.List;
import java.util.Set;

public class ProxyFindUsagesManager extends FindUsagesManager {
  private static boolean ourUseFastManager = true;

  private FindUsagesManager myDefault;
  private FindUsagesManager myFast;

  public ProxyFindUsagesManager(ClassLoaderManager manager) {
    myDefault = new DefaultFindUsagesManager(manager);
  }

  @NotNull
  public String getComponentName() {
    return "Proxy Find Usages Manager";
  }

  public static void setOurUseFastManager(boolean useFastManager) {
    ourUseFastManager = useFastManager;
  }

  public void setFastManager(FindUsagesManager fast) {
    myFast = fast;
  }

  private FindUsagesManager getRealManager() {
    return myFast != null && ourUseFastManager ? myFast : myDefault;
  }

  public void initComponent() {
    myDefault.initComponent();
  }

  public void disposeComponent() {
    myDefault.disposeComponent();
  }

  public Set<SNode> findDescendants(SNode node, IScope scope) {
    return getRealManager().findDescendants(node, scope);
  }


  public Set<SReference> findUsages(SNode node, IScope scope) {
    return getRealManager().findUsages(node, scope);
  }

  public Set<SReference> findUsages(SNode node, IScope scope, IAdaptiveProgressMonitor progress) {
    return getRealManager().findUsages(node, scope, progress);
  }

  public Set<SReference> findUsages(Set<SNode> nodes, IScope scope, IAdaptiveProgressMonitor progress, boolean manageTasks) {
    return getRealManager().findUsages(nodes, scope, progress, manageTasks);
  }

  public List<SNode> findInstances(SNode conceptDeclaration, IScope scope) {
    return getRealManager().findInstances(conceptDeclaration, scope);
  }

  public List<SNode> findInstances(SNode conceptDeclaration, IScope scope, IAdaptiveProgressMonitor monitor) {
    return getRealManager().findInstances(conceptDeclaration, scope, monitor);
  }

  public Set<SNode> findInstances(SNode concept, IScope scope, IAdaptiveProgressMonitor progress, boolean manageTasks) {
    return getRealManager().findInstances(concept, scope, progress, manageTasks);
  }

  public Set<SNode> findExactInstances(SNode concept, IScope scope, IAdaptiveProgressMonitor progress, boolean manageTasks) {
    return getRealManager().findExactInstances(concept, scope, progress, manageTasks);
  }
}
