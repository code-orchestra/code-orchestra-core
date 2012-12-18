package codeOrchestra.actionScript.scope;

import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;

import java.util.List;

/**
 * @author Alexander Eliseyev
 */
abstract class ScopeDelegate implements IScope {

  protected abstract IScope getDelegatedScope();

  public SModelDescriptor getModelDescriptor(SModelFqName fqName) {
    return GlobalScope.getInstance().getModelDescriptor(fqName);
  }

  public Language getLanguage(String fqName) {
    return GlobalScope.getInstance().getLanguage(fqName);
  }

  public Iterable<SModelDescriptor> getOwnModelDescriptors() {
    return GlobalScope.getInstance().getOwnModelDescriptors();
  }

  public Language getLanguage(ModuleReference moduleReference) {
    return GlobalScope.getInstance().getLanguage(moduleReference);
  }

  public DevKit getDevKit(ModuleReference ref) {
    return GlobalScope.getInstance().getDevKit(ref);
  }

  public List<Language> getVisibleLanguages() {
    return GlobalScope.getInstance().getVisibleLanguages();
  }

  public List<DevKit> getVisibleDevkits() {
    return GlobalScope.getInstance().getVisibleDevkits();
  }

  public Iterable<IModule> getVisibleModules() {
    return GlobalScope.getInstance().getVisibleModules();
  }

  public SModelDescriptor getModelDescriptor(SModelReference modelReference) {
    return GlobalScope.getInstance().getModelDescriptor(modelReference);
  }

  public List<SModelDescriptor> getModelDescriptors() {
    return GlobalScope.getInstance().getModelDescriptors();
  }

  @Override
  public String toString() {
    return getClass().getSimpleName();
  }
}
