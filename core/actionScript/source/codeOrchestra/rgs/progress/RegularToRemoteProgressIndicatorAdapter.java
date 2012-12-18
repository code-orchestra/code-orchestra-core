package codeOrchestra.rgs.progress;

import com.intellij.openapi.progress.ProcessCanceledException;
import com.intellij.openapi.progress.ProgressIndicator;

import java.rmi.RemoteException;

/**
 * @author Alexander Eliseyev
 */
public class RegularToRemoteProgressIndicatorAdapter implements IRemoteProgressIndicator {

  private ProgressIndicator progressIndicator;

  public RegularToRemoteProgressIndicatorAdapter(ProgressIndicator progressIndicator) {
    this.progressIndicator = progressIndicator;
  }

  @Override
  public void start() throws RemoteException {
    progressIndicator.start();
  }

  @Override
  public void stop() throws RemoteException {
    progressIndicator.stop();
  }

  @Override
  public boolean isRunning() throws RemoteException {
    return progressIndicator.isRunning();
  }

  @Override
  public void cancel() throws RemoteException {
    progressIndicator.cancel();
  }

  @Override
  public boolean isCanceled() throws RemoteException {
    return progressIndicator.isCanceled();
  }

  @Override
  public void setText(String text) throws RemoteException {
    progressIndicator.setText(text);
  }

  @Override
  public String getText() throws RemoteException {
    return progressIndicator.getText();
  }

  @Override
  public void setText2(String text) throws RemoteException {
    progressIndicator.setText2(text);
  }

  @Override
  public String getText2() throws RemoteException {
    return progressIndicator.getText2();
  }

  @Override
  public double getFraction() throws RemoteException {
    return progressIndicator.getFraction();
  }

  @Override
  public void setFraction(double fraction) throws RemoteException {
    progressIndicator.setFraction(fraction);
  }

  @Override
  public void pushState() throws RemoteException {
    progressIndicator.pushState();
  }

  @Override
  public void popState() throws RemoteException {
    progressIndicator.popState();
  }

  @Override
  public void startNonCancelableSection() throws RemoteException {
    progressIndicator.startNonCancelableSection();
  }

  @Override
  public void finishNonCancelableSection() throws RemoteException {
    progressIndicator.finishNonCancelableSection();
  }

  @Override
  public boolean isModal() throws RemoteException {
    return progressIndicator.isModal();
  }

  @Override
  public boolean isIndeterminate() throws RemoteException {
    return progressIndicator.isIndeterminate();
  }

  @Override
  public void setIndeterminate(boolean indeterminate) throws RemoteException {
    progressIndicator.setIndeterminate(indeterminate);
  }

  @Override
  public void checkCanceled() throws ProcessCanceledException, RemoteException {
    progressIndicator.checkCanceled();
  }
}
