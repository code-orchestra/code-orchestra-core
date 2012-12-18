package codeOrchestra.rgs.logging;

import codeOrchestra.rgs.IRemoteGenerationCallback;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.logging.ILoggingHandler;
import jetbrains.mps.logging.LogEntry;

import static codeOrchestra.rgs.logging.Severity.*;

import java.io.File;
import java.rmi.RemoteException;

/**
 * @author Alexander Eliseyev
 */
public class RemoteLoggingHandlerAdapter implements ILoggingHandler {

  private IRemoteGenerationCallback myRemoteGenerationCallback;

  public RemoteLoggingHandlerAdapter(IRemoteGenerationCallback remoteGenerationCallback) {
    myRemoteGenerationCallback = remoteGenerationCallback;
  }

  @Override
  public void info(LogEntry e) {
    handle(INFO, e);
  }

  @Override
  public void warning(LogEntry e) {
    handle(WARNING, e);
  }

  @Override
  public void debug(LogEntry e) {
    handle(DEBUG, e);
  }

  @Override
  public void error(LogEntry e) {
    handle(ERROR, e);
  }

  @Override
  public void fatal(LogEntry e) {
    handle(FATAL, e);
  }

  private void handle(Severity severity, LogEntry logEntry) {
    try {
      String message = logEntry.getMessage();

      String projectPath = new File(ProjectHolder.getProject().getBaseDir().getPath()).getPath();
      if (message != null && message.contains(projectPath)) {
        logEntry.setMessage(message.replace(projectPath, ""));
      }

      myRemoteGenerationCallback.handleMessage(SerializableLogEntry.fromLogEntry(severity, logEntry));
    } catch (RemoteException e) {
      // ignore
    }
  }

}
