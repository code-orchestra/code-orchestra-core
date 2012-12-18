package jetbrains.mps.baseLanguage.typesystem;

/*Generated by MPS */

import jetbrains.mps.errors.QuickFix_Runtime;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.IAttributeDescriptor;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;

public class ReplaceClassAntiquotationWithClassifierType_QuickFix extends QuickFix_Runtime {
  public ReplaceClassAntiquotationWithClassifierType_QuickFix() {
  }

  public String getDescription() {
    return "Replace antiquotation with classifier type with reference antiquotation";
  }

  public void execute(SNode node) {
    SNode expression = SLinkOperations.getTarget(((SNode) ReplaceClassAntiquotationWithClassifierType_QuickFix.this.getField("antiquotation")[0]), "expression", true);
    SNode parent = SNodeOperations.getParent(((SNode) ReplaceClassAntiquotationWithClassifierType_QuickFix.this.getField("antiquotation")[0]));
    parent.removeChild(((SNode) ReplaceClassAntiquotationWithClassifierType_QuickFix.this.getField("antiquotation")[0]));
    SNode classifierType = SNodeOperations.replaceWithNewChild(parent, "jetbrains.mps.baseLanguage.structure.ClassifierType");
    SNode referenceAntiquotation = AttributeOperations.createAndSetAttrbiute(classifierType, new IAttributeDescriptor.LinkAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.quotation.structure.ReferenceAntiquotation"), "classifier"), "jetbrains.mps.lang.quotation.structure.ReferenceAntiquotation");
    SLinkOperations.setTarget(referenceAntiquotation, "expression", expression, true);
  }
}
