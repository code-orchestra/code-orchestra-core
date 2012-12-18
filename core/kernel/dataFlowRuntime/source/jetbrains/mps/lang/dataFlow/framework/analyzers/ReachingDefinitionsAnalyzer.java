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

import jetbrains.mps.lang.dataFlow.framework.AnalysisDirection;
import jetbrains.mps.lang.dataFlow.framework.DataFlowAnalyzer;
import jetbrains.mps.lang.dataFlow.framework.Program;
import jetbrains.mps.lang.dataFlow.framework.ProgramState;
import jetbrains.mps.lang.dataFlow.framework.instructions.WriteInstruction;
import jetbrains.mps.lang.dataFlow.framework.instructions.Instruction;

import java.util.HashSet;
import java.util.Set;
import java.util.List;

public class ReachingDefinitionsAnalyzer implements DataFlowAnalyzer<Set<WriteInstruction>> {
  public Set<WriteInstruction> initial(Program p) {
    return new HashSet<WriteInstruction>();
  }

  public Set<WriteInstruction> merge(Program p, List<Set<WriteInstruction>> input) {
    Set<WriteInstruction> result = new HashSet<WriteInstruction>();
    for (Set<WriteInstruction> i : input) {
      result.addAll(i);
    }
    return result;
  }

  public Set<WriteInstruction> fun(Set<WriteInstruction> input, ProgramState s) {
    Instruction instruction = s.getInstruction();
    Set<WriteInstruction> result = input;
    if (instruction instanceof WriteInstruction) {
      WriteInstruction write = (WriteInstruction) instruction;

      for (WriteInstruction item : new HashSet<WriteInstruction>(result)) {
        if (write.getVariable().equals(item.getVariable())) {
          result.remove(item);
        }
      }

      result.add(write);
    }

    return result;
  }

  public AnalysisDirection getDirection() {
    return AnalysisDirection.FORWARD;
  }
}
