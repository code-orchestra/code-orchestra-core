package codeOrchestra.actionScript.license;

import com.intellij.openapi.actionSystem.AnActionEvent;
import jetbrains.mps.workbench.action.BaseAction;

import java.util.Map;

/**
 * RE-2715
 * @author Alexander Eliseyev
 */
public class EnterSerialNumberAction extends BaseAction {

  public EnterSerialNumberAction() {
    super("Enter Serial Number");
    setDisableOnNoProject(false);
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  @Override
  protected void doUpdate(AnActionEvent e, Map<String, Object> params) {
    super.doUpdate(e, params);
    
    if (CodeOrchestraLicenseManager.isLicenseValid()) {
      disable(e.getPresentation());
    }
  }

  protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
    CodeOrchestraLicenseDialogs.showSerialNumberDialog();
  }

}
