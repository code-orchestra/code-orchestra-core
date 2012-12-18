package codeOrchestra.actionscript.liveCoding.run;

import codeOrchestra.actionscript.liveCoding.LiveCodingSession;
import codeOrchestra.actionscript.liveCoding.run.config.ILiveCodingRunConfiguration;
import codeOrchestra.actionscript.socket.SocketWriter;
import jetbrains.mps.project.structure.modules.ModuleReference;

/**
 * @author Alexander Eliseyev
 */
public class LiveCodingSessionImpl implements LiveCodingSession {

  private ModuleReference moduleReference;
  private long startTimestamp;
  private SocketWriter socketWriter;
  private ILiveCodingRunConfiguration liveCodingRunConfiguration;
  private String sessionId;

  public LiveCodingSessionImpl(String sessionId, ModuleReference moduleReference, long startTimestamp, SocketWriter socketWriter, ILiveCodingRunConfiguration liveCodingRunConfiguration) {
    this.sessionId = sessionId;
    this.moduleReference = moduleReference;
    this.startTimestamp = startTimestamp;
    this.socketWriter = socketWriter;
    this.liveCodingRunConfiguration = liveCodingRunConfiguration;
  }

  public ILiveCodingRunConfiguration getLiveCodingRunConfiguration() {
    return liveCodingRunConfiguration;
  }

  public ModuleReference getRootModuleReference() {
    return moduleReference;
  }

  @Override
  public boolean isProxy() {
    return false;
  }

  public SocketWriter getSocketWriter() {
    return socketWriter;
  }

  @Override
  public long getStartTimestamp() {
    return startTimestamp;
  }

  public String getSessionId() {
    return sessionId;
  }
}
