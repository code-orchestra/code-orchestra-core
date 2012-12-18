package codeOrchestra.debugger;

import com.intellij.execution.ExecutionManager;
import com.intellij.execution.executors.DefaultDebugExecutor;
import com.intellij.ide.impl.ProjectUtil;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.registry.Registry;
import com.intellij.ui.AppIcon;
import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpoint;
import codeOrchestra.debugger.step.StepType;
import jetbrains.mps.debug.api.AbstractDebugSession;
import jetbrains.mps.debug.api.AbstractUiState;
import jetbrains.mps.debug.api.breakpoints.IBreakpoint;
import jetbrains.mps.debug.runtime.execution.DebuggerCommand;

import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public abstract class CodeOrchestraDebugSession<S extends AbstractUiState> extends AbstractDebugSession<S> {

  private volatile boolean myIsMute = false;

  protected abstract DebuggerEventProcessor getDebuggerEventProcessor();

  protected abstract void step(StepType type);

  protected CodeOrchestraDebugSession(Project p) {
    super(p);
  }

  @Override
  public void stepOver() {
    step(StepType.OVER);
  }

  @Override
  public void stepInto() {
    step(StepType.INTO);
  }

  @Override
  public void stepOut() {
    step(StepType.OUT);
  }

  protected void toFront() {
    if (!ApplicationManager.getApplication().isUnitTestMode()) {
      ExecutionManager.getInstance(getProject()).getContentManager().toFrontRunContent(DefaultDebugExecutor.getDebugExecutorInstance(), myProcessHandler);
      ApplicationManager.getApplication().invokeLater(new Runnable() {
        @Override
        public void run() {
          boolean focusWnd = Registry.is("debugger.mayBringFrameToFrontOnBreakpoint");
          ProjectUtil.focusProjectWindow(getProject(), focusWnd);
          if (!focusWnd) {
            AppIcon.getInstance().requestAttention(true);
          }
        }
      });
    }
  }

  @Override
  public void muteBreakpoints(final boolean mute) {
    final DebuggerEventProcessor eventsProcessor = getDebuggerEventProcessor();

    if (eventsProcessor.isAttached()) {
      eventsProcessor.getManagerThread().schedule(new DebuggerCommand(){
        @Override
        protected void action() throws Exception {
          if (myIsMute != mute) {
            Set<IBreakpoint> breakpoints = eventsProcessor.getBreakpointManager().getValidIBreakpoints();
            for (IBreakpoint bp : breakpoints) {
              if (bp instanceof ASBreakpoint) {
                ASBreakpoint breakpoint = (ASBreakpoint) bp;
                if (mute) {
                  breakpoint.removeRequest(eventsProcessor);
                } else {
                  breakpoint.createRequest(eventsProcessor);
                }
              }
            }
            myIsMute = mute;
            fireSessionMuted(CodeOrchestraDebugSession.this);
          }
        }
      });
    } else {
      myIsMute = mute;
      fireSessionMuted(CodeOrchestraDebugSession.this);
    }
  }

  @Override
  public boolean isMute() {
    return myIsMute;
  }

}
