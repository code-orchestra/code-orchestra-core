package formulaAdapter;

/*Generated by MPS */

import jetbrains.mps.samples.formulaLanguage.api.Function;
import mf.Quantity;
import postingrules.Usage;

public class UsageQuantity implements Function<Quantity> {
  public UsageQuantity() {
  }

  public Quantity compute(Object parm) {
    Usage usageEvent = (Usage) parm;
    return usageEvent.getAmount();
  }
}
