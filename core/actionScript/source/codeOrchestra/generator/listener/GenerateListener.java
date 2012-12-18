package codeOrchestra.generator.listener;

import jetbrains.mps.smodel.SModel;

/**
 * @author Alexander Eliseyev
 */
public interface GenerateListener {

  void preGenerationScriptStarted(SModel model, String scriptName);

  void preGenerationScriptEnded(SModel model, String scriptName);

  void generationStarted(SModel model);

  void generationEnded(SModel model);

  void primaryMappingGenerationStarted(SModel model, int majorStep);

  void primaryMappingGenerationEnded(SModel model, int majorStep);

  void postGenerationScriptStarted(SModel model, String scriptName);

  void postGenerationScriptEnded(SModel model, String scriptName);

  void secondaryMappingGenerationStarted(SModel model, int minorStep);

  void secondaryMappingGenerationEnded(SModel model, int minorStep);
}
