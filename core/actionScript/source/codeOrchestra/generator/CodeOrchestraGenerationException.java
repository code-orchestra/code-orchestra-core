package codeOrchestra.generator;

/**
 * @author Alexander Eliseyev
 */
public class CodeOrchestraGenerationException extends Exception {
  public CodeOrchestraGenerationException() {
    super();
  }

  public CodeOrchestraGenerationException(String s) {
    super(s);
  }

  public CodeOrchestraGenerationException(String s, Throwable throwable) {
    super(s, throwable);
  }

  public CodeOrchestraGenerationException(Throwable throwable) {
    super(throwable);
  }
}
