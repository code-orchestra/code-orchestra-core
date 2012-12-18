package codeOrchestra.actionscript.logging.transport;

import codeOrchestra.actionscript.socket.ClientSocketHandler;
import codeOrchestra.actionscript.socket.ClientSocketHandlerFactory;
import codeOrchestra.actionscript.socket.command.TraceBasedCommandExecutor;

import java.net.Socket;

/**
 * @author Alexander Eliseyev
 */
public final class LoggerClientSocketHandlerFactory implements ClientSocketHandlerFactory {

  private final static ClientSocketHandlerFactory INSTANCE = new LoggerClientSocketHandlerFactory();

  public static ClientSocketHandlerFactory getInstance() {
    return INSTANCE;
  }

  private LoggerClientSocketHandlerFactory() {
  }

  public ClientSocketHandler createHandler(Socket socket) {
    return new TraceBasedCommandExecutor(socket);
  }
}
