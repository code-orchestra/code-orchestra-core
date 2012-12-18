package codeOrchestra.help;

import com.intellij.ide.BrowserUtil;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.application.PathManager;
import jetbrains.mps.workbench.action.BaseAction;

import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class GoToLogsFolder extends BaseAction {

  public GoToLogsFolder() {
    super("Browse to Editor Logs Folder");
    setDisableOnNoProject(false);
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
    BrowserUtil.launchBrowser(PathManager.getLogPath());
  }

}
