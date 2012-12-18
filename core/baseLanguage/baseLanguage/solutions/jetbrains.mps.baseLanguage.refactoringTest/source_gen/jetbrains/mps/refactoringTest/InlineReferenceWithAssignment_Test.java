package jetbrains.mps.refactoringTest;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.util.plugin.run.MPSLaunch;
import jetbrains.mps.lang.test.runtime.BaseTransformationTest;
import org.junit.Test;
import jetbrains.mps.lang.test.runtime.BaseTestBody;
import jetbrains.mps.baseLanguage.util.plugin.refactorings.InlineVariableRefactoring;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import junit.framework.Assert;
import jetbrains.mps.lang.test.matcher.NodesMatcher;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.smodel.SNode;

@MPSLaunch
public class InlineReferenceWithAssignment_Test extends BaseTransformationTest {
  @Test
  public void test_InlineReferenceWithAssignment() throws Throwable {
    this.initTest("${mps_home}/MPS.mpr", "r:4dc6ffb5-4bbb-4773-b0b7-e52989ceb56f(jetbrains.mps.refactoringTest)");
    this.runTest("jetbrains.mps.refactoringTest.InlineReferenceWithAssignment_Test$TestBody", "test_InlineReferenceWithAssignment", true);
  }

  @MPSLaunch
  public static class TestBody extends BaseTestBody {
    public void test_InlineReferenceWithAssignment() throws Exception {
      this.addNodeById("1230053266542");
      this.addNodeById("1230053266566");
      InlineVariableRefactoring ref = InlineVariableRefactoring.createRefactoring(SNodeOperations.cast(this.getNodeById("1230053266560"), "jetbrains.mps.baseLanguage.structure.LocalVariableReference"));
      ref.doRefactoring();
      Assert.assertEquals(null, NodesMatcher.matchNodes(ListSequence.fromListAndArray(new ArrayList<SNode>(), SNodeOperations.cast(this.getNodeById("1230053266543"), "jetbrains.mps.baseLanguage.structure.ClassConcept")), ListSequence.fromListAndArray(new ArrayList<SNode>(), SNodeOperations.cast(this.getNodeById("1230053266567"), "jetbrains.mps.baseLanguage.structure.ClassConcept"))));
    }
  }
}
