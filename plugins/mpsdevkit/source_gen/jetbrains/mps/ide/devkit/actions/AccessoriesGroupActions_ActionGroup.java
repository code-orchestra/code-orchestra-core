package jetbrains.mps.ide.devkit.actions;

/*Generated by MPS */

import jetbrains.mps.plugins.pluginparts.actions.GeneratedActionGroup;
import jetbrains.mps.logging.Logger;

public class AccessoriesGroupActions_ActionGroup extends GeneratedActionGroup {
  private static Logger LOG = Logger.getLogger(AccessoriesGroupActions_ActionGroup.class);
  public static final String ID = "jetbrains.mps.ide.devkit.actions.AccessoriesGroupActions_ActionGroup";

  public AccessoriesGroupActions_ActionGroup() {
    super("AccessoriesGroupActions", ID);
    this.setIsInternal(false);
    this.setPopup(false);
    try {
      AccessoriesGroupActions_ActionGroup.this.addAction("jetbrains.mps.ide.devkit.actions.NewAccessoryModel_Action");
      AccessoriesGroupActions_ActionGroup.this.addAction("jetbrains.mps.ide.devkit.actions.AddAccessoryModel_Action");
    } catch (Throwable t) {
      LOG.error("User group error", t);
    }
  }
}
