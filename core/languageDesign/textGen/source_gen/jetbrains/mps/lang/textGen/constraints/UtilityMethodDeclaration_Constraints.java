package jetbrains.mps.lang.textGen.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.runtime.ReferenceScopeProvider;
import jetbrains.mps.smodel.runtime.base.BaseReferenceScopeProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.runtime.ReferenceConstraintsContext;
import java.util.List;
import jetbrains.mps.smodel.SNode;
import java.util.ArrayList;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;

public class UtilityMethodDeclaration_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer breakingNode_o7w1nm_a0a1a0a0a1 = new SNodePointer("r:472e3702-e789-4c3f-b300-132c65ad44f1(jetbrains.mps.lang.textGen.constraints)", "1237206482577");

  public UtilityMethodDeclaration_Constraints() {
    super("jetbrains.mps.lang.textGen.structure.UtilityMethodDeclaration");
  }

  @Override
  public boolean hasOwnDefaultScopeProvider() {
    return true;
  }

  @Override
  public ReferenceScopeProvider getDefaultScopeProvider() {
    return new BaseReferenceScopeProvider() {
      @Override
      public Object createSearchScopeOrListOfNodes(final IOperationContext operationContext, final ReferenceConstraintsContext _context) {
        List<SNode> methods = new ArrayList<SNode>();
        SNode textGen = SNodeOperations.getAncestor(_context.getEnclosingNode(), "jetbrains.mps.lang.textGen.structure.LanguageTextGenDeclaration", false, false);
        if (textGen != null) {
          while (true) {
            ListSequence.fromList(methods).addSequence(ListSequence.fromList(SLinkOperations.getTargets(textGen, "function", true)));
            if ((SLinkOperations.getTarget(textGen, "baseTextGen", false) == null)) {
              break;
            }
            textGen = SLinkOperations.getTarget(textGen, "baseTextGen", false);
          }
        }
        return methods;
      }

      @Override
      public SNodePointer getSearchScopeValidatorNode() {
        return breakingNode_o7w1nm_a0a1a0a0a1;
      }
    };
  }
}
