package codeOrchestra.actionScript.scope;

import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.SModel.ImportElement;
import jetbrains.mps.util.misc.hash.HashSet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public class ModelDependenciesGraphScopeWrapper extends ScopeDelegate implements IScope {

  private Set<SModelReference> allModels = new HashSet<SModelReference>();
  private Set<ModuleReference> allLanguages = new HashSet<ModuleReference>();

  private IScope wrappedScope;

  public ModelDependenciesGraphScopeWrapper(IScope wrappedScope, SModelDescriptor scopeModel) {
    this.wrappedScope = wrappedScope;
    initDependencies(scopeModel);
  }

  private void initDependencies(SModelDescriptor sModelDescriptor) {
    SModelReference sModelReference = sModelDescriptor.getSModelReference();
    if (allModels.contains(sModelReference)) {
      return;
    }

    SModel sModel = sModelDescriptor.getSModel();

    allModels.add(sModelReference);
    allLanguages.addAll(sModel.importedLanguages());

    // Recursion
    for (ImportElement importElement : sModel.importedModels()) {
      SModelDescriptor importedModelDescriptor = SModelRepository.getInstance().getModelDescriptor(importElement.getModelReference());
      if (importedModelDescriptor != null) {
        initDependencies(importedModelDescriptor);
      }
    }
  }

  @Override
  public SModelDescriptor getModelDescriptor(SModelReference modelReference) {
    if (allModels.contains(modelReference)) {
      return super.getModelDescriptor(modelReference);
    }
    return null;
  }

  @Override
  public Language getLanguage(ModuleReference moduleReference) {
    if (allLanguages.contains(moduleReference)) {
      return super.getLanguage(moduleReference);
    }
    return null;
  }

  @Override
  public Iterable<SModelDescriptor> getOwnModelDescriptors() {
    return getModelDescriptors();
  }

  @Override
  public DevKit getDevKit(ModuleReference ref) {
    return null;
  }

  @Override
  public Iterable<SModelDescriptor> getModelDescriptors() {
    List<SModelDescriptor> result = new ArrayList<SModelDescriptor>();

    for (SModelReference modelReference : allModels) {
      SModelDescriptor modelDescriptor = super.getModelDescriptor(modelReference);
      if (modelDescriptor != null) {
        result.add(modelDescriptor);
      }
    }

    return result;
  }

  @Override
  public Iterable<Language> getVisibleLanguages() {
    List<Language> result = new ArrayList<Language>();

    for (ModuleReference langRef : allLanguages) {
      Language language = super.getLanguage(langRef);
      if (language != null) {
        result.add(language);
      }
    }

    return result;
  }

  @Override
  public Iterable<IModule> getVisibleModules() {
    List<IModule> result = new ArrayList<IModule>();

    for (SModelReference modelReference : allModels) {
      SModelDescriptor modelDescriptor = super.getModelDescriptor(modelReference);
      if (modelDescriptor != null) {
        IModule module = modelDescriptor.getModule();
        if (module != null) {
          result.add(module);
        }
      }
    }

    return result;
  }

  @Override
  public Iterable<DevKit> getVisibleDevkits() {
    return Collections.EMPTY_LIST;
  }

  @Override
  public SModelDescriptor getModelDescriptor(SModelFqName fqName) {
    for (SModelReference modelReference : allModels) {
      if (modelReference.getSModelFqName().equals(fqName)) {
        return super.getModelDescriptor(fqName);
      }
    }

    return null;
  }

  @Override
  public Language getLanguage(String fqName) {
    for (ModuleReference languageReference : allLanguages) {
      if (languageReference.getModuleFqName().equals(fqName)) {
        return super.getLanguage(languageReference);
      }
    }

    return null;
  }

  @Override
  protected IScope getDelegatedScope() {
    return wrappedScope;
  }


}
