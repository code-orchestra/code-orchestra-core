package codeOrchestra.actionscript.liveCoding.listener;

import codeOrchestra.actionscript.liveCoding.LiveCodingSession;

/**
 * @author Alexander Eliseyev
 */
public interface LiveCodingListener {
  void onSessionStart(LiveCodingSession session);
  void onSessionEnd(LiveCodingSession session);
  void onSessionPause();
  void onSessionResume();
}
