package constraintLanguageSandbox.model;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.runtime.ReferenceScopeProvider;
import jetbrains.mps.smodel.runtime.base.BaseReferenceScopeProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.runtime.ReferencePresentationContext;
import jetbrains.mps.baseLanguage.behavior.Classifier_Behavior;
import jetbrains.mps.smodel.runtime.ReferenceConstraintsContext;

public class ClassConcept_Constraints extends BaseConstraintsDescriptor {
  private static SNodePointer breakingNode_3muhb7_a0a3a0a0a1 = new SNodePointer("r:00000000-0000-4000-0000-011c895905c3(constraintLanguageSandbox.model)", "3025230698924756389");

  public ClassConcept_Constraints() {
    super("jetbrains.mps.baseLanguage.structure.ClassConcept");
  }

  @Override
  public boolean hasOwnDefaultScopeProvider() {
    return true;
  }

  @Override
  public ReferenceScopeProvider getDefaultScopeProvider() {
    return new BaseReferenceScopeProvider() {
      @Override
      public boolean hasPresentation() {
        return true;
      }

      @Override
      public String getPresentation(final IOperationContext operationContext, final ReferencePresentationContext _context) {
        return Classifier_Behavior.call_getNestedNameInContext_8540045600162183880(_context.getParameterNode(), _context.getEnclosingNode());
      }

      @Override
      public Object createSearchScopeOrListOfNodes(final IOperationContext operationContext, final ReferenceConstraintsContext _context) {
      }

      @Override
      public SNodePointer getSearchScopeValidatorNode() {
        return breakingNode_3muhb7_a0a3a0a0a1;
      }
    };
  }
}
