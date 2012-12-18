package jetbrains.mps.lang.generator.generationContext.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.generator.structure.MappingLabelDeclaration;
import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class GenerationContextOp_GetOutputByLabelAndInput extends GenerationContextOp_Base {
  public static final String concept = "jetbrains.mps.lang.generator.generationContext.structure.GenerationContextOp_GetOutputByLabelAndInput";
  public static final String LABEL_NAME_INTERN = "labelName_intern";
  public static final String LABEL = "label";
  public static final String INPUT_NODE = "inputNode";

  public GenerationContextOp_GetOutputByLabelAndInput(SNode node) {
    super(node);
  }

  public String getLabelName_intern() {
    return this.getProperty(GenerationContextOp_GetOutputByLabelAndInput.LABEL_NAME_INTERN);
  }

  public void setLabelName_intern(String value) {
    this.setProperty(GenerationContextOp_GetOutputByLabelAndInput.LABEL_NAME_INTERN, value);
  }

  public MappingLabelDeclaration getLabel() {
    return (MappingLabelDeclaration) this.getReferent(MappingLabelDeclaration.class, GenerationContextOp_GetOutputByLabelAndInput.LABEL);
  }

  public void setLabel(MappingLabelDeclaration node) {
    super.setReferent(GenerationContextOp_GetOutputByLabelAndInput.LABEL, node);
  }

  public Expression getInputNode() {
    return (Expression) this.getChild(Expression.class, GenerationContextOp_GetOutputByLabelAndInput.INPUT_NODE);
  }

  public void setInputNode(Expression node) {
    super.setChild(GenerationContextOp_GetOutputByLabelAndInput.INPUT_NODE, node);
  }

  public static GenerationContextOp_GetOutputByLabelAndInput newInstance(SModel sm, boolean init) {
    return (GenerationContextOp_GetOutputByLabelAndInput) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.generator.generationContext.structure.GenerationContextOp_GetOutputByLabelAndInput", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static GenerationContextOp_GetOutputByLabelAndInput newInstance(SModel sm) {
    return GenerationContextOp_GetOutputByLabelAndInput.newInstance(sm, false);
  }
}
