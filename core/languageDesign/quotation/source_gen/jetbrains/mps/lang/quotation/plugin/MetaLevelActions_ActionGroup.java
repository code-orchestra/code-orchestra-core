package jetbrains.mps.lang.quotation.plugin;

/*Generated by MPS */

import jetbrains.mps.plugins.pluginparts.actions.GeneratedActionGroup;
import jetbrains.mps.logging.Logger;

public class MetaLevelActions_ActionGroup extends GeneratedActionGroup {
  private static Logger LOG = Logger.getLogger(MetaLevelActions_ActionGroup.class);
  public static final String ID = "jetbrains.mps.lang.quotation.plugin.MetaLevelActions_ActionGroup";

  public MetaLevelActions_ActionGroup() {
    super("MetaLevelActions", ID);
    this.setIsInternal(false);
    this.setPopup(false);
    try {
      MetaLevelActions_ActionGroup.this.addAction("jetbrains.mps.lang.quotation.plugin.ShowMetaLevel_Action");
    } catch (Throwable t) {
      LOG.error("User group error", t);
    }
  }
}
