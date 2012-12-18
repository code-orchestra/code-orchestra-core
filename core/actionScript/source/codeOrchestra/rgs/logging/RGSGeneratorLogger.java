package codeOrchestra.rgs.logging;

import codeOrchestra.rgs.IRemoteGenerationCallback;
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.smodel.SNode;

import java.rmi.RemoteException;

import static codeOrchestra.rgs.logging.Severity.*;

/**
 * @author Alexander Eliseyev
 */
public class RGSGeneratorLogger implements IGeneratorLogger {

  private IRemoteGenerationCallback myRemoteGenerationCallback;

  public RGSGeneratorLogger(IRemoteGenerationCallback remoteGenerationCallback) {
    myRemoteGenerationCallback = remoteGenerationCallback;
  }

  @Override
  public void handleException(Throwable t) {
    try {
      myRemoteGenerationCallback.handleException(t);
    } catch (RemoteException e) {
      // ignore
    }
  }

  @Override
  public boolean needsInfo() {
    return true;
  }

  private void handle(Severity severity, String message) {
    try {
      myRemoteGenerationCallback.handleMessage(SerializableLogEntry.fromString(severity, message));
    } catch (RemoteException e) {
      // ignore
    }
  }

  @Override
  public boolean needsWarnings() {
    return true;
  }

  @Override
  public void info(String message) {
    handle(INFO, message);
  }

  @Override
  public void warning(String message) {
    handle(WARNING, message);
  }

  @Override
  public void error(String message) {
    handle(ERROR, message);
  }

  @Override
  public void info(SNode node, String message) {
    info(message);
  }

  @Override
  public void warning(SNode node, String message, ProblemDescription... descriptions) {
    warning(message);
  }

  @Override
  public void error(SNode node, String message, ProblemDescription... descriptions) {
    error(message);
  }

}
