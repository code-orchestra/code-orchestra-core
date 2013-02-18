package codeOrchestra.rgs.client;

import codeOrchestra.actionscript.liveCoding.settings.LiveCodingSettings;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.rgs.state.model.*;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.liveCoding.run.config.ILiveCodingRunConfiguration;
import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.*;
import codeOrchestra.rgs.client.facade.RemoteProjectLoadFacade;
import codeOrchestra.rgs.client.rmi.TimeoutRMISocketFactory;
import codeOrchestra.rgs.client.settings.RGSClientSettings;
import codeOrchestra.rgs.client.sshd.SSHDClientImpl;
import codeOrchestra.rgs.local.LocalRGSProcessHolder;
import codeOrchestra.rgs.local.RGSLocalLauncher;
import codeOrchestra.rgs.progress.IRemoteProgressIndicator;
import codeOrchestra.rgs.state.RGSConnectedState;
import codeOrchestra.rgs.state.RGSNotConnectedState;
import codeOrchestra.rgs.state.RGSState;
import codeOrchestra.rgs.state.RGSUnknownState;
import codeOrchestra.utils.BuildUtil;
import jetbrains.mps.InternalFlag;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.io.File;
import java.io.IOException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractRGSClient implements RGSServiceClient, ProjectInfoHolder {

  private static final int CONNECTION_TIMEOUT = 5000;
  private AbstractRGSClient.RGSPingThread rgsPingThread;

  private ISSHDClient sshdClient;
  private IRemoteGenerationService remoteGenerationService;
  private Registry registry;

  protected Project project;
  private RGSClientSettings rgsClientSettings;

  protected AbstractRGSClient(Project project, RGSClientSettings rgsClientSettings) {
    this.project = project;
    this.rgsClientSettings = rgsClientSettings;

    this.rgsPingThread = new RGSPingThread();
    this.rgsPingThread.start();
  }

  public boolean mustStartLocalRGS() {
    return rgsClientSettings.isLocal() && !BuildUtil.isDeveloperBuild() && !InternalFlag.isInternalMode();
  }

  protected void tryStartLocalRGS(boolean async) {
    if (startLocalRGS()) {
      Runnable runnable = new Runnable() {
        @Override
        public void run() {
          try { Thread.sleep(1500); } catch (InterruptedException e1) {}

          try {
            init();
          } catch (RGSException e1) {
            try {
              Thread.sleep(1500);
              init();
            } catch (Throwable t) {
              // ignore
            }
          }

          new RemoteProjectLoadFacade(project).loadTheProject();
        }
      };

      if (async) {
        new Thread(runnable, "Local RGS restart thread").start();
      } else {
        runnable.run();
      }
    }
  }

  protected void tryStartLocalRGS() {
    tryStartLocalRGS(true);
  }

  private boolean startLocalRGS() {
    RGSLocalLauncher rgsLocalLauncher = new RGSLocalLauncher();
    try {
      Process rgsProcess = rgsLocalLauncher.createProcessBuilder().start();
      LocalRGSProcessHolder.getInstance().setCurrentLocalRGSProcess(rgsProcess);
      return true;
    } catch (IOException e) {
      reportRGSError("Can't start local Generation Server", new RGSException(e), "Generation Server");
      return false;
    }
  }

  public abstract void reportRGSError(String message, final RGSException e, final String title);

  @Override
  public void updateProject() throws RGSException {
    try {
      remoteGenerationService.updateProject();
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  @Override
  public void updateModule(String name) throws RGSException {
    try {
      remoteGenerationService.updateModule(name);
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  @Override
  public void updateModel(RemoteModelReference modelReference) throws RGSException {
    try {
      remoteGenerationService.updateModel(modelReference);
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  @Override
  public void syncProject(ISyncCallback syncCallback) throws RGSException {
    syncProjectInternal(syncCallback, false);
  }

  protected void syncProjectInternal(ISyncCallback syncCallback, boolean isRetry) throws RGSException {
    try {
      sshdClient.syncProject(syncCallback);
    } catch (RGSException e) {
      if (e instanceof RGSFileSyncException) {
        RGSFileSyncException rgsFileSyncException = (RGSFileSyncException) e;
        if (rgsFileSyncException.isConnectionError()) {
          if (isRetry) {
            throw e;
          }

          // RF-1236 - Check if the RGS is alive
          if (!isConnected()) {
            tryStartLocalRGS(false);
          }

          try {
            remoteGenerationService.restartSyncServer();
          } catch (RemoteException re) {
            throw new RGSException("Tried to reconnect to the SSHD unsuccessfully", re);
          }

          try {
            Thread.sleep(1000);
          } catch (InterruptedException e1) {
            // ignore
          }

          syncProjectInternal(syncCallback, true);
        }
      }
    }
  }

  @Override
  public void reportLiveCodingSessionStart(String sessionId, long timestamp, AbstractRemoteModuleReference moduleReference) throws RGSException {
    try {
      remoteGenerationService.reportLiveCodingSessionStart(sessionId, timestamp, moduleReference);
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  @Override
  public void reportLiveCodingSessionStop() throws RGSException {
    if (remoteGenerationService == null) {
      return;
    }
    try {
      remoteGenerationService.reportLiveCodingSessionEnd();
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  @Override
  public void fetchBuildArtifacts(@Nullable OutputType outputType, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback) throws RGSException {
    try {
      UnicastRemoteObject.exportObject(fetchCallback, 0);
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
    sshdClient.fetchArtifacts(outputType, moduleReference, fetchCallback);
  }

  @Override
  public void initAndTryToRestart() throws RGSException {
    try {
      init();
    } catch (RGSException e) {
      if (mustStartLocalRGS()) {
        startLocalRGS();

        try { Thread.sleep(2000); } catch (InterruptedException e1) {}

        try {
          init();
        } catch (RGSException e1) {
          try {
            try {
              Thread.sleep(3000);
            } catch (InterruptedException e2) {
              // ignore
            }
            init();
          } catch (RGSException e2) {
            throw new RGSException("Can't init local RGS connection", e2);
          }
        }
      }
    }
  }

  @Override
  public void init() throws RGSException {
    if (isConnected()) {
      return;
    }

    // Init the SSHD client
    sshdClient = new SSHDClientImpl(this);
    sshdClient.init();

    // Connect to the remote RGS service
    try {
      registry = getRegistry();
      remoteGenerationService = (IRemoteGenerationService) registry.lookup(IRemoteGenerationService.REFERENCE_NAME);
    } catch (Throwable t) {
      throw new RGSException("Can't connect to Remote Generation Server", t);
    }
  }

  @Override
  public void syncGenerationSettings() throws RGSException {
    try {
      RemoteGenerationSettings remoteGenerationSettings = new RemoteGenerationSettings();
      remoteGenerationSettings.setCompilerKind(FlexSDKSettings.getInstance().getCompilerKind());
      remoteGenerationSettings.setLiveCodingCompilerKind(LiveCodingSettings.getInstance().getCompilerKind());

      remoteGenerationService.setGenerationSettings(remoteGenerationSettings);
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  /**
   * Returns a registry reference obtained from information in the URL.
   */
  private Registry getRegistry() throws RemoteException {
    return LocateRegistry.getRegistry(getServerHost(), getServerPort(), new TimeoutRMISocketFactory(CONNECTION_TIMEOUT));
  }

  @Override
  public void disconnect() throws RGSException {
    remoteGenerationService = null;

    if (sshdClient != null) {
      sshdClient.dispose();
      sshdClient = null;
    }
  }

  @Override
  public boolean canBeRestarted() throws RGSException {
    if (mustStartLocalRGS()) {
      return true;
    } else {
      return getState() instanceof RGSConnectedState;
    }
  }

  @Override
  public void restart() throws RGSException {
    if (mustStartLocalRGS()) {
      // Local RGS
      disconnect();

      LocalRGSProcessHolder.getInstance().destroyCurrentLocalRGSProcess();
      try { Thread.sleep(1000); } catch (InterruptedException e) {}

      tryStartLocalRGS();
    } else {
      // Remote RGS
      try {
        remoteGenerationService.restart();
      } catch (java.rmi.UnmarshalException e) {
        // ignore - that's fine
      } catch (RemoteException e) {
        throw new RGSException(e);
      }
    }
  }

  public boolean isConnected() {
    if (remoteGenerationService == null) {
      return false;
    }

    try {
      return !(remoteGenerationService.getState() instanceof RGSNotConnectedState);
    } catch (RemoteException e) {
      return false;
    }
  }

  @Override
  public RGSState getState() {
    if (remoteGenerationService == null) {
      return new RGSNotConnectedState();
    }

    try {
      return remoteGenerationService.getState();
    } catch (RemoteException e) {
      return new RGSUnknownState(e);
    }
  }

  @Override
  public void reportPropertyChange(RemoteNodeId nodeId, String propertyName, String newValue, long timestamp) throws RGSException {
    try {
      remoteGenerationService.reportPropertyChange(nodeId, propertyName, newValue, timestamp);
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  @Override
  public void loadProject() throws RGSException {
    try {
      remoteGenerationService.loadProject(RemoteProject.forName(getProjectName()));
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  @Override
  public void unloadProject() throws RGSException {
    try {
      remoteGenerationService.unloadProject();
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  @Override
  public void toggleLiveGeneration(boolean nextGenerationShouldBeLive, AbstractRemoteModuleReference remoteModelReference, ILiveCodingRunConfiguration liveCodingConfiguration) throws RGSException {
    try {
      remoteGenerationService.toggleLiveGeneration(nextGenerationShouldBeLive, remoteModelReference, liveCodingConfiguration);
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  @Override
  public boolean pushNewMakeType(@NotNull String moduleName, @NotNull ASModuleMakeType makeType) throws RGSException {
    try {
      return remoteGenerationService.pushNewMakeType(moduleName, makeType);
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  @Override
  public boolean isProfilingInProgress() throws RGSException {
    if (remoteGenerationService == null) {
      return false;
    }
    try {
      return remoteGenerationService.isProfilingInProgress();
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  @Override
  public void toggleCPUProfiling(boolean on) throws RGSException {
    try {
      remoteGenerationService.toggleCPUProfiling(on);
    } catch (RemoteException e) {
      throw new RGSException(e);
    }
  }

  @Override
  public void generate(AbstractRemoteModuleReference remoteModuleReference, boolean rebuildAll, BuildProvider buildProvider, IRemoteGenerationCallback generationCallback, IRemoteProgressIndicator progressIndicator) throws RGSException {
    try {
      UnicastRemoteObject.exportObject(generationCallback, 0);
      UnicastRemoteObject.exportObject(progressIndicator, 0);
      remoteGenerationService.generate(remoteModuleReference, rebuildAll, buildProvider, generationCallback, progressIndicator);
    } catch (Throwable t) {
      throw new RGSException(t);
    }
  }

  private void ping() {
    try {
      remoteGenerationService.ping();
    } catch (RemoteException e) {
      // ignore
    }
  }

  public void dispose() {
    if (this.rgsPingThread != null) {
      this.rgsPingThread.stopRightThere();
      this.rgsPingThread = null;
    }
    this.registry = null;
    this.remoteGenerationService = null;
  }

  protected abstract int getServerPort();

  protected abstract String getServerHost();

  @Override
  public String getProjectPath() {
    return new File(project.getBaseDir().getPath()).getPath();
  }

  @Override
  public String getProjectName() {
    return project.getName();
  }

  private class RGSPingThread extends Thread {

    public static final int PING_INTEVAL = 5 * 1000;
    private boolean mustStop;

    public void stopRightThere() {
      this.mustStop = true;
    }

    @Override
    public void run() {
      while (!mustStop) {
        try {
          Thread.sleep(PING_INTEVAL);
        } catch (InterruptedException e) {
          // ignore
        }

        if (isConnected()) {
          ping();
        }
      }
    }
  }

}
