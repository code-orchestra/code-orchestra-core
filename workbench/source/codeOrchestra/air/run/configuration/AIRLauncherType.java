package codeOrchestra.air.run.configuration;

/**
 * @author Alexander Eliseyev
 */
public enum AIRLauncherType {

  /**
   * Default module output (generate the descriptor)
   */
  DEFAULT_MODULE_OUTPUT,

  /**
   * Custom external descriptor
   */
  CUSTOM_APPLICATION_DESCRIPTOR,

  /**
   * Existing APK package file
   */
  EXISTING_APK_PACKAGE;

  public static AIRLauncherType byIndex(int index) {
    for (AIRLauncherType launcherType : values()) {
      if (launcherType.ordinal() == index) {
        return launcherType;
      }
    }
    throw new IllegalArgumentException();
  }

}
