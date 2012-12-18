package codeOrchestra.actionscript.socket.command.impl;

import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.logging.model.LoggerMessage;
import codeOrchestra.actionscript.logging.model.LoggerMessageEncoder;
import codeOrchestra.actionscript.logging.model.LoggerScopeWrapper;
import codeOrchestra.actionscript.logging.scope.MessageScopeRegistry;
import codeOrchestra.actionscript.socket.ClientSocketHandler;
import codeOrchestra.actionscript.socket.command.TraceCommand;
import codeOrchestra.actionscript.view.ASMessageMarker;
import codeOrchestra.logging.SNodeWithStackTrace;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import org.apache.log4j.Level;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class LoggerTraceCommand implements TraceCommand {

  @Override
  public boolean isApplicable(LoggerMessage message) {
    return LoggerMessageEncoder.isLegitSeverityLevel(message.getCommand());
  }

  @Override
  public void execute(final LoggerMessage loggerMessage, ClientSocketHandler clientSocketHandler) {
    Object hintObject = null;

    // Hint object
    if (loggerMessage.hasStackTrace()) {
      hintObject = new SNodeWithStackTrace(loggerMessage.getNodePointer(), loggerMessage.getStackTrace());
    } else {
      hintObject = ModelAccess.instance().runReadAction(new Computable<SNode>() {
        public SNode compute() {
          SNodePointer nodePointer = loggerMessage.getNodePointer();
          if (nodePointer == null) {
            return null;
          }
          return nodePointer.getNode();
        }
      });
    }

    // Get the logger by the root name
    String rootSimpleName = loggerMessage.getRootSimpleName();
    Logger asLogger = Logger.getLogger(rootSimpleName != null ? rootSimpleName : "trace");

    // Severity
    Level severity = loggerMessage.getSeverity();

    // Scopes
    List<String> scopeIds = null;
    if (!loggerMessage.getScopes().isEmpty()) {
      scopeIds = new ArrayList<String>();
      for (LoggerScopeWrapper scopeWrapper : loggerMessage.getScopes()) {
        MessageScopeRegistry.getInstance().addOrUpdateScope(scopeWrapper.getId(), scopeWrapper.getName());

        scopeIds.add(scopeWrapper.getId());
      }
    }

    // NodeId
    String nodeId = null;
    if (hintObject != null) {
      nodeId = loggerMessage.getNodePointer().getNodeId().toString();
    }

    // Timestamp
    long timestamp = loggerMessage.getTimestamp();

    if (severity == Level.INFO || severity == Level.DEBUG) {
      asLogger.info(loggerMessage.getMessage(), null, hintObject, scopeIds, nodeId, timestamp, ASMessageMarker.MARKER);
    } else if (severity == Level.WARN) {
      asLogger.warning(loggerMessage.getMessage(), null, hintObject, scopeIds, nodeId, timestamp, ASMessageMarker.MARKER);
    } else if (severity == Level.ERROR || severity == Level.FATAL) {
      asLogger.error(loggerMessage.getMessage(), null, hintObject, scopeIds, nodeId, timestamp, ASMessageMarker.MARKER);
    }
  }

}
