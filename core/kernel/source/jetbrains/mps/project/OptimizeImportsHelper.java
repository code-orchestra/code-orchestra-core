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

import jetbrains.mps.project.structure.modules.*;
import jetbrains.mps.smodel.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class OptimizeImportsHelper {
  public OptimizeImportsHelper(IOperationContext context) {

  }

  //----public optimizeX methods--------

  public String optimizeProjectImports(MPSProject p) {
    return optimizeProjectImports_internal(p).myReport;
  }

  public String optimizeSolutionImports(Solution solution) {
    return optimizeSolutionImports_internal(solution).myReport;
  }

  public String optimizeLanguageImports(Language language) {
    return optimizeLanguageImports_internal(language).myReport;
  }

  public String optimizeModelsImports(List<SModelDescriptor> modelsToOptimize) {
    return optimizeModelsImports_internal(modelsToOptimize).myReport;
  }

  public String optimizeModelImports(SModelDescriptor modelDescriptor) {
    return optimizeModelImports_internal(modelDescriptor).myReport;
  }

  //----internal optimizeX methods--------

  private Result optimizeProjectImports_internal(MPSProject p) {
    Result result = new Result();

    for (Language l : p.getProjectModules(Language.class)) {
      result.add(optimizeLanguageImports_internal(l));
    }
    for (Solution s : p.getProjectModules(Solution.class)) {
      result.add(optimizeSolutionImports_internal(s));
    }

    return result;
  }

  private Result optimizeSolutionImports_internal(Solution solution) {
    List<SModelDescriptor> modelsToOptimize = solution.getOwnModelDescriptors();
    Result result = optimizeModelsImports_internal(modelsToOptimize);

    SolutionDescriptor descriptor = solution.getModuleDescriptor();
    result.myReport = optimizeModuleImports(descriptor, result) + "\n\n" + result.myReport;
    solution.setSolutionDescriptor(descriptor, false);

    return result;
  }

  private Result optimizeLanguageImports_internal(Language language) {
    List<SModelDescriptor> modelsToOptimize = new ArrayList<SModelDescriptor>();
    modelsToOptimize.addAll(language.getOwnModelDescriptors());
    for (Generator g : language.getGenerators()) {
      modelsToOptimize.addAll(g.getOwnModelDescriptors());
    }
    Result result = optimizeModelsImports_internal(modelsToOptimize);

    LanguageDescriptor descriptor = language.getModuleDescriptor();
    for (Generator g : language.getGenerators()) {
      GeneratorDescriptor gd = g.getModuleDescriptor();
      result.myReport = optimizeModuleImports(gd, result) + "\n\n" + result.myReport;
      g.setModuleDescriptor(gd, false);
    }
    result.myReport = optimizeModuleImports(descriptor, result) + "\n\n" + result.myReport;
    language.setLanguageDescriptor(descriptor, false);

    return result;
  }

  private Result optimizeModelsImports_internal(List<SModelDescriptor> modelsToOptimize) {
    Result result = new Result();
    for (SModelDescriptor modelDescriptor : modelsToOptimize) {
      if (SModelStereotype.isStubModelStereotype(modelDescriptor.getStereotype())) continue;
      result.add(optimizeModelImports_internal(modelDescriptor));
    }
    return result;
  }

  private Result optimizeModelImports_internal(SModelDescriptor modelDescriptor) {
    Result result = new Result();

    for (ModuleReference ref:modelDescriptor.getSModel().engagedOnGenerationLanguages()){
      result.myUsedLanguages.add(MPSModuleRepository.getInstance().getLanguage(ref));
    }
    for (SNode node : modelDescriptor.getSModel().nodes()) {
      result.myUsedLanguages.add(node.getLanguage());
      for (SReference ref : node.getReferences()) {
        SModelReference mr = ref.getTargetSModelReference();
        if (!modelDescriptor.getSModelReference().equals(mr)) {
          result.myUsedModels.add(mr);
        }
      }
    }

    Set<SModelReference> unusedModels = new HashSet<SModelReference>();
    for (SModelReference model : SModelOperations.getImportedModelUIDs(modelDescriptor.getSModel())) {
      if (!result.myUsedModels.contains(model)) {
        unusedModels.add(model);
      }
    }

    Set<ModuleReference> unusedLanguages = new HashSet<ModuleReference>();
    for (ModuleReference languageRef : modelDescriptor.getSModel().importedLanguages()) {
      ModuleReference ref = getUnusedLanguageRef(result, languageRef);
      if (ref != null) unusedLanguages.add(ref);
    }

    Set<ModuleReference> unusedDevkits = new HashSet<ModuleReference>();
    for (ModuleReference devkitRef : modelDescriptor.getSModel().importedDevkits()) {
      ModuleReference ref = getUnusedDevkitRef(result, devkitRef);
      if (ref != null) unusedDevkits.add(devkitRef);
    }

    result.myReport = removeFromImports(modelDescriptor, unusedModels, unusedLanguages, unusedDevkits);
    return result;
  }

  //----additional methods--------

  private String optimizeModuleImports(ModuleDescriptor descriptor, Result result) {
    List<Dependency> unusedDeps = new ArrayList<Dependency>();
    for (Dependency d : descriptor.getDependencies()) {
      Dependency dep = getUnusedDependency(result, d);
      if (dep != null) unusedDeps.add(dep);
    }

    List<ModuleReference> unusedLanguages = new ArrayList<ModuleReference>();
    for (ModuleReference langRef : descriptor.getUsedLanguages()) {
      ModuleReference ref = getUnusedLanguageRef(result, langRef);
      if (ref != null) unusedLanguages.add(langRef);
    }

    List<ModuleReference> unusedDevkits = new ArrayList<ModuleReference>();
    for (ModuleReference devkitRef : descriptor.getUsedDevkits()) {
      ModuleReference ref = getUnusedDevkitRef(result, devkitRef);
      if (ref != null) unusedDevkits.add(devkitRef);
    }

    return removeFromImports(descriptor, unusedLanguages, unusedDevkits, unusedDeps);
  }

  private Dependency getUnusedDependency(Result result, Dependency dep) {
    if (dep.isReexport()) return null;

    IModule module = MPSModuleRepository.getInstance().getModule(dep.getModuleRef());
    if (module == null) return dep;

    boolean used = false;

    for (SModelReference mr : result.myUsedModels) {
      SModelDescriptor md = SModelRepository.getInstance().getModelDescriptor(mr);
      if (md == null) continue;
      if (md.getModule() == module) {
        used = true;
        break;
      }
    }
    return used ? null : dep;
  }

  private ModuleReference getUnusedDevkitRef(Result result, ModuleReference devkitRef) {
    DevKit dk = GlobalScope.getInstance().getDevKit(devkitRef);
    if (dk == null) return devkitRef;

    for (Language lang : dk.getAllExportedLanguages()) {
      if (getUnusedLanguageRef(result, lang.getModuleReference()) == null) return null;
    }

    for (Solution solution : dk.getAllExportedSolutions()) {
      for (SModelDescriptor model : solution.getOwnModelDescriptors()) {
        if (result.myUsedModels.contains(model.getSModelReference())) return null;
      }
    }
    return dk.getModuleReference();
  }

  private ModuleReference getUnusedLanguageRef(Result result, ModuleReference languageRef) {
    Language language = GlobalScope.getInstance().getLanguage(languageRef);
    if (language == null) return languageRef;
    if (result.myUsedLanguages.contains(language)) return null;

    for (SModelDescriptor md : language.getAccessoryModels()) {
      if (result.myUsedModels.contains(md.getSModelReference())) return null;
    }

    return language.getModuleReference();
  }

  private String removeFromImports(SModelDescriptor modelDescriptor, Set<SModelReference> unusedModels, Set<ModuleReference> unusedLanguages, Set<ModuleReference> unusedDevkits) {
    StringBuilder report = new StringBuilder("Import for model " + modelDescriptor.getSModelReference() + " were optimized \n");

    for (ModuleReference langRef : unusedLanguages) {
      modelDescriptor.getSModel().deleteLanguage(langRef);
      report.append("Language ").append(langRef.getModuleFqName()).append(" was removed from imports\n");
    }

    for (ModuleReference dkRef : unusedDevkits) {
      modelDescriptor.getSModel().deleteDevKit(dkRef);
      report.append("Devkit ").append(dkRef.getModuleFqName()).append(" was removed from imports\n");
    }

    for (SModelReference model : unusedModels) {
      modelDescriptor.getSModel().deleteModelImport(model);
      report.append("Model ").append(model.getSModelFqName()).append(" was removed from imports\n");
    }

    return report.toString();
  }

  private String removeFromImports(ModuleDescriptor descriptor, List<ModuleReference> unusedLanguages, List<ModuleReference> unusedDevkits, List<Dependency> unusedDeps) {
    StringBuilder report = new StringBuilder("Import for module " + descriptor.getNamespace() + " were optimized \n");

    for (ModuleReference langRef : unusedLanguages) {
      descriptor.getUsedLanguages().remove(langRef);
      report.append("Language ").append(langRef.getModuleFqName()).append(" was removed from imports\n");
    }

    for (ModuleReference dkRef : unusedDevkits) {
      descriptor.getUsedDevkits().remove(dkRef);
      report.append("Devkit ").append(dkRef.getModuleFqName()).append(" was removed from imports\n");
    }

    for (Dependency dep : unusedDeps) {
      descriptor.getDependencies().remove(dep);
      report.append("Dependency on ").append(dep.getModuleRef().getModuleFqName()).append(" was removed\n");
    }

    return report.toString();
  }

  private static class Result {
    public String myReport = "";
    public Set<Language> myUsedLanguages = new HashSet<Language>();
    public Set<SModelReference> myUsedModels = new HashSet<SModelReference>();

    public void add(Result addition) {
      myReport = myReport + addition.myReport + "\n";
      myUsedLanguages.addAll(addition.myUsedLanguages);
      myUsedModels.addAll(addition.myUsedModels);
    }
  }
}
