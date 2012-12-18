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
import jetbrains.mps.lang.dataFlow.framework.Program.TryFinallyInfo;

import java.util.ArrayList;
import java.util.List;

public class RetInstruction extends Instruction {
  public RetInstruction() {
  }

  public List<ProgramState> succ(ProgramState s) {
    List<ProgramState> result = new ArrayList<ProgramState>();
    TryFinallyInfo blockInfo = getEnclosingBlock();
    if (blockInfo == null) {
      result.add(new ProgramState(getProgram().getEnd(), true));
    } else {
      if (isBefore(blockInfo.getFinally())) {
        result.add(new ProgramState(blockInfo.getFinally(), true));
      } else {
        result.add(new ProgramState(blockInfo.getEndTry(), true));
      }
    }
    return result;
  }

  public String commandPresentation() {
    return "ret";
  }
}
