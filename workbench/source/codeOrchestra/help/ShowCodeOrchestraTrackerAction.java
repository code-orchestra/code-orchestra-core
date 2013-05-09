package codeOrchestra.help;

import jetbrains.mps.workbench.actions.help.ShowSiteAction;

/**
 * @author Alexander Eliseyev
 */
public class ShowCodeOrchestraTrackerAction extends ShowSiteAction {

  public ShowCodeOrchestraTrackerAction() {
    super("Code Orchestra Issue Tracker");
  }

  protected String getSiteURL() {
    return "http://tracker.codeorchestra.com/youtrack/issues/CF";
  }

}
