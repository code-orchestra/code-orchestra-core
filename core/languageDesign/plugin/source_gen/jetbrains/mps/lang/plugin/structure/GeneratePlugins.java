package jetbrains.mps.lang.plugin.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class GeneratePlugins extends BaseConcept {
  public static final String concept = "jetbrains.mps.lang.plugin.structure.GeneratePlugins";
  public static final String GENERATE_APPLICATION_PLUGIN = "generateApplicationPlugin";
  public static final String GENERATE_PROJECT_PLUGIN = "generateProjectPlugin";

  public GeneratePlugins(SNode node) {
    super(node);
  }

  public boolean getGenerateApplicationPlugin() {
    return this.getBooleanProperty(GeneratePlugins.GENERATE_APPLICATION_PLUGIN);
  }

  public void setGenerateApplicationPlugin(boolean value) {
    this.setBooleanProperty(GeneratePlugins.GENERATE_APPLICATION_PLUGIN, value);
  }

  public boolean getGenerateProjectPlugin() {
    return this.getBooleanProperty(GeneratePlugins.GENERATE_PROJECT_PLUGIN);
  }

  public void setGenerateProjectPlugin(boolean value) {
    this.setBooleanProperty(GeneratePlugins.GENERATE_PROJECT_PLUGIN, value);
  }

  public static GeneratePlugins newInstance(SModel sm, boolean init) {
    return (GeneratePlugins) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.plugin.structure.GeneratePlugins", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static GeneratePlugins newInstance(SModel sm) {
    return GeneratePlugins.newInstance(sm, false);
  }
}
