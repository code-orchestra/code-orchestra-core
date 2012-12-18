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
import jetbrains.mps.lang.dataFlow.framework.analyzers.InitializedVariablesAnalyzer;
import jetbrains.mps.lang.dataFlow.framework.AnalysisResult;
import jetbrains.mps.lang.dataFlow.framework.Program;
import jetbrains.mps.lang.dataFlow.framework.SimpleProgramBuilder;
import jetbrains.mps.lang.dataFlow.framework.VarSet;

import java.util.Set;

public class InitializedVariablesAnalysisTest {
  @Test
  public void simple() {
    Program p = new SimpleProgramBuilder()
      .emitWrite("x")
      .buildProgram();

    AnalysisResult<VarSet> result = p.analyze(new InitializedVariablesAnalyzer());

    Assert.assertEquals(
      "0: write x [x]\n" +
      "1: end [x]\n",
      result.toString()
    );
  }

  @Test
  public void mayBeInitialized() {
    Program p = new SimpleProgramBuilder()
      .emitIfJump(2)
      .emitWrite("x")
      .buildProgram();
        
    AnalysisResult<VarSet> result = p.analyze(new InitializedVariablesAnalyzer());

    Assert.assertEquals(
      "0: ifjump 2 []\n" +
      "1: write x [x]\n" +
      "2: end []\n",
      result.toString()
    );
  }

  @Test
  public void twoBranchesWhereCanBeInitialized() {
    Program p = new SimpleProgramBuilder()
      .emitIfJump(3)
      .emitWrite("x")
      .emitJump(4)
      .emitWrite("x")
      .buildProgram();

    AnalysisResult<VarSet> result = p.analyze(new InitializedVariablesAnalyzer());

    Assert.assertEquals(
      "0: ifjump 3 []\n" +
      "1: write x [x]\n" +
      "2: jump 4 [x]\n" +
      "3: write x [x]\n" +
      "4: end [x]\n",
      result.toString()
    );
  }

  @Test
  public void cycle() {
    Program p = new SimpleProgramBuilder()
      .emitNop()
      .emitWrite("x")
      .emitRead("x")
      .emitIfJump(2)
      .buildProgram();

    AnalysisResult<VarSet> result = p.analyze(new InitializedVariablesAnalyzer());

    Assert.assertEquals(
      "0: nop []\n" +
      "1: write x [x]\n" +
      "2: read x [x]\n" +
      "3: ifjump 2 [x]\n" +
      "4: end [x]\n",
      result.toString()
    );
  }

  @Test
  public void emptyEntrySet() {
    Program p = new SimpleProgramBuilder()
     .emitWrite("x")
     .emitRet()
     .emitJump(3)
     .buildProgram();

    AnalysisResult<VarSet> result = p.analyze(new InitializedVariablesAnalyzer());

    Assert.assertEquals(
      "0: write x [x]\n" +
      "1: ret [x]\n" +
      "2: jump 3 [x]\n" +
      "3: end [x]\n",
      result.toString()
    );
  }
}
