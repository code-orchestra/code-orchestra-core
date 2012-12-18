package codeOrchestra.rgs.state;

import codeOrchestra.rgs.state.model.AbstractRemoteModuleReference;
import codeOrchestra.rgs.state.model.RemoteProject;

/**
 * @author Alexander Eliseyev
 */
public abstract class RGSGenerateState extends RGSProjectState {

  protected AbstractRemoteModuleReference moduleReference;

  protected RGSGenerateState(RemoteProject project, AbstractRemoteModuleReference module) {
    super(project);
    this.moduleReference = module;
  }

  public AbstractRemoteModuleReference getModuleReference() {
    return moduleReference;
  }

  @Override
  public String toString() {
    return super.toString() + ", module = " + moduleReference;
  }
}
