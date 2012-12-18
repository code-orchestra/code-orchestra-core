package jetbrains.mps.nanoc.debug;

/*Generated by MPS */

import jetbrains.mps.debug.api.AbstractDebugSession;
import jetbrains.mps.nanoc.debug.events.GDBEventsHandler;
import jetbrains.mps.nanoc.debug.requests.GDBRequestManager;
import com.intellij.openapi.project.Project;
import jetbrains.mps.nanoc.debug.requests.ResumeRequest;
import jetbrains.mps.nanoc.debug.answer.ResultAnswer;
import java.util.List;
import jetbrains.mps.nanoc.debug.answer.StreamAnswer;
import jetbrains.mps.nanoc.debug.requests.PauseRequest;
import jetbrains.mps.nanoc.debug.requests.StepRequest;
import jetbrains.mps.smodel.IOperationContext;
import com.intellij.execution.process.ProcessHandler;
import jetbrains.mps.debug.api.BreakpointManagerComponent;
import jetbrains.mps.nanoc.debug.events.GDBEventsAdapter;
import jetbrains.mps.nanoc.debug.answer.AsyncAnswer;
import jetbrains.mps.nanoc.debug.requests.StackInfoRequest;
import jetbrains.mps.nanoc.debug.programState.DefaultThread;
import jetbrains.mps.debug.api.DebugSessionManagerComponent;
import java.util.Set;

public class CppDebugSession extends AbstractDebugSession<CppUiState> {
  private GDBEventsHandler myEventsHandler;
  private GDBRequestManager myRequestManager;
  private String mySourceGen;

  @Deprecated
  public CppDebugSession(Project p) {
    super(p);
  }

  public CppDebugSession(Project p, String sourceGen) {
    super(p);
    mySourceGen = sourceGen;
  }

  protected CppUiState createUiState() {
    return new CppUiStateImpl(this);
  }

  public void resume() {
    myRequestManager.createRequest(new ResumeRequest() {
      public void onRequestFulfilled(ResultAnswer answer, List<StreamAnswer> receivedStreamAnswers) {
        myExecutionState = AbstractDebugSession.ExecutionState.Running;
        setState(getUiState(), new CppUiStateImpl(CppDebugSession.this));
      }
    });
  }

  public void pause() {
    myRequestManager.createRequest(new PauseRequest() {
      public void onRequestFulfilled(ResultAnswer answer, List<StreamAnswer> receivedStreamAnswers) {
      }
    });
  }

  public void stop(boolean terminateTargetProcess) {
  }

  public void stepOver() {
    myExecutionState = AbstractDebugSession.ExecutionState.Running;
    myRequestManager.createRequest(new StepRequest() {
      public void onRequestFulfilled(ResultAnswer answer, List<StreamAnswer> receivedStreamAnswers) {
      }
    });
  }

  public void stepInto() {
  }

  public void stepOut() {
  }

  public void showEvaluationDialog(IOperationContext operationContext) {
  }

  public void setProcessHandler(ProcessHandler processHandler) {
    super.setProcessHandler(processHandler);
    myEventsHandler = new GDBEventsHandler(processHandler);
    myRequestManager = new GDBRequestManager(myEventsHandler, getProject().getComponent(BreakpointManagerComponent.class));
  }

  /*package*/ void setupBreakpointListener() {
    myEventsHandler.addEventListener(new GDBEventsAdapter() {
      public void paused(AsyncAnswer answer, ProcessHandler gdbProcess) {
        StackInfoRequest request = new StackInfoRequest() {
          public void onRequestFulfilled(ResultAnswer answer, List<StreamAnswer> receivedStreamAnswers) {
            doPause(answer);
          }
        };
        myRequestManager.createRequest(request);
      }

      public void processTerminated(ProcessHandler gdbProcess) {
        doTerminateProcess();
      }

      public void gdbProcessTerminated(ProcessHandler processHandler) {
        doTerminateProcess();
      }
    });
    myExecutionState = AbstractDebugSession.ExecutionState.Running;
  }

  private void doPause(ResultAnswer resultAnswer) {
    myExecutionState = AbstractDebugSession.ExecutionState.Paused;
    new DefaultThread(resultAnswer, mySourceGen, this) {
      public void whenCreated() {
        CppUiState state = getUiState();
        setState(state, new CppUiStateImpl(CppDebugSession.this, this));
      }
    };
  }

  private void doTerminateProcess() {
    if (myExecutionState != AbstractDebugSession.ExecutionState.Stopped) {
      myExecutionState = AbstractDebugSession.ExecutionState.Stopped;
      setState(getUiState(), new CppUiStateImpl(this));
    }
  }

  public GDBEventsHandler getGDBEventsHandler() {
    return myEventsHandler;
  }

  public GDBRequestManager getGDBRequestManager() {
    return myRequestManager;
  }

  public static void performAllSessionsAction(Project p, CppDebugSession.DebugSessionAction action) {
    DebugSessionManagerComponent debugSessionManager = DebugSessionManagerComponent.getInstance(p);
    Set<AbstractDebugSession> debugSessions = debugSessionManager.getDebugSessions();
    for (AbstractDebugSession session : debugSessions) {
      if (session instanceof CppDebugSession) {
        action.run((CppDebugSession) session);
      }
    }
  }

  public static interface DebugSessionAction {
    public void run(CppDebugSession debugSession);
  }
}
