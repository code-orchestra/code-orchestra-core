package codeOrchestra.actionscript.socket;

import codeOrchestra.utils.ExceptionUtils;
import jetbrains.mps.logging.Logger;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;

/**
 * @author Alexander Eliseyev
 */
public abstract class ServerSocketThread extends Thread {

  private final static Logger LOG = Logger.getLogger(ServerSocketThread.class);

  private int port;
  private ClientSocketHandlerFactory handlerFactory;
  private ServerSocket serverSocket;
  private boolean socketOpen;

  public ServerSocketThread(int port, ClientSocketHandlerFactory handlerFactory) {
    assert handlerFactory != null;
    this.handlerFactory = handlerFactory;
    this.port = port;
  }

  public final void run() {
    try {
      serverSocket = new ServerSocket(port);
      ClientSocketHandler lastHandler = null;

      while (!serverSocket.isClosed()) {
        // Wait to accept a new connection
        Socket clientSocket = null;
        try {
          clientSocket = serverSocket.accept();
        } catch (SocketException e) {
          if (ExceptionUtils.isSocketClosed(e)) {
            return;
          }
          LOG.warning("Couldn't accept a socket", e);
          continue;
        }

        // Close the previous socket if the multiple logging clients are disabled
        if (!allowMultipleConnections() && lastHandler != null) {
          try {
            lastHandler.close();
          } catch (IOException e) {
            // Ignore it
          }
        }

        // Run the client socker handler thread
        new Thread(lastHandler = handlerFactory.createHandler(clientSocket)).start();
      }
    } catch (IOException e) {
      LOG.error("Can't open logging server socket", e);
    }
  }

  public synchronized boolean isSocketOpen() {
    return socketOpen;
  }

  protected abstract boolean allowMultipleConnections();

  public synchronized void openSocket() {
    if (socketOpen) {
      throw new IllegalStateException("Socket is open");
    }

    socketOpen = true;

    start();
  }

  public synchronized void closeSocket() {
    if (!socketOpen) {
      throw new IllegalStateException("Socket is closed");
    }

    socketOpen = false;

    if (serverSocket != null) {
      try {
        serverSocket.close();
      } catch (IOException e) {
        // throw new RuntimeException("Error while attempting to close a server socket", e);
      }
    }
  }

}
