package jetbrains.mps.execution.settings.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.INodeAdapter;

public interface PersistentConfigurationAssistent extends INodeAdapter {
  public static final String concept = "jetbrains.mps.execution.settings.structure.PersistentConfigurationAssistent";
  public static final String CONFIGURATION = "configuration";

  public PersistentConfiguration getConfiguration();
  public void setConfiguration(PersistentConfiguration node);
}
