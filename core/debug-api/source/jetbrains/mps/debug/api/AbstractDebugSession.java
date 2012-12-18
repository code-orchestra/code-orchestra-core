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

import com.intellij.execution.process.ProcessHandler;
import com.intellij.openapi.project.Project;
import jetbrains.mps.debug.api.evaluation.DummyEvaluationProvider;
import jetbrains.mps.debug.api.evaluation.IEvaluationProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.util.annotation.ToRemove;
import jetbrains.mps.util.annotation.UseCarefully;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

public abstract class AbstractDebugSession<State extends AbstractUiState> {

  protected ProcessHandler myProcessHandler;
  private final List<SessionChangeListener> myListeners = new ArrayList<SessionChangeListener>();
  protected ExecutionState myExecutionState = ExecutionState.WaitingAttach;
  protected final AtomicReference<State> myUiState = new AtomicReference<State>(createUiState());
  protected IDebuggableFramesSelector myDebuggableFramesSelector = new DebuggableFramesSelector();
  protected Project myProject;

  public AbstractDebugSession(Project p) {
    myProject = p;
  }

  protected abstract State createUiState();

  public abstract void resume();

  public abstract void pause();

  public abstract void stop(boolean terminateTargetProcess);

  public abstract void stepOver();

  public abstract void stepInto();

  public abstract void stepOut();

  protected void setState(State oldState, @NotNull State newState) {
    setState(oldState, newState, true);
  }

  protected void setState(State oldState, @NotNull State newState, boolean fireEvents) {
    while (!myUiState.compareAndSet(oldState, newState)) {
      // TODO we do not care here if user selected something, we just replace old state. But we might do something more clever, like remember what user selected.
      oldState = getUiState();
    }
    if (fireEvents) {
      fireStateChanged();
    }
  }

  public boolean isPaused() {
    return myExecutionState.equals(ExecutionState.Paused);
  }

  public boolean isRunning() {
    return myExecutionState.equals(ExecutionState.Running);
  }

  public boolean isStopped() {
    return myExecutionState.equals(ExecutionState.Stopped);
  }

  public boolean isStepEnabled() {
    return isPaused() && getUiState().isPausedOnBreakpoint();
  }

  public void setProcessHandler(ProcessHandler processHandler) {
    myProcessHandler = processHandler;
  }

  public ProcessHandler getProcessHandler() {
    return myProcessHandler;
  }

  public IDebuggableFramesSelector getDebuggableFramesSelector() {
    return myDebuggableFramesSelector;
  }

  private List<SessionChangeListener> getListeners() {
    List<SessionChangeListener> listeners = new ArrayList<SessionChangeListener>();
    listeners.addAll(myListeners);
    return listeners;
  }

  protected void fireStateChanged() {
    for (SessionChangeListener listener : getListeners()) {
      listener.stateChanged(this);
    }
  }

  protected void fireSessionPaused(AbstractDebugSession debugSession) {
    for (SessionChangeListener listener : getListeners()) {
      listener.paused(debugSession);
    }
  }

  protected void fireSessionResumed(AbstractDebugSession debugSession) {
    for (SessionChangeListener listener : getListeners()) {
      listener.resumed(debugSession);
    }
  }

  protected void fireSessionMuted(AbstractDebugSession debugSession) {
    for (SessionChangeListener listener : getListeners()) {
      listener.muted(debugSession);
    }
  }

  public void addChangeListener(@NotNull SessionChangeListener listener) {
    myListeners.add(listener);
  }

  public void removeChangeListener(@NotNull SessionChangeListener listener) {
    myListeners.remove(listener);
  }

  //use from AbstractUiState only

  @UseCarefully
  public void trySetState(State oldState, State newState) {
    if (myUiState.compareAndSet(oldState, newState)) {
      fireStateChanged();
    }
  }

  public State getUiState() {
    return myUiState.get();
  }

  public boolean canShowEvaluationDialog() {
    return false;
  }

  public ExecutionState getExecutionState() {
    return myExecutionState;
  }

  @Deprecated
  @ToRemove(version = 2.0)
  public void showEvaluationDialog(IOperationContext operationContext) {
  }

  @Nullable
  public IEvaluationProvider getEvaluationProvider() {
    if (!canShowEvaluationDialog()) return null;
    return new DummyEvaluationProvider(this);
  }

  public void sessionRegistered(DebugSessionManagerComponent manager) {
  }

  public void sessionUnregistered(DebugSessionManagerComponent manager) {
  }

  public void muteBreakpoints(boolean mute) {
  }

  public boolean isMute() {
    return false;
  }

  public Project getProject() {
    return myProject;
  }

  public enum ExecutionState {
    Stopped,
    Running,
    Paused,
    WaitingAttach;
  }

}
