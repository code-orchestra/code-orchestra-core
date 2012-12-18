package jetbrains.mps.ide.messages.navigation;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.messages.NavigationManager;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;

public class ModuleReferenceNavigationHandler implements INavigationHandler<ModuleReference> {
  public void navigate(Project project, ModuleReference object, boolean focus, boolean select) {
    IModule module = MPSModuleRepository.getInstance().getModule(object);
    if (module == null) return;
    NavigationManager.getInstance().navigateTo(project, module, focus, select);
  }
}