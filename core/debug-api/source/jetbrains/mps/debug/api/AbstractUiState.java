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
package jetbrains.mps.debug.api;

import jetbrains.mps.debug.api.programState.IStackFrame;
import jetbrains.mps.debug.api.programState.IThread;
import jetbrains.mps.debug.api.programState.IValue;
import jetbrains.mps.debug.api.programState.IWatchable;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Collections;
import java.util.List;
import java.util.Map;

public abstract class AbstractUiState {
  protected static final int NO_FRAME = -1;
  protected final AbstractDebugSession myAbstractDebugSession;

  protected AbstractUiState(AbstractDebugSession session) {
    myAbstractDebugSession = session;
  }

  @Nullable
  public abstract IThread getThread();

  @NotNull
  public abstract List<IThread> getThreads();

  @Nullable
  public abstract IStackFrame getStackFrame();

  public abstract boolean isPausedOnBreakpoint();

  protected abstract IThread findThread();

  // changes state on user selection
  protected abstract AbstractUiState selectThreadInternal(@Nullable IThread thread);

  public boolean isMultithreaded() {
    return true;
  }

  // is going to be removed, implement selectFrameInternal(int)
  @Deprecated
  protected AbstractUiState selectFrameInternal(@Nullable IStackFrame frame) {
    return this;
  }

  // this implementation is going to be removed
  // the method is going to be abstract
  // it is here for not breaking existing user code
  protected AbstractUiState selectFrameInternal(int frame) {
    if (frame == NO_FRAME) {
      return selectFrameInternal(null);
    } else {
      return selectFrameInternal(getThread().getFrames().get(frame));
    }
  }

  //impl
  @Nullable
  @Deprecated
  protected IStackFrame findStackFrame() {
    int index = findStackFrameIndex();
    if (index == NO_FRAME) {
      return null;
    }
    return getThread().getFrames().get(index);
  }

  //impl
  protected int findStackFrameIndex() {
    IThread thread = getThread();
    if (thread == null) {
      return NO_FRAME;
    }
    if (thread.getFramesCount() > 0) {
      return myAbstractDebugSession.getDebuggableFramesSelector().findDeepestDebuggableFrameIndex(thread.getFrames());
    }
    return NO_FRAME;
  }


  public void selectThread(@Nullable IThread thread) {
    AbstractUiState newState = selectThreadInternal(thread);
    if (newState != this) {
      myAbstractDebugSession.trySetState(this, newState);
    }
  }

  public void selectFrame(int frame) {
    AbstractUiState newState = selectFrameInternal(frame);
    if (newState != this) {
      myAbstractDebugSession.trySetState(this, newState);
    }
  }

  @NotNull
  public List<IStackFrame> getStackFrames() {
    IThread thread = getThread();
    if (thread != null) {
      return thread.getFrames();
    }
    return Collections.emptyList();
  }

  public int getStackFramesCount() {
    IThread thread = getThread();
    if (thread != null) {
      return thread.getFramesCount();
    }
    return 0;
  }

  @Nullable
  public IStackFrame getStackFrame(int index) {
    assert index >= 0;
    List<IStackFrame> frames = getStackFrames();
    if (index >= frames.size()){
      return null;
    }
    return frames.get(index);
  }

  // todo is this method really used?
  @NotNull
  public Map<IWatchable, IValue> getWatchableValues() {
    IStackFrame stackFrame = getStackFrame();
    if (stackFrame != null) {
      return stackFrame.getWatchableValues();
    }
    return Collections.emptyMap();
  }

  @NotNull
  public List<IWatchable> getWatchables() {
    IStackFrame stackFrame = getStackFrame();
    if (stackFrame != null) {
      return stackFrame.getVisibleWatchables();
    }
    return Collections.emptyList();
  }

  @Nullable
  public IValue getVariableValue(IWatchable variable) {
    IStackFrame stackFrame = getStackFrame();
    if (stackFrame != null) {
      return stackFrame.getValue(variable);
    }
    return null;
  }

  @Nullable
  public String getSourceFileName() {
    IStackFrame stackFrame = getStackFrame();
    if (stackFrame == null) return null;
    return stackFrame.getLocation().getFileName();
  }

  public int getPosition() {
    IStackFrame stackFrame = getStackFrame();
    if (stackFrame == null) return 0;
    return stackFrame.getLocation().getLineNumber();
  }

}
