package codeOrchestra.actionscript.socket.command;

import codeOrchestra.actionscript.logging.model.LoggerMessage;
import codeOrchestra.actionscript.socket.ClientSocketHandler;
import codeOrchestra.actionscript.socket.command.impl.LiveCodingSessionStartTraceCommand;
import codeOrchestra.actionscript.socket.command.impl.LoggerTraceCommand;
import codeOrchestra.actionscript.socket.command.impl.NavigateTraceCommand;
import codeOrchestra.actionscript.socket.command.impl.PongTraceCommand;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public final class TraceCommandManager {

  private static TraceCommandManager instance;
  public synchronized static TraceCommandManager getInstance() {
    if (instance == null) {
      instance = new TraceCommandManager();
    }
    return instance;
  }

  private List<TraceCommand> commands = new ArrayList<TraceCommand>();

  private TraceCommandManager() {
    addCommand(new LoggerTraceCommand());
    addCommand(new NavigateTraceCommand());
    addCommand(new LiveCodingSessionStartTraceCommand());
    addCommand(PongTraceCommand.getInstance());
  }

  public void addCommand(TraceCommand command) {
    commands.add(command);
  }

  /**
   * @return whether the message was handled by a command
   */
  public boolean handleMessage(LoggerMessage message, ClientSocketHandler clientSocketHandler) {
    for (TraceCommand command : commands) {
      if (command.isApplicable(message)) {
        command.execute(message, clientSocketHandler);
        return true;
      }
    }
    return false;
  }

}
