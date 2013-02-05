package codeOrchestra.rgs.client.facade;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.project.Project;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.client.appimpl.ApplicationRGSClient;
import codeOrchestra.rgs.state.*;
import codeOrchestra.rgs.state.model.GenerateInput;
import codeOrchestra.rgs.state.model.RemoteProject;

/**
 * @author: Alexander Eliseyev
 */
public class RemoteProjectLoadFacade extends AbstractRGSFacade {

  private static final GenerateInput DEFAULT_GENERATE_INPUT_CONTEXT = new GenerateInput(null, BuildProvider.RGS);

  public RemoteProjectLoadFacade(Project project) {
    super(project);
  }

  @Override
  public void call() {
    loadTheProject();
  }

  public void loadTheProject() {
    RGSState state = ApplicationRGSClient.getInstance().getState();

    if (state instanceof RGSNotConnectedState) {
      // Init client, next phase
      RGSTaskStack.create(this, initClient(), nextPhase()).process();
    } else if (state instanceof RGSUnknownState) {
      // Re-Init client, next phase
      RGSTaskStack.create(this, reInitClient(), nextPhase()).process();
    } else if (state instanceof RGSNoProjectState) {
      // Sync project, load project, next phase
      RGSTaskStack.create(this, syncProject(), loadProject()).process();
    } else if (state instanceof RGSProjectLoadedState) {
      RemoteProject remoteProject = ((RGSProjectLoadedState) state).getProject();
      if (remoteProject.isTheSameAs(getProject())) {
        // Done
        return;
      } else {
        // Unload previous project
        RGSTaskStack.create(this, unloadProject(), nextPhase()).process();
      }
    }
  }

  private RGSTask nextPhase() {
    return new RGSTask(getGenerateInput(), "Stepping to the next project loading phase", true) {
      @Override
      protected void doTask(final ProgressIndicator indicator) throws RGSException {
        loadTheProject();
      }
    };
  }

  @Override
  protected GenerateInput getGenerateInput() {
    return DEFAULT_GENERATE_INPUT_CONTEXT;
  }
}
