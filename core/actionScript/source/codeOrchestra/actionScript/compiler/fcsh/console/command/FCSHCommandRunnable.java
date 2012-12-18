package codeOrchestra.actionScript.compiler.fcsh.console.command;

import com.intellij.execution.process.ProcessAdapter;
import com.intellij.execution.process.ProcessEvent;
import com.intellij.execution.process.ProcessListener;
import com.intellij.openapi.util.Key;
import codeOrchestra.actionScript.compiler.fcsh.FCSHManager;
import codeOrchestra.actionScript.compiler.fcsh.console.FCSHProcessHandler;
import codeOrchestra.actionscript.view.ASMessageMarker;

/**
 * @author Alexander Eliseyev
 */
public class FCSHCommandRunnable implements Runnable  {

  private static final int TEXT_RECIEVE_SLEEP_TIMEOUT = 50;
  private static final int COMMAND_EXECUTE_TIMEOUT = 30000;

  private FCSHManager fcshManager;
  private CommandCallback commandCallback;

  public FCSHCommandRunnable(FCSHManager fcshManager, CommandCallback commandCallback) {
    this.fcshManager = fcshManager;
    this.commandCallback = commandCallback;
  }

  @Override
  public final void run() {
    synchronized (FCSHCommandExecuteThread.class) {
      try {
        FCSHProcessHandler fcshProcessHandler = fcshManager.getProcessHandler();

        final CommandOutput commandOutput = new CommandOutput();
        ProcessListener processListener = new ProcessAdapter() {
          public void onTextAvailable(ProcessEvent event, Key outputType) {
            commandCallback.textAvailable(event.getText(), outputType);
            commandOutput.addOutput(outputType, event.getText());
          }
        };

        fcshProcessHandler.addProcessListener(processListener);
        fcshProcessHandler.inputWithFlush(commandCallback.getCommand() + '\n');

        int timeout = COMMAND_EXECUTE_TIMEOUT;
        while (true) {
          // Sleep a bit
          try { Thread.sleep(TEXT_RECIEVE_SLEEP_TIMEOUT); } catch (InterruptedException e) {}
          if (commandCallback.isDone()) {
            break;
          }

          timeout -= TEXT_RECIEVE_SLEEP_TIMEOUT;
          if (timeout <= 0) {
            FCSHManager.LOG.errorWithMarker("Command execute timed out: " + commandCallback.getCommand(), ASMessageMarker.MARKER);
            FCSHManager.LOG.error("STDOUT: " + commandOutput.getNormalOutput());
            FCSHManager.LOG.error("STDERR: " + commandOutput.getErrorOutput());
            fcshManager.destroyProcess();
            return;
          }
        }

        commandCallback.done(commandOutput);
        fcshProcessHandler.removeProcessListener(processListener);
      } catch (Throwable t) {
        commandCallback.failed(t);
      }
    }
  }

}
