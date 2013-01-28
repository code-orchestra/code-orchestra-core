package codeOrchestra.actionScript.scope;

import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;

/**
 * @author Alexander Eliseyev
 */
abstract class ScopeDelegate implements IScope {

  protected abstract IScope getDelegatedScope();

  public SModelDescriptor getModelDescriptor(SModelFqName fqName) {
    return getDelegatedScope().getModelDescriptor(fqName);
  }

  public Language getLanguage(String fqName) {
    return getDelegatedScope().getLanguage(fqName);
  }

  public Iterable<SModelDescriptor> getOwnModelDescriptors() {
    return getDelegatedScope().getOwnModelDescriptors();
  }

  public Language getLanguage(ModuleReference moduleReference) {
    return getDelegatedScope().getLanguage(moduleReference);
  }

  public Iterable<SModelDescriptor> getModelDescriptors() {
    return getDelegatedScope().getModelDescriptors();
  }

  public DevKit getDevKit(ModuleReference ref) {
    return getDelegatedScope().getDevKit(ref);
  }

  public Iterable<Language> getVisibleLanguages() {
    return getDelegatedScope().getVisibleLanguages();
  }

  public Iterable<DevKit> getVisibleDevkits() {
    return getDelegatedScope().getVisibleDevkits();
  }

  public Iterable<IModule> getVisibleModules() {
    return getDelegatedScope().getVisibleModules();
  }

  public SModelDescriptor getModelDescriptor(SModelReference modelReference) {
    return getDelegatedScope().getModelDescriptor(modelReference);
  }

  @Override
  public String toString() {
    return getClass().getSimpleName() + " wrapping " + getDelegatedScope();
  }
}
