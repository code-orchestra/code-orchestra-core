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
package jetbrains.mps.testbench;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.TestMain;
import jetbrains.mps.generator.GeneratorManager;
import jetbrains.mps.library.ModulesMiner;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.*;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;

import java.io.File;
import java.util.*;

public class ModelsExtractor {
  private Set<SModelDescriptor> models = new HashSet<SModelDescriptor>();
  boolean modelLoaded = false;
  private final boolean myIncludeDoNotGenerate;

  public ModelsExtractor(boolean includeDoNotGenerate) {
    myIncludeDoNotGenerate = includeDoNotGenerate;
  }

  public Iterable<SModelDescriptor> getModels () {
    if (!modelLoaded) throw new IllegalStateException("Models not loaded");
    return models;
  }

  public Iterable<IModule> getModules(Iterable<IFile> files) {
    return collectFromModuleFiles(files);
  }

  public void loadModels (Iterable<IFile> files) {
    if (modelLoaded) throw new IllegalStateException("Models already loaded");
    doLoadModels(files, models);
    this.modelLoaded = true;
  }


  public void clear () {
    this.models.clear();
    this.modelLoaded = false;
  }

  private Iterable<SModelDescriptor> doLoadModels(Iterable<IFile> files, Collection<SModelDescriptor> models) {
    for (MPSProject prj : collectFromProjects(files)) {
      extractModels(models, prj);
    }
    for (IModule mod : collectFromModuleFiles(files)) {
      extractModels(models, mod);
    }
    return models;
  }

  private Iterable<MPSProject> collectFromProjects(Iterable<IFile> files) {
    Set<MPSProject> projects = new HashSet<MPSProject>();
    for (IFile projectFile : files) {
      if (projectFile.getName().endsWith(MPSExtentions.DOT_MPS_PROJECT)) {
        assert !FileSystem.getInstance().isPackaged(projectFile);
        final MPSProject project = TestMain.loadProject(new File(projectFile.getPath()));
        projects.add(project);
      }
    }
    return projects;
  }

  private Iterable<IModule> collectFromModuleFiles(Iterable<IFile> files) {
    Set<IModule> modules = new HashSet<IModule>();
    for (IFile moduleFile : files) {
      processModuleFile(moduleFile, modules);
    }
    return modules;
  }

  private void processModuleFile(final IFile moduleFile, final Set<IModule> modules) {
    String name = moduleFile.getName();
    if (!name.endsWith(MPSExtentions.DOT_LANGUAGE) && !name.endsWith(MPSExtentions.DOT_SOLUTION) && !name.endsWith(MPSExtentions.DOT_DEVKIT))
      return;
    List<IModule> tmpmodules;
    IModule moduleByFile = ModelAccess.instance().runReadAction(new Computable<IModule>() {
      public IModule compute() {
        return MPSModuleRepository.getInstance().getModuleByFile(FileSystem.getInstance().getFileByPath(moduleFile.getAbsolutePath()));
      }
    });
    if (moduleByFile != null) {
      tmpmodules = Collections.singletonList(moduleByFile);
    } else {
      tmpmodules = ModelAccess.instance().runWriteAction(new Computable<List<IModule>>() {
        public List<IModule> compute() {
          return ModulesMiner.getInstance().readModuleDescriptors(moduleFile.isDirectory() ? moduleFile : moduleFile.getParent(), new MPSModuleOwner() {
          });
        }
      });
    }
    modules.addAll(tmpmodules);
    for (IModule module : tmpmodules) {
      if (module.isPackaged()) continue;
      if (module instanceof Language) {
        Language language = (Language) module;
        for (Generator gen : language.getGenerators()) {
          modules.add(gen);
        }
      }
    }
  }

  private void extractModels(Collection<SModelDescriptor> modelDescriptors, MPSProject project) {
    List<SModelDescriptor> models = project.getProjectModels();
    for (Language language : project.getProjectModules(Language.class)) {
      models.addAll(language.getOwnModelDescriptors());
      for (Generator gen : language.getGenerators()) {
        models.addAll(gen.getOwnModelDescriptors());
      }
    }
    for (SModelDescriptor modelDescriptor : models) {
      if (includeModel(modelDescriptor)) {
        modelDescriptors.add(modelDescriptor);
      }
    }
  }

  private void extractModels(Collection<SModelDescriptor> modelsList, IModule m) {
    List<SModelDescriptor> ownedModels = m.getOwnModelDescriptors();
    for (SModelDescriptor d : ownedModels) {
      if (includeModel(d)) {
        modelsList.add(d);
      }
    }
  }

  private boolean includeModel(SModelDescriptor modelDescriptor) {
    return SModelStereotype.isUserModel(modelDescriptor) &&
      (myIncludeDoNotGenerate || !(GeneratorManager.isDoNotGenerate(modelDescriptor)));
  }
}
