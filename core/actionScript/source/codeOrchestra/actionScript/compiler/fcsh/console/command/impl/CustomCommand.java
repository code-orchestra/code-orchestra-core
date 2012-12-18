package codeOrchestra.actionScript.compiler.fcsh.console.command.impl;

import codeOrchestra.actionScript.compiler.fcsh.console.command.AbstractCommandCallback;
import codeOrchestra.actionScript.compiler.fcsh.console.command.CommandOutput;

/**
 * @author Alexander Eliseyev
 */
public class CustomCommand extends AbstractCommandCallback {

  private String command;

  public CustomCommand(String command) {
    this.command = command;
  }

  @Override
  public String getCommand() {
    return command;
  }

  @Override
  public void done(CommandOutput response) {
    System.out.println("STDOUT: " + response.getNormalOutput());
    System.out.println("STDERR: " + response.getErrorOutput());
  }

  @Override
  public boolean isSynchronous() {
    return true;

  }
}
