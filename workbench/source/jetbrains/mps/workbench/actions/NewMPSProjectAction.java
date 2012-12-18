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
package jetbrains.mps.workbench.actions;

import com.intellij.openapi.actionSystem.ActionPlaces;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import com.intellij.openapi.project.Project;
import jetbrains.mps.workbench.action.BaseAction;
import jetbrains.mps.workbench.dialogs.project.newproject.NewProjectWizard;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import java.util.Map;

public class NewMPSProjectAction extends BaseAction {
  private static final Icon NEW_ICON_WELCOME_SCREEN = new ImageIcon(OpenMPSProjectAction.class.getResource("newWelcomeScreen.png"));

  public NewMPSProjectAction() {
    setExecuteOutsideCommand(true);
    setDisableOnNoProject(false);

    getTemplatePresentation().setIcon(NEW_ICON_WELCOME_SCREEN);
  }

  @Override
  protected void doUpdate(AnActionEvent e, Map<String, Object> _params) {
    super.doUpdate(e, _params);
    if (ActionPlaces.WELCOME_SCREEN.equals(e.getPlace())) {
      e.getPresentation().setIcon(NEW_ICON_WELCOME_SCREEN);
    } else {
      e.getPresentation().setIcon(null);
    }
  }

  public void doExecute(AnActionEvent e, Map<String, Object> _params) {
    Project project = e.getData(PlatformDataKeys.PROJECT);
    NewProjectWizard wizard = new NewProjectWizard("New Project", project);
    wizard.show();
  }
}
