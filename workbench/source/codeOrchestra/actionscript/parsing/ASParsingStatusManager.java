package codeOrchestra.actionscript.parsing;

/**
 * @author Alexander Eliseyev
 */
public final class ASParsingStatusManager {

  private static final ASParsingStatusManager instance = new ASParsingStatusManager();

  private final int WAIT_MILLIS = 100;

  public static ASParsingStatusManager getInstance() {
    return instance;
  }

  private Object monitor = new Object();
  private ASParsingState state = ASParsingState.STOPPED;

  private ASParsingStatusManager() {
  }

  public ASParsingState getState() {
    synchronized (monitor) {
      return state;
    }
  }

  public void setState(ASParsingState state) {
    synchronized (monitor) {
      this.state = state;
    }
  }

  public void waitForState(ASParsingState state) throws InterruptedException {
    while (true) {
      synchronized (monitor) {
        if (this.state == state) {
          break;
        }
      }
      Thread.sleep(WAIT_MILLIS);
    }
  }

}
