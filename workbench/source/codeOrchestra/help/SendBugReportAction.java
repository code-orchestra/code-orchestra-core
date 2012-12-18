package codeOrchestra.help;

import com.intellij.ide.DataManager;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.application.impl.LaterInvocator;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.WindowManager;
import jetbrains.mps.ide.blame.IssueType;
import jetbrains.mps.ide.blame.dialog.BlameDialog;
import jetbrains.mps.ide.blame.dialog.BlameDialogComponent;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.BaseAction;

import javax.swing.JFrame;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class SendBugReportAction extends BaseAction {

  public SendBugReportAction() {
    super("Send Bug Report");
    setDisableOnNoProject(false);
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  @Override
  protected void doExecute(AnActionEvent e, Map<String, Object> params) {
    LaterInvocator.invokeLater(new Runnable() {
      @Override
      public void run() {
        Project project = MPSDataKeys.PROJECT.getData(DataManager.getInstance().getDataContext());

        JFrame frame = WindowManager.getInstance().getFrame(project);
        BlameDialog dialog = BlameDialogComponent.getInstance().createDialog(project, frame);

        dialog.setIssueType(IssueType.BUG);
        dialog.showDialog();


        // TODO: implement

      }
    });
  }
}
