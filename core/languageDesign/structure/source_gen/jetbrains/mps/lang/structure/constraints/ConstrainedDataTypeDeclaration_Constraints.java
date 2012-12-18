package jetbrains.mps.lang.structure.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModel;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.runtime.CheckingNodeContext;
import jetbrains.mps.smodel.constraints.CanBeARootContext;
import jetbrains.mps.smodel.LanguageAspect;

public class ConstrainedDataTypeDeclaration_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer canBeRootBreakingPoint = new SNodePointer("r:00000000-0000-4000-0000-011c8959028c(jetbrains.mps.lang.structure.constraints)", "1227087700408");

  public ConstrainedDataTypeDeclaration_Constraints() {
    super("jetbrains.mps.lang.structure.structure.ConstrainedDataTypeDeclaration");
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
    return LanguageAspect.STRUCTURE.is(_context.getModel());
  }
}
