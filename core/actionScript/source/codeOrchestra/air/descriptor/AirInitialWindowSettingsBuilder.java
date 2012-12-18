package codeOrchestra.air.descriptor;

public class AirInitialWindowSettingsBuilder {
  private String myContent;
  private String myTitle;
  private boolean myVisible;
  private int myWidth;
  private int myHeight;

  public AirInitialWindowSettingsBuilder setContent(String content) {
    myContent = content;
    return this;
  }

  public AirInitialWindowSettingsBuilder setTitle(String title) {
    myTitle = title;
    return this;
  }

  public AirInitialWindowSettingsBuilder setVisible(boolean visible) {
    myVisible = visible;
    return this;
  }

  public AirInitialWindowSettingsBuilder setWidth(int width) {
    myWidth = width;
    return this;
  }

  public AirInitialWindowSettingsBuilder setHeight(int height) {
    myHeight = height;
    return this;
  }

  public AirInitialWindowSettings createAirInitialWindowSettings() {
    return new AirInitialWindowSettings(myContent, myTitle, myVisible, myWidth, myHeight);
  }
}