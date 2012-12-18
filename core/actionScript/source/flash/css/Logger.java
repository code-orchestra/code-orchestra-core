package flash.css;

/**
 * @author Alexander Eliseyev
 */
public interface Logger {

  public void logError(String message);

  public void logError(String cssPath, int i, String localizedMessage);

  public void logWarning(String mxmlPath, int lineNumber, String userFriendlyErrror);

}
