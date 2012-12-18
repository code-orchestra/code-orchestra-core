package codeOrchestra.rgs.state;

/**
 * @author Alexander Eliseyev
 */
public class RGSErrorState implements RGSState {

  private String errorMessage;
  private Throwable throwable;

  public String getErrorMessage() {
    return errorMessage;
  }

  public void setErrorMessage(String errorMessage) {
    this.errorMessage = errorMessage;
  }

  public Throwable getThrowable() {
    return throwable;
  }

  public void setThrowable(Throwable throwable) {
    this.throwable = throwable;
  }

  @Override
  public String getPresentation() {
    if (throwable == null) {
      return "Error";
    } else {
      return "Error: " + throwable.getMessage();
    }
  }

  @Override
  public String toString() {
    return "RGSErrorState: " +
      "errorMessage='" + errorMessage + '\'' +
      ", throwable=" + throwable;
  }
}
