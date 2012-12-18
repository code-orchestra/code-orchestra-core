package codeOrchestra.javaScript.debugger.suspending;

import codeOrchestra.debugger.step.StepType;
import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.events.JSSuspendEvent;
import jetbrains.mps.logging.Logger;
import org.chromium.sdk.DebugContext.ContinueCallback;
import org.chromium.sdk.DebugContext.StepAction;

/**
 * @author Alexander Eliseyev
 */
public class JSSuspendContextByEvent extends JSTriableSuspendContext {

  private static Logger LOG = Logger.getLogger(JSSuspendContextByEvent.class);

  public JSSuspendContextByEvent(ChromeEventsProcessor eventsProcessor, JSSuspendEvent debugEvent) {
    super(eventsProcessor, 1, debugEvent);
  }

  @Override
  protected void tryResume() throws Exception {
    assert debugEvent != null;

    final StepAction stepAction;

    StepType stepTypeRequested = debugEvent.getStepTypeRequested();
    if (stepTypeRequested == null) {
      stepAction = StepAction.CONTINUE;
    } else {
      switch (stepTypeRequested) {
        case OVER:
          stepAction = StepAction.OVER;
          break;
        case INTO:
          stepAction = StepAction.IN;
          break;
        case OUT:
          stepAction = StepAction.OUT;
          break;
        default:
          stepAction = StepAction.CONTINUE;
      }
    }

    int stepCount = stepAction == StepAction.CONTINUE ? -1 : 1;

    debugEvent.getDebugContext().continueVm(stepAction, stepCount, new ContinueCallback() {
      @Override
      public void success() {
        eventsProcessor.getMulticaster().resumed(JSSuspendContextByEvent.this);
      }

      @Override
      public void failure(String errorMessage) {
        LOG.warning("Can't resume with the action " + stepAction + ": " + errorMessage);
      }
    });
  }
}
