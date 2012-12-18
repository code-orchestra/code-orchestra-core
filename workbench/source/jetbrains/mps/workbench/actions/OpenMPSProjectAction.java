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

import com.intellij.ide.impl.ProjectUtil;
import com.intellij.openapi.actionSystem.ActionPlaces;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import com.intellij.openapi.project.Project;
import com.intellij.platform.ProjectBaseDirectory;
import codeOrchestra.actionscript.wizards.settings.ASNewProjectRootSettings;
import jetbrains.mps.ide.ui.filechoosers.treefilechooser.IFileFilter;
import jetbrains.mps.ide.ui.filechoosers.treefilechooser.TreeFileChooser;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.workbench.action.BaseAction;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import java.awt.Frame;
import java.util.Map;

public class OpenMPSProjectAction extends BaseAction {
  private static final Icon OPEN_ICON = new ImageIcon(OpenMPSProjectAction.class.getResource("open.png"));
  private static final Icon OPEN_ICON_WELCOME_SCREEN = new ImageIcon(OpenMPSProjectAction.class.getResource("openWelcomeScreen.png"));

  public OpenMPSProjectAction() {
    setExecuteOutsideCommand(true);
    setDisableOnNoProject(false);

    getTemplatePresentation().setIcon(OPEN_ICON_WELCOME_SCREEN);
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  @Override
  protected void doUpdate(AnActionEvent e, Map<String, Object> _params) {
    super.doUpdate(e, _params);

    if (ActionPlaces.WELCOME_SCREEN.equals(e.getPlace())) {
      e.getPresentation().setIcon(OPEN_ICON_WELCOME_SCREEN);
    } else {
      e.getPresentation().setIcon(OPEN_ICON);
    }
  }

  @CodeOrchestraPatch
  public void doExecute(AnActionEvent e, Map<String, Object> _params) {
    TreeFileChooser chooser = new TreeFileChooser();

    chooser.setFileFilter(new IFileFilter() {
      public boolean accept(IFile file) {
        return file.isDirectory() || file.getName().toLowerCase().endsWith(MPSExtentions.DOT_MPS_PROJECT);
      }
    });

    // RF-624
    try {
      chooser.setInitialFile(FileSystem.getInstance().getFileByPath(ASNewProjectRootSettings.getInstance().getProjectRoot()));
    } catch (Throwable t) {
      // ignore
    }

    IFile file = chooser.showDialog((Frame) null);
    if (file == null) {
      return;
    }

    String filePath = file.getPath();

    Project project = ProjectUtil.openProject(filePath, e.getData(PlatformDataKeys.PROJECT), false);
    if (project != null) {
      ProjectBaseDirectory.getInstance(project).setBaseDir(project.getBaseDir());
    }
  }
}
