package codeOrchestra.rgs;

/**
 * @author Alexander Eliseyev
 */
public class RGSException extends Exception {

  public RGSException() {
  }

  public RGSException(String s) {
    super(s);
  }

  public RGSException(String s, Throwable throwable) {
    super(s, throwable);
  }

  public RGSException(Throwable throwable) {
    super(throwable);
  }
}
