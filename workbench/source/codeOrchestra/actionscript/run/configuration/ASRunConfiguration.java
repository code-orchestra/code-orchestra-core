package codeOrchestra.actionscript.run.configuration;

import codeOrchestra.run.CodeOrchestraRunConfiguration;
import jetbrains.mps.project.MPSProject;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASRunConfiguration implements CodeOrchestraRunConfiguration {

  private boolean useCustomFile;
  private String moduleName;
  private String swfFile;
  private String customFile;
  private String webAddress;
  private boolean make;
  private List<FlashVar> flashVars = new ArrayList<FlashVar>();  
  private int launcherType;
  private String flashPlayerPath;

  private transient MPSProject mpsProject;

  public ASRunConfiguration(String moduleName, String customFile, boolean useCustomFile, boolean skipMake) {
    this.useCustomFile = useCustomFile;
    this.moduleName = moduleName;
    this.customFile = customFile;
    this.make = !skipMake;
  }

  public LauncherType getLauncherType() {
    return LauncherType.byIndex(launcherType);
  }

  public void setLauncherType(LauncherType launcherType) {
    this.launcherType = launcherType.ordinal();
  }

  public String getWebAddress() {
    return webAddress;
  }

  public void setWebAddress(String webAddress) {
    this.webAddress = webAddress;
  }

  public String getFlashPlayerPath() {
    return flashPlayerPath;
  }

  public void setFlashPlayerPath(String flashPlayerPath) {
    this.flashPlayerPath = flashPlayerPath;
  }

  public void addFlashVar(FlashVar flashVar) {
    flashVars.add(flashVar);
  }
      
  public List<FlashVar> getFlashVars() {
    return flashVars;
  }

  public void setFlashVars(List<FlashVar> flashVars) {
    this.flashVars = flashVars;
  }

  public boolean isUseCustomFile() {
    return useCustomFile;
  }

  public void setUseCustomFile(boolean useCustomFile) {
    this.useCustomFile = useCustomFile;
  }

  public ASRunConfiguration() {
    this.make = true;
  }

  public String getModuleName() {
    return moduleName;
  }

  public void setModuleName(String moduleName) {
    this.moduleName = moduleName;
  }

  public String getSwfFile() {
    return swfFile;
  }

  public void setSwfFile(String swfFile) {
    this.swfFile = swfFile;
  }

  public String getCustomFile() {
    return customFile;
  }

  public MPSProject getMpsProject() {
    return mpsProject;
  }

  public void setMpsProject(MPSProject mpsProject) {
    this.mpsProject = mpsProject;
  }

  public void setCustomFile(String customFile) {
    this.customFile = customFile;
  }

  public boolean isMake() {
    return make;
  }

  public void setMake(boolean make) {
    this.make = make;
  }


}
