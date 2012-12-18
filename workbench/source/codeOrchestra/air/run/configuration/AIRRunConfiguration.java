package codeOrchestra.air.run.configuration;

import codeOrchestra.run.CodeOrchestraRunConfiguration;

/**
 * @author Alexander Eliseyev
 */
public class AIRRunConfiguration implements CodeOrchestraRunConfiguration {

  private String moduleName;

  private String launcherOptions;
  private String programParameters;

  // Custom AIR app descriptor params
  private String descriptorPath;
  private String rootDirectory;

  private int launcherType = AIRLauncherType.DEFAULT_MODULE_OUTPUT.ordinal();

  public AIRRunConfiguration(String moduleName, String launcherOptions, String programParameters, String descriptorPath, String rootDirectory) {
    this.moduleName = moduleName;
    this.launcherOptions = launcherOptions;
    this.programParameters = programParameters;
    this.descriptorPath = descriptorPath;
    this.rootDirectory = rootDirectory;
  }

  public String getModuleName() {
    return moduleName;
  }

  public String getLauncherOptions() {
    return launcherOptions;
  }

  public String getProgramParameters() {
    return programParameters;
  }

  public String getDescriptorPath() {
    return descriptorPath;
  }

  public String getRootDirectory() {
    return rootDirectory;
  }

  public AIRLauncherType getLauncherType() {
    return AIRLauncherType.byIndex(launcherType);
  }

  public void setLauncherType(AIRLauncherType launcherType) {
    this.launcherType = launcherType.ordinal();
  }

  public void setModuleName(String moduleName) {
    this.moduleName = moduleName;
  }

  public void setLauncherOptions(String launcherOptions) {
    this.launcherOptions = launcherOptions;
  }

  public void setProgramParameters(String programParameters) {
    this.programParameters = programParameters;
  }

  public void setDescriptorPath(String descriptorPath) {
    this.descriptorPath = descriptorPath;
  }

  public void setRootDirectory(String rootDirectory) {
    this.rootDirectory = rootDirectory;
  }

  public void setLauncherType(int launcherType) {
    this.launcherType = launcherType;
  }
}
