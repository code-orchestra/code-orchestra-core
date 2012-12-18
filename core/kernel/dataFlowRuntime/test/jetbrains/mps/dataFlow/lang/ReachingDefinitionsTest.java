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

import jetbrains.mps.lang.dataFlow.framework.instructions.WriteInstruction;
import jetbrains.mps.lang.dataFlow.framework.analyzers.ReachingDefinitionsAnalyzer;
import jetbrains.mps.lang.dataFlow.framework.SimpleProgramBuilder;
import jetbrains.mps.lang.dataFlow.framework.Program;
import jetbrains.mps.lang.dataFlow.framework.AnalysisResult;
import org.junit.Assert;
import org.junit.Test;

import java.util.Set;

public class ReachingDefinitionsTest {
  @Test
  public void simpleLinear() {
      Program p =
      new SimpleProgramBuilder()
        .emitWrite("x")
        .emitWrite("x")
        .buildProgram();

      AnalysisResult<Set<WriteInstruction>> result = p.analyze(new ReachingDefinitionsAnalyzer());

    Assert.assertEquals(
      "0: write x [0: write x]\n" +
      "1: write x [1: write x]\n" +
      "2: end [1: write x]\n",
      result.toString()
    );
  }

  @Test
  public void cycle() {
      Program p =
      new SimpleProgramBuilder()
        .emitWrite("x")
        .emitWrite("y")
        .emitIfJump(0)
        .buildProgram();

    AnalysisResult<Set<WriteInstruction>> result = p.analyze(new ReachingDefinitionsAnalyzer());

    Assert.assertEquals(
      "0: write x [0: write x, 1: write y]\n" +
      "1: write y [0: write x, 1: write y]\n" +
      "2: ifjump 0 [0: write x, 1: write y]\n" +
      "3: end [0: write x, 1: write y]\n",
      result.toString()
    );
  }    
}
