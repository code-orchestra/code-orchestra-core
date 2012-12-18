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
package jetbrains.mps.workbench.choose.base;

import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

public class ModulesOnlyScope extends BaseScope {
  private Set<IModule> myModules;

  public ModulesOnlyScope(Collection<IModule> modules) {
    myModules = new HashSet<IModule>(modules);
  }

  public SModelDescriptor getModelDescriptor(SModelReference modelReference) {
    SModelDescriptor md = SModelRepository.getInstance().getModelDescriptor(modelReference);
    if (md == null) return null;
    if (myModules.contains(md.getModule())) return md;
    return null;
  }

  public Language getLanguage(ModuleReference moduleReference) {
    Language lang = MPSModuleRepository.getInstance().getLanguage(moduleReference);
    if (lang == null) return null;
    if (myModules.contains(lang)) return lang;
    return null;
  }

  public DevKit getDevKit(ModuleReference ref) {
    DevKit dk = MPSModuleRepository.getInstance().getDevKit(ref);
    if (dk == null) return null;
    if (myModules.contains(dk)) return dk;
    return null;
  }

  public Iterable<SModelDescriptor> getModelDescriptors() {
    ArrayList<SModelDescriptor> res = new ArrayList<SModelDescriptor>();
    for (IModule module : myModules) {
      res.addAll(module.getOwnModelDescriptors());
    }
    return res;
  }

  public Iterable<Language> getVisibleLanguages() {
    ArrayList<Language> res = new ArrayList<Language>();
    for (IModule module : myModules) {
      if (module instanceof Language) {
        res.add((Language) module);
      }
    }
    return res;
  }

  public Iterable<DevKit> getVisibleDevkits() {
    ArrayList<DevKit> res = new ArrayList<DevKit>();
    for (IModule module : myModules) {
      if (module instanceof DevKit) {
        res.add((DevKit) module);
      }
    }
    return res;
  }

  public Iterable<IModule> getVisibleModules() {
    return myModules;
  }
}
