package codeOrchestra.ios;

/**
 * @author Alexander Eliseyev
 */
public class iOSException extends Exception {

  private static final int UNKNOWN_DEVICE_ID = -1;

  private int returnValue;

  private int deviceId = UNKNOWN_DEVICE_ID;

  public iOSException(String s, int deviceId, int returnValue) {
    super(s + ", returnValue=" + returnValue + (deviceId == UNKNOWN_DEVICE_ID ? "" : ", deviceId=" + deviceId));
    this.returnValue = returnValue;
  }

  public iOSException(String s, int returnValue) {
    this(s, UNKNOWN_DEVICE_ID, returnValue);
  }

  public iOSException(String s, Throwable throwable) {
    super(s, throwable);
  }

  public iOSException(Throwable throwable) {
    super(throwable);
  }

  public int getReturnValue() {
    return returnValue;
  }

  public int getDeviceId() {
    return deviceId;
  }

}
