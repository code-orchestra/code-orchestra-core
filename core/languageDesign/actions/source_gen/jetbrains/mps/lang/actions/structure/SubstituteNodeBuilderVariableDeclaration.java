package jetbrains.mps.lang.actions.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.VariableDeclaration;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class SubstituteNodeBuilderVariableDeclaration extends VariableDeclaration {
  public static final String concept = "jetbrains.mps.lang.actions.structure.SubstituteNodeBuilderVariableDeclaration";
  public static final String INITIALIZER_BLOCK = "initializerBlock";

  public SubstituteNodeBuilderVariableDeclaration(SNode node) {
    super(node);
  }

  public QueryFunction_SubstituteVariableInitializer getInitializerBlock() {
    return (QueryFunction_SubstituteVariableInitializer) this.getChild(QueryFunction_SubstituteVariableInitializer.class, SubstituteNodeBuilderVariableDeclaration.INITIALIZER_BLOCK);
  }

  public void setInitializerBlock(QueryFunction_SubstituteVariableInitializer node) {
    super.setChild(SubstituteNodeBuilderVariableDeclaration.INITIALIZER_BLOCK, node);
  }

  public static SubstituteNodeBuilderVariableDeclaration newInstance(SModel sm, boolean init) {
    return (SubstituteNodeBuilderVariableDeclaration) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.actions.structure.SubstituteNodeBuilderVariableDeclaration", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static SubstituteNodeBuilderVariableDeclaration newInstance(SModel sm) {
    return SubstituteNodeBuilderVariableDeclaration.newInstance(sm, false);
  }
}
