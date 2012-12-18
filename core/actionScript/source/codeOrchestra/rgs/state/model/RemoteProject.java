package codeOrchestra.rgs.state.model;

import com.intellij.openapi.project.Project;

import java.io.Serializable;

/**
 * @author Alexander Eliseyev
 */
public class RemoteProject implements Serializable {

  public static RemoteProject forName(String projectName) {
    RemoteProject remoteProject = new RemoteProject();
    remoteProject.setProjectName(projectName);
    return remoteProject;
  }

  private String projectName;

  public RemoteProject() {
  }

  public RemoteProject(Project project) {
    this.projectName = project.getName();
  }

  public String getProjectName() {
    return projectName;
  }

  public void setProjectName(String projectName) {
    this.projectName = projectName;
  }

  public boolean isTheSameAs(Project project) {
    return projectName.equals(project.getName());
  }

}
