package jetbrains.mps.samples.secretCompartmentLanguage.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.ConstraintsDescriptor;
import java.util.Arrays;
import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;

public class ConstraintsAspectDescriptor implements jetbrains.mps.smodel.runtime.ConstraintsAspectDescriptor {
  private static String[] stringSwitchCases_2qnle6_a0a0a = new String[]{"jetbrains.mps.samples.secretCompartmentLanguage.structure.Event", "jetbrains.mps.samples.secretCompartmentLanguage.structure.State", "jetbrains.mps.samples.secretCompartmentLanguage.structure.StateMachine", "jetbrains.mps.samples.secretCompartmentLanguage.structure.StateMachineTest"};

  public ConstraintsAspectDescriptor() {
  }

  public ConstraintsDescriptor getDescriptor(String fqName) {
    switch (Arrays.binarySearch(stringSwitchCases_2qnle6_a0a0a, fqName)) {
      case 2:
        return new StateMachine_Constraints();
      case 3:
        return new StateMachineTest_Constraints();
      case 0:
        return new Event_Constraints();
      case 1:
        return new State_Constraints();
      default:
        // todo: illegal in some cases? 
        return new BaseConstraintsDescriptor(fqName);
    }
  }
}
