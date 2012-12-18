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
package jetbrains.mps.lang.dataFlow.framework;

import jetbrains.mps.lang.dataFlow.framework.instructions.Instruction;

import java.util.List;

public class ProgramState {  
  private Instruction myInstruction;
  private boolean myReturnMode;

  public ProgramState(Instruction instruction, boolean returnMode) {
    myInstruction = instruction;
    myReturnMode = returnMode;
  }

  public Instruction getInstruction() {
    return myInstruction;
  }

  public boolean isReturnMode() {
    return myReturnMode;
  }

  public boolean isStart() {
    return !isReturnMode() && myInstruction.isStart();
  }

  public List<ProgramState> succ() {
    return myInstruction.succ(this);
  }

  public List<ProgramState> pred() {
    return myInstruction.pred(this);
  }

  public int getIndex() {
    if (myReturnMode) {
      return myInstruction.getIndex() << 1;
    } else {
      return (myInstruction.getIndex() << 1) + 1;
    }
  }

  public String toString() {
    return "(state " + myInstruction + ", " + myReturnMode + ")";
  }

  public boolean equals(Object obj) {
    if (!(obj instanceof ProgramState)) {
      return false;
    }

    ProgramState s = (ProgramState) obj;
    return s.getIndex() == getIndex();
  }

  public int hashCode() {
    return getIndex();
  }
}
