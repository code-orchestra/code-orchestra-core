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

import com.intellij.openapi.actionSystem.ActionGroup;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.projectPane.ProjectPaneActionGroups;
import jetbrains.mps.ide.ui.ErrorState;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.workbench.action.ActionUtils;

import java.util.ArrayList;
import java.util.List;

public class AccessoriesModelTreeNode extends TextTreeNode {
  private ProjectLanguageTreeNode myProjectLanguageTreeNode;

  public AccessoriesModelTreeNode(ProjectLanguageTreeNode projectLanguageTreeNode) {
    super("accessories");
    myProjectLanguageTreeNode = projectLanguageTreeNode;
    setIcon(Icons.LIB_ICON);
  }

  public List<String> validate() {
    List<String> errors = new ArrayList<String>();
    IScope scope = myProjectLanguageTreeNode.getLanguage().getScope();
    for (SModelReference accessory : myProjectLanguageTreeNode.getLanguage().getModuleDescriptor().getAccessoryModels()) {
      if (scope.getModelDescriptor(accessory) == null) {
        errors.add("Can't find accessory " + accessory.getLongName());
      }
    }
    return errors;
  }

  protected void doUpdatePresentation() {
    super.doUpdatePresentation();
    setErrorState(validate().isEmpty() ? ErrorState.NONE : ErrorState.ERROR);
  }

  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ProjectPaneActionGroups.PROJECT_PANE_ACCESSORIES_ACTIONS);
  }
}
