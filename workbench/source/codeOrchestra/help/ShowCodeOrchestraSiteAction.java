package codeOrchestra.help;

import jetbrains.mps.workbench.actions.help.ShowSiteAction;

/**
 * @author Alexander Eliseyev
 */
public class ShowCodeOrchestraSiteAction extends ShowSiteAction {

  public ShowCodeOrchestraSiteAction() {
    super("Code Orchestra Home");
  }

  protected String getSiteURL() {
    return "http://codeorchestra.com";
  }

}
