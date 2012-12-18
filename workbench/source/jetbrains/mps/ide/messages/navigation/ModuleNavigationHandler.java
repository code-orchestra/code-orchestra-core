package jetbrains.mps.ide.messages.navigation;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.ide.projectPane.ProjectPane;
import jetbrains.mps.project.IModule;

public class ModuleNavigationHandler implements INavigationHandler<IModule> {
  public void navigate(Project project, IModule object, boolean focus, boolean select) {
    IProjectPane projectPane = ProjectPane.getInstance(project);
    if (focus) {
      projectPane.selectModule(object, true);
    } else {
      projectPane.selectModule(object, false);
    }
  }
}
