package jetbrains.mps.ide.actions;

import com.intellij.openapi.actionSystem.AnActionEvent;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.workbench.MPSDataKeys;

import java.util.HashSet;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public class GenerateAllModulesInProjectAction extends BaseGenerateAction {

  public GenerateAllModulesInProjectAction(boolean regenerate) {
    super(regenerate);
  }

  @Override
  protected Set<IModule> getRootModules(AnActionEvent e) {
    MPSProject mpsProject = e.getData(MPSDataKeys.MPS_PROJECT);
    assert mpsProject != null;
    return new HashSet(mpsProject.getModules());
  }

  @Override
  protected String getObject() {
    return "Project";
  }
}
