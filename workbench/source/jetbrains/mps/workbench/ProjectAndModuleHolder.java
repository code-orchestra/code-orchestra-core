package jetbrains.mps.workbench;

import com.intellij.openapi.project.Project;
import jetbrains.mps.project.structure.modules.ModuleReference;

import java.lang.ref.WeakReference;

/**
 * This is a hack to hold the project and module reference to make them accessible from the run configuration dialogs.
 *
 * @author Alexander Eliseyev
 */
public final class ProjectAndModuleHolder {

  private static final ProjectAndModuleHolder INSTANCE = new ProjectAndModuleHolder();

  public static ProjectAndModuleHolder getInstance() {
    return INSTANCE;
  }

  private WeakReference<Project> projectReference;
  private ModuleReference moduleReference;

  private ProjectAndModuleHolder() {
  }

  public void setProject(Project project) {
    this.projectReference = new WeakReference<Project>(project);
  }

  public Project getProject() {
    if (projectReference == null) {
      return null;
    }
    return projectReference.get();
  }

  public ModuleReference getModuleReference() {
    return moduleReference;
  }

  public void setModuleReference(ModuleReference moduleReference) {
    this.moduleReference = moduleReference;
  }
}
