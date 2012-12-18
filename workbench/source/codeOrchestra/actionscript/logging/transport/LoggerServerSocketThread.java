package codeOrchestra.actionscript.logging.transport;

import codeOrchestra.actionscript.logging.settings.LoggingSettings;
import codeOrchestra.actionscript.socket.ServerSocketThread;

/**
 * @author Alexander Eliseyev
 */
public class LoggerServerSocketThread extends ServerSocketThread {

  public static final int LOGGING_PORT = 6125;

  public LoggerServerSocketThread() {
    super(LOGGING_PORT, LoggerClientSocketHandlerFactory.getInstance());
  }

  protected boolean allowMultipleConnections() {
    return LoggingSettings.getInstance().isAllowMultipleLoggers();
  }
}
