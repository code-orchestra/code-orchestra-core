package jetbrains.mps.samples.secretCompartmentLanguage.runtime.test;

/*Generated by MPS */

import jetbrains.mps.samples.secretCompartmentLanguage.runtime.StateMachineTest;
import jetbrains.mps.samples.secretCompartmentLanguage.runtime.StateMachineFactory;
import junit.framework.Assert;

public final class Test extends StateMachineTest {
  public Test() {
  }

  public void test() {
    StateMachineFactory stateMachineFactory = new HStateMachineFactory();
    init(stateMachineFactory);
    getController().handle("D1CL");
    getController().handle("D2OP");
    getController().handle("L1ON");
    Assert.assertEquals("unlockedPanel", getController().getCurrentState().getName());
  }
}
