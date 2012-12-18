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
package jetbrains.mps.migration20.stages;

import com.intellij.openapi.progress.EmptyProgressIndicator;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.OptimizeImportsHelper;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.SModelRepository;

public class OptimizeImportsStage implements MigrationStage {
  public String title() {
    return "Optimize Imports";
  }

  public void execute(MPSProject p) {
    new OptimizeImportsHelper(ProjectOperationContext.get(p.getProject())).optimizeProjectImports(p);
    for (IModule module : ListSequence.fromList(p.getModules())) {
      module.save();
    }
    SModelRepository.getInstance().saveAll();
    ClassLoaderManager.getInstance().reloadAll(new EmptyProgressIndicator());
  }

  public boolean needsCommand() {
    return true;
  }

  public String messageBefore() {
    return "Now imports will be optimized to remove old unused dependencies to stub models and non-existing modules";
  }

  public String messageAfter() {
    return null;
  }
}
