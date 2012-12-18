package jetbrains.mps.ide.make.actions;

import jetbrains.mps.ide.make.actions.generate.GenerateAllModelsInModuleAction;
import jetbrains.mps.plugins.pluginparts.actions.GeneratedAction;
import javax.swing.Icon;

import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.Generator;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.intellij.openapi.actionSystem.AnActionEvent;
import java.util.Map;
import jetbrains.mps.make.IMakeService;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import java.util.List;
import jetbrains.mps.project.IModule;
import org.jetbrains.annotations.NotNull;
import jetbrains.mps.workbench.MPSDataKeys;

@CodeOrchestraPatch
public class RebuildSelectedModules_Action extends GenerateAllModelsInModuleAction {

  public RebuildSelectedModules_Action() {
    super(true);
  }

  public void doUpdate(@NotNull AnActionEvent e, final Map<String, Object> _params) {
    for (IModule module : myRootModules) {
      if ((!(module instanceof Solution)) && (!(module instanceof Language)) && (!(module instanceof Generator))) {
        disable(e.getPresentation());
        return;
      }
    }
    enable(e.getPresentation());
    String newText = "Rebuild Module(s)";
    e.getPresentation().setText(newText);
  }

}