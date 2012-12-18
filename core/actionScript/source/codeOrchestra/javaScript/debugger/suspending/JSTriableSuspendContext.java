package codeOrchestra.javaScript.debugger.suspending;

import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.events.JSSuspendEvent;
import jetbrains.mps.logging.Logger;

public abstract class JSTriableSuspendContext extends JSSuspendContext {

  private static final Logger LOG = Logger.getLogger(JSTriableSuspendContext.class);

  protected JSTriableSuspendContext(ChromeEventsProcessor eventsProcessor, int eventVotes, JSSuspendEvent debugEvent) {
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
      } catch (Exception e) {
        LOG.error(e);
        break;
      }
    }
  }

}
