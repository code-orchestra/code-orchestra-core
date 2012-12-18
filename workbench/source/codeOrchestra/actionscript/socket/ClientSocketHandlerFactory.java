package codeOrchestra.actionscript.socket;

import java.io.IOException;
import java.net.Socket;

/**
 * @author Alexander Eliseyev
 */
public interface ClientSocketHandlerFactory {

  ClientSocketHandler createHandler(Socket socket);

}
