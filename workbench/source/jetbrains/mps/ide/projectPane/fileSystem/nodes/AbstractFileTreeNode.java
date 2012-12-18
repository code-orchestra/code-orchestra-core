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
import com.intellij.openapi.vcs.impl.VcsFileStatusProvider;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.ide.actions.AbstractFileActions_ActionGroup;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.workbench.action.ActionUtils;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public abstract class AbstractFileTreeNode extends MPSTreeNode {
  protected final VirtualFile myFile;
  protected VcsFileStatusProvider myProvider;
  protected Project myProject;
  private boolean myShowFullPath;

  public AbstractFileTreeNode(Project project, VirtualFile file) {
    this(project, file, false);
  }

  public AbstractFileTreeNode(Project project, VirtualFile file, boolean showFullPath) {
    super(new NullOperationContext());
    myFile = file;
    myProvider = project.getComponent(VcsFileStatusProvider.class);
    myProject = project;
    myShowFullPath = showFullPath;
    updatePresentationInternal();
  }

  @Override
  protected void doUpdatePresentation() {
    updatePresentationInternal();
  }

  private void updatePresentationInternal() {
    if (!myFile.exists()) {
      removeFromParent();
      return;
    }
    setText(myFile.getName());
    if (myShowFullPath) {
      setAdditionalText(myFile.getPresentableUrl());
    }
    setNodeIdentifier(myFile.getPath() != null ? myFile.getPath() : "");
    setColor(myProvider.getFileStatus(myFile).getColor());
  }

  @Override
  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(AbstractFileActions_ActionGroup.ID);
  }

  public VirtualFile getFile() {
    return myFile;
  }

  public String toString() {
    return myFile.getUrl();
  }

  public Collection<? extends AbstractFileTreeNode> getChildren() {
    List<AbstractFileTreeNode> children = new LinkedList<AbstractFileTreeNode>();
    for (int i = 0; i < getChildCount(); i++) {
      children.add((AbstractFileTreeNode) getChildAt(i));
    }
    return children;
  }

}
