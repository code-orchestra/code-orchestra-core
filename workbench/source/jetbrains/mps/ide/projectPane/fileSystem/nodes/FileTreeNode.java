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
package jetbrains.mps.ide.projectPane.fileSystem.nodes;

import com.intellij.openapi.actionSystem.ActionGroup;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.ide.actions.FileActions_ActionGroup;
import jetbrains.mps.workbench.action.ActionUtils;

import javax.swing.Icon;

public class FileTreeNode extends AbstractFileTreeNode {
  public FileTreeNode(Project project, VirtualFile file) {
    super(project, file);
  }

  public boolean isLeaf() {
    return true;
  }

  protected void doUpdatePresentation() {
    super.doUpdatePresentation();
    Icon icon = getIcon();
    if (icon != null) setIcon(icon);
  }

  private Icon getIcon() {
    return myFile.getFileType().getIcon();
  }

  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(FileActions_ActionGroup.ID);
  }
}
