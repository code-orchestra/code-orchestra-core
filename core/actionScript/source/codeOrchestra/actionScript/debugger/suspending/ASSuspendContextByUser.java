package codeOrchestra.actionScript.debugger.suspending;


import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;

public class ASSuspendContextByUser extends ASTriableSuspendContext {

  public ASSuspendContextByUser(FDBEventsProcessor eventsProcessor, int eventVotes) {
    super(eventsProcessor, eventVotes, null);
  }

  @Override
  protected void tryResume() throws Exception {
    eventsProcessor.getFdbSession().resume();
  }
}
