package jetbrains.mps.lang.generator.generationContext.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class GenerationContextOp_GetOriginalCopiedInputByOutput extends GenerationContextOp_Base {
  public static final String concept = "jetbrains.mps.lang.generator.generationContext.structure.GenerationContextOp_GetOriginalCopiedInputByOutput";
  public static final String OUTPUT_NODE = "outputNode";

  public GenerationContextOp_GetOriginalCopiedInputByOutput(SNode node) {
    super(node);
  }

  public Expression getOutputNode() {
    return (Expression) this.getChild(Expression.class, GenerationContextOp_GetOriginalCopiedInputByOutput.OUTPUT_NODE);
  }

  public void setOutputNode(Expression node) {
    super.setChild(GenerationContextOp_GetOriginalCopiedInputByOutput.OUTPUT_NODE, node);
  }

  public static GenerationContextOp_GetOriginalCopiedInputByOutput newInstance(SModel sm, boolean init) {
    return (GenerationContextOp_GetOriginalCopiedInputByOutput) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.generator.generationContext.structure.GenerationContextOp_GetOriginalCopiedInputByOutput", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static GenerationContextOp_GetOriginalCopiedInputByOutput newInstance(SModel sm) {
    return GenerationContextOp_GetOriginalCopiedInputByOutput.newInstance(sm, false);
  }
}
