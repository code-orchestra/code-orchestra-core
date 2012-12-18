package codeOrchestra.rgs.logging;

import codeOrchestra.rgs.state.model.RemoteNodeId;
import codeOrchestra.rgs.state.model.navigate.RelativePathFileWithPosition;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.ide.messages.FileWithLogicalPosition;
import jetbrains.mps.logging.LogEntry;
import jetbrains.mps.smodel.SNodePointer;

import java.io.Serializable;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class SerializableLogEntry implements Serializable {

  public static final String RGS = "RGS";

  public static SerializableLogEntry fromString(Severity severity, String message) {
    SerializableLogEntry serializableLogEntry = new SerializableLogEntry();
    serializableLogEntry.severity = severity;
    serializableLogEntry.message = message;
    serializableLogEntry.sourceClass = RGS;
    return serializableLogEntry;
  }

  public static SerializableLogEntry fromLogEntry(Severity severity, LogEntry logEntry) {
    SerializableLogEntry serializableLogEntry = new SerializableLogEntry();

    serializableLogEntry.severity = severity;
    serializableLogEntry.message = logEntry.getMessage();
    serializableLogEntry.sourceClass = RGS + (logEntry.getSourceClass() == null ? "" : ":" + logEntry.getSourceClass());
    serializableLogEntry.throwable = logEntry.getThrowable();
    serializableLogEntry.hintObject = convertHintObject(logEntry.getHintObject());
    serializableLogEntry.scopeIds = logEntry.getScopeIds();
    serializableLogEntry.nodeId = logEntry.getNodeId();
    serializableLogEntry.timestamp = logEntry.getTimestamp();
    serializableLogEntry.marker = logEntry.getMarker();

    return serializableLogEntry;
  }

  private static Serializable convertHintObject(Object hintObject) {
    if (hintObject instanceof FileWithLogicalPosition) {
      return RelativePathFileWithPosition.fromFileWithLogicalPosition((FileWithLogicalPosition) hintObject, ProjectHolder.getProject());
    } else if (hintObject instanceof SNodePointer) {
      return RemoteNodeId.fromNodePointer((SNodePointer) hintObject);
    }

    return null;
  }

  private Severity severity;

  private String message;
  private String sourceClass;
  private Throwable throwable;
  private Serializable hintObject;

  private List<String> scopeIds;
  private String nodeId;
  private long timestamp;
  private String marker;

  public Severity getSeverity() {
    return severity;
  }

  public LogEntry toLogEntry() {
    LogEntry logEntry = new LogEntry(sourceClass, message, throwable, hintObject, scopeIds, nodeId, timestamp);
    logEntry.setMarker(marker);
    return logEntry;
  }

}
