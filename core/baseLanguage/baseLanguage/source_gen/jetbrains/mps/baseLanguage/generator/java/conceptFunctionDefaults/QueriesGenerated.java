package jetbrains.mps.baseLanguage.generator.java.conceptFunctionDefaults;

/*Generated by MPS */

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.generator.template.PropertyMacroContext;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptPropertyOperations;
import jetbrains.mps.generator.template.ReferenceMacroContext;
import jetbrains.mps.generator.template.IfMacroContext;
import jetbrains.mps.baseLanguage.behavior.ConceptFunctionParameter_Behavior;

public class QueriesGenerated {
  public static Object propertyMacro_GetPropertyValue_1199879576743(final IOperationContext operationContext, final PropertyMacroContext _context) {
    return NameUtil.getGetterName(SConceptPropertyOperations.getString(_context.getNode(), "alias"));
  }

  public static Object referenceMacro_GetReferent_1170351924342(final IOperationContext operationContext, final ReferenceMacroContext _context) {
    return SConceptPropertyOperations.getString(_context.getNode(), "alias");
  }

  public static Object referenceMacro_GetReferent_1199971770629(final IOperationContext operationContext, final ReferenceMacroContext _context) {
    return "_context";
  }

  public static boolean ifMacro_Condition_1199879109301(final IOperationContext operationContext, final IfMacroContext _context) {
    return !(ConceptFunctionParameter_Behavior.call_getFromParameterObject_1213877522908(_context.getNode()));
  }
}
