/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.debug.runtime;

import com.sun.jdi.*;
import com.sun.jdi.event.*;
import jetbrains.mps.debug.api.AbstractDebugSession.ExecutionState;
import jetbrains.mps.debug.api.AbstractUiState;
import jetbrains.mps.debug.api.programState.IStackFrame;
import jetbrains.mps.debug.api.programState.IThread;
import jetbrains.mps.debug.api.programState.IWatchable;
import jetbrains.mps.debug.runtime.java.programState.proxies.JavaStackFrame;
import jetbrains.mps.debug.runtime.java.programState.proxies.JavaThread;
import jetbrains.mps.debug.runtime.java.programState.watchables.JavaExceptionWatchable;
import jetbrains.mps.debug.runtime.java.programState.watchables.JavaMethodWatchable;
import jetbrains.mps.debug.runtime.java.programState.watchables.JavaReturnWatchable;
import jetbrains.mps.debug.runtime.java.programState.watchables.JavaWatchpointWatchable;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.CollectionUtil;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

// This class is immutable
public class JavaUiState extends AbstractUiState {
  private static Logger LOG = Logger.getLogger(JavaUiState.class);

  @Nullable
  private final SuspendContext myContext;
  @Nullable
  protected final IThread myThread;
  protected final int myStackFrameIndex;
  private final DebugSession myDebugSession;

  JavaUiState(@Nullable SuspendContext context, DebugSession debugSession) {
    super(debugSession);
    myDebugSession = debugSession;
    myContext = context;

    if (context == null) {
      myThread = null;
      myStackFrameIndex = NO_FRAME;
    } else {
      myThread = findThread();
      LOG.assertLog(myThread != null);
      myStackFrameIndex = findStackFrameIndex();
    }
  }

  // This constructor is called when user selects some thread from ui

  JavaUiState(@NotNull JavaUiState previousState, @Nullable JavaThread thread, DebugSession debugSession) {
    super(debugSession);
    myDebugSession = debugSession;
    if (thread == null) {
      myContext = null;
      myThread = null;
      myStackFrameIndex = NO_FRAME;
    } else {
      myThread = thread;
      myContext = findContext(previousState);
      LOG.assertLog(myContext != null); // in case some botva is going on
      myStackFrameIndex = findStackFrameIndex();
    }
  }

  // This constructor is called when user selects some frame from ui

  JavaUiState(@NotNull JavaUiState previousState, int frameIndex, DebugSession debugSession) {
    super(debugSession);
    myDebugSession = debugSession;
    LOG.assertLog(frameIndex == NO_FRAME || (frameIndex >= 0 && frameIndex < previousState.myThread.getFramesCount()));
    myContext = previousState.myContext;
    myThread = previousState.myThread;
    myStackFrameIndex = frameIndex;
  }

  private SuspendContext findContext(@NotNull JavaUiState previousState) {
    SuspendContext newContext = previousState.myContext;
    if (newContext == null) {
      LOG.errorAssertionFailed();
      return null;
    }
    if (!newContext.suspends(getThread().getThread())) {
      newContext = null;
      for (SuspendContext context : getAllPausedContexts()) {
        if (context.suspends(getThread().getThread())) {
          newContext = context;
          break;
        }
      }
    }
    return newContext;
  }

  protected JavaThread findThread() {
    if (myContext == null) return null;
    ThreadReference thread = myContext.getThread();
    if (thread == null) {
      List<ThreadReference> threads = getEventsProcessor().getVirtualMachine().allThreads();
      thread = threads.get(0);
      for (ThreadReference t : threads) {
        // TODO this is a hack to filter out system threads
        if (!t.threadGroup().name().equals("system")) {
          thread = t;
          break;
        }
      }
    }
    return new JavaThread(thread);
  }

  protected int findStackFrameIndex() {
    if (myThread == null) return NO_FRAME;
    return super.findStackFrameIndex();
  }

  @Nullable
  public ObjectReference getThisObject() {
    JavaStackFrame javaStackFrame = getStackFrame();
    if (javaStackFrame != null) {
      return javaStackFrame.getStackFrame().thisObject();
    }
    return null;
  }

  // changes state on pause/resume

  @NotNull
  JavaUiState paused(SuspendContext context) {
    // we select new context even if we are already on some other context
    // user probably wants to know about new paused contexts
    return new JavaUiState(context, myDebugSession);
  }

  @NotNull
  JavaUiState resumed(SuspendContext context) {
    //TODO if some other context is resumed it does not mean that those changes do not concern us. We still want to display correct threads state.
    if (context != myContext) return this;
    SuspendContext newContext = null;
    List<SuspendContext> allPausedContexts = getAllPausedContexts();
    if (!allPausedContexts.isEmpty()) {
      newContext = allPausedContexts.get(0);
    }
    return new JavaUiState(newContext, myDebugSession);
  }

  private List<SuspendContext> getAllPausedContexts() {
    SuspendManager suspendManager = getEventsProcessor().getSuspendManager();
    SuspendContext context = suspendManager.getPausedByUserContext();
    if (context != null) {
      return suspendManager.getPausedContexts();
    }
    return CollectionUtil.union(suspendManager.getPausedContexts(), Collections.singletonList(context));
  }

  // changes state on user selection

  protected JavaUiState selectThreadInternal(@Nullable IThread thread) {
    return new JavaUiState(this, (JavaThread) thread, myDebugSession);
  }

  protected JavaUiState selectFrameInternal(int frame) {
    if (myStackFrameIndex != frame) {
      return new JavaUiState(this, frame, myDebugSession);
    }
    return this;
  }

  @Nullable
  public SuspendContext getContext() {
    return myContext;
  }

  @NotNull
  public List<IThread> getThreads() {
    if (getExecutionState().equals(ExecutionState.Paused)) {
      List<IThread> result = new ArrayList<IThread>();
      for (ThreadReference threadReference : getEventsProcessor().getVirtualMachine().allThreads()) {
        if (threadReference.isSuspended()) {
          result.add(new JavaThread(threadReference));
        }
      }
      return result;
    }
    return Collections.emptyList();
  }

  public boolean isPausedOnBreakpoint() {
    return myContext != null && getEventsProcessor().getSuspendManager().getPausedContexts().contains(myContext);
  }

  @Nullable
  public JavaThread getThread() {
    return (JavaThread) myThread;
  }

  @Nullable
  public JavaStackFrame getStackFrame() {
    if (myStackFrameIndex == NO_FRAME) return null;
    assert myThread != null; // if we have a frame then we have a thread
    return (JavaStackFrame) myThread.getFrames().get(myStackFrameIndex);
  }

  @Override
  public IStackFrame getStackFrame(int index) {
    JavaThread thread = getThread();
    if (thread == null) return null;
    return thread.getFrame(index);
  }

  private DebugVMEventsProcessor getEventsProcessor() {
    return myDebugSession.getEventsProcessor();
  }

  private ExecutionState getExecutionState() {
    return myDebugSession.getExecutionState();
  }

  @Deprecated
  public Value getVariableValue(LocalVariable variable) {
    JavaStackFrame stackFrame = getStackFrame();
    if (stackFrame != null) {
      return stackFrame.getStackFrame().getValue(variable);
    }
    return null;
  }

  @NotNull
  private List<IWatchable> getAdditionalWatchables() {
    List<IWatchable> watchables = new ArrayList<IWatchable>();
    if (myContext != null) {
      EventSet eventSet = myContext.getEventSet();
      if (eventSet != null) {
        for (Event event : eventSet) {
          if (event instanceof ExceptionEvent) {
            ObjectReference exception = ((ExceptionEvent) event).exception();
            watchables.add(new JavaExceptionWatchable(exception, getStackFrame().getClassFqName(), getThread().getThread()));
          } else if (event instanceof MethodEntryEvent) {
            Method method = ((MethodEntryEvent) event).method();
            watchables.add(new JavaMethodWatchable(method, true, getStackFrame().getClassFqName(), getThread().getThread()));
          } else if (event instanceof MethodExitEvent) {
            Method method = ((MethodExitEvent) event).method();
            Value value = ((MethodExitEvent) event).returnValue();
            watchables.add(new JavaMethodWatchable(method, false, getStackFrame().getClassFqName(), getThread().getThread()));
            watchables.add(new JavaReturnWatchable(value, getStackFrame().getClassFqName(), getThread().getThread()));
          } else if (event instanceof AccessWatchpointEvent) {
            Field field = ((AccessWatchpointEvent) event).field();
            Value value = ((AccessWatchpointEvent) event).valueCurrent();
            watchables.add(new JavaWatchpointWatchable(field, value, getStackFrame().getClassFqName(), getThread().getThread()));
          } else if (event instanceof ModificationWatchpointEvent) {
            Field field = ((ModificationWatchpointEvent) event).field();
            Value currentValue = ((ModificationWatchpointEvent) event).valueCurrent();
            Value valueToBe = ((ModificationWatchpointEvent) event).valueToBe();
            watchables.add(new JavaWatchpointWatchable(field, currentValue, valueToBe, getStackFrame().getClassFqName(), getThread().getThread()));
          }
        }
      }
    }
    return watchables;
  }

  @NotNull
  public List<IWatchable> getWatchables() {
    List<IWatchable> watchables = new ArrayList<IWatchable>();
    watchables.addAll(super.getWatchables());
    watchables.addAll(getAdditionalWatchables());
    return watchables;
  }
}