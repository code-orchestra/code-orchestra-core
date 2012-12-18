package codeOrchestra.actionscript.socket.command;

import codeOrchestra.actionscript.logging.model.LoggerMessageEncoder;
import codeOrchestra.actionscript.logging.transport.LoggerServerSocketThread;
import codeOrchestra.actionscript.socket.FlashClientSocketHandler;
import jetbrains.mps.logging.Logger;

import java.net.Socket;

/**
 * @author Alexander Eliseyev
 */
public class TraceBasedCommandExecutor extends FlashClientSocketHandler {

  private static Logger LOG = Logger.getLogger(TraceBasedCommandExecutor.class);

  public TraceBasedCommandExecutor(Socket clientSocket) {
    super(clientSocket, "*", String.valueOf(LoggerServerSocketThread.LOGGING_PORT));
  }

  @Override
  protected void handleMessage(String str) {
    boolean handled;
    try {
      handled = TraceCommandManager.getInstance().handleMessage(LoggerMessageEncoder.encode(str), this);
    } catch (Throwable t) {
      LOG.error("Error while handling trace message: " + str, t);
      return;
    }

    if (!handled) {
      LOG.error("No trace handler for command: " + str);
    }
  }

}
