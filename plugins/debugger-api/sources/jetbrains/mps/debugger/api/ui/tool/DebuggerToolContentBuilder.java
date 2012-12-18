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
package jetbrains.mps.debugger.api.ui.tool;

import com.intellij.execution.ExecutionResult;
import com.intellij.execution.Executor;
import com.intellij.execution.configurations.RunProfile;
import com.intellij.execution.runners.ExecutionEnvironment;
import com.intellij.execution.runners.ProgramRunner;
import com.intellij.execution.runners.RestartAction;
import com.intellij.execution.ui.ExecutionConsole;
import com.intellij.execution.ui.ExecutionConsoleEx;
import com.intellij.execution.ui.RunContentDescriptor;
import com.intellij.execution.ui.RunnerLayoutUi;
import com.intellij.execution.ui.actions.CloseAction;
import com.intellij.execution.ui.layout.PlaceInGrid;
import com.intellij.openapi.Disposable;
import com.intellij.openapi.actionSystem.ActionGroup;
import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.ActionPlaces;
import com.intellij.openapi.actionSystem.DefaultActionGroup;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Disposer;
import com.intellij.openapi.util.IconLoader;
import com.intellij.ui.content.Content;
import com.intellij.ui.content.tabs.PinToolwindowTabAction;
import jetbrains.mps.debugger.api.ui.actions.DebugTool_ActionGroup;
import jetbrains.mps.debugger.api.ui.tool.DebuggerToolPanel;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import javax.swing.JComponent;
import java.util.ArrayList;

public class DebuggerToolContentBuilder implements Disposable {
  @NonNls
  private static final String JAVA_RUNNER = "JavaRunner";

  private final ProgramRunner myRunner;
  private final Project myProject;
  private final ArrayList<Disposable> myDisposeables = new ArrayList<Disposable>();
  private final boolean myReuseProhibited = false;
  private final ExecutionResult myExecutionResult;
  private final Executor myExecutor;
  private final ExecutionEnvironment myEnvironment;

  public DebuggerToolContentBuilder(Project project, ProgramRunner runner, Executor executor, ExecutionResult executionResult, ExecutionEnvironment env) {
    myProject = project;
    myRunner = runner;
    myExecutor = executor;
    myExecutionResult = executionResult;
    myEnvironment = env;
  }

  public void dispose() {
    for (Disposable disposable : myDisposeables) {
      disposable.dispose();
    }
  }

  private RunContentDescriptor createDescriptor() {
    RunProfile profile = myEnvironment.getRunProfile();

    ExecutionConsole console = myExecutionResult.getExecutionConsole();
    String runnerType = console instanceof ExecutionConsoleEx ? JAVA_RUNNER + "." + ((ExecutionConsoleEx) console).getExecutionConsoleId() : JAVA_RUNNER;
    RunnerLayoutUi ui = RunnerLayoutUi.Factory.getInstance(myProject).create(runnerType, myExecutor.getId(), profile.getName(), this);

    if (ApplicationManager.getApplication().isUnitTestMode()) {
      return createDescriptorInternal(ui, profile);
    }

    buildUi(ui, console);

    MyRunContentDescriptor contentDescriptor = createDescriptorInternal(ui, profile);
    ui.getOptions().setLeftToolbar(createActionToolbar(ui, contentDescriptor), ActionPlaces.UNKNOWN);

    return contentDescriptor;
  }

  private MyRunContentDescriptor createDescriptorInternal(RunnerLayoutUi ui, RunProfile profile) {
    return new MyRunContentDescriptor(profile, myExecutionResult, myReuseProhibited, ui.getComponent(), this);
  }

  private void buildUi(RunnerLayoutUi ui, ExecutionConsole console) {
    ui.getOptions().setMoveToGridActionEnabled(true).setMinimizeActionEnabled(true);

    new DebuggerToolPanel(myProject, myExecutionResult.getProcessHandler(), ui);

    Content consoleContent = ui.createContent("Console2.0", console.getComponent(), "Console", IconLoader.getIcon("/debugger/console.png"), console.getPreferredFocusableComponent());
    consoleContent.setSearchComponent(console.getComponent());
    consoleContent.setCloseable(false);
    ui.addContent(consoleContent, 1, PlaceInGrid.center, false);
  }

  private ActionGroup createActionToolbar(RunnerLayoutUi ui, RunContentDescriptor contentDescriptor) {
    DefaultActionGroup actionGroup = new DefaultActionGroup();

    // TODO use context to get data to the action
    RestartAction restartAction = new RestartAction(myExecutor, myRunner, myExecutionResult.getProcessHandler(), IconLoader.getIcon("/actions/refreshUsages.png"), contentDescriptor, myEnvironment);
    restartAction.registerShortcut(ui.getComponent());
    actionGroup.add(restartAction);

    actionGroup.add(ActionManager.getInstance().getAction(DebugTool_ActionGroup.ID));

    actionGroup.addAll(myExecutionResult.getActions());

    actionGroup.addSeparator();
    actionGroup.add(ui.getOptions().getLayoutActions());
    actionGroup.addSeparator();
    actionGroup.add(PinToolwindowTabAction.getPinAction());
    actionGroup.add(new CloseAction(myExecutor, contentDescriptor, myProject));

    return actionGroup;
  }

  /**
   * @param reuseContent see {@link RunContentDescriptor#myContent}
   */
  public RunContentDescriptor showRunContent(final RunContentDescriptor reuseContent) {
    final RunContentDescriptor descriptor = createDescriptor();
    if (reuseContent != null) descriptor.setAttachedContent(reuseContent.getAttachedContent());
    return descriptor;
  }

  private static class MyRunContentDescriptor extends RunContentDescriptor {
    private final boolean myReuseProhibited;
    private final Disposable myAdditionalDisposable;

    public MyRunContentDescriptor(final RunProfile profile, final ExecutionResult executionResult, final boolean reuseProhibited, final JComponent component, @NotNull Disposable additionalDisposable) {
      super(executionResult.getExecutionConsole(), executionResult.getProcessHandler(), component, profile.getName(), profile.getIcon());
      myReuseProhibited = reuseProhibited;
      myAdditionalDisposable = additionalDisposable;
    }

    public boolean isContentReuseProhibited() {
      return myReuseProhibited;
    }

    public void dispose() {
      Disposer.dispose(myAdditionalDisposable);
      super.dispose();
    }
  }
}