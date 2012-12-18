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

import java.util.List;
import java.util.ArrayList;

public class EndTryInstruction extends Instruction {

  private TryFinallyInfo myInfo;
  private List<RetInstruction> myReturns = new ArrayList<RetInstruction>();

  public String commandPresentation() {
    return "endTry";
  }

  public void buildCaches() {
    super.buildCaches();
    for (TryFinallyInfo info : getProgram().getBlockInfos()) {
      if (info.getEndTry() == this) {
        myInfo = info;
        break;
      }
    }

    int start = myInfo.getFinally().getIndex();
    int end = myInfo.getEndTry().getIndex();



    for (Instruction i : getProgram().getInstructions().subList(start + 1, end)) {
      if (i instanceof RetInstruction &&
        i.getEnclosingBlock() == myInfo &&
        i.isBefore(this)) {                     
        myReturns.add((RetInstruction) i);
      }
    }
  }

  public List<ProgramState> succ(ProgramState s) {
    if (!s.isReturnMode()) {
      return super.succ(s);
    } else {
      List<ProgramState> result = new ArrayList<ProgramState>();
      TryFinallyInfo info = getEnclosingBlock();
      if (info != null) {
        if (isBefore(info.getFinally())) {
          result.add(new ProgramState(info.getFinally(), true));
        } else {
          result.add(new ProgramState(info.getEndTry(), true));
        }
      } else {
        result.add(new ProgramState(getProgram().getEnd(), true));
      }

      return result;
    }
  }

  public List<ProgramState> pred(ProgramState s) {
    List<ProgramState> result = super.pred(s);

    if (s.isReturnMode()) {
      for (TryFinallyInfo child : myInfo.getChildren()) {
        if (child.getFinally().isAfter(myInfo.getFinally())) {
          result.add(new ProgramState(child.getEndTry(), true));
        }
      }

      for (RetInstruction ret : myReturns) {
        result.add(new ProgramState(ret, true));
        result.add(new ProgramState(ret, false));
      }
    }

    return result;
  }
}
