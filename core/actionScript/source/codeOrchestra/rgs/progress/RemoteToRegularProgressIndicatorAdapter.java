package codeOrchestra.rgs.progress;

import com.intellij.openapi.application.ModalityState;
import com.intellij.openapi.progress.ProcessCanceledException;
import com.intellij.openapi.progress.ProgressIndicator;
import org.jetbrains.annotations.NotNull;

import java.rmi.RemoteException;

/**
 * @author Alexander Eliseyev
 */
public class RemoteToRegularProgressIndicatorAdapter implements ProgressIndicator {

  private IRemoteProgressIndicator remoteProgressIndicator;

  private String text;
  private String text2;
  private double fraction;
  private boolean cancelled;

  private int state;

  public RemoteToRegularProgressIndicatorAdapter(IRemoteProgressIndicator remoteProgressIndicator) {
    this.remoteProgressIndicator = remoteProgressIndicator;
  }

  @Override
  public void start() {
    try {
      remoteProgressIndicator.start();
    } catch (RemoteException re) {
    }
  }

  @Override
  public void stop() {
    try {
      remoteProgressIndicator.stop();
    } catch (RemoteException re) {
    }
  }

  @Override
  public boolean isRunning() {
    try {
      return remoteProgressIndicator.isRunning();
    } catch (RemoteException re) {
      return false;
    }
  }

  @Override
  public void cancel() {
    try {
      this.cancelled = true;
      this.remoteProgressIndicator.cancel();
    } catch (RemoteException re) {
    }
  }

  @Override
  public boolean isCanceled() {
    return this.cancelled;
  }

  @Override
  public void setText(String text) {
    if (!isOn()) {
      return;
    }

    try {
      this.text = text;
      this.remoteProgressIndicator.setText(text);
    } catch (RemoteException re) {
    }
  }

  @Override
  public String getText() {
    return this.text;
  }

  @Override
  public void setText2(String text2) {
    if (!isOn()) {
      return;
    }

    try {
      this.text2 = text2;
      this.remoteProgressIndicator.setText2(text2);
    } catch (RemoteException re) {
    }
  }

  @Override
  public String getText2() {
    return this.text2;
  }

  @Override
  public double getFraction() {
    return this.fraction;
  }

  @Override
  public void setFraction(double fraction) {
    if (!isOn()) {
      return;
    }

    try {
      this.fraction = fraction;
      this.remoteProgressIndicator.setFraction(fraction);
    } catch (RemoteException re) {
    }
  }

  @Override
  public void pushState() {
    state++;
    try {
      remoteProgressIndicator.pushState();
    } catch (RemoteException re) {
    }
  }

  @Override
  public void popState() {
    state--;
    try {
      remoteProgressIndicator.popState();
    } catch (RemoteException re) {
    }
  }

  public boolean isOn() {
    return state > 0;
  }

  @Override
  public void startNonCancelableSection() {
    try {
      remoteProgressIndicator.startNonCancelableSection();
    } catch (RemoteException re) {
    }
  }

  @Override
  public void finishNonCancelableSection() {
    try {
      remoteProgressIndicator.finishNonCancelableSection();
    } catch (RemoteException re) {
    }
  }

  @Override
  public boolean isModal() {
    try {
      return remoteProgressIndicator.isModal();
    } catch (RemoteException re) {
      return false;
    }
  }

  @Override
  public boolean isIndeterminate() {
    try {
      return remoteProgressIndicator.isIndeterminate();
    } catch (RemoteException re) {
      return false;
    }
  }

  @Override
  public void setIndeterminate(boolean indeterminate) {
    try {
      remoteProgressIndicator.setIndeterminate(indeterminate);
    } catch (RemoteException re) {
    }
  }

  @Override
  public void checkCanceled() throws ProcessCanceledException {
    try {
      remoteProgressIndicator.checkCanceled();
    } catch (RemoteException re) {
    }
  }

  @NotNull
  @Override
  public ModalityState getModalityState() {
    return ModalityState.NON_MODAL;
  }

  @Override
  public void setModalityProgress(ProgressIndicator modalityProgress) {
    // do nothing
  }
}
