package jetbrains.mps.lang.smodel.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import jetbrains.mps.smodel.SNodePointer;
import java.util.Map;
import jetbrains.mps.smodel.runtime.ReferenceConstraintsDescriptor;
import java.util.HashMap;
import jetbrains.mps.smodel.runtime.base.BaseReferenceConstraintsDescriptor;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.runtime.ReferenceScopeProvider;
import jetbrains.mps.smodel.runtime.base.BaseReferenceScopeProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.runtime.ReferenceConstraintsContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.structure.behavior.AbstractConceptDeclaration_Behavior;

public class Node_IsRoleOperation_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer breakingNode_gpgb0w_a0a1a0a0a1a0b0a1a0 = new SNodePointer("r:00000000-0000-4000-0000-011c895902fb(jetbrains.mps.lang.smodel.constraints)", "1213104847807");

  public Node_IsRoleOperation_Constraints() {
    super("jetbrains.mps.lang.smodel.structure.Node_IsRoleOperation");
  }

  @Override
  protected Map<String, ReferenceConstraintsDescriptor> getNotDefaultReferences() {
    Map<String, ReferenceConstraintsDescriptor> references = new HashMap();
    references.put("linkInParent", new BaseReferenceConstraintsDescriptor("linkInParent", this) {
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
            SNode conceptOfParent = SLinkOperations.getTarget(_context.getReferenceNode(), "conceptOfParent", false);
            return AbstractConceptDeclaration_Behavior.call_getAggregationLinkDeclarations_1213877394521(conceptOfParent);
          }

          @Override
          public SNodePointer getSearchScopeValidatorNode() {
            return breakingNode_gpgb0w_a0a1a0a0a1a0b0a1a0;
          }
        };
      }
    });
    return references;
  }
}
