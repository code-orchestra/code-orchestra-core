package codeOrchestra.javaScript.debugger.ui;

import codeOrchestra.javaScript.debugger.session.JSDebugSession;
import codeOrchestra.javaScript.debugger.suspending.JSSuspendContext;
import jetbrains.mps.debug.api.AbstractDebugSession.ExecutionState;
import jetbrains.mps.debug.api.AbstractUiState;
import jetbrains.mps.debug.api.programState.IStackFrame;
import jetbrains.mps.debug.api.programState.IThread;
import jetbrains.mps.logging.Logger;
import org.chromium.sdk.InvalidContextException;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Collections;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class JSDebugUIState extends AbstractUiState {

  private static Logger LOG = Logger.getLogger(JSDebugUIState.class);

  protected IThread myThread;
  protected int myStackFrameIndex;

  private JSDebugSession myDebugSession;
  private JSSuspendContext suspendContext;

  public JSDebugUIState(JSSuspendContext suspendContext, JSDebugSession jsDebugSession) {
    super(jsDebugSession);

    this.myDebugSession = jsDebugSession;
    this.suspendContext = suspendContext;

    if (suspendContext == null) {
      myThread = null;
      myStackFrameIndex = NO_FRAME;
    } else {
      myThread = new JSThread(jsDebugSession);
      LOG.assertLog(myThread != null);
      myStackFrameIndex = findStackFrameIndex();
    }
  }

  // This constructor is called when user selects some frame from ui

  JSDebugUIState(@NotNull JSDebugUIState previousState, int frameIndex, JSDebugSession debugSession) {
    super(debugSession);
    myDebugSession = debugSession;
    LOG.assertLog(frameIndex == NO_FRAME || (frameIndex >= 0 && frameIndex < previousState.myThread.getFramesCount()));
    suspendContext = previousState.suspendContext;
    myThread = previousState.myThread;
    myStackFrameIndex = frameIndex;
  }

  protected JSDebugUIState selectFrameInternal(int frame) {
    if (myStackFrameIndex != frame) {
      return new JSDebugUIState(this, frame, myDebugSession);
    }
    return this;
  }

  @Override
  public JSStackFrame getStackFrame() {
    if (myStackFrameIndex == NO_FRAME) return null;
    assert myThread != null; // if we have a frame then we have a thread
    try {
      return (JSStackFrame) myThread.getFrames().get(myStackFrameIndex);
    } catch (Throwable t) {
      return null;
    }
  }

  @Override
  public boolean isMultithreaded() {
    return false;
  }

  @Override
  public JSThread getThread() {
    return (JSThread) myThread;
  }

  @NotNull
  @Override
  public List<IThread> getThreads() {
    if (getExecutionState().equals(ExecutionState.Paused)) {
      return Collections.singletonList(myThread);
    }
    return Collections.emptyList();
  }

  private ExecutionState getExecutionState() {
    return myDebugSession.getExecutionState();
  }

  @Override
  public IStackFrame getStackFrame(int index) {
    JSThread thread = getThread();
    if (thread == null) return null;
    return thread.getFrame(index);
  }

  @Override
  public boolean isPausedOnBreakpoint() {
    if (suspendContext == null) {
      return false;
    }
    try {
      suspendContext.getDebugEvent().getDebugContext().getState();
      return true;
    } catch (InvalidContextException t) {
      return false;
    }
  }

  @Override
  protected IThread findThread() {
    if (suspendContext == null) {
      return null;
    }
    return new JSThread(myDebugSession);
  }

  @Override
  protected AbstractUiState selectThreadInternal(@Nullable IThread thread) {
    return null;  // TODO: implement ?
  }

  @NotNull
  public JSDebugUIState paused(JSSuspendContext context) {
    return new JSDebugUIState(context, myDebugSession);
  }

  @NotNull
  public JSDebugUIState resumed(JSSuspendContext context) {
    return new JSDebugUIState(context, myDebugSession);
  }

  public JSSuspendContext getContext() {
    return suspendContext;
  }

}
