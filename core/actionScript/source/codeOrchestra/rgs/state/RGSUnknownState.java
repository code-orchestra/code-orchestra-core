package codeOrchestra.rgs.state;

/**
 * @author Alexander Eliseyev
 */
public class RGSUnknownState implements RGSState {

  private Throwable myThrowable;

  public RGSUnknownState(Throwable throwable) {
    myThrowable = throwable;
  }

  public RGSUnknownState() {
  }

  public Throwable getThrowable() {
    return myThrowable;
  }

  @Override
  public String getPresentation() {
    return "Unknown";
  }
}
