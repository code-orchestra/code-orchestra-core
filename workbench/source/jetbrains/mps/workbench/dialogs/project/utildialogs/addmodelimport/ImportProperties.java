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
package jetbrains.mps.workbench.dialogs.project.utildialogs.addmodelimport;

import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ImportProperties {
  private Set<SModelReference> myModels;
  private Set<ModuleReference> myLanguages;
  private IModule mySourceModule;
  private IModule myTargetModule;

  private List<ModelImportDescriptor> myModelImports = new ArrayList<ModelImportDescriptor>();
  private List<LanguageImportDescriptor> myLanguageImports = new ArrayList<LanguageImportDescriptor>();

  public List<LanguageImportDescriptor> getLanguagesList() {
    return myLanguageImports;
  }

  public List<ModelImportDescriptor> getModelList() {
    return myModelImports;
  }

  public List<SModelReference> getModelsToImport(boolean all) {
    if (all) return new ArrayList<SModelReference>(myModels);

    List<SModelReference> result = new ArrayList<SModelReference>();
    for (ModelImportDescriptor m : myModelImports) {
      if (!m.getIsImported()) continue;
      result.add(m.getModel());
    }
    return result;
  }

  public List<ModuleReference> getLanguagesToImport(boolean all) {
    if (all) return new ArrayList<ModuleReference>(myLanguages);

    List<ModuleReference> result = new ArrayList<ModuleReference>();
    for (LanguageImportDescriptor l : myLanguageImports) {
      if (!l.getIsImported()) continue;
      result.add(l.getLanguage());
    }
    return result;
  }

  public List<ModuleReference> getDevkitsToImport(boolean all) {
    Set<ModuleReference> result = new HashSet<ModuleReference>();

    if (all) {
      for (ModuleReference lang : myLanguages) {
        ModuleReference prefModule = getPreferredModuleForLanguage(lang);
        if (prefModule != null) result.add(prefModule);
      }
    } else {
      for (LanguageImportDescriptor l : myLanguageImports) {
        if (!l.getIsImported()) continue;
        if (l.getModule() == null) continue;

        result.add(l.getModule());
      }
    }

    return new ArrayList<ModuleReference>(result);
  }

  public List<Dependency> getNewModuleDependencies(boolean all) {
    Set<ModuleReference> depModules = new HashSet<ModuleReference>();
    if (all) {
      for (SModelReference model : myModels) {
        ModuleReference prefModule = getPreferredModuleForModel(model);
        if (prefModule != null) {
          depModules.add(prefModule);
        }
      }
    } else {
      for (ModelImportDescriptor m : myModelImports) {
        if (!m.getIsImported()) continue;
        if (m.getModule() == null) continue;

        depModules.add(m.getModule());
      }
    }

    List<Dependency> result = new ArrayList<Dependency>();
    for (ModuleReference ref : depModules) {
      Dependency dep = new Dependency();
      dep.setModuleRef(ref);
      dep.setReexport(false);
      result.add(dep);
    }
    return result;
  }

  public List<ModuleReference> getModulesForModel(int numberInList) {
    SModelReference modelRef = getModelList().get(numberInList).getModel();
    SModelDescriptor model = SModelRepository.getInstance().getModelDescriptor(modelRef);

    Set<IModule> modules = new HashSet<IModule>();
    if (model.getModule() != null) {
      modules.add(model.getModule());
    }
    modules.retainAll(mySourceModule.getDependenciesManager().getAllVisibleModules());
    modules.add(mySourceModule);
    modules.removeAll(myTargetModule.getDependenciesManager().getAllVisibleModules());
    modules.remove(myTargetModule);

    List<ModuleReference> result = new ArrayList<ModuleReference>();
    for (IModule module : modules) {
      result.add(module.getModuleReference());
    }

    return result;
  }

  public List<ModuleReference> getModulesForLanguage(int numberInList) {
    ArrayList<ModuleReference> result = new ArrayList<ModuleReference>();

    ModuleReference langRef = getLanguagesList().get(numberInList).getLanguage();
    Language language = MPSModuleRepository.getInstance().getLanguage(langRef);
    for (ModuleReference devkitRef : mySourceModule.getModuleDescriptor().getUsedDevkits()) {
      DevKit d = MPSModuleRepository.getInstance().getDevKit(devkitRef);
      if (d.getAllExportedLanguages().contains(language)) {
        result.add(devkitRef);
      }
    }

    return result;
  }

  //should return null if module is already in place
  private ModuleReference getPreferredModuleForModel(SModelReference modelRef) {
    SModelDescriptor model = SModelRepository.getInstance().getModelDescriptor(modelRef);
    if (model == null) {
      // Model was deleted.
      return null;
    }
    IModule module = model.getModule();

    if (module == myTargetModule) return null;
    Set<IModule> deps = myTargetModule.getDependenciesManager().getAllVisibleModules();
    if (deps.contains(module)) return null;
    if (module == mySourceModule) return mySourceModule.getModuleReference();

    if (mySourceModule.getDependenciesManager().getAllVisibleModules().contains(module))
      return module.getModuleReference();

    return null;
  }

  //should return null if module is already in place
  private ModuleReference getPreferredModuleForLanguage(ModuleReference language) {
    return null;
  }

  public void loadFrom(Set<SModelReference> models, Set<ModuleReference> languages, IModule sourceModule, IModule targetModule) {
    myModels = models;
    myLanguages = languages;
    mySourceModule = sourceModule;
    myTargetModule = targetModule;

    for (ModuleReference langRef : myLanguages) {
      LanguageImportDescriptor lid = new LanguageImportDescriptor();
      lid.setIsImported(true);
      lid.setLanguage(langRef);
      lid.setModule(getPreferredModuleForLanguage(langRef));
      myLanguageImports.add(lid);
    }

    for (SModelReference mRef : myModels) {
      ModelImportDescriptor mid = new ModelImportDescriptor();
      mid.setIsImported(true);
      mid.setModel(mRef);
      mid.setModule(getPreferredModuleForModel(mRef));
      myModelImports.add(mid);
    }
  }

  public void saveTo(IModule targetModule, SModel targetModel, boolean all) {
    for (SModelReference imported : getModelsToImport(all)) {
      targetModel.addModelImport(imported, false);
    }
    for (ModuleReference language : getLanguagesToImport(all)) {
      targetModel.addLanguage(language);
    }
    for (ModuleReference devkit : getDevkitsToImport(all)) {
      targetModel.addDevKit(devkit);
    }


    for (ModuleReference language : getLanguagesToImport(all)) {
      targetModule.getModuleDescriptor().getUsedLanguages().add(language);
    }
    for (ModuleReference devkit : getDevkitsToImport(all)) {
      targetModule.getModuleDescriptor().getUsedDevkits().add(devkit);
    }

    //if there are new module dependencies, class reloading is needed
    List<Dependency> deps = getNewModuleDependencies(all);
    if (!deps.isEmpty()) {
      ModuleDescriptor descriptor = targetModule.getModuleDescriptor();
      if (descriptor != null) {
        for (Dependency dep : deps) {
          descriptor.getDependencies().add(dep);
        }
        targetModule.setModuleDescriptor(descriptor, true);
      } else {
        targetModule.invalidateCaches();
      }
    }

    targetModule.save();
  }

  public class ImportDescriptor {
    public static final String IS_IMPORTED = "isImported";
    public static final String MODULE = "module";

    private boolean myIsImported;
    private ModuleReference myModule;

    public boolean getIsImported() {
      return myIsImported;
    }

    public void setIsImported(boolean isImported) {
      myIsImported = isImported;
    }

    public ModuleReference getModule() {
      return myModule;
    }

    public void setModule(ModuleReference module) {
      myModule = module;
    }
  }

  public class ModelImportDescriptor extends ImportDescriptor {
    public static final String MODEL = "model";
    private SModelReference myModel;

    public SModelReference getModel() {
      return myModel;
    }

    public void setModel(SModelReference model) {
      myModel = model;
    }
  }

  public class LanguageImportDescriptor extends ImportDescriptor {
    public static final String LANGUAGE = "language";
    private ModuleReference myLanguage;

    public ModuleReference getLanguage() {
      return myLanguage;
    }

    public void setLanguage(ModuleReference language) {
      myLanguage = language;
    }
  }
}
