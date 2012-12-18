package jetbrains.mps.bash.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import java.util.Map;
import jetbrains.mps.smodel.runtime.PropertyConstraintsDescriptor;
import java.util.HashMap;
import jetbrains.mps.smodel.runtime.base.BasePropertyConstraintsDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.bash.behavior.VariableNameDeclaration_Behavior;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;

public class VariableNameDeclaration_Constraints extends BaseConstraintsDescriptor {
  public VariableNameDeclaration_Constraints() {
    super("jetbrains.mps.bash.structure.VariableNameDeclaration");
  }

  @Override
  protected Map<String, PropertyConstraintsDescriptor> getNotDefaultProperties() {
    Map<String, PropertyConstraintsDescriptor> properties = new HashMap();
    properties.put("name", new BasePropertyConstraintsDescriptor("name", this) {
      @Override
      public boolean hasOwnValidator() {
        return true;
      }

      @Override
      public boolean validateValue(SNode node, String propertyValue, IScope scope) {
        String propertyName = "name";
        {
          SNode v = VariableNameDeclaration_Behavior.testName_9034131902194480300(node, (SPropertyOperations.getString(propertyValue)));
          if (node != v && (v != null)) {
            return false;
          }
          if ((SPropertyOperations.getString(propertyValue)).contains("#")) {
            return false;
          }
          return true;
        }
      }
    });
    return properties;
  }
}
