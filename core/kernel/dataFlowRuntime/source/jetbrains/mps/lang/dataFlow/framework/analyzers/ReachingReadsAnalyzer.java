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

import jetbrains.mps.lang.dataFlow.framework.instructions.WriteInstruction;
import jetbrains.mps.lang.dataFlow.framework.instructions.Instruction;
import jetbrains.mps.lang.dataFlow.framework.instructions.ReadInstruction;
import jetbrains.mps.lang.dataFlow.framework.DataFlowAnalyzer;
import jetbrains.mps.lang.dataFlow.framework.Program;
import jetbrains.mps.lang.dataFlow.framework.ProgramState;
import jetbrains.mps.lang.dataFlow.framework.AnalysisDirection;

import java.util.Set;
import java.util.HashSet;
import java.util.List;

public class ReachingReadsAnalyzer implements DataFlowAnalyzer<Set<ReadInstruction>> {
  public Set<ReadInstruction> initial(Program p) {
    return new HashSet<ReadInstruction>();
  }

  public Set<ReadInstruction> merge(Program p, List<Set<ReadInstruction>> input) {
    Set<ReadInstruction> result = new HashSet<ReadInstruction>();
    for (Set<ReadInstruction> i : input) {
      result.addAll(i);
    }
    return result;
  }

  public Set<ReadInstruction> fun(Set<ReadInstruction> input, ProgramState s) {
    Instruction instruction = s.getInstruction();
    Set<ReadInstruction> result = input;
    if (instruction instanceof WriteInstruction) {
      WriteInstruction write = (WriteInstruction) instruction;

      for (ReadInstruction item : new HashSet<ReadInstruction>(result)) {
        Object variable = write.getVariable();
        if (variable != null && variable.equals(item.getVariable())) {
          result.remove(item);
        }
      }

    }

    if (instruction instanceof ReadInstruction) {
      result.add((ReadInstruction) instruction);
    }

    return result;
  }

  public AnalysisDirection getDirection() {
    return AnalysisDirection.BACKWARD;
  }
}

