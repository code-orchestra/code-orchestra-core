package codeOrchestra.actionScript.compiler.fcsh;

import com.intellij.execution.ui.ConsoleView;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionScript.compiler.fcsh.console.FCSHConsoleTool;
import codeOrchestra.actionScript.compiler.fcsh.console.FCSHProcessHandler;
import codeOrchestra.actionScript.compiler.fcsh.console.command.CommandCallback;
import codeOrchestra.actionScript.compiler.fcsh.console.command.FCSHCommandExecuteThread;
import codeOrchestra.actionScript.compiler.fcsh.console.command.FCSHCommandRunnable;
import codeOrchestra.actionScript.compiler.fcsh.console.command.impl.*;
import codeOrchestra.actionScript.compiler.fcsh.target.CompilerTarget;
import codeOrchestra.actionscript.modulemaker.CompilationResult;
import codeOrchestra.actionscript.view.ASMessageMarker;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class FCSHManager implements ProjectComponent {

  public static final Logger LOG = Logger.getLogger("fcsh");

  private static final int FCSH_INIT_CHECK_INTERVAL = 100;
  public static final long FCSH_INIT_TIMEOUT = 3000;

  private Project project;
  private FCSHProcessHandler fcshProcessHandler;
  private Map<List<String>, CompilerTarget> compilerTargets = Collections.synchronizedMap(new HashMap<List<String>, CompilerTarget>());
  private boolean livecodingMode;

  public FCSHManager(Project project) {
    this.project = project;
  }

  public void restart() throws FCSHException {
    destroyProcess();
    assureFCSHIsActive();
  }

  public void destroyProcess() {
    try {
      if (fcshProcessHandler != null && !fcshProcessHandler.isProcessTerminated()) {
        fcshProcessHandler.destroyProcess();
      }
    } catch (Throwable t) {
      // ignore
    }
  }

  private void assureFCSHIsActive() throws FCSHException {
    if (fcshProcessHandler != null && !fcshProcessHandler.isProcessTerminated()) {
      // No need to reactivate, the process is still running
      return;
    }

    clearTargets();

    FCSHLauncher fcshLauncher = new FCSHLauncher(livecodingMode);
    ProcessBuilder processBuilder = fcshLauncher.createProcessBuilder();
    Process fcshProcess;
    try {
      fcshProcess = processBuilder.start();
    } catch (IOException e) {
      throw new FCSHException("Error while trying to start the fcsh process", e);
    }

    fcshProcessHandler = new FCSHProcessHandler(getConsoleView(), fcshProcess, fcshLauncher.getCommandString());
    fcshProcessHandler.startNotify();

    getConsoleTool().makeAvailableLater();

    // Give fcsh some time to start up
    long timeout = FCSH_INIT_TIMEOUT;
    while (!fcshProcessHandler.isInitialized()) {
      if (timeout < 0) {
        return;
      }

      try {
        Thread.sleep(FCSH_INIT_CHECK_INTERVAL);
        timeout -= FCSH_INIT_CHECK_INTERVAL;
      } catch (InterruptedException e) {
        // ignore
      }
    }
  }

  public void clearTargets() {
    this.compilerTargets.clear();
  }

  public void submitCommand(CommandCallback commandCallback) throws FCSHException {
    assureFCSHIsActive();

    FCSHCommandRunnable fcshCommandRunnable = new FCSHCommandRunnable(this, commandCallback);
    if (commandCallback.isSynchronous()) {
      fcshCommandRunnable.run();
    } else {
      new FCSHCommandExecuteThread(fcshCommandRunnable).start();
    }
  }

  public CompilerTarget registerCompileTarget(List<String> arguments, int id) {
    synchronized (compilerTargets) {
      CompilerTarget compilerTarget = compilerTargets.get(arguments);
      if (compilerTarget == null) {
        compilerTarget = new CompilerTarget(id);
        compilerTargets.put(arguments, compilerTarget);
      }

      return compilerTarget;
    }
  }

  public void displayHelp() throws FCSHException {
    assureFCSHIsActive();
    submitCommand(new HelpCommand());
  }

  public CompilationResult mxmlc(List<String> arguments) throws FCSHException {
    assureFCSHIsActive();

    synchronized (compilerTargets) {
      CompilerTarget compilerTarget = compilerTargets.get(arguments);
      if (compilerTarget != null) {
        return compile(compilerTarget);
      }
    }

    MXMLCCommand mxmlcCommand = new MXMLCCommand(this, arguments);
    LOG.infoWithMarker("Compiling: " + mxmlcCommand.getCommand(), ASMessageMarker.MARKER);

    submitCommand(mxmlcCommand);

    return mxmlcCommand.getCompileResult();
  }

  public CompilationResult compile(CompilerTarget target) throws FCSHException {
    assureFCSHIsActive();

    CompileTargetCommand compileCommand = new CompileTargetCommand(this, target);
    LOG.infoWithMarker("Compiling the target #" + target.getId(), ASMessageMarker.MARKER);

    submitCommand(compileCommand);

    return compileCommand.getCompileResult();
  }

  public CompilationResult compc(List<String> arguments) throws FCSHException {
    assureFCSHIsActive();

    synchronized (compilerTargets) {
      CompilerTarget compilerTarget = compilerTargets.get(arguments);
      if (compilerTarget != null) {
        return compile(compilerTarget);
      }
    }

    COMPCCommand compcCommand = new COMPCCommand(this, arguments);
    LOG.infoWithMarker("Compiling: " + compcCommand.getCommand(), ASMessageMarker.MARKER);

    submitCommand(compcCommand);

    return compcCommand.getCompileResult();
  }

  public void clear() throws FCSHException {
    if (livecodingMode) {
      // FCSH in livecoding mode clears itself after every compilation
      clearTargets();
      return;
    }

    assureFCSHIsActive();

    ClearCommand clearCommand = new ClearCommand();
    submitCommand(clearCommand);

    clearTargets();
  }

  public void customInput(String input) throws FCSHException {
    assureFCSHIsActive();
    submitCommand(new CustomCommand(input));
  }

  public FCSHProcessHandler getProcessHandler() {
    return fcshProcessHandler;
  }

  private ConsoleView getConsoleView() {
    return getConsoleTool().getConsoleView();
  }

  private FCSHConsoleTool getConsoleTool() {
    return project.getComponent(FCSHConsoleTool.class);
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Flex Compiler Shell Component";
  }

  @Override
  public void projectClosed() {
    if (fcshProcessHandler != null) {
      fcshProcessHandler.destroyProcess();
    }
  }

  @Override
  public void disposeComponent() {
    this.fcshProcessHandler = null;
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void initComponent() {
  }

  public void setLivecodingMode(boolean livecodingMode) {
    this.livecodingMode = livecodingMode;
  }
}
