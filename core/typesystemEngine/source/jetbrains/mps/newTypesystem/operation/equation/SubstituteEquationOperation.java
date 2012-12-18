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
package jetbrains.mps.newTypesystem.operation.equation;

import jetbrains.mps.newTypesystem.operation.AbstractOperation;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.smodel.SNode;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: Oct 8, 2010
 * Time: 1:19:19 PM
 */
public class SubstituteEquationOperation extends AbstractOperation {
  private final AddEquationOperation myAdded;
  private final RemoveEquationOperation myRemoved;

  public SubstituteEquationOperation(SNode key, SNode prev, SNode cur, SNode source) {
    myAdded = new AddEquationOperation(key, cur, source, null);
    myRemoved = new RemoveEquationOperation(key, prev, source);
    mySource = source;
  }

  public void doUndo(State state) {
    myAdded.doUndo(state);
    myRemoved.doUndo(state);
  }

  public void doRedo(State state) {
    myRemoved.doRedo(state);
    myAdded.doRedo(state);
  }

  public String getPresentation() {
    return myRemoved.getShortPresentation() + " substituted with " +
      myAdded.getShortPresentation();
  }
}
