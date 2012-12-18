package jetbrains.mps.lang.core.typesystem;

/*Generated by MPS */

import jetbrains.mps.errors.QuickFix_Runtime;
import jetbrains.mps.smodel.SNode;

public class RemoveUndeclaredProperty_QuickFix extends QuickFix_Runtime {
  public RemoveUndeclaredProperty_QuickFix() {
  }

  public String getDescription() {
    return "Remove undeclared property \"" + ((String) RemoveUndeclaredProperty_QuickFix.this.getField("propertyName")[0]) + "\"";
  }

  public void execute(SNode node) {
    node.setProperty(((String) RemoveUndeclaredProperty_QuickFix.this.getField("propertyName")[0]), null, false);
  }
}
