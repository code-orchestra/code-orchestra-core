package codeOrchestra.help;

import jetbrains.mps.workbench.actions.help.ShowSiteAction;

/**
 * @author Alexander Eliseyev
 */
public class ShowRASEBlogAction extends ShowSiteAction {

  public ShowRASEBlogAction() {
    super("Code Orchestra Blog");
  }

  protected String getSiteURL() {
    return "http://blog.codeOrchestra.com";
  }

}
