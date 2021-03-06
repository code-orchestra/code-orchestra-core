package jetbrains.mps.lang.editor.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class TableComponentStyleClassItem extends StyleClassItem {
  public static final String concept = "jetbrains.mps.lang.editor.structure.TableComponentStyleClassItem";
  public static final String TABLE_COMPONENT = "tableComponent";

  public TableComponentStyleClassItem(SNode node) {
    super(node);
  }

  public TableComponentEnum getTableComponent() {
    String value = super.getProperty(TableComponentStyleClassItem.TABLE_COMPONENT);
    return TableComponentEnum.parseValue(value);
  }

  public void setTableComponent(TableComponentEnum value) {
    super.setProperty(TableComponentStyleClassItem.TABLE_COMPONENT, value.getValueAsString());
  }

  public static TableComponentStyleClassItem newInstance(SModel sm, boolean init) {
    return (TableComponentStyleClassItem) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.editor.structure.TableComponentStyleClassItem", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static TableComponentStyleClassItem newInstance(SModel sm) {
    return TableComponentStyleClassItem.newInstance(sm, false);
  }
}
