package codeOrchestra.actionscript.view.utils;

import com.intellij.openapi.project.Project;
import codeOrchestra.actionScript.assets.AssetsManager;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.workbench.actions.imports.ImportHelper;

import java.util.HashSet;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public final class ModelUtils {

  private static final String ACTION_SCRIPT_UTIL_MODEL = "r:944a31f8-bb9e-4168-b4ad-9638a126a51d(codeOrchestra.actionScript.util)";
  private static String[] DEFAULT_IMPORTS = new String[] {
    "",
    "flash.display",
    "flash.metadata",
    "flash.events"
  };
  private static Set<SModelReference> defaultImportsSet;

  public synchronized static Set<SModelReference> getDefaultImports() {
    if (defaultImportsSet == null) {
      defaultImportsSet = new HashSet<SModelReference>();
      for (String defaultModel : DEFAULT_IMPORTS){
        defaultImportsSet.add(getSWCModelReference(defaultModel));
      }
    }
    return defaultImportsSet;
  }

  public static boolean isDefaultImport(SModelReference modelReference) {
    return getDefaultImports().contains(modelReference);
  }

  public static boolean isDefaultImport(String modelLongName) {
    for (String packageName : DEFAULT_IMPORTS) {
      if (packageName.equals(modelLongName)) {
        return true;
      }
    }
    return false;
  }

  /**
   * RE-2727
   *
   * @param module module to add AS2JS generator dependency to
   * @param add add/remove flag
   */
  public static void toggleAS2JSDenepdency(IModule module, boolean add) {
    for (SModelDescriptor sModelDescriptor : module.getOwnModelDescriptors()) {
      toggleAS2JSDependency(sModelDescriptor.getSModel(), add);
    }
  }

  /**
   * RE-2727
   *
   * @param sModel model to add AS2JS generator dependency to
   * @param add add/remove flag
   */
  public static void toggleAS2JSDependency(SModel sModel, boolean add) {
    SModelDescriptor modelDescriptor = sModel.getModelDescriptor();
    IModule sourceModule = modelDescriptor.getModule();
    ModuleReference astojsLangReference = Languages.getReference(Languages.ACTION_SCRIPT_TO_JS);

    if (add) {
      ImportHelper.addLanguageImport(sourceModule, modelDescriptor, astojsLangReference);
    } else {
      sModel.deleteLanguage(astojsLangReference);
      boolean noLangUsesLeft = true;
      for (SModelDescriptor sModelDescriptor : sourceModule.getOwnModelDescriptors()) {
        if (sModelDescriptor.getSModel().importedLanguages().contains(astojsLangReference)) {
          noLangUsesLeft = false;
          break;
        }
      }

      // Remove the language dependency from the model's module
      if (noLangUsesLeft) {
        Dependency astojsDependency = null;
        for (Dependency dependency : sourceModule.getModuleDescriptor().getDependencies()) {
          if (astojsLangReference.equals(dependency.getModuleRef())) {
            astojsDependency = dependency;
            break;
          }
        }

        if (astojsDependency != null) {
          sourceModule.getModuleDescriptor().getDependencies().remove(astojsDependency);
          sourceModule.save();
        }
      }
    }
  }

  public static void addDefaultModelImports(SModel sModel, Project project) {
    // Add flash libraries
    for (String packageName : DEFAULT_IMPORTS) {
      sModel.addModelImport(getSWCModelReference(packageName), false);
    }

    // Add assets model(s)
    sModel.addModelImport(AssetsManager.createProjectAssetModelReference(project), false);

    // Add actionScript accessoryModel
    sModel.addModelImport(SModelReference.fromString(ACTION_SCRIPT_UTIL_MODEL), false);
  }

  private static SModelReference getSWCModelReference(String pack) {
    return SModelReference.fromString(String.format("f:swc_stub#%s(%s@swc_stub)", pack, pack));
  }

  private ModelUtils() {
  }

}
