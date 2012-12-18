package jetbrains.mps.lang.pattern.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.runtime.CheckingNodeContext;
import jetbrains.mps.smodel.constraints.CanBeAParentContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;

public class ActionAsPattern_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer canBeParentBreakingPoint = new SNodePointer("r:00000000-0000-4000-0000-011c89590340(jetbrains.mps.lang.pattern.constraints)", "1483902774837520155");

  public ActionAsPattern_Constraints() {
    super("jetbrains.mps.lang.pattern.structure.ActionAsPattern");
  }

  @Override
  public boolean hasOwnCanBeParentMethod() {
    return true;
  }

  @Override
  public boolean canBeParent(IOperationContext operationContext, SNode node, SNode node1, SNode node2, @Nullable CheckingNodeContext checkingNodeContext) {
    boolean result = static_canBeAParent(operationContext, new CanBeAParentContext(node, node1, node2));

    if (!(result) && checkingNodeContext != null) {
      checkingNodeContext.setBreakingNode(canBeParentBreakingPoint);
    }

    return result;
  }

  public static boolean static_canBeAParent(final IOperationContext operationContext, final CanBeAParentContext _context) {
    if (_context.getLink() == SLinkOperations.findLinkDeclaration("jetbrains.mps.lang.pattern.structure.ActionAsPattern", "action")) {
      return SConceptOperations.isSubConceptOf(_context.getChildConcept(), "jetbrains.mps.lang.pattern.structure.ActionStatement");
    }
    if (_context.getLink() == SLinkOperations.findLinkDeclaration("jetbrains.mps.lang.pattern.structure.ActionAsPattern", "position")) {
      return SConceptOperations.isSubConceptOf(_context.getChildConcept(), "jetbrains.mps.lang.pattern.structure.InsertPosition");
    }
    return false;
  }
}
