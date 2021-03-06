package jetbrains.mps.baseLanguage.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class SubstringExpression extends Expression {
  public static final String concept = "jetbrains.mps.baseLanguage.structure.SubstringExpression";
  public static final String OPERAND = "operand";
  public static final String START_INDEX = "startIndex";
  public static final String END_INDEX = "endIndex";

  public SubstringExpression(SNode node) {
    super(node);
  }

  public Expression getOperand() {
    return (Expression) this.getChild(Expression.class, SubstringExpression.OPERAND);
  }

  public void setOperand(Expression node) {
    super.setChild(SubstringExpression.OPERAND, node);
  }

  public Expression getStartIndex() {
    return (Expression) this.getChild(Expression.class, SubstringExpression.START_INDEX);
  }

  public void setStartIndex(Expression node) {
    super.setChild(SubstringExpression.START_INDEX, node);
  }

  public Expression getEndIndex() {
    return (Expression) this.getChild(Expression.class, SubstringExpression.END_INDEX);
  }

  public void setEndIndex(Expression node) {
    super.setChild(SubstringExpression.END_INDEX, node);
  }

  public static SubstringExpression newInstance(SModel sm, boolean init) {
    return (SubstringExpression) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.SubstringExpression", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static SubstringExpression newInstance(SModel sm) {
    return SubstringExpression.newInstance(sm, false);
  }
}
