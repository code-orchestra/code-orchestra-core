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
import com.intellij.openapi.fileTypes.FileTypeManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.vcs.impl.ExcludedFileIndex;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.ide.actions.FolderActions_ActionGroup;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.workbench.action.ActionUtils;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

public class FolderTreeNode extends AbstractFileTreeNode {
  private boolean myInitialized;
  private Project myProject;

  public FolderTreeNode(Project project, @NotNull VirtualFile folder) {
    this(project, folder, false);
  }

  public FolderTreeNode(Project project, @NotNull VirtualFile folder, boolean showFullPath) {
    super(project, folder, showFullPath);
    myProject = project;
  }

  protected void doUpdate() {
    this.removeAllChildren();
    myInitialized = false;
  }

  public boolean isInitialized() {
    return myInitialized;
  }

  protected void doInit() {
    removeAllChildren();

    VirtualFile[] files = myFile.getChildren();
    ArrayList<VirtualFile> sortedFiles = new ArrayList<VirtualFile>();
    sortedFiles.addAll(Arrays.asList(files));
    Collections.sort(sortedFiles, new Comparator<VirtualFile>() {
      public int compare(VirtualFile o1, VirtualFile o2) {
        return o1.getPath().compareTo(o2.getPath());
      }
    });
    for (VirtualFile f : sortedFiles) {
      if (f.exists()) {
        if (!FileTypeManager.getInstance().isFileIgnored(f.getName()) &&
          !ExcludedFileIndex.getInstance(myProject).isExcludedFile(f) &&
          f.isDirectory()) {
          this.add(createNode(myProject, f));
        }
      }
    }
    for (VirtualFile f : sortedFiles) {
      if (f.exists()) {
        if (!FileTypeManager.getInstance().isFileIgnored(f.getName()) &&
          !ExcludedFileIndex.getInstance(myProject).isExcludedFile(f) &&
          !f.isDirectory()) {

          this.add(createNode(myProject, f));
        }
      }
    }

    updatePresentation();
    myInitialized = true;
  }

  private static MPSTreeNode createNode(Project project, VirtualFile file) {
    if (file.isDirectory()) {
      return new FolderTreeNode(project, file);
    } else {
      return new FileTreeNode(project, file);
    }
  }

  @Override
  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(FolderActions_ActionGroup.ID);
  }
}
