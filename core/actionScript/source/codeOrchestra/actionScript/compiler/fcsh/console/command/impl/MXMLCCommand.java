package codeOrchestra.actionScript.compiler.fcsh.console.command.impl;

import codeOrchestra.actionScript.compiler.fcsh.FCSHManager;

import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class MXMLCCommand extends AbstractCompileWithArgumentsCommandCallback {

  public MXMLCCommand(FCSHManager fcshManager, List<String> arguments) {
    super(fcshManager, arguments);
  }

  @Override
  protected String getExecutableName() {
    return "mxmlc";
  }

}
