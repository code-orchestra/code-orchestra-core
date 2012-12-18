package jetbrains.mps.make.script.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.runtime.CheckingNodeContext;
import jetbrains.mps.smodel.constraints.CanBeAChildContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;

public class RelayQueryExpression_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer canBeChildBreakingPoint = new SNodePointer("r:56325792-0540-48ec-8d52-897a8821cc64(jetbrains.mps.make.script.constraints)", "1977954644795375517");

  public RelayQueryExpression_Constraints() {
    super("jetbrains.mps.make.script.structure.RelayQueryExpression");
  }

  @Override
  public boolean hasOwnCanBeChildMethod() {
    return true;
  }

  @Override
  public boolean canBeChild(final IOperationContext operationContext, SNode node, SNode node1, SNode node2, @Nullable final CheckingNodeContext checkingNodeContext) {
    boolean result = static_canBeAChild(operationContext, new CanBeAChildContext(node, node1, node2));

    if (!(result) && checkingNodeContext != null) {
      checkingNodeContext.setBreakingNode(canBeChildBreakingPoint);
    }

    return result;
  }

  public static boolean static_canBeAChild(final IOperationContext operationContext, final CanBeAChildContext _context) {
    return (SNodeOperations.getAncestorWhereConceptInList(_context.getParentNode(), new String[]{"jetbrains.mps.baseLanguage.structure.IStatementListContainer", "jetbrains.mps.make.script.structure.ConfigDefinition"}, false, false) != null);
  }
}
