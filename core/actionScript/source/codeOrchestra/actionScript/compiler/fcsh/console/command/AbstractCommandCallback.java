package codeOrchestra.actionScript.compiler.fcsh.console.command;

import com.intellij.openapi.util.Key;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractCommandCallback implements CommandCallback {

  public static final String FCSH_COMMAND_PROMPT = "(fcsh)";
  public static final String DOUBLE_FCSH_COMMAND_PROMPT = "(fcsh) (fcsh)";

  private boolean done;

  private boolean failed;
  private Throwable failCause;

  @Override
  public final void textAvailable(String response, Key key) {
    response = response.trim();
    if (response.equals(FCSH_COMMAND_PROMPT) || response.equals(DOUBLE_FCSH_COMMAND_PROMPT)) {
      this.done = true;
    }
  }

  @Override
  public boolean isDone() {
    return done;
  }

  protected boolean hasFailed() {
    return failed;
  }

  protected Throwable getFailCause() {
    return failCause;
  }

  @Override
  public void failed(Throwable t) {
    this.done = true;
    this.failed = true;
    this.failCause = t;
  }

}
