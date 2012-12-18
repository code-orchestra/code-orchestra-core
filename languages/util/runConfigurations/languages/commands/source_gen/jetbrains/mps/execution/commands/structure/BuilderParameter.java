package jetbrains.mps.execution.commands.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.NodeAttribute;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class BuilderParameter extends NodeAttribute {
  public static final String concept = "jetbrains.mps.execution.commands.structure.BuilderParameter";

  public BuilderParameter(SNode node) {
    super(node);
  }

  public static BuilderParameter newInstance(SModel sm, boolean init) {
    return (BuilderParameter) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.execution.commands.structure.BuilderParameter", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static BuilderParameter newInstance(SModel sm) {
    return BuilderParameter.newInstance(sm, false);
  }
}
