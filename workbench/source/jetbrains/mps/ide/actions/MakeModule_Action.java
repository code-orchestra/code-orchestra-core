package jetbrains.mps.ide.actions;

import com.intellij.openapi.actionSystem.AnActionEvent;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.Map;

@CodeOrchestraPatch
public class MakeModule_Action extends GenerateAllModelsInModuleAction {

  public MakeModule_Action() {
    super(false);
  }

  @Override
  protected void doUpdate(AnActionEvent e, Map<String, Object> _params) {
    super.doUpdate(e, _params);
    e.getPresentation().setText("Make");
  }
}
