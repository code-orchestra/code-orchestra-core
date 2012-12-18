package codeOrchestra.rgs.client.facade;

import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.IRemoteGenerationCallback;
import codeOrchestra.rgs.logging.SerializableLogEntry;
import codeOrchestra.rgs.logging.Severity;
import codeOrchestra.rgs.state.model.GenerateInput;
import jetbrains.mps.logging.LogEntry;
import jetbrains.mps.logging.Logger;

import java.rmi.RemoteException;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractGenerationCallback implements IRemoteGenerationCallback {

  private String lastMessage;
  private GenerateInput generateInput;

  protected AbstractGenerationCallback(GenerateInput generateInput) {
    this.generateInput = generateInput;
  }

  @Override
  public void handleMessage(SerializableLogEntry serializableLogEntry) throws RemoteException {
    Severity severity = serializableLogEntry.getSeverity();
    LogEntry logEntry = serializableLogEntry.toLogEntry();

    if (generateInput.getBuildProvider() == BuildProvider.LIVE_CODING_INCREMENTAL) {
      if (severity == Severity.INFO) {
        return;
      }
      logEntry.setMarker(null);
    }

    this.lastMessage = logEntry.getMessage();

    switch (severity) {
      case INFO:
        Logger.info(logEntry);
        break;
      case ERROR:
        Logger.error(logEntry);
        break;
      case WARNING:
        Logger.warning(logEntry);
        break;
      case FATAL:
        Logger.fatal(logEntry);
      default:
        Logger.info(logEntry);
    }
  }

  public String getLastMessage() {
    return lastMessage;
  }
}
