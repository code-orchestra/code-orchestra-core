package jetbrains.mps.ide.make.actions;

import com.intellij.openapi.actionSystem.AnActionEvent;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import jetbrains.mps.ide.make.actions.generate.GenerateAllModelsInModuleAction;
import jetbrains.mps.make.IMakeService;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.MPSDataKeys;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@CodeOrchestraPatch
public class RebuildProject_Action extends GenerateAllModelsInModuleAction {

  private static final Icon ICON = null;
  protected static Log log = LogFactory.getLog(RebuildProject_Action.class);

  public RebuildProject_Action() {
    super(true);
  }

  @Override
  protected Set<IModule> getRootModules(AnActionEvent e) {
    HashSet<IModule> result = new HashSet<IModule>();
    MPSProject mpsProject = e.getData(MPSDataKeys.MPS_PROJECT);
    for (Solution solution : mpsProject.getProjectSolutions()) {
      if (!SolutionUtils.isActionScriptDependent(solution) || SolutionUtils.isStubSolution(solution)) {
        continue;
      }
      result.add(solution);
    }
    return result;
  }

  public void doUpdate(@NotNull AnActionEvent e, final Map<String, Object> _params) {
    if (IMakeService.INSTANCE.get().isSessionActive()) {
      disable(e.getPresentation());
    } else {
      enable(e.getPresentation());
    }

    e.getPresentation().setText("_Rebuild Project");
    e.getPresentation().setIcon(ICON);
  }

}
