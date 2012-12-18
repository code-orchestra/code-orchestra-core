package codeOrchestra.actionscript.wizards.newproject.fromexternal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * @author Anton.I.Neverov
 */
public abstract class ASExternalModule {

  protected String moduleName;
  protected String modulePath;
  protected String sourcesPath;
  protected List<String> moduleDependencies = new ArrayList<String>();
  protected List<String> libraryDependencies = new ArrayList<String>();
  protected boolean libraryModule = false;
  protected String mainClass;
  protected String additionalCompilerArguments;
  protected String targetPlayerVersion;
  protected boolean useNonDefaultLocales = false;
  protected String nonDefaultLocales;
  protected boolean useDefaultSDKConfig = true;
  protected boolean useCustomCompilerConfig = false;
  protected String customCompilerConfig;

  public String getSourcesPath() {
    return sourcesPath;
  }

  public List<String> getModuleDependencies() {
    return Collections.unmodifiableList(moduleDependencies);
  }

  public abstract void resolveModuleDependencies(Map<String, String> namePathMap);

  public List<String> getLibraryDependencies() {
    return Collections.unmodifiableList(libraryDependencies);
  }

  public String getModuleName() {
    return moduleName;
  }

  public String getModulePath() {
    return modulePath;
  }

  public boolean isLibraryModule() {
    return libraryModule;
  }

  public String getMainClass() {
    return mainClass;
  }

  public String getAdditionalCompilerArguments() {
    return additionalCompilerArguments;
  }

  public String getTargetPlayerVersion() {
    return targetPlayerVersion;
  }

  public String getNonDefaultLocales() {
    return nonDefaultLocales;
  }

  public boolean isUseDefaultSDKConfig() {
    return useDefaultSDKConfig;
  }

  public String getCustomCompilerConfig() {
    return customCompilerConfig;
  }

  public void setCustomCompilerConfig(String customCompilerConfig) {
    this.customCompilerConfig = customCompilerConfig;
  }

  public boolean isUseNonDefaultLocales() {
    return useNonDefaultLocales;
  }

  public boolean isUseCustomCompilerConfig() {
    return useCustomCompilerConfig;
  }

}
