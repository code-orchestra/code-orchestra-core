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
package jetbrains.mps.newTypesystem.operation;

import jetbrains.mps.newTypesystem.state.State;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: Jan 17, 2011
 * Time: 9:53:43 PM
 */
public class SolveInequalitiesOperation extends AbstractOperation {
  private Runnable myAction = null;

  public SolveInequalitiesOperation(Runnable action) {
    myAction = action;
  }

  public String getPresentation() {
    return "Solving inequalities";
  }

  public void doUndo(State state) {
    state.getInequalities().setSolvingInProcess(false);
  }

  public void doRedo(State state) {
    state.getInequalities().setSolvingInProcess(true);
  }

  public void execute(State state) {
    state.getInequalities().setSolvingInProcess(true);
    if (myAction != null) {
      myAction.run();
      myAction = null;
    }
  }
}
