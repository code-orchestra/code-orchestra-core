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

import java.util.Set;

import jetbrains.mps.lang.dataFlow.framework.analyzers.LivenessAnalyzer;
import jetbrains.mps.lang.dataFlow.framework.SimpleProgramBuilder;
import jetbrains.mps.lang.dataFlow.framework.AnalysisResult;
import jetbrains.mps.lang.dataFlow.framework.Program;
import jetbrains.mps.lang.dataFlow.framework.VarSet;

public class LivenessAnalysisTest {

  @Test
  public void linearProgram() {
      Program p =
      new SimpleProgramBuilder()
        .emitRead("x")
        .emitWrite("y")
        .emitRead("z")
        .buildProgram();

      AnalysisResult<VarSet> analysisResult = p.analyze(new LivenessAnalyzer());

    Assert.assertEquals(
      "0: read x [x, z]\n" +
      "1: write y [z]\n" +
      "2: read z [z]\n" +
      "3: end []\n",
      analysisResult.toString()
    );
  }

  @Test
  public void overwrite() {
      Program p =
      new SimpleProgramBuilder()
        .emitRead("x")
        .emitWrite("x")
        .buildProgram();

      AnalysisResult<VarSet> analysisResult = p.analyze(new LivenessAnalyzer());

    Assert.assertEquals(
      "0: read x [x]\n" +
      "1: write x []\n" +
      "2: end []\n",
      analysisResult.toString()
    );
  }

  @Test
  public void cyclicProgram() {
      Program p =
      new SimpleProgramBuilder()
        .emitRead("y")
        .emitRead("x")
        .emitIfJump(0)
        .buildProgram();

      AnalysisResult<VarSet> analysisResult = p.analyze(new LivenessAnalyzer());

    Assert.assertEquals(
      "0: read y [x, y]\n" +
      "1: read x [x, y]\n" +
      "2: ifjump 0 [x, y]\n" +
      "3: end []\n",      
      analysisResult.toString()
    );
  }

}
