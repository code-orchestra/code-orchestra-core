package codeOrchestra.actionscript.run.compiler.properties;

import codeOrchestra.actionScript.flexsdk.FlexSDKLibsManager;
import codeOrchestra.actionscript.modulemaker.CompilerKind;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.javaScript.generator.JSOptimizationKind;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;

import java.io.File;
import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public class CompilerSettings {

  public static final String DEFAULT_OUTPUT_PROJECT_DIR = "output_swf";

  public static final String OUTPUT_TYPE_INDEX = "outputTypeIndex";
  public static final String USE_DEFAULT_SDK_CONFIG = "useDefaultSDKConfiguration";
  public static final String USE_CUSTOM_SDK_CONFIG = "useCustomSDKConfiguration";
  public static final String CONFIGURATION_FILE = "compilerConfigurationFile";
  public static final String OUTPUT_FILE_NAME = "outputFileName";
  public static final String INHERIT_PROJECT_OUTPUT_PATH = "inheritProjectOutputPath";
  public static final String COMPILE_OUTPUT_PATH = "moduleOutputPath";
  public static final String PLAYER_VERSION = "playerVersion";
  public static final String USE_FRAMEWORK_AS_RSL = "useFrameworkAsRSL";
  public static final String CHECK_MODELS = "checkModels";
  public static final String DELETE_UNUSED_MEMBERS = "deleteUnusedMembers";
  public static final String DELETE_WHITESPACE = "deleteWhitespace";
  public static final String INCLUDE_SWC_RESOURCES = "includeResources";
  public static final String INCLUDE_ALL_ROOTS = "includeAllRoots";
  public static final String FLEX_COMPILER_OPTIONS = "compilerOptions";
  public static final String LOCALE_OPTIONS = "localeOptions";
  public static final String NON_DEFAULT_LOCALE = "nonDefaultLocale";

  public static final String MAIN_CLASS_NODE_ID = "mainClassNodeId";
  public static final String MAIN_CLASS_MODEL_UID = "mainClassModelUID";

  public transient boolean isSWC;
  public transient CompilerKind previousCompiler = null;

  private Map<JSOptimizationKind, Boolean> jsParameters = new HashMap<JSOptimizationKind, Boolean>();
  {
    // Init the default values
    for (JSOptimizationKind jsOptimizationKind : JSOptimizationKind.values()) {
      toggleJSOptimization(jsOptimizationKind, jsOptimizationKind.getDefaultValue());
    }
  }

  private List<String> excludedPackages = new ArrayList<String>();

  public CompilerSettings() {
  }

  public CompilerSettings(SolutionDescriptor parent) {
    update(parent);
  }

  public List<String> getExcludedPackages() {
    return excludedPackages;
  }

  public void setExcludedPackages(List<String> excludedPackages) {
    this.excludedPackages = excludedPackages;
  }

  public boolean includeAllRoots() {
    return includeAllRoots;
  }

  public void setIncludeAllRoots(boolean includeAllRoots) {
    this.includeAllRoots = includeAllRoots;
  }

  public void toggleJSOptimization(JSOptimizationKind optimizationKind, boolean on) {
    jsParameters.put(optimizationKind, on);
  }

  public boolean isJSOptimizationOn(JSOptimizationKind optimizationKind) {
    OutputType outputType = getOutputType();
    if (optimizationKind.isApplicable(outputType)) {
      Boolean result = jsParameters.get(optimizationKind);
      if (result != null) {
        return result;
      }
    }
    return false;
  }

  public boolean isJSOptimizationOn_noCheck(JSOptimizationKind optimizationKind) {
    Boolean result = jsParameters.get(optimizationKind);
    if (result != null) {
      return result;
    }
    return false;
  }

  public boolean enableFlashStage() {
    return isJSOptimizationOn(JSOptimizationKind.EnableFlashStage);
  }

  public boolean deleteUnusedMembersOnGeneration() {
    return isJSOptimizationOn(JSOptimizationKind.DeleteUnusedMembers);
  }

  public boolean deleteWhitespaceOnGeneration() {
    return isJSOptimizationOn(JSOptimizationKind.DeleteWhitespaces);
  }

  public void update(SolutionDescriptor parent) {
    if (SolutionUtils.isSWCSolution(parent)) {
      outputTypeIndex = OutputType.FLEX_LIBRARY.getIndex();
      for (ModelRoot stubModelsEntry : parent.getStubModelEntries_()) {
        String path = stubModelsEntry.getPath();
        if (path.endsWith(".swc")) {
          try {
            File file = new File(path);
            outputFileName = file.getName();
            outputPath = file.getParent();
            inheritProjectOutputPath = false;
            isSWC = true;
          } catch (Exception e) {
            // ignore
          }
        }
      }
    } else {
      if (outputFileName == null) {
        outputFileName = parent.getNamespace() + (getOutputType() == OutputType.FLEX_LIBRARY ? ".swc" : ".swf");
      }
    }
  }

  /**
   * Don't you dare use it for anything other than save/load. Use CodeOrchestraGenerateManager#getContextAwareOutputType instead
   */
  public OutputType getOutputType() {
    return OutputType.byIndex(outputTypeIndex);
  }

  public boolean checkModelsBeforeGeneration() {
    if (EnumSet.of(OutputType.HTML5_APPLICATION, OutputType.HTML5_LIBRARY).contains(getOutputType())) {
      return checkModels;
    }
    return false;
  }

  @Deprecated
  public boolean isLibrary;

  private boolean includeAllRoots;
  public int outputTypeIndex;
  public boolean useDefaultSDKConfiguration = true;
  public boolean useCustomSDKConfiguration;
  public String configurationFile;  
  public String outputFileName;
  public boolean inheritProjectOutputPath = true;
  public String outputPath;
  public String playerVersion = FlexSDKLibsManager.getInstance().getPlayerVersion();
  public boolean useFrameworkAsRSL;
  public boolean includeResources;
  public String compilerOptions;
  public String localeOptions = "en_US";
  public boolean nonDefaultLocale;

  public String mainClassNodeId;
  public String mainClassModelUID;
  
  public boolean checkModels = false;

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    CompilerSettings that = (CompilerSettings) o;

    if (checkModels != that.checkModels) return false;
    if (includeResources != that.includeResources) return false;
    if (includeAllRoots != that.includeAllRoots) return false;
    if (inheritProjectOutputPath != that.inheritProjectOutputPath) return false;
    if (isLibrary != that.isLibrary) return false;
    if (isSWC != that.isSWC) return false;
    if (nonDefaultLocale != that.nonDefaultLocale) return false;
    if (outputTypeIndex != that.outputTypeIndex) return false;
    if (useCustomSDKConfiguration != that.useCustomSDKConfiguration) return false;
    if (useDefaultSDKConfiguration != that.useDefaultSDKConfiguration) return false;
    if (useFrameworkAsRSL != that.useFrameworkAsRSL) return false;
    if (compilerOptions != null ? !compilerOptions.equals(that.compilerOptions) : that.compilerOptions != null)
      return false;
    if (configurationFile != null ? !configurationFile.equals(that.configurationFile) : that.configurationFile != null)
      return false;
    if (localeOptions != null ? !localeOptions.equals(that.localeOptions) : that.localeOptions != null) return false;
    if (mainClassModelUID != null ? !mainClassModelUID.equals(that.mainClassModelUID) : that.mainClassModelUID != null)
      return false;
    if (mainClassNodeId != null ? !mainClassNodeId.equals(that.mainClassNodeId) : that.mainClassNodeId != null)
      return false;
    if (outputFileName != null ? !outputFileName.equals(that.outputFileName) : that.outputFileName != null)
      return false;
    if (outputPath != null ? !outputPath.equals(that.outputPath) : that.outputPath != null) return false;
    if (playerVersion != null ? !playerVersion.equals(that.playerVersion) : that.playerVersion != null) return false;
    if (jsParameters != null ? !jsParameters.equals(that.jsParameters) : that.jsParameters != null) return false;
    if (excludedPackages != null ? !excludedPackages.equals(that.excludedPackages) : that.excludedPackages != null) return false;

    return true;
  }

}
