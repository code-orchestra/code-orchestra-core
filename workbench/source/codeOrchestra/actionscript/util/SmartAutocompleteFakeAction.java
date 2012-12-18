package codeOrchestra.actionscript.util;

import com.intellij.openapi.actionSystem.AnActionEvent;
import jetbrains.mps.workbench.action.BaseAction;

import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class SmartAutocompleteFakeAction extends BaseAction {

  public SmartAutocompleteFakeAction() {
    super("Code Smart Autocomplete", "Code smart autocompletition action", null);
  }

  @Override
  protected void doExecute(AnActionEvent e, Map<String, Object> params) {
    // do nothing
  }

  @Override
  protected void doUpdate(AnActionEvent e, Map<String, Object> params) {
    e.getPresentation().setVisible(false);
    e.getPresentation().setEnabled(false);
  }

  @Override
  public String getActionId() {
    return "SmartTypeCompletion";
  }


}
