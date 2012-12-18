package jetbrains.mps.ide.make.actions.generate;

import jetbrains.mps.util.annotation.CodeOrchestraPatch;

@CodeOrchestraPatch
public class GenerateAllModelsInModuleAction extends jetbrains.mps.ide.actions.GenerateAllModelsInModuleAction {

  public GenerateAllModelsInModuleAction(boolean regenerate) {
    super(regenerate);
  }

}
