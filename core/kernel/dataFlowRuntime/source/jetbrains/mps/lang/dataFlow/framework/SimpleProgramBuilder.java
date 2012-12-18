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

public class SimpleProgramBuilder {
  private Program myProgram = new Program();

  public SimpleProgramBuilder emitRead(final Object var) {
    myProgram.add(new ReadInstruction(var));
    return this;
  }

  public SimpleProgramBuilder emitWrite(final Object var) {
    myProgram.add(new WriteInstruction(var, null));
    return this;
  }

  public SimpleProgramBuilder emitJump(int jumpTo) {
    JumpInstruction instruction = new JumpInstruction();
    instruction.setJumpTo(jumpTo);
    myProgram.add(instruction);
    return this;
  }

  public SimpleProgramBuilder emitIfJump(int jumpTo) {
    IfJumpInstruction instruction = new IfJumpInstruction();
    instruction.setJumpTo(jumpTo);
    myProgram.add(instruction);
    return this;
  }

  public SimpleProgramBuilder emitRet() {
    RetInstruction instruction = new RetInstruction();
    myProgram.add(instruction);
    return this;
  }

  public SimpleProgramBuilder emitTry() {
    TryInstruction instruction = new TryInstruction();
    myProgram.add(instruction);
    return this;
  }

  public SimpleProgramBuilder emitFinally() {
    FinallyInstruction instruction = new FinallyInstruction();
    myProgram.add(instruction);
    return this;
  }

  public SimpleProgramBuilder emitEndTry() {
    EndTryInstruction instruction = new EndTryInstruction();
    myProgram.add(instruction);
    return this;
  }

  public SimpleProgramBuilder emitNop() {
    myProgram.add(new NopInstruction());
    return this;
  }

  public Program buildProgram() {
    myProgram.init();
    return myProgram;
  }
}
