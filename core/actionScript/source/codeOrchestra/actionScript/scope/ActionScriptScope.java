package codeOrchestra.actionScript.scope;

import com.intellij.openapi.util.text.StringUtil;
import codeOrchestra.actionscript.modulemaker.LanguageUtils;
import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelFqName;
import jetbrains.mps.smodel.SModelReference;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
abstract class ActionScriptScope extends ScopeDelegate {

  protected boolean includeStubs;

  protected ActionScriptScope() {
    this.includeStubs = true;
  }

  protected ActionScriptScope(boolean includeStubs) {
    this.includeStubs = includeStubs;
  }

  @Override
  public Iterable<IModule> getVisibleModules() {
    Iterable<IModule> allVisibleModules = super.getVisibleModules();
    List<IModule> asVisibleModules = new ArrayList<IModule>();

    for (IModule visibleModule : allVisibleModules) {
      if (visibleModule != null && isApplicableActionScriptModule(visibleModule)) {
        asVisibleModules.add(visibleModule);
      }
    }

    return asVisibleModules;
  }

  @Override
  public Iterable<SModelDescriptor> getOwnModelDescriptors() {
    List<SModelDescriptor> modelDescriptors = new ArrayList<SModelDescriptor>();

    for (SModelDescriptor modelDescriptor : super.getOwnModelDescriptors()) {
      if (modelDescriptor != null && isApplicableActionScriptModel(modelDescriptor)) {
        modelDescriptors.add(modelDescriptor);
      }
    }

    return modelDescriptors;
  }

  @Override
  public SModelDescriptor getModelDescriptor(SModelFqName fqName) {
    SModelDescriptor modelDescriptor = super.getModelDescriptor(fqName);

    if (modelDescriptor != null && isApplicableActionScriptModel(modelDescriptor)) {
      return modelDescriptor;
    }

    return null;
  }

  @Override
  public SModelDescriptor getModelDescriptor(SModelReference modelReference) {
    SModelDescriptor modelDescriptor = super.getModelDescriptor(modelReference);

    if (modelDescriptor != null && isApplicableActionScriptModel(modelDescriptor)) {
      return modelDescriptor;
    }

    return null;
  }

  @Override
  public List<SModelDescriptor> getModelDescriptors() {
    List<SModelDescriptor> modelDescriptors = new ArrayList<SModelDescriptor>();

    for (SModelDescriptor visibleModel : super.getModelDescriptors()) {
      if (isApplicableActionScriptModel(visibleModel)) {
        modelDescriptors.add(visibleModel);
      }
    }

    return modelDescriptors;
  }

  protected abstract boolean isApplicableActionScriptModule(IModule module);

  protected boolean isApplicableActionScriptModel(@NotNull SModelDescriptor modelDescriptor) {
    // Check if the model is a stub one
    if (!this.includeStubs && !StringUtil.isEmpty(modelDescriptor.getStereotype())) {
      return false;
    }

    IModule module = modelDescriptor.getModule();
    if (module == null || isApplicableActionScriptModule(module)) {
      return true;
    }
    return false;
  }

  // --- Util methods

  protected boolean isASDevKit(@Nullable DevKit devKit) {
    if (devKit != null) {
      for (Language exportedLanguages : devKit.getAllExportedLanguages()) {
        if (LanguageUtils.isExtendingActionScript(exportedLanguages)) {
          return true;
        }
      }
    }

    return false;
  }

}
