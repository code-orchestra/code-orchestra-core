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

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.progress.ProgressIndicator;
import jetbrains.mps.ide.progress.IAdaptiveProgressMonitor;
import jetbrains.mps.ide.progress.NullAdaptiveProgressMonitor;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SReference;

import java.util.List;
import java.util.Set;

public abstract class FindUsagesManager implements ApplicationComponent {

  public static FindUsagesManager getInstance() {
    return ApplicationManager.getApplication().getComponent(ProxyFindUsagesManager.class);
  }

  public abstract Set<SNode> findDescendants(SNode node, IScope scope);

  public abstract Set<SReference> findUsages(SNode node, IScope scope);

  public abstract Set<SReference> findUsages(SNode node, IScope scope, IAdaptiveProgressMonitor progress);

  public abstract Set<SReference> findUsages(Set<SNode> nodes, IScope scope, IAdaptiveProgressMonitor progress, boolean manageTasks);

  public abstract List<SNode> findInstances(SNode conceptDeclaration, IScope scope);

  public abstract List<SNode> findInstances(SNode conceptDeclaration, IScope scope, IAdaptiveProgressMonitor monitor);

  public abstract Set<SNode> findInstances(SNode concept, IScope scope, IAdaptiveProgressMonitor progress, boolean manageTasks);

  public abstract Set<SNode> findExactInstances(SNode concept, IScope scope, IAdaptiveProgressMonitor progress, boolean manageTasks);

  public static class ProgressAdapter extends NullAdaptiveProgressMonitor {
    private final ProgressIndicator myProgress;

    public ProgressAdapter(ProgressIndicator progress) {
      myProgress = progress;
    }

    public void addText(String text) {
      myProgress.setText(text);
    }

    public boolean isCanceled() {
      return myProgress.isCanceled();
    }
  }

}
