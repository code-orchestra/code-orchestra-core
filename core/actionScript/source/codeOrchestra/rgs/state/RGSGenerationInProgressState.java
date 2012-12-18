package codeOrchestra.rgs.state;

import codeOrchestra.rgs.IRemoteGenerationCallback;
import codeOrchestra.rgs.progress.IRemoteProgressIndicator;
import codeOrchestra.rgs.state.model.AbstractRemoteModuleReference;
import codeOrchestra.rgs.state.model.RemoteProject;

/**
 * @author Alexander Eliseyev
 */
public class RGSGenerationInProgressState extends RGSGenerateState implements RGSState {

  private IRemoteGenerationCallback remoteGenerationCallback;
  private IRemoteProgressIndicator progressIndicator;

  public RGSGenerationInProgressState(RemoteProject project, AbstractRemoteModuleReference module, IRemoteGenerationCallback remoteGenerationCallback, IRemoteProgressIndicator progressIndicator) {
    super(project, module);
    this.remoteGenerationCallback = remoteGenerationCallback;
    this.progressIndicator = progressIndicator;
  }

  public IRemoteGenerationCallback getRemoteGenerationCallback() {
    return remoteGenerationCallback;
  }

  public IRemoteProgressIndicator getProgressIndicator() {
    return progressIndicator;
  }

  @Override
  public String getPresentation() {
    return "Generation in progress: " + getModuleReference().getModuleName();
  }

}
