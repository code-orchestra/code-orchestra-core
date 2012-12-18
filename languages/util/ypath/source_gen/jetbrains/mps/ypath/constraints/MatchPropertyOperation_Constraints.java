package jetbrains.mps.ypath.constraints;

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
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;

public class MatchPropertyOperation_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer breakingNode_cb3j36_a0a1a0a0a1a0b0a1a0 = new SNodePointer("r:00000000-0000-4000-0000-011c895905a8(jetbrains.mps.ypath.constraints)", "1213104836709");

  public MatchPropertyOperation_Constraints() {
    super("jetbrains.mps.ypath.structure.MatchPropertyOperation");
  }

  @Override
  protected Map<String, ReferenceConstraintsDescriptor> getNotDefaultReferences() {
    Map<String, ReferenceConstraintsDescriptor> references = new HashMap();
    references.put("property", new BaseReferenceConstraintsDescriptor("property", this) {
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
            SNode nk = SLinkOperations.getTarget(SLinkOperations.getTarget(_context.getReferenceNode(), "nodeKindOccurrence", true), "nodeKind", false);
            return ListSequence.fromList(SNodeOperations.getDescendants(nk, null, false, new String[]{})).where(new IWhereFilter<SNode>() {
              public boolean accept(SNode it) {
                return SNodeOperations.isInstanceOf(it, "jetbrains.mps.ypath.structure.TreeNodeKindProperty");
              }
            }).toListSequence();
          }

          @Override
          public SNodePointer getSearchScopeValidatorNode() {
            return breakingNode_cb3j36_a0a1a0a0a1a0b0a1a0;
          }
        };
      }
    });
    return references;
  }
}
