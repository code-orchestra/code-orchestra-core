package codeOrchestra.air.descriptor;

/**
 * @author Alexander Eliseyev
 */
public class AirInitialWindowSettings {

  public static final int DEFAULT_WIDTH = 400;
  public static final int DEFAULT_HEIGHT = 300;

  private String content;
  private String title;
  private boolean visible;
  private int width = DEFAULT_WIDTH;
  private int height = DEFAULT_HEIGHT;

  AirInitialWindowSettings(String content, String title, boolean visible, int width, int height) {
    this.content = content;
    this.title = title;
    this.visible = visible;

    if (width != -1) {
      this.width = width;
    }

    if (height != -1) {
      this.height = height;
    }
  }

  public String getContent() {
    return content;
  }

  public String getTitle() {
    return title;
  }

  public boolean isVisible() {
    return visible;
  }

  public int getWidth() {
    return width;
  }

  public int getHeight() {
    return height;
  }
}
