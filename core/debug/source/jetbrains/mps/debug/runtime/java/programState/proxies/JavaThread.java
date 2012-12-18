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
package jetbrains.mps.debug.runtime.java.programState.proxies;

import com.sun.jdi.IncompatibleThreadStateException;
import com.sun.jdi.ThreadReference;
import jetbrains.mps.debug.api.programState.IStackFrame;
import jetbrains.mps.debug.api.programState.IThread;
import jetbrains.mps.debug.integration.ui.icons.Icons;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 09.04.2010
 * Time: 17:15:46
 * To change this template use File | Settings | File Templates.
 */
public class JavaThread extends ProxyForJava implements IThread {
  private static final Logger LOG = Logger.getLogger(JavaThread.class);
  @NotNull
  private final ThreadReference myThreadReference;
  @Nullable
  private Icon myCachedIcon = null;

  public JavaThread(@NotNull ThreadReference threadReference) {
    super(threadReference);
    myThreadReference = threadReference;
  }

  @Override
  public List<IStackFrame> getFrames() {
    try {
      List<IStackFrame> frames = new ArrayList<IStackFrame>();
      for (int i = 0; i < myThreadReference.frameCount(); i++) {
        frames.add(new JavaStackFrame(myThreadReference, i));
      }
      return frames;
    } catch (IncompatibleThreadStateException ex) {
      LOG.debug("IncompatibleThreadStateException", ex);
      return Collections.emptyList();
    }
  }

  @Override
  public int getFramesCount() {
    try {
      return myThreadReference.frameCount();
    } catch (IncompatibleThreadStateException ex) {
      LOG.warning("IncompatibleThreadStateException", ex);
      return 0;
    }
  }

  @Nullable
  public IStackFrame getFrame(int index) {
    try {
      if (index >= myThreadReference.frameCount()) {
        return null;
      }
      return new JavaStackFrame(myThreadReference, index);
    } catch (IncompatibleThreadStateException ex) {
      LOG.warning("IncompatibleThreadStateException", ex);
      return null;
    }
  }

  @NotNull
  public ThreadReference getThread() {
    return myThreadReference;
  }

  @Override
  public String getName() {
    return myThreadReference.name();
  }

  @Override
  public String getPresentation() {
    ThreadReference thread = myThreadReference;
    return thread.name() + " (" + thread.referenceType().name()
      + " from group " + thread.threadGroup().name() + ") : "
      + getThreadStatusText(thread.status());
  }

  @Override
  public Icon getPresentationIcon() {
    if (myCachedIcon == null) {
      ThreadReference thread = myThreadReference;
      if (thread.isAtBreakpoint()) {
        myCachedIcon = Icons.THREAD_AT_BREAKPOINT;
      } else if (thread.isSuspended()) {
        myCachedIcon = Icons.THREAD_SUSPENDED;
      } else {
        myCachedIcon = Icons.THREAD_RUNNING;
      }
    }
    return myCachedIcon;
  }

  private static String getThreadStatusText(int statusId) {
    switch (statusId) {
      case ThreadReference.THREAD_STATUS_MONITOR:
        return "MONITOR";
      case ThreadReference.THREAD_STATUS_NOT_STARTED:
        return "NOT_STARTED";
      case ThreadReference.THREAD_STATUS_RUNNING:
        return "RUNNING";
      case ThreadReference.THREAD_STATUS_SLEEPING:
        return "SLEEPING";
      case ThreadReference.THREAD_STATUS_UNKNOWN:
        return "UNKNOWN";
      case ThreadReference.THREAD_STATUS_WAIT:
        return "WAIT";
      case ThreadReference.THREAD_STATUS_ZOMBIE:
        return "ZOMBIE";
      default:
        return "UNDEFINED";
    }
  }
}
