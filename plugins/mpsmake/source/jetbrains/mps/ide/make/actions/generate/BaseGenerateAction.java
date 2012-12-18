package jetbrains.mps.ide.make.actions.generate;

import jetbrains.mps.util.annotation.CodeOrchestraPatch;

/**
 * @author  Alexander Eliseyev
 */
@CodeOrchestraPatch
public abstract class BaseGenerateAction extends jetbrains.mps.ide.actions.BaseGenerateAction {

  public BaseGenerateAction(boolean rebuildAll) {
    super(rebuildAll);
  }

}

