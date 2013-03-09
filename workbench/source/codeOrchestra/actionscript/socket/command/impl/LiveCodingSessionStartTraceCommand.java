package codeOrchestra.actionscript.socket.command.impl;

import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.logging.model.LoggerMessage;
import codeOrchestra.actionscript.socket.ClientSocketHandler;
import codeOrchestra.actionscript.socket.command.TraceCommand;

/**
 * @author Alexander Eliseyev
 */
public class LiveCodingSessionStartTraceCommand implements TraceCommand {

  private static final String START_SESSION_COMMAND = "start-live-coding-session";

  @Override
  public boolean isApplicable(LoggerMessage message) {
    return START_SESSION_COMMAND.equals(message.getCommand());
  }

  @Override
  public void execute(LoggerMessage message, ClientSocketHandler clientSocketHandler) {
    LiveCodingManager liveCodingManager = LiveCodingManager.instance();

    // RF-1307 - we do this check in case no project is open, but a live-coding-compiled swf is run
    if (liveCodingManager != null) {
      liveCodingManager.startSession(message.getMessage(), clientSocketHandler);
    }
  }
}
