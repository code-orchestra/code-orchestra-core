package jetbrains.mps.lang.actions.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class MenuPart extends BaseConcept {
  public static final String concept = "jetbrains.mps.lang.actions.structure.MenuPart";
  public static final String ACTION_TYPE = "actionType";

  public MenuPart(SNode node) {
    super(node);
  }

  public QueryFunction_ActionType getActionType() {
    return (QueryFunction_ActionType) this.getChild(QueryFunction_ActionType.class, MenuPart.ACTION_TYPE);
  }

  public void setActionType(QueryFunction_ActionType node) {
    super.setChild(MenuPart.ACTION_TYPE, node);
  }

  public static MenuPart newInstance(SModel sm, boolean init) {
    return (MenuPart) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.actions.structure.MenuPart", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static MenuPart newInstance(SModel sm) {
    return MenuPart.newInstance(sm, false);
  }
}
