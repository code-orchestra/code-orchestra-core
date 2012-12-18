package codeOrchestra.ios.jna.mobileDevice;

/**
 * @author Alexander Eliseyev
 */
public enum FileOpenMode {

  UNKNOWN(0),
  READ(2),
  WRITE(3);

  private FileOpenMode(long nativeValue) {
    this.nativeValue = nativeValue;
  }

  private long nativeValue;

  public long getNativeValue() {
    return nativeValue;
  }
}
