package codeOrchestra.actionscript.socket.command;

import codeOrchestra.actionscript.logging.model.LoggerMessage;
import codeOrchestra.actionscript.socket.ClientSocketHandler;

/**
 * @author Alexander Eliseyev
 */
public interface TraceCommand {

  boolean isApplicable(LoggerMessage message);
  void execute(LoggerMessage message, ClientSocketHandler clientSocketHandler);

}
