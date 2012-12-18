package codeOrchestra.generator.listener;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;
import org.jetbrains.annotations.NotNull;
import codeOrchestra.actionscript.view.utils.SolutionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class BuildBroadcaster implements ApplicationComponent {

  public static BuildBroadcaster getInstance() {
    return ApplicationManager.getApplication().getComponent(BuildBroadcaster.class);
  }

  private List<BuildListener> buildListeners = new ArrayList<BuildListener>();

  public void fireBuildEvent(CodeOrchestraGenerationContext codeOrchestraGenerationContext, boolean successful, BuildProvider buildProvider) {
    ModuleReference rootModuleReference = codeOrchestraGenerationContext.getRootModule();
    OutputType rootOutputType = codeOrchestraGenerationContext.getRootOutputType();

    fireBuildEvent(rootModuleReference, rootOutputType, buildProvider, successful);
  }

  public void fireBuildEvent(ModuleReference rootModuleReference, OutputType rootOutputType, BuildProvider provider, boolean successful) {
    BuildEvent buildEvent = new BuildEvent();



    // Figure out the artifact path
    String artifactPath = null;

    // Artifact type
    if (successful) {
      IModule module = MPSModuleRepository.getInstance().getModule(rootModuleReference);
      switch (rootOutputType) {
        case FLEX_APPLICATION:
        case FLEX_LIBRARY:
          artifactPath = SolutionUtils.getSWFOutputPath((Solution) module);
          break;
        case HTML5_LIBRARY:
        case HTML5_APPLICATION:
          artifactPath = module.getGeneratorOutputPath();
      }
      if (artifactPath == null) {
        artifactPath = module.getGeneratorOutputPath();
      }
      buildEvent.setArtifactPath(artifactPath);
    }

    // Module reference
    buildEvent.setRootModuleReference(rootModuleReference);

    // Output type
    buildEvent.setOutputType(rootOutputType);

    // Provider
    buildEvent.setProvider(provider);

    // Success
    buildEvent.setSuccessful(successful);

    fireBuildEvent(buildEvent);
  }

  public synchronized void addBuildListener(BuildListener buildListener) {
    this.buildListeners.add(buildListener);
  }

  public synchronized void removeBuildListener(BuildListener buildListener) {
    this.buildListeners.remove(buildListener);
  }

  private synchronized void fireBuildEvent(BuildEvent buildEvent) {
    for (BuildListener buildListener : new ArrayList<BuildListener>(buildListeners)) {
      buildListener.onBuild(buildEvent);
    }
  }

  @Override
  public void initComponent() {
  }

  @Override
  public void disposeComponent() {
    this.buildListeners.clear();
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Build Broadcaster";
  }

}
