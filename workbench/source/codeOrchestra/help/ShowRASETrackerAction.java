package codeOrchestra.help;

import jetbrains.mps.workbench.actions.help.ShowSiteAction;

/**
 * @author Alexander Eliseyev
 */
public class ShowRASETrackerAction extends ShowSiteAction {

  public ShowRASETrackerAction() {
    super("Code Orchestra Issue Tracker");
  }

  protected String getSiteURL() {
    return "http://codeOrchestra.myjetbrains.com/youtrack/issues/RF";
  }

}
