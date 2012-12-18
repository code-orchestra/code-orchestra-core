package jetbrains.mps.lang.typesystem.constraints;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import java.util.Map;
import jetbrains.mps.smodel.runtime.ReferenceConstraintsDescriptor;
import java.util.HashMap;
import jetbrains.mps.smodel.runtime.base.BaseReferenceConstraintsDescriptor;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.runtime.ReferenceScopeProvider;
import jetbrains.mps.smodel.runtime.base.BaseReferenceScopeProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.runtime.ReferencePresentationContext;
import org.apache.commons.lang.StringUtils;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptPropertyOperations;

public class InequationReference_Constraints extends BaseConstraintsDescriptor {
  public InequationReference_Constraints() {
    super("jetbrains.mps.lang.typesystem.structure.InequationReference");
  }

  @Override
  protected Map<String, ReferenceConstraintsDescriptor> getNotDefaultReferences() {
    Map<String, ReferenceConstraintsDescriptor> references = new HashMap();
    references.put("inequation", new BaseReferenceConstraintsDescriptor("inequation", this) {
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
            if (StringUtils.isNotEmpty(SPropertyOperations.getString(_context.getParameterNode(), "label"))) {
              return SPropertyOperations.getString(_context.getParameterNode(), "label") + " " + SConceptPropertyOperations.getString(_context.getParameterNode(), "alias");
            } else {
              return SConceptPropertyOperations.getString(_context.getParameterNode(), "alias");
            }
          }
        };
      }
    });
    return references;
  }
}
