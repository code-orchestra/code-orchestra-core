package codeOrchestra.actionscript.liveCoding.run.config;

import codeOrchestra.actionscript.liveCoding.LiveCodingTarget;
import codeOrchestra.actionscript.run.configuration.LauncherType;
import codeOrchestra.run.CodeOrchestraRunConfiguration;

import java.io.Serializable;

/**
 * @author Alexander Eliseyev
 */
public class ASLiveCodingRunConfiguration extends AbstractLiveCodingRunConfiguration {

  private boolean useCustomFile;
  private String swfFile;
  private String customFile;
  private int launcherType;
  private String flashPlayerPath;

  public ASLiveCodingRunConfiguration(String moduleName, String customFile, boolean useCustomFile) {
    super(moduleName);
    this.useCustomFile = useCustomFile;
    this.customFile = customFile;
  }

  @Override
  public LiveCodingTarget getLiveCodingTarget() {
    return LiveCodingTarget.SWF;
  }

  public LauncherType getLauncherType() {
    return LauncherType.byIndex(launcherType);
  }

  public void setLauncherType(LauncherType launcherType) {
    this.launcherType = launcherType.ordinal();
  }

  public String getFlashPlayerPath() {
    return flashPlayerPath;
  }

  public void setFlashPlayerPath(String flashPlayerPath) {
    this.flashPlayerPath = flashPlayerPath;
  }

  public boolean isUseCustomFile() {
    return useCustomFile;
  }

  public void setUseCustomFile(boolean useCustomFile) {
    this.useCustomFile = useCustomFile;
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

  public void setCustomFile(String customFile) {
    this.customFile = customFile;
  }

}
