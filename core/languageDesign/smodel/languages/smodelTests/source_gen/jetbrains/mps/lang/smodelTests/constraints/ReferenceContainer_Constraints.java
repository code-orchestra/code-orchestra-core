package jetbrains.mps.lang.smodelTests.constraints;

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
import jetbrains.mps.smodel.runtime.ReferencePresentationContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.smodel.runtime.ReferenceConstraintsContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SModelOperations;

public class ReferenceContainer_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer breakingNode_5tia2e_a0a3a0a0a1a0b0a1a0 = new SNodePointer("r:c3114115-c401-467f-8766-388ee2aa9908(jetbrains.mps.lang.smodelTests.constraints)", "8758390115029091796");
  private static SNodePointer breakingNode_5tia2e_a0a3a0a0a1a0b0a2a0 = new SNodePointer("r:c3114115-c401-467f-8766-388ee2aa9908(jetbrains.mps.lang.smodelTests.constraints)", "8758390115029225986");
  private static SNodePointer breakingNode_5tia2e_a0a3a0a0a1a0b0a3a0 = new SNodePointer("r:c3114115-c401-467f-8766-388ee2aa9908(jetbrains.mps.lang.smodelTests.constraints)", "8758390115029226005");

  public ReferenceContainer_Constraints() {
    super("jetbrains.mps.lang.smodelTests.structure.ReferenceContainer");
  }

  @Override
  protected Map<String, ReferenceConstraintsDescriptor> getNotDefaultReferences() {
    Map<String, ReferenceConstraintsDescriptor> references = new HashMap();
    references.put("root", new BaseReferenceConstraintsDescriptor("root", this) {
      @Override
      public boolean hasOwnScopeProvider() {
        return true;
      }

      @Nullable
      @Override
      public ReferenceScopeProvider getScopeProvider() {
        return new BaseReferenceScopeProvider() {
          @Override
          public boolean hasPresentation() {
            return true;
          }

          @Override
          public String getPresentation(final IOperationContext operationContext, final ReferencePresentationContext _context) {
            return SPropertyOperations.getString(_context.getParameterNode(), "name");
          }

          @Override
          public Object createSearchScopeOrListOfNodes(final IOperationContext operationContext, final ReferenceConstraintsContext _context) {
            return SModelOperations.getNodes(_context.getModel(), "jetbrains.mps.lang.smodelTests.structure.Root");
          }

          @Override
          public SNodePointer getSearchScopeValidatorNode() {
            return breakingNode_5tia2e_a0a3a0a0a1a0b0a1a0;
          }
        };
      }
    });
    references.put("rightChild", new BaseReferenceConstraintsDescriptor("rightChild", this) {
      @Override
      public boolean hasOwnScopeProvider() {
        return true;
      }

      @Nullable
      @Override
      public ReferenceScopeProvider getScopeProvider() {
        return new BaseReferenceScopeProvider() {
          @Override
          public boolean hasPresentation() {
            return true;
          }

          @Override
          public String getPresentation(final IOperationContext operationContext, final ReferencePresentationContext _context) {
            return SPropertyOperations.getString(_context.getParameterNode(), "name");
          }

          @Override
          public Object createSearchScopeOrListOfNodes(final IOperationContext operationContext, final ReferenceConstraintsContext _context) {
            return SModelOperations.getNodes(_context.getModel(), "jetbrains.mps.lang.smodelTests.structure.Child");
          }

          @Override
          public SNodePointer getSearchScopeValidatorNode() {
            return breakingNode_5tia2e_a0a3a0a0a1a0b0a2a0;
          }
        };
      }
    });
    references.put("leftChild", new BaseReferenceConstraintsDescriptor("leftChild", this) {
      @Override
      public boolean hasOwnScopeProvider() {
        return true;
      }

      @Nullable
      @Override
      public ReferenceScopeProvider getScopeProvider() {
        return new BaseReferenceScopeProvider() {
          @Override
          public boolean hasPresentation() {
            return true;
          }

          @Override
          public String getPresentation(final IOperationContext operationContext, final ReferencePresentationContext _context) {
            return SPropertyOperations.getString(_context.getParameterNode(), "name");
          }

          @Override
          public Object createSearchScopeOrListOfNodes(final IOperationContext operationContext, final ReferenceConstraintsContext _context) {
            return SModelOperations.getNodes(_context.getModel(), "jetbrains.mps.lang.smodelTests.structure.Child");
          }

          @Override
          public SNodePointer getSearchScopeValidatorNode() {
            return breakingNode_5tia2e_a0a3a0a0a1a0b0a3a0;
          }
        };
      }
    });
    return references;
  }
}
