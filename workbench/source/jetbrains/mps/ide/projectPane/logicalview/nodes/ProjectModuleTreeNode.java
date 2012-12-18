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
package jetbrains.mps.ide.projectPane.logicalview.nodes;

import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.project.*;
import jetbrains.mps.project.structure.ProjectStructureModule;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.Language;

public abstract class ProjectModuleTreeNode extends MPSTreeNode {
  public static ProjectModuleTreeNode createFor(MPSProject project, IModule module) {
    return createFor(project, module, false);
  }

  public static ProjectModuleTreeNode createFor(MPSProject project, IModule module, boolean shortNameOnly) {
    if (module instanceof Language) {
      return new ProjectLanguageTreeNode((Language) module, project, shortNameOnly);
    } else if (module instanceof Solution || module instanceof ProjectStructureModule) {
      return new ProjectSolutionTreeNode((AbstractModule) module, project, shortNameOnly);
    } else if (module instanceof DevKit) {
      return new ProjectDevKitTreeNode((DevKit) module, project, false);
    } else if (module instanceof Library) {
      return new ProjectLibraryTreeNode((Library) module, project, false);
    }

    return null;
  }

  protected ProjectModuleTreeNode(IOperationContext operationContext) {
    super(operationContext);
  }

  protected void doUpdatePresentation() {
    setText(getModulePresentation());
  }

  protected abstract String getModulePresentation();

  public abstract IModule getModule();

  protected final boolean canBeOpened() {
    return false;
  }
}
