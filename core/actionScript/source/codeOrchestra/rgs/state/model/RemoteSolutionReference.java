package codeOrchestra.rgs.state.model;

import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class RemoteSolutionReference extends AbstractRemoteModuleReference {

  public RemoteSolutionReference() {
  }

  public RemoteSolutionReference(@NotNull ModuleReference moduleReference) {
    super(moduleReference);
  }

  public RemoteSolutionReference(@NotNull IModule module) {
    super(module);
  }
}
