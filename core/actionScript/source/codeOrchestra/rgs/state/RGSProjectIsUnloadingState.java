package codeOrchestra.rgs.state;

import codeOrchestra.rgs.state.model.RemoteProject;

/**
 * @author Alexander Eliseyev
 */
public class RGSProjectIsUnloadingState extends RGSProjectState implements RGSState {

  public RGSProjectIsUnloadingState(RemoteProject project) {
    super(project);
  }

  @Override
  public String getPresentation() {
    return "Unloading the project: " + getProject().getProjectName();
  }
}