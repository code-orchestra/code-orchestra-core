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

import com.sun.jdi.IncompatibleThreadStateException;
import com.sun.jdi.ObjectReference;
import com.sun.jdi.StackFrame;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.event.EventSet;
import com.sun.jdi.request.EventRequest;
import jetbrains.mps.debug.runtime.execution.DebuggerManagerThread;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 18.12.2009
 * Time: 18:42:00
 * To change this template use File | Settings | File Templates.
 */
public abstract class SuspendContext { //todo: add evaluation and postponed commands - later
  private static final Logger LOG = Logger.getLogger(SuspendContext.class);

  private final DebugVMEventsProcessor myDebugProcess;
  private final int mySuspendPolicy;
  private final EventSet myEventSet;
  private final Set<ObjectReference> myKeptReferences = new HashSet<ObjectReference>();

  @Nullable
  private ThreadReference myThread;

  boolean myIsVotedForResume = true;
  protected int myVotesToVote;
  private volatile boolean myIsResumed;
  public volatile boolean myInProgress;
  private boolean myIsEvaluating = false;

  SuspendContext(@NotNull DebugVMEventsProcessor debugProcess,
                 int suspendPolicy, int eventVotes, @Nullable EventSet set) {
    myDebugProcess = debugProcess;
    mySuspendPolicy = suspendPolicy;
    myVotesToVote = eventVotes;
    myEventSet = set;
  }

  public void setThread(@Nullable ThreadReference thread) {
    assertNotResumed();
    LOG.assertLog(myThread == null || myThread == thread);
    myThread = thread;
  }

  protected abstract void resumeImpl();

  protected void resume() {
    assertNotResumed();
    DebuggerManagerThread.assertIsManagerThread();
    try {
      resumeImpl();
    } finally {
      myIsResumed = true;
    }
  }

  private void assertNotResumed() {
    if (myIsResumed) {
      if (myDebugProcess.isAttached()) {
        LOG.assertLog(false, "Cannot access SuspendContext. SuspendContext is resumed.");
      }
    }
  }

  @Nullable
  public EventSet getEventSet() {
    assertNotResumed();
    return myEventSet;
  }

  public DebugVMEventsProcessor getDebugProcess() {
    assertNotResumed();
    return myDebugProcess;
  }

  @Nullable
  public StackFrame getFrame() {
    assertNotResumed();
    List<StackFrame> frames = getFrames();
    return !frames.isEmpty() ? frames.get(0) : null;
  }

  @NotNull
  private List<StackFrame> getFrames() {
    assertNotResumed();
    try {
      return myThread != null ? myThread.frames() : Collections.<StackFrame>emptyList();
    } catch (IncompatibleThreadStateException e) {
      return Collections.<StackFrame>emptyList();
    }
  }

  @Nullable
  public ThreadReference getThread() {
    return myThread;
  }

  public int getSuspendPolicy() {
    assertNotResumed();
    return mySuspendPolicy;
  }

  //if this context suspends a given thread

  public boolean suspends(ThreadReference thread) {
    assertNotResumed();
    switch (getSuspendPolicy()) {
      case EventRequest.SUSPEND_ALL:
        return true;
      case EventRequest.SUSPEND_EVENT_THREAD:
        return thread == getThread();
    }
    return false;
  }

  public boolean isResumed() {
    return myIsResumed;
  }

  public void setIsEvaluating(boolean b) {
    myIsEvaluating = b;
  }

  public boolean isEvaluating() {
    return myIsEvaluating;
  }
}
