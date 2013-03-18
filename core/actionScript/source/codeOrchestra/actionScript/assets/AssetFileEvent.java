package codeOrchestra.actionScript.assets;

import codeOrchestra.actionScript.assets.util.AssetEventType;

/**
 * @author Alexander Eliseyev
 */
public class AssetFileEvent {

  private String absolutePath;
  private String relativePath;
  private AssetEventType eventType;

  public AssetFileEvent(String absolutePath, String relativePath, AssetEventType eventType) {
    this.absolutePath = absolutePath;
    this.relativePath = relativePath;
    this.eventType = eventType;
  }

  public String getAbsolutePath() {
    return absolutePath;
  }

  public String getRelativePath() {
    return relativePath;
  }

  public AssetEventType getEventType() {
    return eventType;
  }

}
