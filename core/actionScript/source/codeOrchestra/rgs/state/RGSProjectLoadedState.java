package codeOrchestra.rgs.state;

import codeOrchestra.rgs.state.model.RemoteProject;

/**
 * @author Alexander Eliseyev
 */
public class RGSProjectLoadedState extends RGSProjectState implements RGSState {

  public RGSProjectLoadedState(RemoteProject project) {
    super(project);
  }

  @Override
  public String getPresentation() {
    return "Project loaded: " + getProject().getProjectName();
  }
}
