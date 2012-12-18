package codeOrchestra.actionScript.debugger.suspending;

import codeOrchestra.actionScript.debugger.events.ASSuspendEvent;
import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;

/**
 * @author Alexander Eliseyev
 */
public class ASSuspendContextByEvent extends ASTriableSuspendContext {

  public ASSuspendContextByEvent(FDBEventsProcessor eventsProcessor, ASSuspendEvent debugEvent) {
    super(eventsProcessor, 1, debugEvent); // Not sure the 1 is the way to go
  }

  @Override
  protected void tryResume() throws Exception {
    eventsProcessor.getFdbSession().resume();
  }
}
