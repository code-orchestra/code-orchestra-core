package codeOrchestra.actionScript.debugger.suspending;

import codeOrchestra.actionScript.debugger.events.ASSuspendEvent;
import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import flash.tools.debugger.NotConnectedException;
import jetbrains.mps.logging.Logger;

public abstract class ASTriableSuspendContext extends ASSuspendContext {

  private static final Logger LOG = Logger.getLogger(ASTriableSuspendContext.class);

  protected ASTriableSuspendContext(FDBEventsProcessor eventsProcessor, int eventVotes, ASSuspendEvent debugEvent) {
    super(eventsProcessor, eventVotes, debugEvent);
  }

  @Override
  protected void doResume() {
    tryResume5Times();
  }

  protected abstract void tryResume() throws Exception;

  protected void tryResume5Times() {
    int resumeAttempts = 5;
    while (--resumeAttempts > 0) {
      try {
        tryResume();
        break;
      } catch (NotConnectedException nce) {
        break;
      } catch (Exception e) {
        LOG.error(e);
        break;
      }
    }
  }

}
