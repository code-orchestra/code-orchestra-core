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
package jetbrains.mps.smodel;

import codeOrchestra.actionscript.view.utils.ModelUtils;
import jetbrains.mps.MPSCore;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.SModel.ImportElement;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.*;

public class SModelOperations {
  private static final Logger LOG = Logger.getLogger(SModelOperations.class);

  @Nullable
  public static SNode getRootByName(SModel model, @NotNull String name) {
    for (SNode root : model.roots()) {
      if (name.equals(root.getName())) return root;
    }
    return null;
  }

  @CodeOrchestraPatch
  public static boolean validateLanguagesAndImportsNew(List<SModelDescriptor> modelDescriptors, Solution module) {
    GlobalScope scope = GlobalScope.getInstance();

    final Set<ModuleReference> dependencies = new HashSet<ModuleReference>();

    for (SModelDescriptor model : modelDescriptors) {
      try {
        for (SModelDescriptor sm : allImportedModels(model.getSModel(), scope)) {
          if (ModelUtils.isDefaultImport(sm.getLongName())) {
            continue;
          }

          // RE-912
          IModule targetModule = sm == null ? null : sm.getModule();
          if (targetModule != null && module != targetModule && !module.getDependenciesManager().getAllRequiredModules().contains(targetModule)) {
            dependencies.add(targetModule.getModuleReference());
          }
        }
      } catch (Throwable t) {
        // ignore
      }
    }

    if (dependencies.isEmpty()) {
      return false;
    }

    module.addDependencies(dependencies, false);
    return true;
  }

  public static void validateLanguagesAndImports(SModel model, boolean respectModulesScopes, boolean firstVersion) {
    ModelChange.assertLegalChange(model);

    GlobalScope scope = GlobalScope.getInstance();
    SModelDescriptor modelDescriptor = model.getModelDescriptor();
    final IModule module = modelDescriptor == null ? null : modelDescriptor.getModule();
    final Set<IModule> declaredDependencies = module != null ? module.getDependenciesManager().getAllVisibleModules() : null;
    final Set<Language> declaredUsedLanguages = module != null ? module.getDependenciesManager().getAllUsedLanguages() : null;
    Set<ModuleReference> usedLanguages = getAllImportedLanguages(model);

    Set<SModelReference> importedModels = new HashSet<SModelReference>();
    for (SModelDescriptor sm : allImportedModels(model, scope)) {
      importedModels.add(sm.getSModelReference());

      // RE-912
      if (respectModulesScopes && module != null) {
        IModule targetModule = sm == null ? null : sm.getModule();
        if (targetModule != null && !module.getDependenciesManager().getAllRequiredModules().contains(targetModule)) {
          module.addDependency(targetModule.getModuleReference(), false); // cannot decide re-export or not here!
        }
      }
    }

    for (SNode node : model.nodes()) {
      Language lang = node.getLanguage();
      if (lang == null) {
        LOG.error("Can't find language " + node.getLanguageNamespace());
        continue;
      }
      ModuleReference ref = lang.getModuleReference();
      if (!usedLanguages.contains(ref)) {
        if (module != null) {
          if (respectModulesScopes && !declaredUsedLanguages.contains(lang)) {
            module.addUsedLanguage(ref);
          }
        }

        usedLanguages.add(ref);
        model.addLanguage(ref);
      }

      for (SReference reference : node.getReferencesIterable()) {
        if (reference.isExternal()) {
          SModelReference targetModelReference = reference.getTargetSModelReference();
          if (targetModelReference != null && !importedModels.contains(targetModelReference)) {
            if (respectModulesScopes && module != null) {
              SModelDescriptor targetModelDescriptor = SModelRepository.getInstance().getModelDescriptor(targetModelReference);
              IModule targetModule = targetModelDescriptor == null ? null : targetModelDescriptor.getModule();
              if (targetModule != null && !declaredDependencies.contains(targetModule)) {
                module.addDependency(targetModule.getModuleReference(), false); // cannot decide re-export or not here!
              }
            }
            model.addModelImport(targetModelReference, firstVersion);
            importedModels.add(targetModelReference);
          }
        }
      }
    }
    importedModels.clear();
  }

  //todo rewrite using iterators
  public static boolean hasLanguage(SModel model, @NotNull ModuleReference ref) {
    return getAllImportedLanguages(model).contains(ref);
  }

  //todo rewrite using iterators
  @NotNull
  public static List<Language> getLanguages(SModel model, @NotNull IScope scope) {
    Set<Language> languages = new LinkedHashSet<Language>();

    for (ModuleReference lang : model.importedLanguages()) {
      Language language = scope.getLanguage(lang);

      if (language != null) {
        languages.add(language);
        languages.addAll(language.getAllExtendedLanguages());
      }
    }

    for (ModuleReference dk : model.importedDevkits()) {
      DevKit devKit = scope.getDevKit(dk);
      if (devKit != null) {
        for (Language l : devKit.getAllExportedLanguages()) {
          if (languages.add(l)) {
            languages.addAll(l.getAllExtendedLanguages());
          }
        }
      }
    }

    if (model.getModelDescriptor() != null && model.getModelDescriptor().getModule() != null) {
      IModule module = model.getModelDescriptor().getModule();
      languages.addAll(module.getImplicitlyImportedLanguages(model.getModelDescriptor()));
    }

    return new ArrayList<Language>(languages);
  }

  //todo rewrite using iterators
  @NotNull
  public static Set<ModuleReference> getAllImportedLanguages(SModel model) {
    List<ModuleReference> langs = model.importedLanguages();
    List<ModuleReference> devkits = model.importedDevkits();
    Set<ModuleReference> result = new HashSet<ModuleReference>(langs.size() + devkits.size() * 8);
    result.addAll(langs);
    if (!MPSCore.getInstance().isMergeDriverMode()) {
      for (ModuleReference dk : devkits) {
        DevKit devKit = GlobalScope.getInstance().getDevKit(dk);
        if (devKit == null) continue;
        for (Language l : devKit.getExportedLanguages()) {
          result.add(l.getModuleReference());
        }
      }
    }
    return result;
  }

  //todo rewrite using iterators
  public static Set<ModuleReference> getUsedLanguages(@NotNull SModel model) {
    Set<ModuleReference> result = new HashSet<ModuleReference>();
    for (SNode node : model.nodes()) {
      Language lang = node.getLanguage();
      if (lang == null) continue;
      result.add(lang.getModuleReference());
    }
    return result;
  }

  //todo rewrite using iterators
  public static List<SModelDescriptor> allImportedModels(SModel model, IScope scope) {
    SModelDescriptor sourceModel = model.getModelDescriptor();
    Set<SModelDescriptor> result = new LinkedHashSet<SModelDescriptor>();
    for (Language language : getLanguages(model, scope)) {
      for (SModelDescriptor am : language.getAccessoryModels()) {
        if (am != sourceModel) {
          result.add(am);
        }
      }
    }

    for (SModelDescriptor importedModel : importedModels(model, scope)) {
      if (importedModel != sourceModel) {
        result.add(importedModel);
      }
    }

    if (sourceModel != null) {
      IModule module = sourceModel.getModule();
      if (module != null) {
        result.addAll(module.getImplicitlyImportedModelsFor(sourceModel));
      }
    }

    return new ArrayList<SModelDescriptor>(result);
  }

  @Nullable
  public static ImportElement getImportElement(SModel model, @NotNull SModelReference modelReference) {
    for (ImportElement importElement : model.importedModels()) {
      if (importElement.getModelReference().equals(modelReference)) {
        return importElement;
      }
    }
    return null;
  }

  @NotNull
  public static List<ImportElement> getAllImportElements(SModel model) {
    List<ImportElement> result = new ArrayList<ImportElement>();
    result.addAll(model.importedModels());
    result.addAll(model.getAdditionalModelVersions());
    return result;
  }

  //todo rewrite using iterators
  @NotNull
  public static List<SModelReference> getImportedModelUIDs(SModel sModel) {
    List<SModelReference> references = new ArrayList<SModelReference>();
    for (ImportElement importElement : sModel.importedModels()) {
      references.add(importElement.getModelReference());
    }
    return Collections.unmodifiableList(references);
  }

  //todo rewrite using iterators
  @NotNull
  public static Set<SModelDescriptor> getDependenciesModels(SModel sModel) {
    Set<SModelDescriptor> modelDescriptors = new HashSet<SModelDescriptor>(allImportedModels(sModel, GlobalScope.getInstance()));
    for (Language language : getLanguages(sModel, GlobalScope.getInstance())) {
      modelDescriptors.addAll(language.getAspectModelDescriptors());
    }
    return modelDescriptors;
  }

  //todo rewrite using iterators
  @NotNull
  public static Set<SModelReference> getDependenciesModelRefs(SModel sModel) {
    Set<SModelReference> result = new HashSet<SModelReference>();
    for (SModelDescriptor sm : getDependenciesModels(sModel)) {
      result.add(sm.getSModelReference());
    }
    return result;
  }

  //todo rewrite using iterators
  public static Set<SModelReference> getUsedImportedModels(SModel sModel) {
    Set<SModelReference> result = new HashSet<SModelReference>();
    for (SNode node : sModel.nodes()) {
      List<SReference> references = node.getReferences();
      for (SReference reference : references) {
        if (!reference.isExternal()) continue;
        SModelReference targetModelReference = reference.getTargetSModelReference();
        if (targetModelReference == null || result.contains(targetModelReference)) continue;

        result.add(targetModelReference);
      }
    }
    return result;
  }

  @Nullable
  public static SModelReference getImportedModelUID(SModel sModel, int referenceID) {
    for (ImportElement importElement : sModel.importedModels()) {
      if (importElement.getReferenceID() == referenceID) {
        return importElement.getModelReference();
      }
    }
    return null;
  }

  public static int getUsedVersion(SModel sModel, SModelReference sModelReference) {
    ImportElement importElement = getImportElement(sModel, sModelReference);
    if (importElement == null) return getLanguageAspectModelVersion(sModel, sModelReference);
    return importElement.getUsedVersion();
  }

  public static int getLanguageAspectModelVersion(SModel sModel, SModelReference sModelReference) {
    ImportElement importElement = getAdditionalModelElement(sModel, sModelReference);
    if (importElement == null) return -1;
    return importElement.getUsedVersion();
  }

  @Nullable
  public static ImportElement getAdditionalModelElement(SModel sModel, @NotNull SModelReference modelReference) {
    for (ImportElement importElement : sModel.getAdditionalModelVersions()) {
      if (importElement.getModelReference().equals(modelReference)) {
        return importElement;
      }
    }
    return null;
  }

  //todo rewrite using iterators
  @NotNull
  private static List<SModelDescriptor> importedModels(SModel model, @NotNull IScope scope) {
    List<SModelDescriptor> modelsList = new ArrayList<SModelDescriptor>();
    for (ImportElement importElement : model.importedModels()) {
      SModelReference modelReference = importElement.getModelReference();
      SModelDescriptor modelDescriptor = scope.getModelDescriptor(modelReference);

      if (modelDescriptor == null) {
        for (Language l : getLanguages(model, scope)) {
          for (SModelDescriptor accessory : l.getAccessoryModels()) {
            if (modelReference.equals(accessory.getSModelReference())) {
              modelDescriptor = accessory;
              break;
            }
          }
        }
      }

      if (modelDescriptor != null) {
        modelsList.add(modelDescriptor);
      }
    }
    return modelsList;
  }

  static void validateLanguages(SModel sModel, SNode node) {
    if (GlobalScope.getInstance() == null) {
      return;
    }
    Collection<ModuleReference> allrefs = getAllImportedLanguages(sModel);
    Set<String> available = new HashSet<String>(allrefs.size());
    for (ModuleReference ref : allrefs) {
      available.add(ref.getModuleFqName());
    }
    for (SNode n : node.getDescendantsIterable(null, true)) {
      String namespace = n.getLanguageNamespace();
      if (!available.contains(namespace)) {
        available.add(namespace);
        Language lang = GlobalScope.getInstance().getLanguage(namespace);
        if (lang != null) {
          sModel.addLanguage(lang.getModuleReference());
          // add language also to module if necessary
          IModule module = sModel.getModelDescriptor() == null ? null : sModel.getModelDescriptor().getModule();
          if (module != null && module.getModuleDescriptor() != null && !module.getDependenciesManager().getAllUsedLanguages().contains(lang)) {
            module.addUsedLanguage(lang.getModuleReference());
          }
        }
      }
    }
  }
}
