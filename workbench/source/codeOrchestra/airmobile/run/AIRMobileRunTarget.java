package codeOrchestra.airmobile.run;

/**
 * @author Alexander Eliseyev
 */
public enum AIRMobileRunTarget {

  /**
   * ADL with emulator options
   */
  EMULATOR,

  /**
   * Probably an Android device
   */
  DEVICE;

  public static AIRMobileRunTarget byIndex(int index) {
    for (AIRMobileRunTarget target : values()) {
      if (target.ordinal() == index) {
        return target;
      }
    }
    throw new IllegalArgumentException();
  }

}
