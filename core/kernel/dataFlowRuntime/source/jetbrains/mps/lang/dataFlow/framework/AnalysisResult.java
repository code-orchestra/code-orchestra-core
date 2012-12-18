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

import java.util.*;

public class AnalysisResult<E> {
  private Map<ProgramState, E> myResult;
  private DataFlowAnalyzer<E> myAnalyzer;
  private Map<Instruction, E> myInstructionsResult;
  private Program myProgram;

  AnalysisResult(Program program, DataFlowAnalyzer<E> analyzer, Map<ProgramState, E> result, Map<Instruction, E> instrResult) {
    myProgram = program;
    myAnalyzer = analyzer;
    myResult = result;
    myInstructionsResult = instrResult;
  }

  public E get(Instruction i) {
    if (myInstructionsResult.containsKey(i)) {
      return myInstructionsResult.get(i);
    }
    return myAnalyzer.initial(myProgram);
  }

  public E get(ProgramState s) {
    if (myResult.containsKey(s)) {
      return myResult.get(s);
    }
    return myAnalyzer.initial(myProgram);
  }

  public Set<ProgramState> getStates() {
    return Collections.unmodifiableSet(myResult.keySet());
  }

  public String toString() {
    StringBuilder r = new StringBuilder();
    for (int i = 0; i < myProgram.size(); i++) {
      Instruction instruction = myProgram.get(i);
      r.append(instruction).append(" ");
      r.append(toString(myInstructionsResult.get(instruction)));
      r.append("\n");
    }
    return r.toString();
  }

  private String toString(E e) {
    if (e instanceof Set) {
      return setToString((Set) e);
    }
    return "" + e;
  }

  private String setToString(Set set) {
    List<String> strings = new ArrayList<String>();
    for (Object o : set) {
      strings.add("" + o);
    }
    Collections.sort(strings);
    return strings.toString();
  }
}
