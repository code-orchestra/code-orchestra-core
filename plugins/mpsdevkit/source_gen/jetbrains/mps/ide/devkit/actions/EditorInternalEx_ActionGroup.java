package jetbrains.mps.ide.devkit.actions;

/*Generated by MPS */

import jetbrains.mps.plugins.pluginparts.actions.GeneratedActionGroup;
import jetbrains.mps.logging.Logger;

public class EditorInternalEx_ActionGroup extends GeneratedActionGroup {
  private static Logger LOG = Logger.getLogger(EditorInternalEx_ActionGroup.class);
  public static final String ID = "jetbrains.mps.ide.devkit.actions.EditorInternalEx_ActionGroup";

  public EditorInternalEx_ActionGroup() {
    super("EditorInternalEx", ID);
    this.setIsInternal(false);
    this.setPopup(false);
    try {
      EditorInternalEx_ActionGroup.this.addAction("jetbrains.mps.ide.devkit.actions.TestNodePath_Action");
      EditorInternalEx_ActionGroup.this.addAction("jetbrains.mps.ide.devkit.actions.CellProperties_Action");
      EditorInternalEx_ActionGroup.this.addAction("jetbrains.mps.ide.devkit.actions.ShowCellInExplorer_Action");
      EditorInternalEx_ActionGroup.this.addAction("jetbrains.mps.ide.devkit.actions.PrintNodeID_Action");
      EditorInternalEx_ActionGroup.this.addAction("jetbrains.mps.ide.devkit.actions.HighlightCellDependencies_Action");
      EditorInternalEx_ActionGroup.this.addAction("jetbrains.mps.ide.devkit.actions.LanguagePaths_Action");
    } catch (Throwable t) {
      LOG.error("User group error", t);
    }
  }
}
