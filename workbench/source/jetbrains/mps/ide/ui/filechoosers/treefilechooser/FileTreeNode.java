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
package jetbrains.mps.ide.ui.filechoosers.treefilechooser;

import com.intellij.openapi.util.io.FileUtil;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.vfs.IFile;

import javax.swing.Icon;
import javax.swing.filechooser.FileSystemView;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public abstract class FileTreeNode extends MPSTreeNode {
  private boolean myInitialized;

  public FileTreeNode(IFile file) {
    super(null);

    setAssociatedFile(file);

    String filename = file.getName();
    boolean isDisk = isDiskNode();

    if (isDisk) {
      filename = file.getPath();
    }

    setNodeIdentifier(filename);

    FileSystemView fsView = FileSystemView.getFileSystemView();

    Icon icon;
    String extension = FileUtil.getExtension(file.getName());

    if (extension.equals(MPSExtentions.MPS_PROJECT)) {
      icon = Icons.PROJECT_ICON;
    } else if (extension.equals(MPSExtentions.LANGUAGE)) {
      icon = Icons.LANGUAGE_ICON;
    } else if (extension.equals(MPSExtentions.SOLUTION)) {
      icon = Icons.SOLUTION_ICON;
    } else if (extension.equals(MPSExtentions.DEVKIT)) {
      icon = Icons.DEVKIT_ICON;
    } else if (extension.equals(MPSExtentions.MODEL)) {
      icon = Icons.MODEL_ICON;
    } else {
      icon = fsView.getSystemIcon(new File(file.getPath()));
    }


    String caption = filename;
    if (!isDisk) {
      if (new File(file.getPath()).isHidden()) {
        caption = "<html><font color='gray'>" + caption + "</font></html>";
        //todo: set new icon
      }
    }
    setText(caption);
    setIcon(icon);
  }

  public boolean isInitialized() {
    return myInitialized;
  }

  public IFile getAssociatedFile() {
    return (IFile) getUserObject();
  }

  public boolean isDiskNode() {
    return getAssociatedFile().getName().equals("");
  }

  public boolean isLeaf() {
    return !getAssociatedFile().isDirectory();
  }

  private void setAssociatedFile(IFile file) {
    setUserObject(file);
  }

  protected void doUpdate() {
    this.removeAllChildren();
    myInitialized = false;
  }

  protected void doInit() {
    if (getAssociatedFile().isDirectory()) {
      List<IFile> sortedFiles = new ArrayList<IFile>();
      for (IFile f : getAssociatedFile().getChildren()) {
        if (getFileFilter().accept(f)) {
          sortedFiles.add(f);
        }
      }
      Collections.sort(sortedFiles, new Comparator<IFile>() {
        public int compare(IFile f1, IFile f2) {
          if (f1.isDirectory() && !f2.isDirectory()) {
            return -1;
          }
          if (f2.isDirectory() && !f1.isDirectory()) {
            return 1;
          }
          return f1.getName().compareToIgnoreCase(f2.getName());
        }
      });

      for (IFile file : sortedFiles) {
        add(new FileTreeNode(file) {
          protected IFileFilter getFileFilter() {
            return FileTreeNode.this.getFileFilter();
          }
        });
      }
    }
    myInitialized = true;
  }

  protected abstract IFileFilter getFileFilter();
}
