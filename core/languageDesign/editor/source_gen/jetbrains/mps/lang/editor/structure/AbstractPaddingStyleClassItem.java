package jetbrains.mps.lang.editor.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class AbstractPaddingStyleClassItem extends FloatStyleClassItem {
  public static final String concept = "jetbrains.mps.lang.editor.structure.AbstractPaddingStyleClassItem";
  public static final String MEASURE = "measure";

  public AbstractPaddingStyleClassItem(SNode node) {
    super(node);
  }

  public _Enum_Measure getMeasure() {
    String value = super.getProperty(AbstractPaddingStyleClassItem.MEASURE);
    return _Enum_Measure.parseValue(value);
  }

  public void setMeasure(_Enum_Measure value) {
    super.setProperty(AbstractPaddingStyleClassItem.MEASURE, value.getValueAsString());
  }

  public static AbstractPaddingStyleClassItem newInstance(SModel sm, boolean init) {
    return (AbstractPaddingStyleClassItem) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.editor.structure.AbstractPaddingStyleClassItem", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static AbstractPaddingStyleClassItem newInstance(SModel sm) {
    return AbstractPaddingStyleClassItem.newInstance(sm, false);
  }
}
