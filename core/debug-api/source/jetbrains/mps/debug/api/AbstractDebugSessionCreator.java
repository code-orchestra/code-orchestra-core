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

import com.intellij.execution.ExecutionException;
import com.intellij.execution.ExecutionResult;
import com.intellij.execution.Executor;
import com.intellij.execution.configurations.RunProfileState;
import com.intellij.execution.runners.ProgramRunner;
import com.intellij.openapi.project.Project;
import jetbrains.mps.logging.Logger;

/**
 * Created by IntelliJ IDEA.
 * User: User
 * Date: 16.04.2010
 * Time: 17:59:46
 * To change this template use File | Settings | File Templates.
 */
public abstract class AbstractDebugSessionCreator {
  private static Logger LOG = Logger.getLogger(AbstractDebugSessionCreator.class);

  public ExecutionResult startSession(Executor executor, ProgramRunner runner, RunProfileState state, Project project) throws ExecutionException {
    return execute(executor, runner, state);
  }

  protected ExecutionResult execute(Executor executor, ProgramRunner runner, RunProfileState state) throws ExecutionException {
    return state.execute(executor, runner);
  }

  public abstract AbstractDebugSession getDebugSession();
}
