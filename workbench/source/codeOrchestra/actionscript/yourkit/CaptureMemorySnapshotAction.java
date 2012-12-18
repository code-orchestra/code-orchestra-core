package codeOrchestra.actionscript.yourkit;

import com.intellij.openapi.actionSystem.AnActionEvent;
import codeOrchestra.actionscript.yourkit.SavedSnapshotHandler.Type;
import jetbrains.mps.workbench.action.BaseAction;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import java.util.Map;

/**
 * @author Anton.I.Neverov
 */
public class CaptureMemorySnapshotAction extends BaseAction {
  private static final Icon ICON = new ImageIcon(CaptureMemorySnapshotAction.class.getResource("mem.png"));

  public CaptureMemorySnapshotAction() {
    super("Capture Memory Snapshot", "", ICON);
    this.setIsAlwaysVisible(true);
    this.setExecuteOutsideCommand(false);
    super.setDisableOnNoProject(false);
  }

  public boolean isApplicable(AnActionEvent event, final Map<String, Object> _params) {
    return YourKitControllerManager.isJVMLaunchedWithAgent();
  }

  public void doUpdate(@NotNull AnActionEvent event, final Map<String, Object> _params) {
    try {
      {
        boolean enabled = this.isApplicable(event, _params);
        this.setEnabledState(event.getPresentation(), enabled);
      }
    } catch (Throwable t) {
      this.disable(event.getPresentation());
    }
  }

  protected boolean collectActionData(AnActionEvent event, final Map<String, Object> _params) {
    return super.collectActionData(event, _params);
  }

  @Override
  protected void doExecute(@NotNull final AnActionEvent event, final Map<String, Object> _params) {
    try {
      YourKitControllerManager myControllerManager = YourKitControllerManager.getInstance();
      String path = myControllerManager.captureMemorySnapshot();
      SavedSnapshotHandler savedSnapshotHandler = new SavedSnapshotHandler(path, Type.MEM);
      savedSnapshotHandler.showDialogAndHandle();
    } catch (Exception ex) {
      JOptionPane.showMessageDialog(JOptionPane.getRootFrame(), "Can't take snapshot", "Error", JOptionPane.ERROR_MESSAGE);
    }
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }
}
