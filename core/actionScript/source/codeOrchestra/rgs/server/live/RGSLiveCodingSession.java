package codeOrchestra.rgs.server.live;

import codeOrchestra.actionscript.liveCoding.LiveCodingSession;
import codeOrchestra.actionscript.liveCoding.run.LiveCodingSessionImpl;
import codeOrchestra.actionscript.socket.SocketWriter;
import jetbrains.mps.project.structure.modules.ModuleReference;

/**
 * @author Alexander Eliseyev
 */
public class RGSLiveCodingSession extends LiveCodingSessionImpl implements LiveCodingSession {

  public RGSLiveCodingSession(ModuleReference moduleReference, String sessionId, long startTimestamp) {
    super(sessionId, moduleReference, startTimestamp, null, null);
  }

  @Override
  public SocketWriter getSocketWriter() {
    throw new UnsupportedOperationException();
  }

  @Override
  public boolean isProxy() {
    return true;
  }

}
