package codeOrchestra.rgs.state.model;

import codeOrchestra.generator.listener.BuildProvider;
import jetbrains.mps.project.structure.modules.ModuleReference;

/**
 * @author Alexander Eliseyev
 */
public class GenerateInput {

  private BuildProvider buildProvider;
  private ModuleReference moduleReference;

  public GenerateInput(ModuleReference moduleReference, BuildProvider buildProvider) {
    this.buildProvider = buildProvider;
    this.moduleReference = moduleReference;
  }

  public BuildProvider getBuildProvider() {
    return buildProvider;
  }

  public ModuleReference getModuleReference() {
    return moduleReference;
  }
}
