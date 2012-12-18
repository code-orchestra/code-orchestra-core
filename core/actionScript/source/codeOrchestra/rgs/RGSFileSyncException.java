package codeOrchestra.rgs;

/**
 * @author Alexander Eliseyev
 */
public class RGSFileSyncException extends RGSException {

  private boolean connectionError;

  public RGSFileSyncException(String s, Throwable throwable, boolean connectionError) {
    super(s, throwable);
    this.connectionError = connectionError;
  }

  public boolean isConnectionError() {
    return connectionError;
  }

}
