package codeOrchestra.help;

import jetbrains.mps.workbench.actions.help.ShowSiteAction;

/**
 * @author Alexander Eliseyev
 */
public class ShowRASESiteAction extends ShowSiteAction {

  public ShowRASESiteAction() {
    super("Code Orchestra Home");
  }

  protected String getSiteURL() {
    return "http://codeOrchestra.com";
  }

}
