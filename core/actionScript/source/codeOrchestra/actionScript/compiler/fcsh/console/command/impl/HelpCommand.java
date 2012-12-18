package codeOrchestra.actionScript.compiler.fcsh.console.command.impl;

import codeOrchestra.actionScript.compiler.fcsh.console.command.AbstractCommandCallback;
import codeOrchestra.actionScript.compiler.fcsh.console.command.CommandOutput;

/**
 * @author Alexander Eliseyev
 */
public class HelpCommand extends AbstractCommandCallback {

  @Override
  public void done(CommandOutput output) {
    // do nothing, the text is displayed in the console anyway
  }

  @Override
  public boolean isSynchronous() {
    return false;
  }

  @Override
  public String getCommand() {
    return "help";
  }
}
