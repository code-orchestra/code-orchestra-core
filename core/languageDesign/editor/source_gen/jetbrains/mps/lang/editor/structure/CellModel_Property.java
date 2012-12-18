package jetbrains.mps.lang.editor.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.structure.structure.PropertyDeclaration;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class CellModel_Property extends CellModel_WithRole {
  public static final String concept = "jetbrains.mps.lang.editor.structure.CellModel_Property";

  public CellModel_Property(SNode node) {
    super(node);
  }

  public PropertyDeclaration getPropertyDeclaration() {
    return this.ensureAdapter(PropertyDeclaration.class, "relationDeclaration", this.getRelationDeclaration());
  }

  public void setPropertyDeclaration(PropertyDeclaration node) {
    this.setRelationDeclaration(node);
  }

  public static CellModel_Property newInstance(SModel sm, boolean init) {
    return (CellModel_Property) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.editor.structure.CellModel_Property", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static CellModel_Property newInstance(SModel sm) {
    return CellModel_Property.newInstance(sm, false);
  }
}
