package codeOrchestra.actionScript.compiler.fcsh.console.command.impl;

import codeOrchestra.actionScript.compiler.fcsh.FCSHManager;
import codeOrchestra.actionScript.compiler.fcsh.console.command.CommandOutput;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.liveCoding.LiveCodingSession;
import codeOrchestra.actionscript.modulemaker.CompilationResult;
import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractCompileWithArgumentsCommandCallback extends AbstractCompileCommandCallback implements CompileCommandCallback {

  public static final String  ASSIGNED_TOKEN = " Assigned ";

  private FCSHManager fcshManager;
  private List<String> arguments;

  public AbstractCompileWithArgumentsCommandCallback(FCSHManager fcshManager, List<String> arguments) {
    this.fcshManager = fcshManager;
    this.arguments = arguments;
  }

  @Override
  public String getCommand() {
    return getExecutableName() + " " + (isBenchmarkEnabled() ? "-benchmark=true " : "") + getArgumentsSeparated();
  }

  private boolean isBenchmarkEnabled() {
    return LiveCodingManager.instance().getCurrentSession() == null;
  }

  private String getArgumentsSeparated() {
    return StringUtils.join(arguments, " ");
  }

  protected CompilationResult compile(CommandOutput response) {
    String normalOutput = response.getNormalOutput();
    Integer targetId = null;

    // Parse the compiler target
    String[] responseLines = StringUtils.split(normalOutput, '\n');
    for (String responseLine : responseLines) {
      if (responseLine.contains(ASSIGNED_TOKEN)) {
        String temp = responseLine.substring(responseLine.indexOf(ASSIGNED_TOKEN) + ASSIGNED_TOKEN.length());
        String numberStr = temp.substring(0, temp.indexOf(" "));

        targetId = Integer.parseInt(numberStr);
        break;
      }
    }
    if (targetId == null) {
      throw new RuntimeException("Can't retrieve the compile target ID assigned from the output:\n" + normalOutput);
    }

    // Get the compilation result
    CompilationResult compilationResult = getCompilationResult(response);

    // Register the compiler target if the compilation went ok
    if (compilationResult.isOk()) {
      fcshManager.registerCompileTarget(arguments, targetId);
    }

    return compilationResult;
  }

}

