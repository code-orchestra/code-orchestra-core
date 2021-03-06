package jetbrains.mps.ui.modeling.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class EditableUIPropertyAccessCode extends UIPropertyAccessCode {
  public static final String concept = "jetbrains.mps.ui.modeling.structure.EditableUIPropertyAccessCode";
  public static final String HANDLER_SETUP = "handlerSetup";

  public EditableUIPropertyAccessCode(SNode node) {
    super(node);
  }

  public EditableUIProperty getProperty() {
    return this.ensureAdapter(EditableUIProperty.class, "property", this.getProperty());
  }

  public void setProperty(EditableUIProperty node) {
    this.setProperty(node);
  }

  public PropertyChangeHandlerSetup getHandlerSetup() {
    return (PropertyChangeHandlerSetup) this.getChild(PropertyChangeHandlerSetup.class, EditableUIPropertyAccessCode.HANDLER_SETUP);
  }

  public void setHandlerSetup(PropertyChangeHandlerSetup node) {
    super.setChild(EditableUIPropertyAccessCode.HANDLER_SETUP, node);
  }

  public static EditableUIPropertyAccessCode newInstance(SModel sm, boolean init) {
    return (EditableUIPropertyAccessCode) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.ui.modeling.structure.EditableUIPropertyAccessCode", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static EditableUIPropertyAccessCode newInstance(SModel sm) {
    return EditableUIPropertyAccessCode.newInstance(sm, false);
  }
}
