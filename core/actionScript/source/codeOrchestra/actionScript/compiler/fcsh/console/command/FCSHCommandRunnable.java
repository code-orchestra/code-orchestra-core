package codeOrchestra.actionScript.compiler.fcsh.console.command;

import codeOrchestra.actionScript.compiler.fcsh.FCSHManager;
import codeOrchestra.actionScript.compiler.fcsh.console.FCSHProcessHandler;
import codeOrchestra.actionscript.view.ASMessageMarker;
import codeOrchestra.utils.ThreadUtils;
import com.intellij.execution.process.ProcessAdapter;
import com.intellij.execution.process.ProcessEvent;
import com.intellij.execution.process.ProcessListener;
import com.intellij.execution.process.ProcessOutputTypes;
import com.intellij.openapi.util.Key;

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
            commandOutput.addOutput(outputType, event.getText());
            commandCallback.textAvailable(event.getText(), outputType);
          }
        };

        fcshProcessHandler.addProcessListener(processListener);

        // RF-1246
        if (!fcshProcessHandler.inputWithFlush(commandCallback.getCommand() + '\n')) {
          // FCSH was down, got to restart
          fcshManager.restart();
          fcshManager.submitCommand(commandCallback);
          return;
        }

        int timeout = COMMAND_EXECUTE_TIMEOUT;
        while (true) {
          // Sleep a bit
          ThreadUtils.sleep(TEXT_RECIEVE_SLEEP_TIMEOUT);
          if (commandCallback.isDone()) {
            break;
          }

          timeout -= TEXT_RECIEVE_SLEEP_TIMEOUT;
          if (timeout <= 0) {
            FCSHManager.LOG.errorWithMarker("Command execute timed out: " + commandCallback.getCommand(), ASMessageMarker.MARKER);
            FCSHManager.LOG.error(ProcessOutputTypes.STDOUT + ": " + commandOutput.getNormalOutput());
            FCSHManager.LOG.error(ProcessOutputTypes.STDERR + ": " + commandOutput.getErrorOutput());
            fcshManager.destroyProcess();
            return;
          }
        }

        // In case we've missed some output
        ThreadUtils.sleep(TEXT_RECIEVE_SLEEP_TIMEOUT);

        commandCallback.done(commandOutput);
        fcshProcessHandler.removeProcessListener(processListener);
      } catch (Throwable t) {
        commandCallback.failed(t);
      }
    }
  }

}
