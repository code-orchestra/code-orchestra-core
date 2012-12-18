package codeOrchestra.rgs.state;

import codeOrchestra.rgs.state.model.RemoteProject;

/**
 * @author Alexander Eliseyev
 */
public abstract class RGSProjectState extends RGSConnectedState implements RGSState {

  private RemoteProject project;

  public RGSProjectState(RemoteProject project) {
    this.project = project;
  }

  public RemoteProject getProject() {
    return project;
  }

  public void setProject(RemoteProject project) {
    this.project = project;
  }

  public String toString() {
    return getClass().getSimpleName() + ": " + project.getProjectName();
  }

}
