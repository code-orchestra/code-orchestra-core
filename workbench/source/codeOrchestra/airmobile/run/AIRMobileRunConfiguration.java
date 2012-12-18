package codeOrchestra.airmobile.run;

import codeOrchestra.air.run.configuration.AIRRunConfiguration;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class AIRMobileRunConfiguration extends AIRRunConfiguration {

  private int runTarget = AIRMobileRunTarget.EMULATOR.ordinal();

  private int screenWidth;
  private int screenHeight;
  private int fullScreenWidth;
  private int fullScreenHeight;

  private String emulatorId;

  public AIRMobileRunConfiguration(String moduleName, String launcherOptions, String programParameters, String descriptorPath, String rootDirectory, int runTarget, String emulatorId) {
    super(moduleName, launcherOptions, programParameters, descriptorPath, rootDirectory);
    this.runTarget = runTarget;
    if (emulatorId != null) {
      this.emulatorId = emulatorId;
    } else {
      this.emulatorId = AIRMobileEmulator.GENERIC_720x480.name();
    }
  }

  public AIRMobileEmulator getEmulator() {
    return AIRMobileEmulator.fromId(emulatorId);
  }

  public void setEmulator(@NotNull AIRMobileEmulator emulator) {
    this.emulatorId = emulator.name();
  }

  public AIRMobileRunTarget getRunTarget() {
    return AIRMobileRunTarget.byIndex(runTarget);
  }

  public void setRunTarget(AIRMobileRunTarget runTarget) {
    this.runTarget = runTarget.ordinal();
  }

  public void setScreenWidth(int screenWidth) {
    this.screenWidth = screenWidth;
  }

  public void setScreenHeight(int screenHeight) {
    this.screenHeight = screenHeight;
  }

  public void setFullScreenWidth(int fullScreenWidth) {
    this.fullScreenWidth = fullScreenWidth;
  }

  public void setFullScreenHeight(int fullScreenHeight) {
    this.fullScreenHeight = fullScreenHeight;
  }

  public int getScreenWidth() {
    return screenWidth;
  }

  public int getScreenHeight() {
    return screenHeight;
  }

  public int getFullScreenWidth() {
    return fullScreenWidth;
  }

  public int getFullScreenHeight() {
    return fullScreenHeight;
  }


}
