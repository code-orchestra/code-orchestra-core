package codeOrchestra.rgs.state;

import codeOrchestra.rgs.state.model.RemoteProject;

/**
 * @author Alexander Eliseyev
 */
public class RGSProjectIsLoadingState extends RGSProjectState implements RGSState {

  public RGSProjectIsLoadingState(RemoteProject project) {
    super(project);
  }

  @Override
  public String getPresentation() {
    return "Loading the project: " + getProject().getProjectName();
  }

}
