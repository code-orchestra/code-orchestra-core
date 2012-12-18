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

import jetbrains.mps.lang.dataFlow.framework.instructions.*;

import java.util.*;

public class AnalyzerRunner<E> {
  protected Program myProgram;
  protected DataFlowAnalyzer<E> myAnalyzer;

  public AnalyzerRunner(Program program, DataFlowAnalyzer<E> analyzer) {
    myProgram = program;
    myAnalyzer = analyzer;
  }

  public AnalysisResult analyze() {
    Map<ProgramState, E> stateValues = doAnalyze();
    Map<Instruction, E> result = new HashMap<Instruction, E>();
    for (Instruction i : myProgram.getInstructions()) {
      List<E> input = new ArrayList<E>();
      input.add(stateValues.get(new ProgramState(i, true)));
      input.add(stateValues.get(new ProgramState(i, false)));
      result.put(i, myAnalyzer.merge(myProgram, input));
    }
    return new AnalysisResult<E>(myProgram, myAnalyzer, stateValues, result);
  }

  private Map<ProgramState, E> doAnalyze() {
    Map<ProgramState, E> stateValues = new ProgramStateMap<E>(myProgram);

    for (ProgramState ps : myProgram.getStates()) {
      stateValues.put(ps, myAnalyzer.initial(myProgram));
    }

    AnalysisDirection direction = myAnalyzer.getDirection();

    Map<ProgramState, List<ProgramState>> dependencies = new ProgramStateMap<List<ProgramState>>(myProgram);
    Map<ProgramState, List<ProgramState>> dependents = new ProgramStateMap<List<ProgramState>>(myProgram);
    for (ProgramState ps : myProgram.getStates()) {
      dependencies.put(ps, direction.dependencies(ps));
      dependents.put(ps, direction.dependents(ps));
    }

    Queue<ProgramState> workList = new LinkedList<ProgramState>();
    for (Instruction i : myProgram.getInstructions()) {
      workList.add(new ProgramState(i, false));
      workList.add(new ProgramState(i, true));
    }

    while (!workList.isEmpty()) {
      ProgramState current = workList.remove();

      List<E> input = new ArrayList<E>();
      for (ProgramState s : dependencies.get(current)) {
        input.add(stateValues.get(s));
      }

      E oldValue = stateValues.get(current);
      E mergedValue = myAnalyzer.merge(myProgram, input);
      E newValue = myAnalyzer.fun(mergedValue, current);

      if (!newValue.equals(oldValue)) {
        stateValues.put(current, newValue);
        for (ProgramState s : dependents.get(current)) {
          workList.add(s);
        }
      }
    }

    return stateValues;
  }

  public Program getProgramCopy() {
    return myProgram;
  }
}
