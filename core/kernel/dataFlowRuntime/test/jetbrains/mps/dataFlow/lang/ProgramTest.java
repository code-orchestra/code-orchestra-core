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
package jetbrains.mps.dataFlow.lang;

import org.junit.Test;
import org.junit.Assert;
import jetbrains.mps.lang.dataFlow.framework.SimpleProgramBuilder;
import jetbrains.mps.lang.dataFlow.framework.Program;
import jetbrains.mps.lang.dataFlow.framework.instructions.ReadInstruction;
import jetbrains.mps.lang.dataFlow.framework.instructions.WriteInstruction;

import java.util.Collections;

public class ProgramTest {

  @Test
  public void simpleProgramBuilding() {    
    Program program = new SimpleProgramBuilder()
      .emitRead("x")
      .emitWrite("y")
      .buildProgram();

    Assert.assertEquals(
      "0: read x\n" +
      "1: write y\n" +
      "2: end\n",
      
      program.toString()
    );
  }

  @Test
  public void programWithTryFinally() {
    Program program = new SimpleProgramBuilder()
      .emitTry()
      .emitRead("x")
      .emitFinally()
      .emitRead("x")
      .emitEndTry()
      .buildProgram();


    Assert.assertEquals(
      "0: try\n" +
      "1: read x\n" +
      "2: finally\n" +
      "3: read x\n" +
      "4: endTry\n" +
      "5: end\n",
      program.toString()
    );
  }

  @Test
  public void tryFinallyInFinallyBlock() {
    Program program = new SimpleProgramBuilder()
      .emitTry()
      .emitFinally()
      .emitTry()
      .emitFinally()
      .emitEndTry()
      .emitEndTry()
      .buildProgram();
  }

  @Test
  public void retInFinallyBlock() {
    Program program = new SimpleProgramBuilder()
      .emitTry()
      .emitFinally()
      .emitRet()
      .emitEndTry()
      .buildProgram();
  }

  @Test(expected = IllegalStateException.class)
  public void danglingTry() {
    new SimpleProgramBuilder()
      .emitTry()
      .buildProgram();
  }

  @Test(expected = IllegalStateException.class)
  public void unexpectedFinally() {
    new SimpleProgramBuilder()
        .emitFinally()
        .buildProgram();
  }

  @Test(expected = IllegalStateException.class)
  public void unexpectedEndTry() {
    new SimpleProgramBuilder()
        .emitEndTry()
        .buildProgram();
  }

  @Test
  public void unreachable() {
    Program program = new SimpleProgramBuilder()
      .emitRet()
      .emitNop()
      .buildProgram();


    Assert.assertEquals(
      Collections.singleton(program.get(1)),
      program.getUnreachableInstructions()      
    );
  }
  
  @Test
  public void expectedReturns() {
    Program program = new SimpleProgramBuilder()
      .emitNop()
      .buildProgram();

    Assert.assertEquals(
      Collections.singleton(program.get(0)),
      program.getExpectedReturns()      
    );
  }

  @Test
  public void expectedReturnInUnreachableCode() {
    Program program = new SimpleProgramBuilder()
      .emitRet()
      .emitNop()
      .buildProgram();

    Assert.assertEquals(
      Collections.EMPTY_SET,
      program.getExpectedReturns()
    );
  }

  @Test
  public void noExpectedReturnInTryFinallyWithReturn() {
    Program program = new SimpleProgramBuilder()
      .emitTry()
      .emitRet()
      .emitFinally()
      .emitEndTry()
      .buildProgram();

    Assert.assertTrue(program.getExpectedReturns().isEmpty());
  }

  @Test
  public void unitializedReads() {
    Program program = new SimpleProgramBuilder()
      .emitRead("x")
      .buildProgram();

    Assert.assertEquals(
      Collections.singleton((ReadInstruction) program.get(0)),
      program.getUninitializedReads()
    );
  }

  @Test
  public void unusedAssignments() {
    Program program = new SimpleProgramBuilder()
      .emitWrite("x")
      .buildProgram();

    Assert.assertEquals(
      Collections.singleton((WriteInstruction) program.get(0)),
      program.getUnusedAssignments()
    );
  }

  @Test
  public void writeWithReadIsNotUnusedAssignment() {
    Program program = new SimpleProgramBuilder()
      .emitWrite("x")
      .emitRead("x")
      .buildProgram();

    Assert.assertTrue(program.getUnusedAssignments().isEmpty());
  }
}
