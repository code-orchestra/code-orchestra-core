package codeOrchestra.rgs;

import codeOrchestra.rgs.logging.SerializableLogEntry;
import codeOrchestra.rgs.logging.Severity;
import codeOrchestra.rgs.progress.IRemoteProgressIndicator;
import codeOrchestra.rgs.state.generation.GenerationResult;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * @author Alexander Eliseyev
 */
public interface IRemoteGenerationCallback extends Remote {

  void onFinish(GenerationResult result) throws RemoteException;

  void handleMessage(SerializableLogEntry serializableLogEntry) throws RemoteException;

  void handleException(Throwable t) throws RemoteException;

}
