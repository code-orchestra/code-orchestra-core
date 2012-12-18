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
package jetbrains.mps.fileTypes;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.fileTypes.FileType;
import com.intellij.openapi.fileTypes.FileTypeManager;
import com.intellij.openapi.vfs.VirtualFile;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class MPSFileTypesManager implements ApplicationComponent {
  public static MPSFileTypesManager instance() {
    return ApplicationManager.getApplication().getComponent(MPSFileTypesManager.class);
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "VCS Application Component";
  }

  public void initComponent() {

  }

  public void disposeComponent() {

  }

  public boolean isModuleFile(VirtualFile file) {
    if (file == null) return false;
    FileType type = file.getFileType();
    return type.equals(MPSFileTypeFactory.LANGUAGE_FILE_TYPE) ||
      type.equals(MPSFileTypeFactory.SOLUTION_FILE_TYPE) ||
      type.equals(MPSFileTypeFactory.DEVKIT_FILE_TYPE);
  }

  public boolean isModelFile(VirtualFile vfile) {
    if (vfile == null) return false;
    return vfile.getFileType().equals(MPSFileTypeFactory.MODEL_FILE_TYPE);
  }


  public boolean isModuleFile(String path) {
    if (path == null) return false;
    FileType type = FileTypeManager.getInstance().getFileTypeByFileName(path);
    return type.equals(MPSFileTypeFactory.LANGUAGE_FILE_TYPE) ||
      type.equals(MPSFileTypeFactory.SOLUTION_FILE_TYPE) ||
      type.equals(MPSFileTypeFactory.DEVKIT_FILE_TYPE);
  }

  public boolean isModelFile(String path) {
    if (path == null) return false;
    FileType type = FileTypeManager.getInstance().getFileTypeByFileName(path);
    return type.equals(MPSFileTypeFactory.MODEL_FILE_TYPE);
  }
}
