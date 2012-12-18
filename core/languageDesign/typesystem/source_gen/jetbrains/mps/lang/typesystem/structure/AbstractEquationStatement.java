package jetbrains.mps.lang.typesystem.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Statement;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.Expression;
import java.util.Iterator;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class AbstractEquationStatement extends Statement {
  public static final String concept = "jetbrains.mps.lang.typesystem.structure.AbstractEquationStatement";
  public static final String CHECK_ONLY = "checkOnly";
  public static final String LEFT_EXPRESSION = "leftExpression";
  public static final String RIGHT_EXPRESSION = "rightExpression";
  public static final String NODE_TO_CHECK = "nodeToCheck";
  public static final String ERROR_STRING = "errorString";
  public static final String HELGINS_INTENTION = "helginsIntention";

  public AbstractEquationStatement(SNode node) {
    super(node);
  }

  public boolean getCheckOnly() {
    return this.getBooleanProperty(AbstractEquationStatement.CHECK_ONLY);
  }

  public void setCheckOnly(boolean value) {
    this.setBooleanProperty(AbstractEquationStatement.CHECK_ONLY, value);
  }

  public TypeClause getLeftExpression() {
    return (TypeClause) this.getChild(TypeClause.class, AbstractEquationStatement.LEFT_EXPRESSION);
  }

  public void setLeftExpression(TypeClause node) {
    super.setChild(AbstractEquationStatement.LEFT_EXPRESSION, node);
  }

  public TypeClause getRightExpression() {
    return (TypeClause) this.getChild(TypeClause.class, AbstractEquationStatement.RIGHT_EXPRESSION);
  }

  public void setRightExpression(TypeClause node) {
    super.setChild(AbstractEquationStatement.RIGHT_EXPRESSION, node);
  }

  public Expression getNodeToCheck() {
    return (Expression) this.getChild(Expression.class, AbstractEquationStatement.NODE_TO_CHECK);
  }

  public void setNodeToCheck(Expression node) {
    super.setChild(AbstractEquationStatement.NODE_TO_CHECK, node);
  }

  public Expression getErrorString() {
    return (Expression) this.getChild(Expression.class, AbstractEquationStatement.ERROR_STRING);
  }

  public void setErrorString(Expression node) {
    super.setChild(AbstractEquationStatement.ERROR_STRING, node);
  }

  public int getHelginsIntentionsCount() {
    return this.getChildCount(AbstractEquationStatement.HELGINS_INTENTION);
  }

  public Iterator<TypesystemIntention> helginsIntentions() {
    return this.children(TypesystemIntention.class, AbstractEquationStatement.HELGINS_INTENTION);
  }

  public List<TypesystemIntention> getHelginsIntentions() {
    return this.getChildren(TypesystemIntention.class, AbstractEquationStatement.HELGINS_INTENTION);
  }

  public void addHelginsIntention(TypesystemIntention node) {
    this.addChild(AbstractEquationStatement.HELGINS_INTENTION, node);
  }

  public void insertHelginsIntention(TypesystemIntention prev, TypesystemIntention node) {
    this.insertChild(prev, AbstractEquationStatement.HELGINS_INTENTION, node);
  }

  public static AbstractEquationStatement newInstance(SModel sm, boolean init) {
    return (AbstractEquationStatement) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.AbstractEquationStatement", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static AbstractEquationStatement newInstance(SModel sm) {
    return AbstractEquationStatement.newInstance(sm, false);
  }
}
