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
package jetbrains.mps.project.dependency;

import jetbrains.mps.project.*;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.util.IterableUtil;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

public class ModuleDependenciesManager<T extends AbstractModule> implements DependenciesManager {
  protected T myModule;

  public ModuleDependenciesManager(T module) {
    myModule = module;
  }

  public final Set<Language> getAllUsedLanguages() {
    Set<Language> result = new LinkedHashSet<Language>();
    result.addAll(ModuleUtil.refsToLanguages(myModule.getUsedLanguagesReferences()));
    for (DevKit dk : ModuleUtil.refsToDevkits(myModule.getUsedDevkitReferences())) {
      result.addAll(dk.getAllExportedLanguages());
    }
    for (Language l : new HashSet<Language>(result)) {
      result.addAll(l.getAllExtendedLanguages());
    }
    return result;
  }

  public final Set<IModule> getAllRequiredModules() {
    Set<IModule> modules = new LinkedHashSet<IModule>();
    Set<Language> usedLanguages = new LinkedHashSet<Language>();
    collectAllCompileTimeDependencies(modules, usedLanguages);
    modules.addAll(usedLanguages);
    modules.remove(myModule);
    return modules;
  }

  @Override
  public Set<IModule> getRequiredModules() {
    Set<IModule> modules = new LinkedHashSet<IModule>();
    for (IModule m : ModuleUtil.getDependencies(myModule)) {
      modules.add(m);
    }

    for(Language language : ModuleUtil.getUsedLanguages(myModule)) {
      for (ModuleReference ref : language.getRuntimeModulesReferences()) {
        IModule m = MPSModuleRepository.getInstance().getModule(ref);
        if (m == null) continue;
        modules.add(m);
      }
    }
    return modules;
  }

  public void collectAllCompileTimeDependencies(/* out */ Set<IModule> dependencies, /* out */ Set<Language> languagesWithRuntime) {
    dependencies.add(myModule);
    for (IModule m : ModuleUtil.getDependencies(myModule)) {
      if (!dependencies.contains(m)) {
        m.getDependenciesManager().collectAllCompileTimeDependencies(dependencies, languagesWithRuntime);
      }
    }

    for(Language language : ModuleUtil.getUsedLanguages(myModule)) {
      for (ModuleReference dep : language.getRuntimeModulesReferences()) {
        IModule m = MPSModuleRepository.getInstance().getModule(dep);
        if (m == null) continue;
        if (!dependencies.contains(m)) {
          m.getDependenciesManager().collectAllCompileTimeDependencies(dependencies, languagesWithRuntime);
        }
      }
      if (!languagesWithRuntime.contains(language)) {
        if (!language.getRuntimeStubPaths().isEmpty()) {
          languagesWithRuntime.add(language);
        }
      }
    }
  }

  public Set<IModule> getAllVisibleModules() {
    Set<IModule> result = new LinkedHashSet<IModule>();
    collectVisibleModules(result, false);
    result.remove(myModule);
    return result;
  }

  public void collectVisibleModules(Set<IModule> dependencies, boolean reexportOnly) {
    dependencies.add(myModule);

    for (Dependency dependency : myModule.getDependencies()) {
      if (reexportOnly && !dependency.isReexport()) continue;

      IModule m = MPSModuleRepository.getInstance().getModule(dependency.getModuleRef());
      if (m == null) continue;

      if (!dependencies.contains(m)) {
        m.getDependenciesManager().collectVisibleModules(dependencies, true);
      }
    }

    if (reexportOnly) return;

    for (ModuleReference ref : myModule.getUsedDevkitReferences()) {
      DevKit dk = MPSModuleRepository.getInstance().getDevKit(ref);
      if (dk == null) continue;

      for (Solution solution : dk.getAllExportedSolutions()) {
        if (!dependencies.contains(solution)) {
          solution.getDependenciesManager().collectVisibleModules(dependencies, true);
        }
      }
    }
  }
}
