package codeOrchestra.air;

/**
 * @author Alexander Eliseyev
 */
public class AirRunException extends Exception {

  public AirRunException() {
  }

  public AirRunException(String s) {
    super(s);
  }

  public AirRunException(String s, Throwable throwable) {
    super(s, throwable);
  }

  public AirRunException(Throwable throwable) {
    super(throwable);
  }
}
