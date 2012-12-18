package codeOrchestra.actionscript.liveCoding;

import codeOrchestra.actionscript.liveCoding.run.config.ILiveCodingRunConfiguration;
import codeOrchestra.actionscript.socket.SocketWriter;
import jetbrains.mps.project.structure.modules.ModuleReference;

/**
 * @author Alexander Eliseyev
 */
public interface LiveCodingSession {
  String getSessionId();
  long getStartTimestamp();
  SocketWriter getSocketWriter();
  ModuleReference getRootModuleReference();
  boolean isProxy();
  ILiveCodingRunConfiguration getLiveCodingRunConfiguration();
}
