package jetbrains.mps.ide.actions;

import com.intellij.openapi.actionSystem.AnActionEvent;
import jetbrains.mps.make.IMakeService;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.MPSDataKeys;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@CodeOrchestraPatch
public class MakeProject_Action extends GenerateAllModelsInModuleAction {

  private static final Icon ICON = new ImageIcon(MakeProject_Action.class.getResource("make.png"));
  protected static Log log = LogFactory.getLog(MakeProject_Action.class);

  public MakeProject_Action() {
    super(false);
  }

  @Override
  protected Set<IModule> getRootModules(AnActionEvent e) {
    MPSProject mpsProject = e.getData(MPSDataKeys.MPS_PROJECT);
    return new HashSet<IModule>(mpsProject.getProjectSolutions());
  }

  public void doUpdate(@NotNull AnActionEvent e, final Map<String, Object> _params) {
    if (IMakeService.INSTANCE.get().isSessionActive()) {
      disable(e.getPresentation());
    } else {
      enable(e.getPresentation());
    }

    e.getPresentation().setText("Build _Project");
    e.getPresentation().setIcon(ICON);
  }

}
