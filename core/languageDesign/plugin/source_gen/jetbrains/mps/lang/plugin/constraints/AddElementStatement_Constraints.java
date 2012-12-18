package jetbrains.mps.lang.plugin.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.runtime.CheckingNodeContext;
import jetbrains.mps.smodel.constraints.CanBeAChildContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;

public class AddElementStatement_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer canBeChildBreakingPoint = new SNodePointer("r:00000000-0000-4000-0000-011c89590361(jetbrains.mps.lang.plugin.constraints)", "1213107435693");

  public AddElementStatement_Constraints() {
    super("jetbrains.mps.lang.plugin.structure.AddElementStatement");
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
    return SNodeOperations.getAncestorWhereConceptInList(_context.getParentNode(), new String[]{"jetbrains.mps.lang.plugin.structure.BuildGroupBlock", "jetbrains.mps.lang.plugin.structure.UpdateGroupFunction"}, true, false) != null;
  }
}
