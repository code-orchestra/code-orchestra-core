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
import jetbrains.mps.lang.dataFlow.framework.instructions.JumpInstruction;
import jetbrains.mps.lang.dataFlow.framework.instructions.NopInstruction;
import jetbrains.mps.lang.dataFlow.framework.instructions.RetInstruction;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: Apr 16, 2010
 * Time: 1:49:15 PM
 * To change this template use File | Settings | File Templates.
 */
public class InstructionUtil {
  public static boolean isNop(Instruction i) {
     return i instanceof NopInstruction;
  }

  public static boolean isRet(Instruction i) {
     return i instanceof RetInstruction;
  }

  public static boolean isJump(Instruction i) {
     return i instanceof JumpInstruction;
  }

  public static Object getSource(Instruction i) {
     return i.getSource();
  }

}
