package codeOrchestra.help;

import jetbrains.mps.workbench.actions.help.ShowSiteAction;

/**
 * @author Alexander Eliseyev
 */
public class ShowCodeOrchestraBlogAction extends ShowSiteAction {

  public ShowCodeOrchestraBlogAction() {
    super("Code Orchestra Blog");
  }

  protected String getSiteURL() {
    return "http://blog.codeorchestra.com";
  }

}
