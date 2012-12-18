package jetbrains.mps.baseLanguage.contracts.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.BehaviorDescriptor;
import java.util.Arrays;
import jetbrains.mps.smodel.runtime.interpreted.BehaviorAspectInterpreted;

public class BehaviorAspectDescriptor implements jetbrains.mps.smodel.runtime.BehaviorAspectDescriptor {
  private static String[] stringSwitchCases_846f5o_a0a0a = new String[]{"jetbrains.mps.baseLanguage.contracts.structure.ContractThisExpression", "jetbrains.mps.baseLanguage.contracts.structure.MethodConditions", "jetbrains.mps.baseLanguage.contracts.structure.Postcondition", "jetbrains.mps.baseLanguage.contracts.structure.Precondition", "jetbrains.mps.baseLanguage.contracts.structure.ResultExpression"};

  public BehaviorAspectDescriptor() {
  }

  public BehaviorDescriptor getDescriptor(String fqName) {
    switch (Arrays.binarySearch(stringSwitchCases_846f5o_a0a0a, fqName)) {
      case 1:
        return new MethodConditions_BehaviorDescriptor();
      case 3:
        return new Precondition_BehaviorDescriptor();
      case 4:
        return new ResultExpression_BehaviorDescriptor();
      case 2:
        return new Postcondition_BehaviorDescriptor();
      case 0:
        return new ContractThisExpression_BehaviorDescriptor();
      default:
        return BehaviorAspectInterpreted.getInstance().getDescriptor(fqName);
    }
  }
}
