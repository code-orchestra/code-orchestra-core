package jetbrains.mps.lang.editor.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class UnderlinedStyleClassItem extends StyleClassItem {
  public static final String concept = "jetbrains.mps.lang.editor.structure.UnderlinedStyleClassItem";
  public static final String UNDERLINED = "underlined";
  public static final String QUERY = "query";

  public UnderlinedStyleClassItem(SNode node) {
    super(node);
  }

  public UnderlineStyle getUnderlined() {
    String value = super.getProperty(UnderlinedStyleClassItem.UNDERLINED);
    return UnderlineStyle.parseValue(value);
  }

  public void setUnderlined(UnderlineStyle value) {
    super.setProperty(UnderlinedStyleClassItem.UNDERLINED, value.getValueAsString());
  }

  public QueryFunction_Underlined getQuery() {
    return (QueryFunction_Underlined) this.getChild(QueryFunction_Underlined.class, UnderlinedStyleClassItem.QUERY);
  }

  public void setQuery(QueryFunction_Underlined node) {
    super.setChild(UnderlinedStyleClassItem.QUERY, node);
  }

  public static UnderlinedStyleClassItem newInstance(SModel sm, boolean init) {
    return (UnderlinedStyleClassItem) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.editor.structure.UnderlinedStyleClassItem", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static UnderlinedStyleClassItem newInstance(SModel sm) {
    return UnderlinedStyleClassItem.newInstance(sm, false);
  }
}
