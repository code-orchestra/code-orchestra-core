package codeOrchestra.javaScript.debugger.session;

import com.intellij.execution.ExecutionException;
import com.intellij.execution.ExecutionResult;
import com.intellij.execution.Executor;
import com.intellij.execution.configurations.RunProfileState;
import com.intellij.execution.process.ProcessHandler;
import com.intellij.execution.runners.ProgramRunner;
import com.intellij.openapi.project.Project;
import codeOrchestra.javaScript.debugger.configuration.JSDebuggerSettings;
import codeOrchestra.javaScript.debugger.events.ChromeEventsProcessor;
import codeOrchestra.javaScript.debugger.vm.TabConnector;
import codeOrchestra.javaScript.debugger.vm.TabConnectorProvider;
import codeOrchestra.javaScript.debugger.vm.VmConnectException;
import codeOrchestra.javaScript.debugger.vm.v8.V8TabConnectorProvider;
import codeOrchestra.javaScript.debugger.vm.wip.WIPTabConnectorProvider;
import jetbrains.mps.debug.api.*;
import jetbrains.mps.debug.api.run.DebuggerRunProfileState;
import jetbrains.mps.debug.runtime.execution.DebuggerCommand;
import jetbrains.mps.debug.runtime.execution.DebuggerManagerThread;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/**
 * @author Alexander Eliseyev
 */
public class JSDebugSessionCreator extends AbstractDebugSessionCreator {

  private static Logger LOG = Logger.getLogger(JSDebugSessionCreator.class);

  public static final int WAITING_FOR_VM_INTERVAL = 100;
  public static final int CONNECTION_TIMEOUT = 60000;

  private ExecutionResult executionResult;

  private DebuggerManagerThread debuggerManagerThread;

  private JSDebugSession debugSession;
  private JSDebuggerSettings debuggerSettings;
  private TabConnectorProvider tabConnectorProvider;

  private ChromeEventsProcessor chromeEventProcessor;

  private boolean myIsFailed;

  public JSDebugSessionCreator(Project project, TabConnectorProvider tabConnectorProvider) {
    this.debuggerManagerThread = new DebuggerManagerThread();
    this.chromeEventProcessor = new ChromeEventsProcessor(BreakpointManagerComponent.getInstance(project), debuggerManagerThread);
    this.debugSession = new JSDebugSession(project, chromeEventProcessor);
    this.tabConnectorProvider = tabConnectorProvider;
  }

  @Nullable
  @ToDebugAPI
  public ExecutionResult startSession(final Executor executor,
                                      final ProgramRunner runner,
                                      final RunProfileState state,
                                      Project project) throws ExecutionException {
    assert ThreadUtils.isEventDispatchThread() : "must be called from EDT only";

    debuggerSettings = getDebuggerSettings(state);

    startListeningForJavascriptVM();
    try {
      executionResult = execute(executor, runner, state);
      if (executionResult == null) {
        chromeSessionCreateError("Can't start the process - execution result is empty");
        return null;
      }

      @NotNull ProcessHandler processHandler = executionResult.getProcessHandler();
      debugSession.setProcessHandler(processHandler);

      chromeEventProcessor.getReporter().setProcessHandler(processHandler);
    } catch (ExecutionException e) {
      chromeSessionCreateError("Can't start the process: " + e.getMessage());
      throw e;
    }
    return executionResult;
  }

  private void startListeningForJavascriptVM() throws ExecutionException {
    debuggerManagerThread.schedule(new DebuggerCommand() {
      @Override
      protected void action() throws Exception {
        int timeout = CONNECTION_TIMEOUT;

        while (timeout > 0) {
          Thread.sleep(WAITING_FOR_VM_INTERVAL);

          try {
            TabConnector tabConnector = tabConnectorProvider.get(debuggerSettings);
            chromeEventProcessor.commitTabConnector(tabConnector);
            return;
          } catch (VmConnectException vce) {
            if (!vce.shouldRetry()) {
              chromeSessionCreateError("Can't connect to Chrome VM: " + vce.getMessage());
              return;
            }
          }

          timeout -= WAITING_FOR_VM_INTERVAL;
        }
      }
    });
  }

  private void chromeSessionCreateError(String message) {
    chromeEventProcessor.getReporter().reportError(message);
    fail();
  }

  private void fail() {
    synchronized (this) {
      if (myIsFailed) {
        return;
      }
      myIsFailed = true;
    }
    chromeEventProcessor.stop();
  }

  private JSDebuggerSettings getDebuggerSettings(RunProfileState state) {
    if (state instanceof DebuggerRunProfileState) {
      DebuggerRunProfileState debuggerRunProfileState = (DebuggerRunProfileState) state;
      IDebuggerSettings debuggerSettings = debuggerRunProfileState.getDebuggerSettings();

      if (debuggerSettings != null && debuggerSettings instanceof JSDebuggerSettings) {
        return (JSDebuggerSettings) debuggerSettings;
      }
    }
    throw new IllegalArgumentException("Illegal run profile state: " + state);
  }

  @Override
  public AbstractDebugSession getDebugSession() {
    return debugSession;
  }

}