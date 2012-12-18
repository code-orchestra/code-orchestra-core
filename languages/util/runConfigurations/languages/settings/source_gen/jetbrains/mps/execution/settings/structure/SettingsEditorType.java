package jetbrains.mps.execution.settings.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Type;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class SettingsEditorType extends Type {
  public static final String concept = "jetbrains.mps.execution.settings.structure.SettingsEditorType";
  public static final String CONFIGURATION = "configuration";

  public SettingsEditorType(SNode node) {
    super(node);
  }

  public PersistentConfiguration getConfiguration() {
    return (PersistentConfiguration) this.getReferent(PersistentConfiguration.class, SettingsEditorType.CONFIGURATION);
  }

  public void setConfiguration(PersistentConfiguration node) {
    super.setReferent(SettingsEditorType.CONFIGURATION, node);
  }

  public static SettingsEditorType newInstance(SModel sm, boolean init) {
    return (SettingsEditorType) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.execution.settings.structure.SettingsEditorType", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static SettingsEditorType newInstance(SModel sm) {
    return SettingsEditorType.newInstance(sm, false);
  }
}
