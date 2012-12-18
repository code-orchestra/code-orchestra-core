package codeOrchestra.actionscript.socket;

import codeOrchestra.actionscript.logging.settings.LoggingSettings;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * @author Alexander Eliseyev
 */
public abstract class ServerSocketThread extends Thread {

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
        Socket clientSocket = serverSocket.accept();

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
      // Just ignore it, you'll be fine
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

    if (serverSocket != null && !serverSocket.isClosed()) {
      try {
        serverSocket.close();
      } catch (IOException e) {
        throw new RuntimeException("Error while attempting to close a server socket", e);
      }
    }
  }

}
