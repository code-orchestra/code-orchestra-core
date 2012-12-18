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
package jetbrains.mps.typesystem.uiActions;

import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DefaultActionGroup;
import com.intellij.openapi.actionSystem.ToggleAction;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.hierarchy.AbstractHierarchyTree;
import jetbrains.mps.ide.hierarchy.AbstractHierarchyView;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.workbench.action.ActionUtils;

public class SupertypesViewTool extends AbstractHierarchyView {
  public SupertypesViewTool(Project project) {
    super(project, "Supertypes", -1, Icons.DEFAULT_ICON);
  }

  protected AbstractHierarchyTree createHierarchyTree(boolean isParentHierarchy) {
    return new SupertypesTree(this);
  }

  protected DefaultActionGroup createButtonsGroup() {
    ToggleAction action = new ToggleAction("Strong", "Show Only Strong Supertypes", Icons.STRONG_SUBTYPE_ICON) {
      private boolean myState = false;

      public boolean isSelected(AnActionEvent e) {
        return myState;
      }

      public void setSelected(AnActionEvent e, boolean state) {
        myState = state;
        ((SupertypesTree) myHierarchyTree).setShowOnlyStrong(myState);
      }
    };

    return ActionUtils.groupFromActions(action,createCloseAction());
  }

  protected boolean isTreeInfinite() {
    return true;
  }
}
