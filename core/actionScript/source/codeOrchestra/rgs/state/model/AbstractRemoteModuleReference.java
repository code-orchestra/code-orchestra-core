package codeOrchestra.rgs.state.model;

import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Language;
import org.jetbrains.annotations.NotNull;

import java.io.Serializable;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractRemoteModuleReference implements Serializable {

  public static AbstractRemoteModuleReference ofModule(@NotNull IModule module) {
    if (module instanceof Language) {
      return ofLanguage((Language) module);
    } else if (module instanceof Solution) {
      return ofSolution((Solution) module);
    } else {
      throw new IllegalArgumentException("Illegal module type: " + module.getClass().getSimpleName());
    }
  }

  public static AbstractRemoteModuleReference ofLanguage(Language language) {
    return new RemoteLanguageReference(language);
  }

  public static AbstractRemoteModuleReference ofSolution(Solution solution) {
    return new RemoteSolutionReference(solution);
  }

  public static AbstractRemoteModuleReference ofLanguageByReference(ModuleReference ref) {
    return new RemoteLanguageReference(ref);
  }

  public static AbstractRemoteModuleReference ofSolutionByReference(ModuleReference ref) {
    return new RemoteSolutionReference(ref);
  }

  private String moduleReferenceStr;

  public AbstractRemoteModuleReference() {
  }

  protected AbstractRemoteModuleReference(@NotNull ModuleReference moduleReference) {
    this.moduleReferenceStr = moduleReference.toString();
  }

  protected AbstractRemoteModuleReference(@NotNull IModule module) {
    this(module.getModuleReference());
  }

  public String getModuleReferenceStr() {
    return moduleReferenceStr;
  }

  public void setModuleReferenceStr(String moduleReferenceStr) {
    this.moduleReferenceStr = moduleReferenceStr;
  }

  public ModuleReference toLocalModuleReference() {
    if (moduleReferenceStr == null) {
      return null;
    }
    return ModuleReference.fromString(moduleReferenceStr);
  }

  public String getModuleName() {
    if (moduleReferenceStr == null) {
      return null;
    }
    return toLocalModuleReference().getModuleFqName();
  }

  @Override
  public String toString() {
    return moduleReferenceStr;
  }
}
