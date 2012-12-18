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
    LiveCodingManager.instance().startSession(message.getMessage(), clientSocketHandler);
  }
}
