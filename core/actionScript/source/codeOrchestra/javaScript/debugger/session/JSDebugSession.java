package codeOrchestra.javaScript.debugger.session;

import com.intellij.execution.ExecutionManager;
import com.intellij.execution.executors.DefaultDebugExecutor;
import com.intellij.ide.impl.ProjectUtil;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.registry.Registry;
import com.intellij.openapi.wm.WindowManager;
import com.intellij.ui.AppIcon;
import codeOrchestra.debugger.DebuggerEventProcessor;
import codeOrchestra.debugger.CodeOrchestraDebugSession;
import codeOrchestra.debugger.step.StepType;
import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessorManager;
import codeOrchestra.javaScript.debugger.listener.JSDebugProcessAdapter;
import codeOrchestra.javaScript.debugger.suspending.JSSuspendContext;
import codeOrchestra.javaScript.debugger.ui.JSDebugUIState;
import jetbrains.mps.debug.api.DebugSessionManagerComponent;
import jetbrains.mps.util.FrameUtil;
import org.jetbrains.annotations.NotNull;

import javax.swing.JFrame;
import java.awt.Frame;

/**
 * @author Alexander Eliseyev
 */
public class JSDebugSession extends CodeOrchestraDebugSession<JSDebugUIState> {

  private ChromeEventsProcessor chromeEventProcessor;

  public JSDebugSession(Project p, ChromeEventsProcessor chromeEventProcessor) {
    super(p);
    this.chromeEventProcessor = chromeEventProcessor;
    this.chromeEventProcessor.setDebuggableFramesSelector(getDebuggableFramesSelector());
    this.chromeEventProcessor.getMulticaster().addListener(new MyDebugProcessAdapter());
  }

  @Override
  protected JSDebugUIState createUiState() {
    return new JSDebugUIState(null, this);
  }

  @Override
  public void resume() {
    JSSuspendContext context = getUiState().getContext();
    if (context == null) return; // context is null => already resumed

    context.setSteppingRequested(false, null);
    chromeEventProcessor.resume(context);
  }

  @Override
  public void stop(boolean terminateTargetProcess) {
    chromeEventProcessor.stop();
    if (terminateTargetProcess) {
      try {
        getProcessHandler().destroyProcess();
      } catch (Throwable t) {
        // ignore
      }
    }
  }

  @Override
  public void pause() {
    chromeEventProcessor.pause();
  }

  @Override
  protected void step(StepType type) {
    JSDebugUIState state = getUiState();
    JSSuspendContext context = state.getContext();
    assert context != null : "Context is null while debug session state is " + myExecutionState;
    assert state.isPausedOnBreakpoint() : "State is not paused on breakpoint.";

    context.setSteppingRequested(true, type);

    chromeEventProcessor.step(type, context);
  }

  @Override
  public void sessionRegistered(DebugSessionManagerComponent manager) {
    ChromeEventsProcessorManager eventsProcessorManagerprocessorManager = manager.getProject().getComponent(ChromeEventsProcessorManager.class);
    eventsProcessorManagerprocessorManager.addDebugSession(this);
  }

  private void pause(JSSuspendContext suspendContext) {
    JSDebugUIState state = getUiState();
    setState(state, state.paused(suspendContext), false);
  }

  private void resume(JSSuspendContext suspendContext) {
    JSDebugUIState state = getUiState();
    setState(state, state.resumed(suspendContext), false);
  }

  @Override
  protected DebuggerEventProcessor getDebuggerEventProcessor() {
    return getEventsProcessor();
  }

  public ChromeEventsProcessor getEventsProcessor() {
    return chromeEventProcessor;
  }

  private class MyDebugProcessAdapter extends JSDebugProcessAdapter {

    @Override
    public void paused(@NotNull JSSuspendContext suspendContext) {
      myExecutionState = ExecutionState.Paused;
      pause(suspendContext);
      fireSessionPaused(JSDebugSession.this);

      toFront();
    }

    @Override
    public void resumed(@NotNull JSSuspendContext suspendContext) {
      myExecutionState = ExecutionState.Running;
      resume(suspendContext);
      fireSessionResumed(JSDebugSession.this);
    }

    @Override
    public void processDetached(@NotNull ChromeEventsProcessor eventsProcessor, boolean closedByUser) {
      myExecutionState = ExecutionState.Stopped;
      setState(getUiState(), new JSDebugUIState(null, JSDebugSession.this), false);
      fireSessionResumed(JSDebugSession.this);
    }

    @Override
    public void processAttached(@NotNull ChromeEventsProcessor eventsProcessor) {
      myExecutionState = ExecutionState.Running;
    }
  }

}
