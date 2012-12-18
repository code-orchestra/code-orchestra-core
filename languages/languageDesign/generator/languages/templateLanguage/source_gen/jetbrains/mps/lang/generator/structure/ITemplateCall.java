package jetbrains.mps.lang.generator.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.TypeDerivable;
import java.util.Iterator;
import jetbrains.mps.baseLanguage.structure.Expression;
import java.util.List;

public interface ITemplateCall extends TypeDerivable {
  public static final String concept = "jetbrains.mps.lang.generator.structure.ITemplateCall";
  public static final String ACTUAL_ARGUMENT = "actualArgument";
  public static final String TEMPLATE = "template";

  public int getActualArgumentsCount();
  public Iterator<Expression> actualArguments();
  public List<Expression> getActualArguments();
  public void addActualArgument(Expression node);
  public void insertActualArgument(Expression prev, Expression node);
  public TemplateDeclaration getTemplate();
  public void setTemplate(TemplateDeclaration node);
}
