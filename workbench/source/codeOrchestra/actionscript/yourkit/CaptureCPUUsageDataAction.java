package codeOrchestra.actionscript.yourkit;

import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.Toggleable;
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
public class CaptureCPUUsageDataAction extends BaseAction implements Toggleable {
  private static final Icon ICON = new ImageIcon(CaptureCPUUsageDataAction.class.getResource("cpu.png"));
  private static final String selectedText = "Stop capturing CPU Usage Data and save snapshot";
  private static final String unSelectedText = "Start capturing CPU Usage Data";

  public CaptureCPUUsageDataAction() {
    super(unSelectedText, "", ICON);
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

  public void doExecute(@NotNull final AnActionEvent event, final Map<String, Object> _params) {
    try {
      YourKitControllerManager myControllerManager = YourKitControllerManager.getInstance();
      if (!(myControllerManager.isInProgress())) {
        myControllerManager.startCPUProfiling();
        event.getPresentation().putClientProperty(Toggleable.SELECTED_PROPERTY, true);
        event.getPresentation().setText(selectedText);
      } else {
        String path = myControllerManager.stopCPUProfilingAndSaveSnapshot();
        event.getPresentation().putClientProperty(Toggleable.SELECTED_PROPERTY, false);
        event.getPresentation().setText(unSelectedText);
        SavedSnapshotHandler savedSnapshotHandler = new SavedSnapshotHandler(path, Type.MEM);
        savedSnapshotHandler.showDialogAndHandle();
      }
    } catch (Exception e) {
      JOptionPane.showMessageDialog(JOptionPane.getRootFrame(), "Can't take snapshot", "Error", JOptionPane.ERROR_MESSAGE);
    }
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }
}
