package codeOrchestra.flex.processors;

/**
 * @author Anton.I.Neverov
 */
public class SNodeProcessorException extends Exception {

  public SNodeProcessorException() {
  }

  public SNodeProcessorException(String message) {
    super(message);
  }

  public SNodeProcessorException(String message, Throwable cause) {
    super(message, cause);
  }

  public SNodeProcessorException(Throwable cause) {
    super(cause);
  }

}
