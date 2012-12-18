package codeOrchestra.actionscript.logging.model;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.NameUtil;
import org.apache.log4j.Level;

import java.util.List;
import java.util.ArrayList;

/**
 * @author Alexander Eliseyev
 */
public class LoggerMessage {

  private Level severity;
  private String message;
  private List<LoggerScopeWrapper> scopes = new ArrayList<LoggerScopeWrapper>();
  private SNodePointer nodePointer;
  private String rootFQName;
  private long timestamp;
  private String command;
  private String stackTrace;

  private LoggerMessage(Builder builder) {
    this.message = builder.message;
    this.nodePointer = builder.nodePointer;
    this.severity = builder.severity;
    this.scopes = builder.scopes;
    this.rootFQName = builder.rootFQName;
    this.timestamp = builder.timestamp;
    this.command = builder.command;
    this.stackTrace = builder.stackTrace;
  }

  public boolean hasStackTrace() {
    return stackTrace != null;
  }

  public String getStackTrace() {
    return stackTrace;
  }

  public long getTimestamp() {
    return timestamp;
  }

  public List<LoggerScopeWrapper> getScopes() {
    return scopes;
  }

  public String getRootSimpleName() {
    if (rootFQName != null) {
      return NameUtil.shortNameFromLongName(rootFQName);
    }

    return ModelAccess.instance().runReadAction(new Computable<String>() {
      public String compute() {
        try {
          return getNodePointer().getNode().getTopmostAncestor().getName();
        } catch (Throwable t) {
          return null;
        }
      }
    });
  }

  public String getMessage() {
    return message;
  }

  public SNodePointer getNodePointer() {
    return nodePointer;
  }

  public Level getSeverity() {
    return severity;
  }

  public String getCommand() {
    return command;
  }

  // Freakish builder pattern!
  public static class Builder {
    private Level severity;
    private String message;
    private List<LoggerScopeWrapper> scopes = new ArrayList<LoggerScopeWrapper>();
    private SNodePointer nodePointer;
    private String rootFQName;
    private long timestamp;
    public String command;
    private String stackTrace;

    public Builder() {
    }

    public Builder command(String command) {
      this.command = command;
      return this;
    }
    public Builder stackTrace(String stackTrace) {
      this.stackTrace = stackTrace;
      return this;
    }
    public Builder timestamp(long timestamp) {
      this.timestamp = timestamp;
      return this;
    }
    public Builder severity(Level severity) {
      this.severity = severity;
      return this;
    }
    public Builder message(String message) {
      this.message = message;
      return this;
    }
    public Builder scopes(List<LoggerScopeWrapper> scopes) {
      this.scopes = scopes;
      return this;
    }
    public Builder nodePointer(SNodePointer nodePointer) {
      this.nodePointer = nodePointer;
      return this;
    }
    public Builder rootFQName(String rootFQName) {
      this.rootFQName = rootFQName;
      return this;
    }
    public LoggerMessage build() {
      return new LoggerMessage(this);
    }
  }

}
