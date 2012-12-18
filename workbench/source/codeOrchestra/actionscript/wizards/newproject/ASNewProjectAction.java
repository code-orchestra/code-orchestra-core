/*
 * Copyright 2003-2009 JetBrains s.r.o.
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
package codeOrchestra.actionscript.wizards.newproject;

import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import com.intellij.openapi.project.Project;
import jetbrains.mps.workbench.action.BaseAction;

import java.util.Map;

public class ASNewProjectAction extends BaseAction {

  public ASNewProjectAction() {
    setExecuteOutsideCommand(true);
    setDisableOnNoProject(false);  
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  public void doExecute(AnActionEvent e, Map<String, Object> params) {
    Project project = e.getData(PlatformDataKeys.PROJECT);
    ASNewProjectWizard wizard = new ASNewProjectWizard(project);
    wizard.show();
  }
  
}
