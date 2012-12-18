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
package jetbrains.mps.project;

import com.intellij.ide.impl.ProjectUtil;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.platform.ProjectBaseDirectory;
import com.intellij.projectImport.ProjectOpenProcessor;
import jetbrains.mps.fileTypes.MPSFileTypeFactory;
import jetbrains.mps.ide.projectPane.Icons;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;

public class MpsProjectOpenProcessor extends ProjectOpenProcessor {
  public String getName() {
    return "MPS Project";
  }

  public Icon getIcon() {
    return Icons.PROJECT_ICON;
  }

  public boolean canOpenProject(VirtualFile file) {
    return MPSFileTypeFactory.PROJECT_FILE_TYPE.equals(file.getFileType());
  }

  public Project doOpenProject(@NotNull VirtualFile virtualFile, Project projectToClose, boolean forceOpenInNewFrame) {
    String filePath = virtualFile.getPath();
    Project project = ProjectUtil.openProject(filePath, projectToClose, forceOpenInNewFrame);
    if (project == null) {
      return null;
    }
    ProjectBaseDirectory.getInstance(project).setBaseDir(virtualFile);
    return project;
  }
}
