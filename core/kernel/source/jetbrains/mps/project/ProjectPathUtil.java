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

import jetbrains.mps.project.structure.modules.LanguageDescriptor;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;

/**
 * evgeny, 3/8/11
 */
public class ProjectPathUtil {

  public static IFile getClassesGenFolder(IFile moduleDescriptor) {
    if (moduleDescriptor == null) {
      return null;
    }
    if (moduleDescriptor.isReadOnly()) {
      // packaged
      String filename = FileSystem.getInstance().getBundleHome(moduleDescriptor).getPath() + "!";
      return FileSystem.getInstance().getFileByPath(filename);
    }
    IFile parent = moduleDescriptor.getParent();
    return parent != null ? parent.getDescendant("classes_gen") : null;
  }

  public static IFile getClassesFolder(IFile moduleDescriptor) {
    if (moduleDescriptor == null) {
      return null;
    }
    if (moduleDescriptor.isReadOnly()) {
      // packaged
      String filename = FileSystem.getInstance().getBundleHome(moduleDescriptor).getPath() + "!";
      return FileSystem.getInstance().getFileByPath(filename);
    }
    IFile parent = moduleDescriptor.getParent();
    return parent != null ? parent.getDescendant("classes") : null;
  }

  public static IFile getGeneratorOutputPath(IFile file, ModuleDescriptor descriptor) {
    String generatorOutputPath;
    if (descriptor instanceof SolutionDescriptor) {
      generatorOutputPath = ((SolutionDescriptor) descriptor).getOutputPath();
    } else if (descriptor instanceof LanguageDescriptor) {
      generatorOutputPath = ((LanguageDescriptor) descriptor).getGenPath();
    } else {
      return null;
    }
    if (generatorOutputPath != null) {
      return FileSystem.getInstance().getFileByPath(generatorOutputPath);
    }
    if (file != null) {
      return file.getParent().getDescendant("source_gen");
    }
    return null;
  }

  public static IFile getGeneratorTestsOutputPath(IFile file, ModuleDescriptor descriptor) {
    if (file != null && (descriptor instanceof SolutionDescriptor || descriptor instanceof LanguageDescriptor)) {
      return file.getParent().getDescendant("test_gen");
    }
    return null;
  }
}
