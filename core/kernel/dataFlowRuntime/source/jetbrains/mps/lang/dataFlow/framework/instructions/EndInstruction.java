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

import java.util.*;

public class EndInstruction extends Instruction {
  private Set<RetInstruction> myReturns = new HashSet<RetInstruction>();
  private Set<TryFinallyInfo> myRootTryFinallies = new HashSet<TryFinallyInfo>();

  public String commandPresentation() {
    return "end";
  }

  public void buildCaches() {
    super.buildCaches();
    for (Instruction i : getProgram().getInstructions()) {
      if (i instanceof RetInstruction) {
        myReturns.add((RetInstruction) i);
      }
    }
    for (TryFinallyInfo info : getProgram().getBlockInfos()) {
      if (info.getParent() == null) {
        myRootTryFinallies.add((TryFinallyInfo) info);
      }
    }
  }

  public List<ProgramState> pred(ProgramState s) {
    List<ProgramState> result = new ArrayList<ProgramState>();
    if (s.isReturnMode()) {
      for (RetInstruction ret : myReturns) {
        if (ret.getEnclosingBlock() == null) {
          result.add(new ProgramState(ret, false));
          result.add(new ProgramState(ret, true));
        }
      }
      for (TryFinallyInfo info : myRootTryFinallies) {
        result.add(new ProgramState(info.getEndTry(), true));
      }      
    }
    result.addAll(super.pred(s));
    return result;
  }

  public List<ProgramState> succ(ProgramState s) {
    return new ArrayList<ProgramState>();
  }
}
