package flash.css;

/**
 * @author Alexander Eliseyev
 */
public class LoggerDumbImpl implements Logger {

  public void logError(String message) {
    System.out.println("error: " + message);
  }

  public void logError(String cssPath, int i, String localizedMessage) {
    System.out.println("error: " + cssPath + ", at line " + i + " -> " + localizedMessage);
  }

  public void logWarning(String mxmlPath, int lineNumber, String userFriendlyErrror) {
    System.out.println("error: " + mxmlPath + ", at line " + lineNumber + " -> " + userFriendlyErrror);
  }

}
