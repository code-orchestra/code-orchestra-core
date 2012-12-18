package jetbrains.mps.baseLanguage.plugin;

/*Generated by MPS */

import jetbrains.mps.plugins.pluginparts.actions.GeneratedActionGroup;
import jetbrains.mps.logging.Logger;

public class PrintNodePosition_ActionGroup extends GeneratedActionGroup {
  private static Logger LOG = Logger.getLogger(PrintNodePosition_ActionGroup.class);
  public static final String ID = "jetbrains.mps.baseLanguage.plugin.PrintNodePosition_ActionGroup";

  public PrintNodePosition_ActionGroup() {
    super("PrintNodePosition", ID);
    this.setIsInternal(false);
    this.setPopup(false);
    try {
      PrintNodePosition_ActionGroup.this.addAction("jetbrains.mps.baseLanguage.plugin.PrintNodePosition_Action");
    } catch (Throwable t) {
      LOG.error("User group error", t);
    }
  }
}
