package codeOrchestra.rgs;

import codeOrchestra.rgs.client.appimpl.ApplicationRGSClient;

import java.io.EOFException;
import java.io.IOException;
import java.rmi.ConnectException;
import java.rmi.RemoteException;

/**
 * @author Alexander Eliseyev
 */
public class RGSException extends Exception {

  public RGSException() {
  }

  public RGSException(String s) {
    super(s);
  }

  public RGSException(String s, Throwable throwable) {
    super(s, throwable);
  }

  public RGSException(Throwable throwable) {
    super(throwable);
  }

  public boolean isConnectionProblem() {
    if (getCause() instanceof RemoteException) {
      RemoteException remoteException = (RemoteException) getCause();
      if (remoteException instanceof ConnectException || remoteException.getCause() instanceof EOFException) {
        return true;
      }
    }

    if (getCause() instanceof IOException) {
      IOException ioException = (IOException) getCause();
      String ioExceptionMessage = ioException.getMessage();
      if ("inputstream is closed".equals(ioExceptionMessage) || "error".equals(ioExceptionMessage)) {
        return true;
      }
    }

    return false;
  }

}
