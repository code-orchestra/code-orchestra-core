package jetbrains.mps.generator.generationTypes;

import jetbrains.mps.util.annotation.CodeOrchestraPatch;

/**
 * @author Alexander Eliseyev
 */
@CodeOrchestraPatch
public interface IFileGenerationHandler extends IGenerationHandler {

  void write();

}
