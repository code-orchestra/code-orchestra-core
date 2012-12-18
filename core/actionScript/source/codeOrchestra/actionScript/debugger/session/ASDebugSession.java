package codeOrchestra.actionScript.debugger.session;

import com.intellij.openapi.project.Project;
import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import codeOrchestra.actionScript.debugger.events.FDBEventsProcessorManager;
import codeOrchestra.actionScript.debugger.listener.ASDebugProcessAdapter;
import codeOrchestra.actionScript.debugger.suspending.ASSuspendContext;
import codeOrchestra.actionScript.debugger.ui.ASDebugUIState;
import codeOrchestra.debugger.DebuggerEventProcessor;
import codeOrchestra.debugger.CodeOrchestraDebugSession;
import codeOrchestra.debugger.step.StepType;
import jetbrains.mps.debug.api.DebugSessionManagerComponent;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class ASDebugSession extends CodeOrchestraDebugSession<ASDebugUIState> {

  private FDBEventsProcessor fdbEventsProcessor;

  public ASDebugSession(FDBEventsProcessor fdbEventsProcessor, Project p) {
    super(p);
    this.fdbEventsProcessor = fdbEventsProcessor;
    this.fdbEventsProcessor.setDebuggableFramesSelector(getDebuggableFramesSelector());
    this.fdbEventsProcessor.getMulticaster().addListener(new MyDebugProcessAdapter());
  }

  @Override
  protected DebuggerEventProcessor getDebuggerEventProcessor() {
    return getFDBEventsProcessor();
  }

  public FDBEventsProcessor getFDBEventsProcessor() {
    return fdbEventsProcessor;
  }

  @Override
  protected ASDebugUIState createUiState() {
    return new ASDebugUIState(null, this);
  }

  @Override
  public void sessionRegistered(DebugSessionManagerComponent manager) {
    FDBEventsProcessorManager eventsProcessorManager = manager.getProject().getComponent(FDBEventsProcessorManager.class);
    eventsProcessorManager.addDebugSession(this);
  }

  @Override
  public void resume() {
    ASSuspendContext context = getUiState().getContext();
    if (context == null) return; // context is null => already resumed

    context.setStepping(false);
    fdbEventsProcessor.resume(context);
  }

  @Override
  public void pause() {
    fdbEventsProcessor.pause();
  }

  @Override
  public void stop(boolean terminateTargetProcess) {
    fdbEventsProcessor.stop(terminateTargetProcess);
  }

  @Override
  protected void step(StepType type) {
    ASDebugUIState state = getUiState();
    ASSuspendContext context = state.getContext();
    assert context != null : "Context is null while debug session state is " + myExecutionState;
    assert state.isPausedOnBreakpoint() : "State is not paused on breakpoint.";

    context.setStepping(true);
    context.setStepType(type);

    fdbEventsProcessor.step(type, context);
  }

  private void pause(ASSuspendContext suspendContext) {
    ASDebugUIState state = getUiState();
    setState(state, state.paused(suspendContext), false);
  }

  private void resume(ASSuspendContext suspendContext) {
    ASDebugUIState state = getUiState();
    setState(state, state.resumed(suspendContext), false);
  }

  private class MyDebugProcessAdapter extends ASDebugProcessAdapter {

    @Override
    public void paused(@NotNull ASSuspendContext suspendContext) {
      myExecutionState = ExecutionState.Paused;
      pause(suspendContext);
      fireSessionPaused(ASDebugSession.this);

      toFront();
    }

    @Override
    public void resumed(@NotNull ASSuspendContext suspendContext) {
      myExecutionState = ExecutionState.Running;
      resume(suspendContext);
      fireSessionResumed(ASDebugSession.this);
    }

    @Override
    public void processDetached(@NotNull FDBEventsProcessor eventsProcessor, boolean closedByUser) {
      myExecutionState = ExecutionState.Stopped;
      setState(getUiState(), new ASDebugUIState(null, ASDebugSession.this), false);
      fireSessionResumed(ASDebugSession.this);
    }

    @Override
    public void processAttached(@NotNull FDBEventsProcessor eventsProcessor) {
      myExecutionState = ExecutionState.Running;
    }
  }

}
