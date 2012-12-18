package codeOrchestra.actionScript.license;

/**
 * @author Alexander Eliseyev
 */
public final class VersionHelper {

  private static final String VERSION_CODE_NAME = "R1.0.0";

  public static final boolean IS_RELEASE_VERSION = false;

  private VersionHelper() {
  }

  public static String getVersionCodeName() {
    if (IS_RELEASE_VERSION) {
      return VERSION_CODE_NAME;
    }
    return VERSION_CODE_NAME + "b" + getBuildNumber();
  }

  private static String getBuildNumber() {
    return System.getProperty("codeOrchestra.build.number");
  }

}
