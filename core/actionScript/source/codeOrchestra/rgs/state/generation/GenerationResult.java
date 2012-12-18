package codeOrchestra.rgs.state.generation;

import codeOrchestra.actionscript.modulemaker.CompilationResult;

import java.io.Serializable;

/**
 * @author Alexander Eliseyev
 */
public class GenerationResult implements Serializable {

  private CompilationResult compilationResult;
  private boolean successful;

  public GenerationResult(boolean successful) {
    this.successful = successful;
  }

  public GenerationResult() {
  }

  public boolean isSuccessful() {
    return successful;
  }

  public void setSuccessful(boolean successful) {
    this.successful = successful;
  }

  public CompilationResult getCompilationResult() {
    return compilationResult;
  }

  public void setCompilationResult(CompilationResult compilationResult) {
    this.compilationResult = compilationResult;
  }
}
