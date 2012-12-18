package codeOrchestra.rgs.progress;

import com.intellij.openapi.application.ModalityState;
import com.intellij.openapi.progress.ProcessCanceledException;
import com.intellij.openapi.progress.ProgressIndicator;
import org.jetbrains.annotations.NotNull;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * @author Alexander Eliseyev
 */
public interface IRemoteProgressIndicator extends Remote {

  void start() throws RemoteException;

  void stop() throws RemoteException;

  boolean isRunning() throws RemoteException;

  void cancel() throws RemoteException;

  boolean isCanceled() throws RemoteException;

  void setText(String text) throws RemoteException;

  String getText() throws RemoteException;

  void setText2(String text) throws RemoteException;

  String getText2() throws RemoteException;

  double getFraction() throws RemoteException;

  void setFraction(double fraction) throws RemoteException;

  void pushState() throws RemoteException;

  void popState() throws RemoteException;

  void startNonCancelableSection() throws RemoteException;

  void finishNonCancelableSection() throws RemoteException;

  boolean isModal() throws RemoteException;

  boolean isIndeterminate() throws RemoteException;

  void setIndeterminate(boolean indeterminate) throws RemoteException;

  void checkCanceled() throws ProcessCanceledException, RemoteException;

}
