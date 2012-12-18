package codeOrchestra.actionScript.scope;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.text.StringUtil;
import codeOrchestra.actionscript.modulemaker.SolutionUtils;
import codeOrchestra.environment.view.EnvironmentLibraryManager;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.SModelDescriptor;
import org.jetbrains.annotations.NotNull;

import java.util.Collections;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
abstract class ActionScriptSolutionScope extends ActionScriptScope {

  private EnvironmentLibraryManager environmentLibraryManager;
  private boolean filterOutEnvironmentLibs;

  ActionScriptSolutionScope(boolean includeStubs, Project project, boolean filterOutEnvironmentLibs) {
    super(includeStubs);

    this.filterOutEnvironmentLibs = filterOutEnvironmentLibs;

    if (project != null) {
      this.environmentLibraryManager = project.getComponent(EnvironmentLibraryManager.class);
    }
  }

  @Override
  public Language getLanguage(String fqName) {
    return null;
  }

  @Override
  public Language getLanguage(ModuleReference moduleReference) {
    return null;
  }

  @Override
  public DevKit getDevKit(ModuleReference ref) {
    return null;
  }

  @Override
  public List<Language> getVisibleLanguages() {
    return Collections.emptyList();
  }

  @Override
  public List<DevKit> getVisibleDevkits() {
    return Collections.emptyList();
  }

  @Override
  protected boolean isApplicableActionScriptModel(@NotNull SModelDescriptor modelDescriptor) {
    // Check if the model is a stub one
    if (!this.includeStubs && !StringUtil.isEmpty(modelDescriptor.getStereotype())) {
      return false;
    }

    IModule module = modelDescriptor.getModule();
    if (module == null) {
      return true;
    }

    // RE-2846 — accept accessory models
    if (module instanceof Language) {
      Language language = (Language) module;
      if (language.getAccessoryModels().contains(modelDescriptor)) {
        return true;
      }
    }

    if (isApplicableActionScriptModule(module)) {
      return true;
    }

    return false;
  }

  @Override
  protected boolean isApplicableActionScriptModule(IModule module) {
    if (module instanceof Solution) {
      // RE-3778 - Filter out environment-specific library implementations
      if (filterOutEnvironmentLibs && environmentLibraryManager != null && environmentLibraryManager.isLibraryImplementation(module)) {
        return false;
      }

      return SolutionUtils.isActionScriptDependent((Solution) module);
    }
    return false;
  }

}
