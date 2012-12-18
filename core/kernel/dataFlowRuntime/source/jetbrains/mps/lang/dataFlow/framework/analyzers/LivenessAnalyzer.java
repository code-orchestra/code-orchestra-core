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
package jetbrains.mps.lang.dataFlow.framework.analyzers;

import jetbrains.mps.lang.dataFlow.framework.*;
import jetbrains.mps.lang.dataFlow.framework.instructions.ReadInstruction;
import jetbrains.mps.lang.dataFlow.framework.instructions.WriteInstruction;
import jetbrains.mps.lang.dataFlow.framework.instructions.Instruction;

import java.util.List;

public class LivenessAnalyzer implements DataFlowAnalyzer<VarSet> {
  public VarSet initial(Program p) {
    return new VarSet(p);
  }

  public VarSet merge(Program p, List<VarSet> input) {
    VarSet result = new VarSet(p);
    for (VarSet inputSet : input) {
      result.addAll(inputSet);
    }
    return result;
  }

  public VarSet fun(VarSet input, ProgramState s) {
    Instruction instruction = s.getInstruction();
    VarSet result = input;

    if (instruction instanceof ReadInstruction) {
      ReadInstruction read = (ReadInstruction) instruction;
      result.add(read.getVariableIndex());
    }

    if (instruction instanceof WriteInstruction) {
      WriteInstruction write = (WriteInstruction) instruction;
      result.remove(write.getVariableIndex());
    }

    return result;
  }

  public AnalysisDirection getDirection() {
    return AnalysisDirection.BACKWARD;
  }
}
