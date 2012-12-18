package codeOrchestra.rgs.state.model;

import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class RemoteLanguageReference extends AbstractRemoteModuleReference {

  public RemoteLanguageReference() {
  }

  public RemoteLanguageReference(@NotNull ModuleReference moduleReference) {
    super(moduleReference);
  }

  public RemoteLanguageReference(@NotNull IModule module) {
    super(module);
  }
}
