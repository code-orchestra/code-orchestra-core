package codeOrchestra.help;

import jetbrains.mps.workbench.actions.help.ShowSiteAction;

/**
 * @author Alexander Eliseyev
 */
public class ShowCodeOrchestraUserGroupAction extends ShowSiteAction {

  public ShowCodeOrchestraUserGroupAction() {
    super("Code Orchestra User Group Tracker");
  }

  protected String getSiteURL() {
    return "https://groups.google.com/forum/?fromgroups#!forum/realaxyeditor";
  }

}
