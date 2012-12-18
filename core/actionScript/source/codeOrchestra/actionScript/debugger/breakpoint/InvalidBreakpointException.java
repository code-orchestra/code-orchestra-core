package codeOrchestra.actionScript.debugger.breakpoint;

/**
 * @author Alexander Eliseyev
 */
public class InvalidBreakpointException extends Exception {
  public InvalidBreakpointException() {
  }

  public InvalidBreakpointException(String s) {
    super(s);
  }

  public InvalidBreakpointException(String s, Throwable throwable) {
    super(s, throwable);
  }

  public InvalidBreakpointException(Throwable throwable) {
    super(throwable);
  }
}
