package codeOrchestra.actionscript.modulemaker;

/**
 * @author Alexander Eliseyev
 */
public class CompilerOutput {

  public static final CompilerOutput NORMAL_OUTPUT = new CompilerOutput(0, null);

  private String output;
  private int errorsCount;

  public CompilerOutput(int errorsCount, String output) {
    this.errorsCount = errorsCount;
    this.output = output;
  }

  public int getErrorsCount() {
    return errorsCount;
  }

  public void setErrorsCount(int errorsCount) {
    this.errorsCount = errorsCount;
  }

  public String getOutput() {
    return output;
  }

  public void setOutput(String output) {
    this.output = output;
  }

}