package codeOrchestra.actionscript.run.configuration;

/**
 * @author Alexander Eliseyev
 */
public enum LauncherType {
  
  DEFAULT,
  FLASH_PLAYER,
  WEB_ADDRESS;
  
  public static LauncherType byIndex(int index) {
    for (LauncherType launcherType : values()) {
      if (launcherType.ordinal() == index) {
        return launcherType;
      }
    }
    throw new IllegalArgumentException();
  }
  
}
