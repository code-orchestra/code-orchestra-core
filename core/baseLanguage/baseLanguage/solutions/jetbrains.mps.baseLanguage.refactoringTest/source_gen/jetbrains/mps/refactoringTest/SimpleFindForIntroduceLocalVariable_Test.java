package jetbrains.mps.refactoringTest;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.util.plugin.run.MPSLaunch;
import jetbrains.mps.lang.test.runtime.BaseTransformationTest;
import org.junit.Test;
import jetbrains.mps.lang.test.runtime.BaseTestBody;
import jetbrains.mps.baseLanguage.util.plugin.refactorings.IntroduceLocalVariableRefactoring;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import junit.framework.Assert;
import jetbrains.mps.lang.test.matcher.NodesMatcher;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.smodel.SNode;

@MPSLaunch
public class SimpleFindForIntroduceLocalVariable_Test extends BaseTransformationTest {
  @Test
  public void test_SimpleFindAndMoveForIntroduceLocalVariableTest() throws Throwable {
    this.initTest("${mps_home}/MPS.mpr", "r:4dc6ffb5-4bbb-4773-b0b7-e52989ceb56f(jetbrains.mps.refactoringTest)");
    this.runTest("jetbrains.mps.refactoringTest.SimpleFindForIntroduceLocalVariable_Test$TestBody", "test_SimpleFindAndMoveForIntroduceLocalVariableTest", true);
  }

  @MPSLaunch
  public static class TestBody extends BaseTestBody {
    public void test_SimpleFindAndMoveForIntroduceLocalVariableTest() throws Exception {
      this.addNodeById("7568753874916226563");
      this.addNodeById("7568753874916226633");
      IntroduceLocalVariableRefactoring refactoring = new IntroduceLocalVariableRefactoring();
      refactoring.init(SNodeOperations.cast(this.getNodeById("7568753874916226573"), "jetbrains.mps.baseLanguage.structure.IntegerConstant"), null);
      refactoring.setReplacingAll(true);
      refactoring.setName("k");
      refactoring.doRefactoring();
      Assert.assertEquals(null, NodesMatcher.matchNodes(ListSequence.fromListAndArray(new ArrayList<SNode>(), SNodeOperations.cast(this.getNodeById("7568753874916226564"), "jetbrains.mps.baseLanguage.structure.ClassConcept")), ListSequence.fromListAndArray(new ArrayList<SNode>(), SNodeOperations.cast(this.getNodeById("7568753874916226634"), "jetbrains.mps.baseLanguage.structure.ClassConcept"))));
    }
  }
}
