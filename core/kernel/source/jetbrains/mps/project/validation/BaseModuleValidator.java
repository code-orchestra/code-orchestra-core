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
package jetbrains.mps.project.validation;

import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class BaseModuleValidator<T extends IModule> implements ModuleValidator {
  protected final T myModule;

  public BaseModuleValidator(@NotNull T module) {
    myModule = module;
  }

  public List<String> getErrors() {
    List<String> errors = new ArrayList<String>();
    for (Dependency dep : myModule.getDependencies()) {
      ModuleReference moduleRef = dep.getModuleRef();
      if (MPSModuleRepository.getInstance().getModule(moduleRef) == null) {
        errors.add("Can't find dependency: " + moduleRef.getModuleFqName());
      }
    }
    for (ModuleReference reference : myModule.getUsedLanguagesReferences()) {
      if (MPSModuleRepository.getInstance().getLanguage(reference) == null) {
        errors.add("Can't find used language: " + reference.getModuleFqName());
      }
    }
    for (ModuleReference reference : myModule.getUsedDevkitReferences()) {
      if (MPSModuleRepository.getInstance().getModule(reference) == null) {
        errors.add("Can't find used devkit: " + reference.getModuleFqName());
      }
    }

    ModuleDescriptor descriptor = myModule.getModuleDescriptor();
    if (descriptor == null) return errors;

    if (descriptor.getSourcePaths() != null && !myModule.isPackaged()) {
      for (String sourcePath : descriptor.getSourcePaths()) {
        IFile file = FileSystem.getInstance().getFileByPath(sourcePath);
        if (file == null || !file.exists()) {
          errors.add("Can't find source path: " + sourcePath);
        }
      }
    }
    if (descriptor.getStubModelEntries() != null) {
      for (ModelRoot stubModelsEntry : descriptor.getStubModelEntries()) {
        IFile file = FileSystem.getInstance().getFileByPath(stubModelsEntry.getPath());
        if (file == null || !file.exists()) {
          if (new File(stubModelsEntry.getPath()).exists()) {
            errors.add("Idea VFS is not up-to-date. Can't find library: " + stubModelsEntry.getPath());
          } else {
            errors.add("Can't find library: " + stubModelsEntry.getPath());
          }
        }
      }
    }
    return errors;
  }

  @Override
  public List<String> getWarnings() {
    return Collections.emptyList();
  }

  public final boolean isValid() {
    return getErrors().isEmpty();
  }
}
