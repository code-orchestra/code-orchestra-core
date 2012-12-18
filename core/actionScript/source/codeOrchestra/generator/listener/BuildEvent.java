package codeOrchestra.generator.listener;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import jetbrains.mps.project.structure.modules.ModuleReference;

/**
 * @author Alexander Eliseyev
 */
public class BuildEvent {

  private boolean successful;
  private OutputType outputType;
  private ModuleReference rootModuleReference;
  private String artifactPath;
  private BuildProvider provider;

  public ModuleReference getRootModuleReference() {
    return rootModuleReference;
  }

  public boolean isSuccessful() {
    return successful;
  }

  public void setSuccessful(boolean successful) {
    this.successful = successful;
  }

  public void setRootModuleReference(ModuleReference rootModuleReference) {
    this.rootModuleReference = rootModuleReference;
  }

  public String getArtifactPath() {
    return artifactPath;
  }

  public void setArtifactPath(String artifactPath) {
    this.artifactPath = artifactPath;
  }

  public OutputType getOutputType() {
    return outputType;
  }

  public void setOutputType(OutputType outputType) {
    this.outputType = outputType;
  }

  public BuildProvider getProvider() {
    return provider;
  }

  public void setProvider(BuildProvider provider) {
    this.provider = provider;
  }
}
