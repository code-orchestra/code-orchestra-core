package codeOrchestra.actionscript.yourkit;

import com.intellij.ide.BrowserUtil;
import com.intellij.openapi.actionSystem.AnActionEvent;
import jetbrains.mps.workbench.action.BaseAction;

import java.util.Map;

/**
 * @author Anton.I.Neverov
 */
public class GoToProfilingFolder extends BaseAction {

  public GoToProfilingFolder() {
    super("Browse to Editor Profiling Folder");
    setDisableOnNoProject(false);
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
    BrowserUtil.launchBrowser(YourKitControllerManager.getProfilingDirectory());
  }
}
