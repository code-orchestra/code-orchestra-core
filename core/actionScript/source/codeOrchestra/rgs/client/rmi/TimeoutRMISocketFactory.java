package codeOrchestra.rgs.client.rmi;

public class TimeoutRMISocketFactory implements java.rmi.server.RMIClientSocketFactory, java.io.Serializable {

  private int timeout;

  public TimeoutRMISocketFactory(int timeout) {
    this.timeout = timeout;
  }

  public java.net.Socket createSocket(String host, int port) throws java.io.IOException {
    java.net.Socket socket = new java.net.Socket(host, port);
    socket.setSoTimeout(timeout);
    return socket;
  }

}