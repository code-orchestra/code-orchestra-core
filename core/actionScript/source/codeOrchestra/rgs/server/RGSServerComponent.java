package codeOrchestra.rgs.server;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import codeOrchestra.generator.listener.BuildBroadcaster;
import codeOrchestra.generator.listener.BuildEvent;
import codeOrchestra.generator.listener.BuildListener;
import codeOrchestra.rgs.IRemoteGenerationCallback;
import codeOrchestra.rgs.IRemoteGenerationService;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.progress.IRemoteProgressIndicator;
import codeOrchestra.rgs.server.artifact.ArtifactPreparerRegistry;
import codeOrchestra.rgs.server.sshd.RGSSSHDServer;
import codeOrchestra.rgs.server.view.Console;
import codeOrchestra.rgs.state.RGSGenerationInProgressState;
import codeOrchestra.rgs.state.RGSState;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.ide.generator.GenerationSettings;
import org.apache.log4j.Logger;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.JFrame;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class RGSServerComponent implements ApplicationComponent {

  private static final Logger LOG = Logger.getLogger(RGSServerComponent.class);

  private static RGSServerComponent ourInstance;

  private BuildListener artifactPrepareBuildListener = new ArtifactPrepareBuildListener();

  private class ArtifactPrepareBuildListener implements BuildListener {
    @Override
    public void onBuild(BuildEvent buildEvent) {
      List<IArtifactPreparer> preparers = ArtifactPreparerRegistry.getInstance().getPreparer(buildEvent.getOutputType());
      for (IArtifactPreparer preparer : preparers) {
        try {
          preparer.prepare(buildEvent);
        } catch (RGSException e) {
          throw new RuntimeException("Error while preparing the artifact for RGS", e);
        }
      }
    }
  }

  public static RGSServerComponent getInstance() {
    if (ourInstance == null) {
      ourInstance = ApplicationManager.getApplication().getComponent(RGSServerComponent.class);
    }
    return ourInstance;
  }

  private Registry registry;

  private IRemoteGenerationService remoteGenerationServiceImpl;

  @Nullable
  public IRemoteGenerationCallback getCurrentGenerationCallback() {
    RGSState state;
    try {
      state = remoteGenerationServiceImpl.getState();
    } catch (RemoteException e) {
      LOG.warn("Couldn't retrieve RGS state to get the callback object");
      return null;
    }

    if (state instanceof RGSGenerationInProgressState) {
      return ((RGSGenerationInProgressState) state).getRemoteGenerationCallback();
    }

    return null;
  }

  @Nullable
  public IRemoteProgressIndicator getCurrentGenerateProgressIndicator() {
    RGSState state;
    try {
      state = remoteGenerationServiceImpl.getState();
    } catch (RemoteException e) {
      LOG.warn("Couldn't retrieve RGS state to get the progress indicator object");
      return null;
    }

    if (state instanceof RGSGenerationInProgressState) {
      return ((RGSGenerationInProgressState) state).getProgressIndicator();
    }

    return null;
  }

  @Override
  public void initComponent() {
    if (RGSParametersCLI.isInServerMode()) {
      // Set the generator settings
      GenerationSettings generationSettings = GenerationSettings.getInstance();
      generationSettings.setStrictMode(RGSParametersCLI.isInStrictMode());
      generationSettings.setParallelGenerator(RGSParametersCLI.generateInParallel());
      generationSettings.setNumberOfParallelThreads(RGSParametersCLI.getNumberOfGenerationThreads());

      // Add build listener to prepare the artifacts
      BuildBroadcaster.getInstance().addBuildListener(this.artifactPrepareBuildListener);

      // Init SSHD server
      LOG.info("Starting the SSHD server");
      try {
        RGSSSHDServer.getInstance().start();
      } catch (IOException e) {
        throw new RuntimeException("Can't start the SSHD server", e);
      }

      // Init the remote RGS service
      LOG.info("Starting the remote RGS service");
      try {
        this.remoteGenerationServiceImpl = new RGSServerImpl();

        IRemoteGenerationService stub = (IRemoteGenerationService) UnicastRemoteObject.exportObject(remoteGenerationServiceImpl, 0);

        this.registry = LocateRegistry.createRegistry(RGSParametersCLI.getRGSServerPort());
        this.registry.bind(IRemoteGenerationService.REFERENCE_NAME, stub);
      } catch (Throwable t) {
        throw new RuntimeException("Can't bind the RMI service for " + IRemoteGenerationService.REFERENCE_NAME, t);
      }
    }
  }

  @Override
  public void disposeComponent() {
    if (RGSParametersCLI.isInServerMode()) {
      // Remove build listener
      BuildBroadcaster.getInstance().removeBuildListener(this.artifactPrepareBuildListener);

      // Stop the SSHD server
      RGSSSHDServer.getInstance().stop();

      // Unbind the remote RGS service
      try {
        registry.unbind(IRemoteGenerationService.REFERENCE_NAME);
      } catch (Throwable t) {
        throw new RuntimeException("Can't unbind the RMI service for " + IRemoteGenerationService.REFERENCE_NAME, t);
      }
    }
  }

  @NotNull
  @Override
  public String getComponentName() {
    if (RGSParametersCLI.isInServerMode()) {
      return "RGS Server Component";
    } else {
      return "RGS Server Component (muted)";
    }
  }

}
