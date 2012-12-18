package jetbrains.mps.baseLanguage.unitTest.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.BehaviorDescriptor;
import java.util.Arrays;
import jetbrains.mps.smodel.runtime.interpreted.BehaviorAspectInterpreted;

public class BehaviorAspectDescriptor implements jetbrains.mps.smodel.runtime.BehaviorAspectDescriptor {
  private static String[] stringSwitchCases_846f5o_a0a0a = new String[]{"jetbrains.mps.baseLanguage.unitTest.structure.AssertEquals", "jetbrains.mps.baseLanguage.unitTest.structure.AssertFalse", "jetbrains.mps.baseLanguage.unitTest.structure.AssertInNotNull", "jetbrains.mps.baseLanguage.unitTest.structure.AssertIsNull", "jetbrains.mps.baseLanguage.unitTest.structure.AssertSame", "jetbrains.mps.baseLanguage.unitTest.structure.AssertThrows", "jetbrains.mps.baseLanguage.unitTest.structure.AssertTrue", "jetbrains.mps.baseLanguage.unitTest.structure.BTestCase", "jetbrains.mps.baseLanguage.unitTest.structure.Fail", "jetbrains.mps.baseLanguage.unitTest.structure.Message", "jetbrains.mps.baseLanguage.unitTest.structure.TestMethod", "jetbrains.mps.baseLanguage.unitTest.structure.TestMethodList"};

  public BehaviorAspectDescriptor() {
  }

  public BehaviorDescriptor getDescriptor(String fqName) {
    switch (Arrays.binarySearch(stringSwitchCases_846f5o_a0a0a, fqName)) {
      case 10:
        return new TestMethod_BehaviorDescriptor();
      case 7:
        return new BTestCase_BehaviorDescriptor();
      case 11:
        return new TestMethodList_BehaviorDescriptor();
      case 0:
        return new AssertEquals_BehaviorDescriptor();
      case 6:
        return new AssertTrue_BehaviorDescriptor();
      case 1:
        return new AssertFalse_BehaviorDescriptor();
      case 4:
        return new AssertSame_BehaviorDescriptor();
      case 8:
        return new Fail_BehaviorDescriptor();
      case 3:
        return new AssertIsNull_BehaviorDescriptor();
      case 5:
        return new AssertThrows_BehaviorDescriptor();
      case 9:
        return new Message_BehaviorDescriptor();
      case 2:
        return new AssertInNotNull_BehaviorDescriptor();
      default:
        return BehaviorAspectInterpreted.getInstance().getDescriptor(fqName);
    }
  }
}
