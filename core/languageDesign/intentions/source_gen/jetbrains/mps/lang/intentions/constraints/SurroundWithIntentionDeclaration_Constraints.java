package jetbrains.mps.lang.intentions.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModel;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.runtime.CheckingNodeContext;
import jetbrains.mps.smodel.constraints.CanBeARootContext;
import jetbrains.mps.smodel.LanguageAspect;

public class SurroundWithIntentionDeclaration_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer canBeRootBreakingPoint = new SNodePointer("r:00000000-0000-4000-0000-011c8959034f(jetbrains.mps.lang.intentions.constraints)", "6263518417926802272");

  public SurroundWithIntentionDeclaration_Constraints() {
    super("jetbrains.mps.lang.intentions.structure.SurroundWithIntentionDeclaration");
  }

  @Override
  public boolean hasOwnCanBeRootMethod() {
    return true;
  }

  @Override
  public boolean canBeRoot(IOperationContext context, SModel model, @Nullable CheckingNodeContext checkingNodeContext) {
    boolean result = static_canBeARoot(context, new CanBeARootContext(model));

    if (!(result) && checkingNodeContext != null) {
      checkingNodeContext.setBreakingNode(canBeRootBreakingPoint);
    }

    return result;
  }

  public static boolean static_canBeARoot(final IOperationContext operationContext, final CanBeARootContext _context) {
    return LanguageAspect.INTENTIONS.is(_context.getModel());
  }
}
