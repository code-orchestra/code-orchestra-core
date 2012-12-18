package codeOrchestra.actionscript.wizards.newproject;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ex.ProjectManagerEx;
import com.intellij.openapi.vfs.LocalFileSystem;
import jetbrains.mps.workbench.dialogs.project.newproject.ProjectFactory.ProjectNotCreatedException;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public abstract class ASAbstractProjectSource implements ASProjectSource {

  public Project createProject(Project currentProject) throws ProjectNotCreatedException {

    LocalFileSystem.getInstance().refresh(false);

    // Create a new project
    final Project[] projectReturn = new Project[] { null };
    final String[] error = new String[] { null };
    ProgressManager.getInstance().run(new Task.Modal(currentProject, "Creating", false) {
      public void run(@NotNull() ProgressIndicator indicator) {
        indicator.setIndeterminate(true);
        error[0] = createDirs();
        if (error[0] != null) return;
        String projectFilePath = NewProjectPathHelper.getProjectFilePath(getSettings().getProjectPath(), getSettings().getProjectName());
        projectReturn[0] = ProjectManagerEx.getInstanceEx().newProject(getSettings().getProjectName(), projectFilePath, true, false);
      }
    });

    // Report errors
    if (error[0] != null) {
      throw new ProjectNotCreatedException(error[0]);
    }

    // Save the project
    final Project createdProject = projectReturn[0];
    createdProject.save();

    // Prepare created project
    prepareCreatedProject(createdProject);

    return createdProject;
  }

  protected abstract void prepareCreatedProject(Project createdProject);

}
