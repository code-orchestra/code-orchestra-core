package codeOrchestra.actionScript.debugger.ui;

import codeOrchestra.actionScript.debugger.session.ASDebugSession;
import codeOrchestra.actionScript.debugger.suspending.ASSuspendContext;
import flash.tools.debugger.NotConnectedException;
import flash.tools.debugger.Session;
import jetbrains.mps.debug.api.AbstractDebugSession.ExecutionState;
import jetbrains.mps.debug.api.AbstractUiState;
import jetbrains.mps.debug.api.programState.IStackFrame;
import jetbrains.mps.debug.api.programState.IThread;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Collections;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASDebugUIState extends AbstractUiState {

  private static Logger LOG = Logger.getLogger(ASDebugUIState.class);

  protected final IThread myThread;
  protected final int myStackFrameIndex;

  private ASSuspendContext suspendContext;
  private final ASDebugSession myDebugSession;

  public ASDebugUIState(@Nullable ASSuspendContext context, ASDebugSession session) {
    super(session);
    suspendContext = context;
    myDebugSession = session;

    if (context == null) {
      myThread = null;
      myStackFrameIndex = NO_FRAME;
    } else {
      myThread = new ASThread(session);
      LOG.assertLog(myThread != null);
      myStackFrameIndex = findStackFrameIndex();
    }
  }
 // This constructor is called when user selects some frame from ui

  ASDebugUIState(@NotNull ASDebugUIState previousState, int frameIndex, ASDebugSession debugSession) {
    super(debugSession);
    myDebugSession = debugSession;
    LOG.assertLog(frameIndex == NO_FRAME || (frameIndex >= 0 && frameIndex < previousState.myThread.getFramesCount()));
    suspendContext = previousState.suspendContext;
    myThread = previousState.myThread;
    myStackFrameIndex = frameIndex;
  }

  protected ASDebugUIState selectFrameInternal(int frame) {
    if (myStackFrameIndex != frame) {
      return new ASDebugUIState(this, frame, myDebugSession);
    }
    return this;
  }

  protected int findStackFrameIndex() {
    if (myThread == null) return NO_FRAME;
    return super.findStackFrameIndex();
  }

  private Session getSession() {
    return ((ASDebugSession) myAbstractDebugSession).getFDBEventsProcessor().getFdbSession();
  }

  @Override
  public boolean isMultithreaded() {
    return false;
  }

  @Override
  public ASThread getThread() {
    return (ASThread) myThread;
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
  public ASStackFrame getStackFrame() {
    if (myStackFrameIndex == NO_FRAME) return null;
    assert myThread != null; // if we have a frame then we have a thread
    try {
      return (ASStackFrame) myThread.getFrames().get(myStackFrameIndex);
    } catch (Throwable t) {
      return null;
    }
  }

  @Override
  public IStackFrame getStackFrame(int index) {
    ASThread thread = getThread();
    if (thread == null) return null;
    return thread.getFrame(index);
  }

  @Override
  public boolean isPausedOnBreakpoint() {
    //TODO: переписать
    try {
      return getSession().isSuspended();
    } catch (NotConnectedException e) {
      return false;
    }
  }

  @Override
  protected IThread findThread() {
    if (suspendContext == null) {
      return null;
    }
    return new ASThread(myDebugSession);
  }

  @Override
  protected AbstractUiState selectThreadInternal(@Nullable IThread thread) {
    return null; // TODO: implement
  }

  @NotNull
  public ASDebugUIState paused(ASSuspendContext context) {
    // we select new context even if we are already on some other context
    // user probably wants to know about new paused contexts
    return new ASDebugUIState(context, myDebugSession);
  }

  @NotNull
  public ASDebugUIState resumed(ASSuspendContext context) {
    //TODO if some other context is resumed it does not mean that those changes do not concern us. We still want to display correct threads state.
    /*
    if (context != suspendContext) return this;
    SuspendContext newContext = null;
    List<SuspendContext> allPausedContexts = getAllPausedContexts();
    if (!allPausedContexts.isEmpty()) {
      newContext = allPausedContexts.get(0);
    }
    */
    return new ASDebugUIState(context, myDebugSession);
  }

  public ASSuspendContext getContext() {
    return suspendContext;
  }
}
