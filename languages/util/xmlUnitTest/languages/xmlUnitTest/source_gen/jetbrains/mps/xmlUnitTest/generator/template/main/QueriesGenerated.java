package jetbrains.mps.xmlUnitTest.generator.template.main;

/*Generated by MPS */

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.generator.template.IfMacroContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.generator.template.SourceSubstituteMacroNodeContext;

public class QueriesGenerated {
  public static boolean ifMacro_Condition_5211164146777102389(final IOperationContext operationContext, final IfMacroContext _context) {
    return (SLinkOperations.getTarget(SLinkOperations.getTarget(_context.getNode(), "message", true), "message", true) != null);
  }

  public static SNode sourceNodeQuery_5211164146777102400(final IOperationContext operationContext, final SourceSubstituteMacroNodeContext _context) {
    return SLinkOperations.getTarget(SLinkOperations.getTarget(_context.getNode(), "message", true), "message", true);
  }

  public static SNode sourceNodeQuery_5211164146777102410(final IOperationContext operationContext, final SourceSubstituteMacroNodeContext _context) {
    return SLinkOperations.getTarget(_context.getNode(), "expected", true);
  }

  public static SNode sourceNodeQuery_5211164146777102418(final IOperationContext operationContext, final SourceSubstituteMacroNodeContext _context) {
    return SLinkOperations.getTarget(_context.getNode(), "actual", true);
  }
}
