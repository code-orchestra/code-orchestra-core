package codeOrchestra.rgs.generation;

import com.intellij.openapi.project.Project;
import codeOrchestra.generator.CodeOrchestraGenerationHandler;
import codeOrchestra.rgs.IRemoteGenerationCallback;
import codeOrchestra.rgs.logging.RGSGeneratorLogger;
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.ide.generator.GenerationSettings;

/**
 * @author Alexander Eliseyev
 */
public class RGSGenerationHandler extends CodeOrchestraGenerationHandler {

  private IRemoteGenerationCallback myRemoteGenerationCallback;

  public RGSGenerationHandler(Project project, IRemoteGenerationCallback remoteGenerationCallback) {
    super(project);
    this.myRemoteGenerationCallback = remoteGenerationCallback;
  }

  @Override
  public void startGeneration(IGeneratorLogger logger) {
    super.startGeneration(logger);

    // Start multi-casting the generator messages
    myLogger = new GeneratorLoggerSplitter(myLogger, new RGSGeneratorLogger(myRemoteGenerationCallback));

    // Print the generator settings
    System.out.println("Generation Settings:");
    GenerationSettings generationSettings = GenerationSettings.getInstance();
    System.out.println("Strict Mode: " + generationSettings.isStrictMode());
    System.out.println("Parallel Generation: " + generationSettings.isParallelGenerator());
    if (generationSettings.isParallelGenerator()) {
      System.out.println("Number of Generation Threads: " + generationSettings.getNumberOfParallelThreads());
    }
  }


}
