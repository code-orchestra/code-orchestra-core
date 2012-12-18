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
package jetbrains.mps.lang.dataFlow.framework.instructions;

import jetbrains.mps.lang.dataFlow.framework.ProgramState;
import jetbrains.mps.lang.dataFlow.framework.StructuralProgramBuilder.Position;

import java.util.List;

public class IfJumpInstruction extends Instruction {
  private int myJumpTo;

  public IfJumpInstruction() {
  }

  public int getJumpTo() {
    return myJumpTo;
  }

  public void setJumpTo(int jumpTo) {
    myJumpTo = jumpTo;
  }

  public void updateJumps(int jumpTo) {
    getProgram().get(jumpTo).removeJump(this);
    getProgram().get(myJumpTo).addJump(this);
  }

  public void setJumpTo(final Position position) {
    myJumpTo = position.getPosition();
  }

  public void buildCaches() {
    super.buildCaches();
    getProgram().get(myJumpTo).addJump(this);
  }

  public List<ProgramState> succ(ProgramState s) {
    List<ProgramState> result = super.succ(s);
    result.add(new ProgramState(getProgram().get(myJumpTo), s.isReturnMode()));
    return result;    
  }

  public String commandPresentation() {
    return "ifjump " + myJumpTo;
  }
}
