/*
 * Copyright 2000-2009 JetBrains s.r.o.
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

package com.intellij.execution.actions;

import com.intellij.execution.ExecutionBundle;
import com.intellij.execution.impl.EditConfigurationsDialog;
import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.IconLoader;
import com.intellij.ui.LayeredIcon;
import com.intellij.util.ui.EmptyIcon;
import jetbrains.mps.project.IModule;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.ProjectAndModuleHolder;

public class EditRunConfigurationsAction extends AnAction{
  public EditRunConfigurationsAction() {
    LayeredIcon icon = new LayeredIcon(2);
    icon.setIcon(IconLoader.getIcon("/actions/editSource.png"),0,2,2);
    icon.setIcon(EmptyIcon.ICON_18, 1);
    getTemplatePresentation().setIcon(icon);
  }

  @CodeOrchestraPatch
  public void actionPerformed(final AnActionEvent e) {
    final Project project = e.getData(PlatformDataKeys.PROJECT);
    if (project == null || project.isDisposed()) return;

    // RE-1647 & RF-828
    ProjectAndModuleHolder projectAndModuleHolder = ProjectAndModuleHolder.getInstance();
    projectAndModuleHolder.setProject(project);
    IModule module = e.getData(MPSDataKeys.MODULE);
    if (module != null) {
      projectAndModuleHolder.setModuleReference(module.getModuleReference());
    }

    final EditConfigurationsDialog dialog = new EditConfigurationsDialog(project);
    dialog.show();
  }

  public void update(final AnActionEvent e) {
    Presentation presentation = e.getPresentation();
    presentation.setEnabled(e.getData(PlatformDataKeys.PROJECT) != null);
    if (ActionPlaces.RUN_CONFIGURATIONS_COMBOBOX.equals(e.getPlace())) {
      presentation.setText(ExecutionBundle.message("edit.configuration.action"));
      presentation.setDescription(presentation.getText());
    }
  }
}
