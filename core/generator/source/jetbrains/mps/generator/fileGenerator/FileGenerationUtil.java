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
package jetbrains.mps.generator.fileGenerator;

import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.util.JavaNameUtil;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import java.io.File;

public class FileGenerationUtil {
  private static final String CACHES_SUFFIX = ".caches";

  public static String getCachesPath(String outputDir) {
    return outputDir + CACHES_SUFFIX;
  }

  public static IFile getCachesDir(IFile outputDir) {
    return FileSystem.getInstance().getFileByPath(outputDir.getPath() + CACHES_SUFFIX);
  }

  public static IFile getDefaultOutputDir(SModelDescriptor inputModelDescriptor, @NotNull IFile outputRootDir) {
    SModelReference reference = inputModelDescriptor.getSModelReference();
    return getDefaultOutputDir(reference, outputRootDir);
  }

  public static IFile getDefaultOutputDir(SModel inputModel, IFile outputRootDir) {
    return getDefaultOutputDir(inputModel.getSModelReference(), outputRootDir);
  }

  public static IFile getDefaultOutputDir(SModelReference reference, @NotNull IFile outputRootDir) {
    return getDefaultOutputDir(JavaNameUtil.packageNameForModelUID(reference), outputRootDir);
  }

  public static IFile getDefaultOutputDir(String packageName, @NotNull IFile outputRootDir) {
    String packagePath;
    if (FileSystem.getInstance().isPackaged(outputRootDir)) {
      packagePath = packageName.replace('.', '/');
    } else {
      packagePath = packageName.replace('.', File.separatorChar);
    }
    return outputRootDir.getDescendant(packagePath);
  }
}
