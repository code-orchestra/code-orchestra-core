package codeOrchestra.javaScript.debugger.vm;

/**
 * @author Alexander Eliseyev
 */
public class VmConnectException extends Exception {

  private boolean shouldRetry;

  public VmConnectException(String s) {
    super(s);
  }

  public VmConnectException(String s, boolean shouldRetry) {
    super(s);
    this.shouldRetry = shouldRetry;
  }

  public boolean shouldRetry() {
    return shouldRetry;
  }
}
