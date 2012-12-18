package jetbrains.mps.lang.smodel.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.runtime.CheckingNodeContext;
import jetbrains.mps.smodel.constraints.CanBeAChildContext;
import java.util.Map;
import jetbrains.mps.smodel.runtime.ReferenceConstraintsDescriptor;
import java.util.HashMap;
import jetbrains.mps.smodel.runtime.base.BaseReferenceConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.ReferenceScopeProvider;
import jetbrains.mps.smodel.runtime.base.BaseReferenceScopeProvider;
import jetbrains.mps.smodel.runtime.ReferenceConstraintsContext;
import jetbrains.mps.lang.structure.behavior.AbstractConceptDeclaration_Behavior;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.typesystem.runtime.HUtil;

public class SLinkImplicitSelect_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer canBeChildBreakingPoint = new SNodePointer("r:00000000-0000-4000-0000-011c895902fb(jetbrains.mps.lang.smodel.constraints)", "8405512791876074476");
  private static SNodePointer breakingNode_f4oi2a_a0a1a0a0a1a0b0a1a2 = new SNodePointer("r:00000000-0000-4000-0000-011c895902fb(jetbrains.mps.lang.smodel.constraints)", "8405512791876074490");

  public SLinkImplicitSelect_Constraints() {
    super("jetbrains.mps.lang.smodel.structure.SLinkImplicitSelect");
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

  @Override
  protected Map<String, ReferenceConstraintsDescriptor> getNotDefaultReferences() {
    Map<String, ReferenceConstraintsDescriptor> references = new HashMap();
    references.put("link", new BaseReferenceConstraintsDescriptor("link", this) {
      @Override
      public boolean hasOwnScopeProvider() {
        return true;
      }

      @Nullable
      @Override
      public ReferenceScopeProvider getScopeProvider() {
        return new BaseReferenceScopeProvider() {
          @Override
          public Object createSearchScopeOrListOfNodes(final IOperationContext operationContext, final ReferenceConstraintsContext _context) {
            return AbstractConceptDeclaration_Behavior.call_getLinkDeclarations_1213877394480(SLinkOperations.getTarget(TypeChecker.getInstance().getRuntimeSupport().coerce_(TypeChecker.getInstance().getTypeOf(SLinkOperations.getTarget(SNodeOperations.as(_context.getEnclosingNode(), "jetbrains.mps.baseLanguage.structure.DotExpression"), "operand", true)), HUtil.createMatchingPatternByConceptFQName("jetbrains.mps.lang.smodel.structure.SNodeListType"), true), "elementConcept", false));
          }

          @Override
          public SNodePointer getSearchScopeValidatorNode() {
            return breakingNode_f4oi2a_a0a1a0a0a1a0b0a1a2;
          }
        };
      }
    });
    return references;
  }

  public static boolean static_canBeAChild(final IOperationContext operationContext, final CanBeAChildContext _context) {
    return (TypeChecker.getInstance().getRuntimeSupport().coerce_(TypeChecker.getInstance().getTypeOf(SLinkOperations.getTarget(SNodeOperations.as(_context.getParentNode(), "jetbrains.mps.baseLanguage.structure.DotExpression"), "operand", true)), HUtil.createMatchingPatternByConceptFQName("jetbrains.mps.lang.smodel.structure.SNodeListType"), true) != null);
  }
}
