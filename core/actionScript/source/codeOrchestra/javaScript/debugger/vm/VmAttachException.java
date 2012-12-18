package codeOrchestra.javaScript.debugger.vm;

/**
 * @author Alexander Eliseyev
 */
public class VmAttachException extends Exception {

  public VmAttachException() {
  }

  public VmAttachException(String s) {
    super(s);
  }

  public VmAttachException(String s, Throwable throwable) {
    super(s, throwable);
  }

  public VmAttachException(Throwable throwable) {
    super(throwable);
  }
}
