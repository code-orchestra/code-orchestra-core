package codeOrchestra.actionscript.view.utils;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.environment.view.EnvironmentLibraryManager;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public final class Languages {

  public static final String ACTION_SCRIPT = "codeOrchestra.actionScript";

  public static final String ACTION_SCRIPT_INTERNAL = "codeOrchestra.actionScript";
  public static final String ACTION_SCRIPT_LOGGING = "codeOrchestra.actionScript.logging";
  public static final String ACTION_SCRIPT_ASSETS = "codeOrchestra.projectAssets";

  public static final String ACTION_SCRIPT_TRAITS = "codeOrchestra.actionScript.traits";
  public static final String ACTION_SCRIPT_TO_JS = "html5.astojs";

  public static final String FALCON = "codeOrchestra.actionScript.falcon";

  public static final String LIVE_CODING = "codeOrchestra.actionScript.liveCoding";

  private static final Set<String> defaultLanguages = new HashSet<String>() {{
    add(ACTION_SCRIPT_INTERNAL);
    add(ACTION_SCRIPT_LOGGING);
    add(ACTION_SCRIPT_ASSETS);
  }};

  private static final Map<OutputType, Set<String>> toggledLanguagesByOutputType = new HashMap<OutputType, Set<String>>() {{
    put(OutputType.HTML5_APPLICATION, new HashSet<String>() {{ add(ACTION_SCRIPT_TO_JS); }});
    put(OutputType.HTML5_LIBRARY, new HashSet<String>() {{ add(ACTION_SCRIPT_TO_JS); }});
  }};
  private static final Set<String> toggledLanguages = new HashSet<String>() {{
    for (Set<String> languagesByOutputType : toggledLanguagesByOutputType.values()) {
      for (String toggledLanguage : languagesByOutputType) {
        add(toggledLanguage);
      }
    }
  }};

  public static boolean isDefaultImportLanguage(@NotNull ModuleReference languageRef) {
    return isDefaultImportLanguage(languageRef, null);
  }

  public static boolean isDefaultImportLanguage(@NotNull ModuleReference languageRef, Solution contextModule) {
    String languageRefModuleFqName = languageRef.getModuleFqName();
    if (defaultLanguages.contains(languageRefModuleFqName)) {
      return true;
    }

    // Make use of context module output type
    if (contextModule != null) {
      OutputType outputType = CodeOrchestraGenerateManager.getOwnOutputType(contextModule.getModuleReference());
      Set<String> toggledLanguagesByOutputTypeGiven = toggledLanguagesByOutputType.get(outputType);
      if (toggledLanguagesByOutputTypeGiven != null && toggledLanguagesByOutputTypeGiven.contains(languageRefModuleFqName)) {
        return true;
      }
    } else {
      if (toggledLanguages.contains(languageRefModuleFqName)) {
        return true;
      }
    }

    return false;
  }

  // - Markers

  private static final String CODE_ORCHESTRA = "codeOrchestra";
  private static final String HTML5 = "html5";

  public static boolean isCodeOrchestraLanguage(Language language) {
    String languageNamespace = language.getModuleDescriptor().getNamespace();
    return languageNamespace != null && (languageNamespace.toLowerCase().contains(CODE_ORCHESTRA) || languageNamespace.toLowerCase().contains(HTML5));
  }

  public static Language get(String fqName) {
    return MPSModuleRepository.getInstance().getLanguage(fqName); 
  }

  public static ModuleReference getReference(String fqName) {
    return ModuleReference.fromString(fqName);
  }
  
}
