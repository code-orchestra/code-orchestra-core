package jetbrains.mps.baseLanguage.classifiers.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.runtime.CheckingNodeContext;
import jetbrains.mps.smodel.constraints.CanBeAChildContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.baseLanguage.classifiers.behavior.IClassifier_Behavior;

public class SuperClassifierExpresson_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer canBeChildBreakingPoint = new SNodePointer("r:00000000-0000-4000-0000-011c8959036e(jetbrains.mps.baseLanguage.classifiers.constraints)", "1217433547506");

  public SuperClassifierExpresson_Constraints() {
    super("jetbrains.mps.baseLanguage.classifiers.structure.SuperClassifierExpresson");
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
    boolean inClassifier = SNodeOperations.getAncestorWhereConceptInList(_context.getParentNode(), new String[]{"jetbrains.mps.baseLanguage.classifiers.structure.IClassifier", "jetbrains.mps.baseLanguage.classifiers.structure.IClassifierPart"}, true, false) != null;
    if (!(inClassifier)) {
      return false;
    }
    SNode classifier = IClassifier_Behavior.getContextClassifier_1213877527940(_context.getParentNode());
    if (classifier == null) {
      return false;
    }
    boolean hasSuper = IClassifier_Behavior.call_createSuperType_1217433657148(classifier) != null;
    if (!(hasSuper)) {
      return false;
    }
    return true;
  }
}
