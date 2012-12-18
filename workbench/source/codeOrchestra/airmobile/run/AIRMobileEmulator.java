package codeOrchestra.airmobile.run;

/**
 * @author Alexander Eliseyev
 */
public enum AIRMobileEmulator {

  CUSTOM("Custom"),
  GENERIC_720x480("720x480", 720, 480, "480"),
  GENERIC_1280x720("1280x720", 1280, 720, "720"),
  GENERIC_1920x1080("1920x1080", 1920, 1080, "1080"),
  APPLE_IPAD("Apple iPad", 768, 1004, 768, 1024, "iPad"),
  APPLE_IPHONE("Apple iPhone", 320, 460, 320, 480, "iPhone"),
  APPLE_IPHONE_RETINA("Apple iPhone Retina", 640, 920, 640, 960, "iPhoneRetina"),
  GOOGLE_NEXUS_ONE("Google Nexus One", 480, 762, 480, 800, "NexusOne"),
  MOTOROLA_DROID("Motorola Droid", 480, 816, 480, 854, "Droid"),
  SAMSUNG_GALAXY_S("Samsung Galaxy S", 480, 762, 780, 800, "SamsungGalaxyS"),
  SAMSUNG_GALAXY_TAB("Samsung Galaxy Tab", 600, 986, 600, 1024, "SamsungGalaxyTab"),
  FQWVGA("FQWVGA", 240, 432),
  FWVGA("FWVGA", 480, 854),
  HVGA("HVGA", 320, 480),
  QVGA("QVGA", 240, 320),
  WQVGA("WQVGA", 240, 400),
  WVGA("WVGA", 480, 800);

  private String displayName;
  private String airId;

  private int screenWidth;
  private int screenHeight;

  private int fullScreenWidth;
  private int fullScreenHeight;

  private AIRMobileEmulator(String name) {
    this(name, -1, -1, null);
  }

  private AIRMobileEmulator(String name, int screenWidth, int screenHeight) {
    this(name, screenWidth, screenHeight, screenWidth, screenHeight, name);
  }

  private AIRMobileEmulator(String name, int screenWidth, int screenHeight, String airId) {
    this(name, screenWidth, screenHeight, screenWidth, screenHeight, airId);
  }

  private AIRMobileEmulator(String displayName, int screenWidth, int screenHeight, int fullScreenWidth, int fullScreenHeight, String airId) {
    this.displayName = displayName;
    this.airId = airId;
    this.screenWidth = screenWidth;
    this.screenHeight = screenHeight;
    this.fullScreenWidth = fullScreenWidth;
    this.fullScreenHeight = fullScreenHeight;
  }

  public String getAIRInternalEmulatorId() {
    return airId;
  }

  public boolean hasCustomResolution() {
    return screenWidth == -1 || screenHeight == -1;
  }

  public int getFullScreenWidth() {
    return fullScreenWidth;
  }

  public int getFullScreenHeight() {
    return fullScreenHeight;
  }

  public int getScreenWidth() {
    return screenWidth;
  }

  public int getScreenHeight() {
    return screenHeight;
  }

  public static AIRMobileEmulator fromId(String emulatorId) {
    for (AIRMobileEmulator airMobileEmulator : AIRMobileEmulator.values()) {
      if (airMobileEmulator.name().equals(emulatorId)) {
        return airMobileEmulator;
      }
    }
    return null;
  }

  @Override
  public String toString() {
    return displayName;
  }
}
