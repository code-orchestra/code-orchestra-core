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

import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.BootstrapLanguages;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.util.IterableUtil;
import jetbrains.mps.util.iterable.CollectingManyIterator;
import jetbrains.mps.util.iterable.RecursiveIterator;
import jetbrains.mps.util.iterable.TranslatingIterator;

import java.util.*;

public class ModuleUtil {

  public static Iterable<IModule> getDependencies(IModule module) {
    Iterable<IModule> dependencies = new TranslatingIterator<Dependency, IModule>(module.getDependencies().iterator()) {
      @Override
      protected IModule translate(Dependency dep) {
        return MPSModuleRepository.getInstance().getModule(dep.getModuleRef());
      }
    };
    Iterable<IModule> solutionsFromDevkits = new TranslatingIterator<ModuleReference, IModule>(
      new CollectingManyIterator<DevKit, ModuleReference>(includingExtended(usedDevkits(module)).iterator()) {
        @Override
        protected Iterator<ModuleReference> translate(DevKit devkit) {
          return devkit.getExportedSolutions_internal().iterator();
        }
      }) {

      @Override
      protected IModule translate(ModuleReference node) {
        return MPSModuleRepository.getInstance().getSolution(node);
      }
    };
    if(module instanceof Language) {
      Language core = BootstrapLanguages.coreLanguage();
      return IterableUtil.distinct(IterableUtil.merge(dependencies, solutionsFromDevkits, Collections.<IModule>singleton(core)));
    }
    return IterableUtil.distinct(IterableUtil.merge(dependencies, solutionsFromDevkits));
  }

  public static Iterable<Language> getUsedLanguages(IModule module) {
    Iterable<Language> dependencies = new TranslatingIterator<ModuleReference, Language>(module.getUsedLanguagesReferences().iterator()) {
      @Override
      protected Language translate(ModuleReference ref) {
        return MPSModuleRepository.getInstance().getLanguage(ref);
      }
    };
    Iterable<Language> languagesFromDevkits = new TranslatingIterator<ModuleReference, Language>(
      new CollectingManyIterator<DevKit, ModuleReference>(includingExtended(usedDevkits(module)).iterator()) {
        @Override
        protected Iterator<ModuleReference> translate(DevKit devkit) {
          return devkit.getExportedLanguages_internal().iterator();
        }
      }) {

      @Override
      protected Language translate(ModuleReference node) {
        return MPSModuleRepository.getInstance().getLanguage(node);
      }
    };
    Language core = BootstrapLanguages.coreLanguage();
    return includingExtendedLanguages(IterableUtil.merge(dependencies, languagesFromDevkits, Collections.singleton(core)));
  }

  private static Iterable<DevKit> usedDevkits(IModule module) {
    return new TranslatingIterator<ModuleReference, DevKit>(module.getUsedDevkitReferences().iterator()) {
      @Override
      protected DevKit translate(ModuleReference node) {
        return MPSModuleRepository.getInstance().getDevKit(node);
      }
    };
  }

  private static Iterable<DevKit> includingExtended(Iterable<DevKit> devkits) {
    return IterableUtil.distinct(new RecursiveIterator<DevKit>(devkits.iterator(), false) {
      @Override
      protected Iterator<DevKit> children(DevKit node) {
        return new TranslatingIterator<ModuleReference, DevKit>(node.getExtendedDevKits_internal().iterator()) {
          @Override
          protected DevKit translate(ModuleReference node) {
            return MPSModuleRepository.getInstance().getDevKit(node);
          }
        };
      }
    });
  }

  private static Iterable<Language> includingExtendedLanguages(Iterable<Language> devkits) {
    return new RecursiveIterator<Language>(devkits.iterator(), false) {
      @Override
      protected Iterator<Language> children(Language node) {
        return new TranslatingIterator<ModuleReference, Language>(node.getExtendedLanguageRefs().iterator()) {
          @Override
          protected Language translate(ModuleReference node) {
            return MPSModuleRepository.getInstance().getLanguage(node);
          }
        };
      }
    };
  }

  ////////


  @Deprecated
  public static List<Language> refsToLanguages(List<ModuleReference> refs) {
    List<Language> result = new ArrayList<Language>();
    for (ModuleReference ref : refs) {
      Language l = MPSModuleRepository.getInstance().getLanguage(ref);
      if (l == null) continue;
      result.add(l);
    }

    return result;
  }

  @Deprecated
  public static List<DevKit> refsToDevkits(List<ModuleReference> refs) {
    List<DevKit> result = new ArrayList<DevKit>();

    for (ModuleReference ref : refs) {
      DevKit dk = MPSModuleRepository.getInstance().getDevKit(ref);
      if (dk == null) continue;
      result.add(dk);
    }

    return result;
  }

  @Deprecated
  public static List<IModule> depsToModules(List<Dependency> deps) {
    List<IModule> result = new ArrayList<IModule>();
    for (Dependency dep : deps) {
      IModule m = MPSModuleRepository.getInstance().getModule(dep.getModuleRef());
      if (m == null) continue;
      result.add(m);
    }
    return result;
  }

  @Deprecated
  public static SModelRoot findModelRoot(IModule module, String path) {
    for (SModelRoot root : module.getSModelRoots()) {
      if (path.equals(root.getPath())) return root;
    }
    return null;
  }
}
