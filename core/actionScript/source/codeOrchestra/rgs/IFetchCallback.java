package codeOrchestra.rgs;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * @author Alexander Eliseyev
 */
public interface IFetchCallback extends Remote {

  void onFetch(String filename) throws RemoteException;

}
