package codeOrchestra.actionScript.debugger.session;

import com.intellij.execution.ExecutionException;
import com.intellij.execution.ExecutionResult;
import com.intellij.execution.Executor;
import com.intellij.execution.configurations.RunProfileState;
import com.intellij.execution.process.ProcessHandler;
import com.intellij.execution.runners.ProgramRunner;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionScript.debugger.configuration.ASDebuggerSettings;
import codeOrchestra.actionScript.debugger.events.FDBEventsProcessor;
import flash.tools.debugger.Bootstrap;
import flash.tools.debugger.Session;
import flash.tools.debugger.SessionManager;
import flash.tools.debugger.VersionException;
import jetbrains.mps.debug.api.AbstractDebugSessionCreator;
import jetbrains.mps.debug.api.BreakpointManagerComponent;
import jetbrains.mps.debug.api.IDebuggerSettings;
import jetbrains.mps.debug.api.ToDebugAPI;
import jetbrains.mps.debug.api.run.DebuggerRunProfileState;
import jetbrains.mps.debug.runtime.execution.DebuggerCommand;
import jetbrains.mps.debug.runtime.execution.DebuggerManagerThread;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.io.IOException;

/**
 * @author Alexander Eliseyev
 */
public class ASDebugSessionCreator extends AbstractDebugSessionCreator {

  private static Logger LOG = Logger.getLogger(ASDebugSessionCreator.class);

  private ExecutionResult executionResult;

  private DebuggerManagerThread debuggerManagerThread;
  private SessionManager fdbSessionManager;
  private FDBEventsProcessor fdbEventsProcessor;

  private ASDebugSession debugSession;
  private ASDebuggerSettings asDebuggerSettings;

  private boolean myIsFailed;

  public ASDebugSessionCreator(Project project) {
    debuggerManagerThread = new DebuggerManagerThread();
    fdbSessionManager = Bootstrap.sessionManager();
    fdbEventsProcessor = new FDBEventsProcessor(BreakpointManagerComponent.getInstance(project), debuggerManagerThread);
    debugSession = new ASDebugSession(fdbEventsProcessor, project);
  }

  @Override
  public ASDebugSession getDebugSession() {
    return debugSession;
  }

  @Nullable
  @ToDebugAPI
  public ExecutionResult startSession(final Executor executor,
                                      final ProgramRunner runner,
                                      final RunProfileState state,
                                      Project project) throws ExecutionException {
    assert ThreadUtils.isEventDispatchThread() : "must be called from EDT only";

    asDebuggerSettings = getDebuggerSettings(state);
    fdbEventsProcessor.getReporter().setProcessName(asDebuggerSettings.getPresentation());

    startListeningForSession();
    try {
      executionResult = execute(executor, runner, state);
      if (executionResult == null) {
        fdbSessionCreateError("Can't start the process - execution result is empty");
        return null;
      }

      @NotNull ProcessHandler processHandler = executionResult.getProcessHandler();
      debugSession.setProcessHandler(processHandler);
      fdbEventsProcessor.getReporter().setProcessHandler(processHandler);
    } catch (ExecutionException e) {
      fdbSessionCreateError("Can't start the process: " + e.getMessage());
      throw e;
    }
    return executionResult;
  }

  private void startListeningForSession() throws ExecutionException {
    debuggerManagerThread.schedule(new DebuggerCommand() {
      @Override
      protected void action() throws Exception {
        try {
          fdbEventsProcessor.getReporter().reportInformation("Waiting for Flash Player to connect");

          fdbSessionManager.startListening();
          final Session fdbSession = fdbSessionManager.accept(null);

          fdbEventsProcessor.getReporter().reportInformation("Flash Player connected");

          // Bind to session
          boolean correctVersion = true;
          try {
            fdbSession.bind();
          } catch (VersionException e) {
            correctVersion = false;
            LOG.warning("Bad debugger/player version number");
          }

          // Poke the session
          int preference = fdbSession.getPreference(SessionManager.PLAYER_SUPPORTS_GET);
          if (preference == 0) {
            LOG.warning("Debug Player does not support 'get'");
          }

          ASDebugSourceLocator sourceLocator = new ASDebugSourceLocator();
          sourceLocator.addSources(asDebuggerSettings.getSourcePaths());
          prepareFDBSession(fdbSession, sourceLocator, correctVersion);

          fdbEventsProcessor.commitFDBSession(fdbSession);
        } catch (IOException e) {
          fdbEventsProcessor.getReporter().reportError("Can't obtain Flash Player connection, accept timed out");
          fdbEventsProcessor.getReporter().reportError("Make sure you use the Content Debugger version of the Flash Player");
        }
      }
    });
  }

  private void prepareFDBSession(Session fdbSession, ASDebugSourceLocator sourceLocator, boolean correctVersion) {
    fdbSession.setSourceLocator(sourceLocator);
  }

  private void fdbSessionCreateError(String message) {
    fdbEventsProcessor.getReporter().reportError(message);
    fail();
  }

  private void fail() {
    synchronized (this) {
      if (myIsFailed) {
        return;
      }
      myIsFailed = true;
    }
    fdbEventsProcessor.stop(false);
  }

  private ASDebuggerSettings getDebuggerSettings(RunProfileState state) {
    if (state instanceof DebuggerRunProfileState) {
      DebuggerRunProfileState debuggerRunProfileState = (DebuggerRunProfileState) state;
      IDebuggerSettings debuggerSettings = debuggerRunProfileState.getDebuggerSettings();

      if (debuggerSettings != null && debuggerSettings instanceof ASDebuggerSettings) {
        return (ASDebuggerSettings) debuggerSettings;
      }
    }
    throw new IllegalArgumentException("Illegal run profile state: " + state);
  }

}
