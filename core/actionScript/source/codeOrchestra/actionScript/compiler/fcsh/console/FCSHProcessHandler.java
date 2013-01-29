package codeOrchestra.actionScript.compiler.fcsh.console;

import codeOrchestra.utils.ExceptionUtils;
import com.intellij.execution.process.*;
import com.intellij.execution.ui.ConsoleView;
import com.intellij.execution.ui.ConsoleViewContentType;
import com.intellij.openapi.util.Key;
import codeOrchestra.actionScript.compiler.fcsh.console.command.AbstractCommandCallback;
import jetbrains.mps.logging.Logger;

import java.io.IOException;
import java.io.OutputStreamWriter;

/**
 * @author Alexander Eliseyev
 */
public class FCSHProcessHandler extends OSProcessHandler {
  private static final Logger LOG = Logger.getLogger(FCSHProcessHandler.class);

  private ConsoleView myConsoleView;
  public OutputStreamWriter myOutputStreamWriter;

  private boolean initialized;

  public FCSHProcessHandler(ConsoleView console, Process process, String params) {
    super(process, params);
    this.myConsoleView = console;

    this.addProcessListener(new ProcessAdapter() {
      public void onTextAvailable(ProcessEvent event, Key k) {
        String text = event.getText();
        if (!initialized && text != null && text.contains(AbstractCommandCallback.FCSH_COMMAND_PROMPT)) {
          initialized = true;
        }
        append(text, k);
      }
    });
    ProcessTerminatedListener.attach(this);
  }

  public boolean isInitialized() {
    return initialized;
  }

  private void append(String s, Key k) {
    if (ProcessOutputTypes.STDERR.equals(k)) {
      this.myConsoleView.print(s, ConsoleViewContentType.ERROR_OUTPUT);
    } else if (ProcessOutputTypes.SYSTEM.equals(k)) {
      this.myConsoleView.print(s, ConsoleViewContentType.SYSTEM_OUTPUT);
    } else if (ProcessOutputTypes.STDOUT.equals(k)) {
      this.myConsoleView.print(s, ConsoleViewContentType.NORMAL_OUTPUT);
    }
  }

  public void input(String s) {
    try {
      getProcessInputWriter().append(s);
    } catch (IOException ex) {
      LOG.error(ex);
    }
  }

  public boolean inputWithFlush(String s) {
    try {
      getProcessInputWriter().append(s);
      getProcessInputWriter().flush();

      this.myConsoleView.print("> " + s, ConsoleViewContentType.NORMAL_OUTPUT);
      return true;
    } catch (IOException ex) {
      if (ExceptionUtils.isBrokenPipe(ex)) {
        return false;
      } else {
        LOG.error(ex);
        return true;
      }
    }
  }

  private OutputStreamWriter getProcessInputWriter() {
    if (myOutputStreamWriter == null) {
      myOutputStreamWriter = new OutputStreamWriter(getProcessInput());
    }
    return myOutputStreamWriter;
  }

  public void flush() {
    try {
      getProcessInputWriter().flush();
    } catch (IOException ex) {
      LOG.error(ex);
    }
  }
}
