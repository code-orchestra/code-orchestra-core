package jetbrains.mps.make.facet.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.INodeAdapter;
import jetbrains.mps.baseLanguage.structure.Expression;

public interface IPropertyExpression extends INodeAdapter {
  public static final String concept = "jetbrains.mps.make.facet.structure.IPropertyExpression";
  public static final String RESOURCE = "resource";

  public Expression getResource();
  public void setResource(Expression node);
}
