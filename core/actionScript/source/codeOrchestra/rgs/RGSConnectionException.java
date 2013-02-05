package codeOrchestra.rgs;

/**
 * @author Alexander Eliseyev
 */
public class RGSConnectionException extends RGSException {

  public RGSConnectionException() {
  }

  public RGSConnectionException(String s) {
    super(s);
  }

  public RGSConnectionException(String s, Throwable throwable) {
    super(s, throwable);
  }

  public RGSConnectionException(Throwable throwable) {
    super(throwable);
  }

  @Override
  public boolean isConnectionProblem() {
    return true;
  }
}
