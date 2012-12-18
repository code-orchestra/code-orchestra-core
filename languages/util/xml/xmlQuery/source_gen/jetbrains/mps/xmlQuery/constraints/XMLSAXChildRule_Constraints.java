package jetbrains.mps.xmlQuery.constraints;

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
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;

public class XMLSAXChildRule_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer breakingNode_1y346m_a0a1a0a0a1a0b0a1a0 = new SNodePointer("r:e79b58b4-ea58-4c9d-b43b-c3a260addf6a(jetbrains.mps.xmlQuery.constraints)", "1967473504308939656");

  public XMLSAXChildRule_Constraints() {
    super("jetbrains.mps.xmlQuery.structure.XMLSAXChildRule");
  }

  @Override
  protected Map<String, ReferenceConstraintsDescriptor> getNotDefaultReferences() {
    Map<String, ReferenceConstraintsDescriptor> references = new HashMap();
    references.put("rule", new BaseReferenceConstraintsDescriptor("rule", this) {
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
            return SNodeOperations.getDescendants(SNodeOperations.getContainingRoot(_context.getEnclosingNode()), "jetbrains.mps.xmlQuery.structure.XMLSAXNodeRule", false, new String[]{});
          }

          @Override
          public SNodePointer getSearchScopeValidatorNode() {
            return breakingNode_1y346m_a0a1a0a0a1a0b0a1a0;
          }
        };
      }
    });
    return references;
  }
}
