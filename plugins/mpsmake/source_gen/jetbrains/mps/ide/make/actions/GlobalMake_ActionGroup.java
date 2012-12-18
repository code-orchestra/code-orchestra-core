package jetbrains.mps.ide.make.actions;

/*Generated by MPS */

import jetbrains.mps.plugins.pluginparts.actions.GeneratedActionGroup;
import jetbrains.mps.logging.Logger;

public class GlobalMake_ActionGroup extends GeneratedActionGroup {
  private static Logger LOG = Logger.getLogger(GlobalMake_ActionGroup.class);
  public static final String ID = "jetbrains.mps.ide.make.actions.GlobalMake_ActionGroup";

  public GlobalMake_ActionGroup() {
    super("GlobalMake", ID);
    this.setIsInternal(false);
    this.setPopup(false);
    try {
      GlobalMake_ActionGroup.this.addSeparator();
      GlobalMake_ActionGroup.this.addAction("jetbrains.mps.ide.make.actions.MakeProject_Action");
      GlobalMake_ActionGroup.this.addAction("jetbrains.mps.ide.make.actions.RebuildProject_Action");
      GlobalMake_ActionGroup.this.addSeparator();
      GlobalMake_ActionGroup.this.addAction("jetbrains.mps.ide.make.actions.MakeSelectedModules_Action");
      GlobalMake_ActionGroup.this.addAction("jetbrains.mps.ide.make.actions.RebuildSelectedModules_Action");
      GlobalMake_ActionGroup.this.addSeparator();
      GlobalMake_ActionGroup.this.addAction("jetbrains.mps.ide.make.actions.MakeSelectedModels_Action");
      GlobalMake_ActionGroup.this.addAction("jetbrains.mps.ide.make.actions.RebuildSelectedModels_Action");
      GlobalMake_ActionGroup.this.addSeparator();
    } catch (Throwable t) {
      LOG.error("User group error", t);
    }
  }
}
