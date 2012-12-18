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

import com.sun.jdi.InternalException;
import com.sun.jdi.ObjectCollectedException;
import com.sun.jdi.ThreadReference;
import com.sun.jdi.event.EventSet;
import com.sun.jdi.request.EventRequest;
import jetbrains.mps.debug.runtime.execution.DebuggerManagerThread;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 18.12.2009
 * Time: 19:23:23
 * To change this template use File | Settings | File Templates.
 */
public class SuspendManager {
  private static final Logger LOG = Logger.getLogger(SuspendManager.class);

  private final DebugVMEventsProcessor myDebugProcess;

  private final LinkedList<SuspendContext> myEventContexts = new LinkedList<SuspendContext>();
  // contexts, paused at breakpoint or another debugger event requests. Note that thread, explicitly paused by user is not considered as
  // "paused at breakpoint" and JDI prohibits data queries on its stackframes
  private final LinkedList<SuspendContext> myPausedContexts = new LinkedList<SuspendContext>();
  // context paused by user
  @Nullable
  private SuspendContext myPausedByUserContext;

  public SuspendManager(DebugVMEventsProcessor debugProcess) {
    myDebugProcess = debugProcess;
    myDebugProcess.addDebugProcessListener(new DebugProcessAdapter() {
      public void processDetached(@NotNull DebugVMEventsProcessor process, boolean closedByUser) {
        myEventContexts.clear();
        myPausedContexts.clear();
        myPausedByUserContext = null;
      }
    });
  }

  public SuspendContext pushSuspendContextWithVotesNumber(int suspendPolicy, int nVotes) {
    SuspendContext suspendContext = new SuspendContextByItSelf(myDebugProcess, suspendPolicy, nVotes);
    pushContext(suspendContext);
    return suspendContext;
  }

  public SuspendContext pushSuspendContextFromEventSet(EventSet set) {
    SuspendContext suspendContext;
    if (set == null) { // special case
      suspendContext = new SuspendContextByItSelf(myDebugProcess, EventRequest.SUSPEND_NONE, 1) {
        @Override
        protected void resumeImpl() {
        }
      };
    } else {
      suspendContext = new SuspendContextFromSet(myDebugProcess, set) {
      };
    }
    pushContext(suspendContext);
    return suspendContext;
  }

  private void pushContext(SuspendContext suspendContext) {
    DebuggerManagerThread.assertIsManagerThread();
    myEventContexts.addFirst(suspendContext);
  }

  public void resume(SuspendContext context) {
    context.resume();
    popContext(context);
  }

  @Nullable
  public SuspendContext getPausedContext() {
    return !myPausedContexts.isEmpty() ? myPausedContexts.getFirst() : null;
  }

  public void popContext(SuspendContext suspendContext) {
    DebuggerManagerThread.assertIsManagerThread();
    myEventContexts.remove(suspendContext);
    myPausedContexts.remove(suspendContext);
    if (myPausedByUserContext == suspendContext) {
      myPausedByUserContext = null;
    }
  }

  private void pushPausedContext(SuspendContext suspendContext) {
    LOG.assertLog(myEventContexts.contains(suspendContext));
    myPausedContexts.addFirst(suspendContext);
  }

  public boolean hasEventContext(SuspendContext suspendContext) {
    DebuggerManagerThread.assertIsManagerThread();
    return myEventContexts.contains(suspendContext);
  }

  public List<SuspendContext> getEventContexts() {
    DebuggerManagerThread.assertIsManagerThread();
    return myEventContexts;
  }

  public boolean isSuspended(ThreadReference thread) throws ObjectCollectedException {
    DebuggerManagerThread.assertIsManagerThread();

    boolean suspended = false;
    for (SuspendContext suspendContext : myEventContexts) {
      if (suspendContext.suspends(thread)) {
        suspended = true;
        break;
      }
    }
    return suspended && (thread == null || thread.isSuspended());
  }

  private void processVote(SuspendContext suspendContext) {
    LOG.assertLog(suspendContext.myVotesToVote > 0);
    suspendContext.myVotesToVote--;

    if (suspendContext.myVotesToVote == 0) {
      if (suspendContext.myIsVotedForResume) {
        resume(suspendContext);
      } else {
        notifyPaused(suspendContext);
      }
    }
  }

  private void notifyPaused(SuspendContext suspendContext) {
    pushPausedContext(suspendContext);
    myDebugProcess.getMulticaster().paused(suspendContext);
  }

  public void voteResume(SuspendContext suspendContext) {
    processVote(suspendContext);
  }

  public void voteSuspend(SuspendContext suspendContext) {
    suspendContext.myIsVotedForResume = false;
    processVote(suspendContext);
  }

  LinkedList<SuspendContext> getPausedContexts() {
    return myPausedContexts;
  }

  @Nullable
  SuspendContext getPausedByUserContext() {
    return myPausedByUserContext;
  }

  public void setPausedByUser(SuspendContext suspendContext) {
    myPausedByUserContext = suspendContext;
  }

  private class SuspendContextFromSet extends SuspendContextImpl {
    public SuspendContextFromSet(@NotNull DebugVMEventsProcessor debugProcess, @NotNull EventSet set) {
      super(debugProcess, set.suspendPolicy(), set.size(), set);
    }

    @Override
    protected void resumeImpl() {
      ThreadReference thread = getThread();
      if (thread != null) { // check that thread is suspended at the moment
        try {
          if (!thread.isSuspended()) {
            LOG.assertLog(false, "Context thread must be suspended");
          }
        } catch (ObjectCollectedException ignored) {
        }
      }

      tryResume5Times();
    }

    @Override
    protected void tryResume() throws ObjectCollectedException, InternalException {
      getEventSet().resume();
    }
  }

  private class SuspendContextByItSelf extends SuspendContextImpl {
    public SuspendContextByItSelf(@NotNull DebugVMEventsProcessor debugProcess, int suspendPolicy, int eventVotes) {
      super(debugProcess, suspendPolicy, eventVotes, null);
    }

    @Override
    protected void resumeImpl() {
      LOG.debug("Start resuming...");
      switch (getSuspendPolicy()) {
        case EventRequest.SUSPEND_ALL:
          tryResume5Times();
          LOG.debug("VM resumed ");
          break;
        case EventRequest.SUSPEND_EVENT_THREAD:
          // TODO: well, this call not just MAY produce NPE, it WILL, if we ever get here (but we won't AFAIK)
          // TODO why don't we repeat 5 times here?
          ThreadReference thread = getThread();
          LOG.assertLog(thread != null);
          thread.resume();
          LOG.debug("Thread resumed : " + getThread().toString());
          break;
        case EventRequest.SUSPEND_NONE:
          LOG.debug("None resumed");
          break;
      }
    }

    @Override
    protected void tryResume() throws ObjectCollectedException, InternalException {
      myDebugProcess.getVirtualMachine().resume();
    }
  }

  private abstract class SuspendContextImpl extends SuspendContext {
    public SuspendContextImpl(@NotNull DebugVMEventsProcessor debugProcess, int suspendPolicy, int eventVotes, @Nullable EventSet set) {
      super(debugProcess, suspendPolicy, eventVotes, set);
    }

    protected abstract void tryResume() throws ObjectCollectedException, InternalException;

    protected void tryResume5Times() {
      int resumeAttempts = 5;
      while (--resumeAttempts > 0) {
        try {
          tryResume();
          break;
        } catch (ObjectCollectedException e) {
          // according to error reports set.resume() may throw this if one of the threads has been collected
        } catch (InternalException e) {
          //InternalException 13 means that there are running threads that we are trying to resume
          //On MacOS it happened that native thread didn't stop while some java thread reached breakpoint
          if (/*Patches.MAC_RESUME_VM_HACK && */e.errorCode() == 13 && getSuspendPolicy() == EventRequest.SUSPEND_ALL) {
            //Its funny, but second resume solves the problem
          } else {
            LOG.error(e);
            break;
          }
        }
      }
    }
  }
}
