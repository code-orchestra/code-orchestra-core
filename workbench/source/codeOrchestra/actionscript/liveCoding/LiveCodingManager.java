package codeOrchestra.actionscript.liveCoding;

import codeOrchestra.actionscript.liveCoding.listener.LiveCodingAdapter;
import codeOrchestra.actionscript.liveCoding.listener.LiveCodingListener;
import codeOrchestra.actionscript.liveCoding.listener.LiveSimplePropertyChangeListener;
import codeOrchestra.actionscript.liveCoding.run.LiveCodingSessionImpl;
import codeOrchestra.actionscript.liveCoding.run.config.ILiveCodingRunConfiguration;
import codeOrchestra.actionscript.liveCoding.utils.LiveCodingUtils;
import codeOrchestra.actionscript.liveCoding.view.LiveCodingPauseWidget;
import codeOrchestra.actionscript.liveCoding.view.LiveCodingWidget;
import codeOrchestra.actionscript.socket.SocketWriter;
import codeOrchestra.actionscript.socket.command.impl.PongTraceCommand;
import codeOrchestra.actionscript.socket.command.impl.PongTraceCommand.PongListener;
import codeOrchestra.actionscript.view.ASMessageMarker;
import codeOrchestra.generator.CodeOrchestraGenerationUtil;
import codeOrchestra.generator.listener.BuildBroadcaster;
import codeOrchestra.generator.listener.BuildEvent;
import codeOrchestra.generator.listener.BuildListener;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.client.appimpl.ApplicationRGSClient;
import codeOrchestra.rgs.client.settings.RGSClientSettings;
import codeOrchestra.rgs.server.RGSParametersCLI;
import codeOrchestra.rgs.state.model.AbstractRemoteModuleReference;
import codeOrchestra.rgs.state.model.RemoteNodeId;
import codeOrchestra.utils.NotificationUtils;
import codeOrchestra.utils.ProjectHolder;
import com.intellij.openapi.components.AbstractProjectComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.startup.StartupManager;
import com.intellij.openapi.wm.IdeFrame;
import com.intellij.openapi.wm.WindowManager;
import com.intellij.openapi.wm.ex.StatusBarEx;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.reloading.ReloadListener;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.event.SModelEvent;
import jetbrains.mps.smodel.event.SModelPropertyEvent;

import javax.swing.SwingUtilities;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public class LiveCodingManager extends AbstractProjectComponent implements ProjectComponent {

  private static Logger LOG = Logger.getLogger(LiveCodingManager.class);

  public static final String LIVE_CODING_MODEL_NAME = "codeOrchestra.liveCoding.load";

  public static LiveCodingManager instance() {
    Project project = ProjectHolder.getProject();
    if (project == null) {
      return null;
    }
    return project.getComponent(LiveCodingManager.class);
  }

  private ReloadListener myReloadListener = new ReloadAdapter() {
    @Override
    public void unload() {
      if (stopSession()) {
        NotificationUtils.showRGSBalloon("Live Coding Session Terminated");
        LOG.infoWithMarker("Live Coding Session Terminated", ASMessageMarker.MARKER);
      }
    }
  };

  private BuildListener myBuildListener = new MyBuildListener();

  private boolean nextGenerationShouldBeLive;
  private boolean skipSyncForNextGeneration;

  private LiveCodingSession currentSession;
  private ModuleReference lastLiveModuleReference;
  private ILiveCodingRunConfiguration lastLiveCodingConfiguration;

  private LiveCodingWidget widget;
  private LiveCodingPauseWidget pauseWidget;

  private Object listenerMonitor = new Object();

  // client listeners
  private List<LiveCodingListener> liveCodingListeners = new ArrayList<LiveCodingListener>();

  // server listeners
  private List<LiveSimplePropertyChangeListener> simplePropertyChangeListeners = new ArrayList<LiveSimplePropertyChangeListener>();

  // artifact listeners
  private List<LiveCodingArtifactListener> artifactListeners = new ArrayList<LiveCodingArtifactListener>();

  private LiveCodingListener finisherThreadLiveCodingListener = new SessionHandleListener();

  private boolean liveCodingGenerationInProgress;

  private Set<String> customMetadataSet = new HashSet<String>();

  public LiveCodingManager(Project project) {
    super(project);
  }

  public void addCustomMetadata(String customMetadata) {
    customMetadataSet.add(customMetadata);
  }

  public Set<String> getCustomMetadataSet() {
    return customMetadataSet;
  }

  public void addArtifactListener(LiveCodingArtifactListener artifactListener) {
    synchronized (listenerMonitor) {
      this.artifactListeners.add(artifactListener);
    }
  }

  public void removeArtifactListener(LiveCodingArtifactListener artifactListener) {
    synchronized (listenerMonitor) {
      this.artifactListeners.remove(artifactListener);
    }
  }

  public void fireArtifactEvent(String artifactPath) {
    synchronized (listenerMonitor) {
      for (LiveCodingArtifactListener artifactListener : this.artifactListeners) {
        artifactListener.artifactAvailable(artifactPath);
      }
    }
  }

  public void addSimplePropertyChangeListener(LiveSimplePropertyChangeListener listener) {
    synchronized (listenerMonitor) {
      this.simplePropertyChangeListeners.add(listener);
    }
  }

  public void removeSimplePropertyChangeListener(LiveSimplePropertyChangeListener listener) {
    synchronized (listenerMonitor) {
      this.simplePropertyChangeListeners.remove(listener);
    }
  }

  public void fireSimplePropertyChangeEvent(SNode node, long timestamp) {
    synchronized (listenerMonitor) {
      for (LiveSimplePropertyChangeListener simplePropertyChangeListener : this.simplePropertyChangeListeners) {
        simplePropertyChangeListener.onChange(node, timestamp);
      }
    }
  }

  public void reportIncrementalEvent(SModelEvent event, long timestamp) {
    // Client-only
    if (RGSParametersCLI.isInServerMode()) {
      return;
    }

    if (RGSClientSettings.getInstance().isUseRemoteGeneration() && event instanceof SModelPropertyEvent) {
      SModelPropertyEvent propertyEvent = (SModelPropertyEvent) event;

      try {
        ApplicationRGSClient.getInstance().reportPropertyChange(
          RemoteNodeId.fromNode(propertyEvent.getNode()),
          propertyEvent.getPropertyName(),
          propertyEvent.getNewPropertyValue(),
          timestamp);
      } catch (RGSException e) {
        ApplicationRGSClient.getInstance().reportRGSError("Can't report property change to RGS", e, "Live Coding on RGS");
      }
    }
  }

  @Override
  public void initComponent() {
    addListener(finisherThreadLiveCodingListener);

    if (!RGSParametersCLI.isInServerMode()) {
      ClassLoaderManager.getInstance().addReloadHandler(myReloadListener);

      BuildBroadcaster.getInstance().addBuildListener(myBuildListener);

      StartupManager.getInstance(myProject).runWhenProjectIsInitialized(new Runnable() {
        @Override
        public void run() {
          IdeFrame ideFrame = WindowManager.getInstance().getIdeFrame(myProject);
          StatusBarEx statusBar = (StatusBarEx) ideFrame.getStatusBar();

          widget = new LiveCodingWidget(LiveCodingManager.this);
          statusBar.removeWidget(LiveCodingWidget.ID);
          statusBar.addWidget(widget);

          pauseWidget = new LiveCodingPauseWidget(LiveCodingManager.this);
          statusBar.removeWidget(LiveCodingPauseWidget.ID);
          statusBar.addWidget(pauseWidget);
        }
      });
    }
  }

  @Override
  public void disposeComponent() {
    BuildBroadcaster.getInstance().removeBuildListener(myBuildListener);

    if (!RGSParametersCLI.isInServerMode()) {
      ClassLoaderManager.getInstance().removeReloadHandler(myReloadListener);
    }

    if (widget != null) {
      widget.dispose();
      widget = null;
    }

    liveCodingListeners.clear();

    currentSession = null;
    nextGenerationShouldBeLive = false;
  }

  public boolean skipSyncForNextGeneration() {
    return skipSyncForNextGeneration;
  }

  public void generateLiveCodingModule(boolean skipSync) {
    this.skipSyncForNextGeneration = skipSync;

    if (isLiveCodingGenerationInProgress()) {
      return;
    }

    if (currentSession == null) {
      throw new IllegalStateException("No LiveCoding session is in progress");
    }

    final Solution liveCodingModule = getOrCreateLiveCodingModule();
    if (liveCodingModule == null) {
      throw new IllegalStateException("Can't locate LiveCoding module");
    }

    SwingUtilities.invokeLater(new Runnable() {
      @Override
      public void run() {
        liveCodingGenerationInProgress = true;
        CodeOrchestraGenerationUtil.generateModuleWithDependencies(
          new ModuleContext(liveCodingModule, myProject),
          myProject,
          false,
          liveCodingModule,
          null,
          BuildProvider.LIVE_CODING_INCREMENTAL
        );
      }
    });
  }

  public void generateLiveCodingModule() {
    generateLiveCodingModule(false);
  }

  public void generateLiveCodingModuleNoSync() {
    generateLiveCodingModule(true);
  }

  public boolean isLiveCodingGenerationInProgress() {
    return liveCodingGenerationInProgress;
  }

  private class MyBuildListener implements BuildListener {
    @Override
    public void onBuild(BuildEvent buildEvent) {
      if (buildEvent.getProvider() == BuildProvider.LIVE_CODING_INCREMENTAL) {
        liveCodingGenerationInProgress = false;
        skipSyncForNextGeneration = false;
      }
    }
  }

  public void toggleLiveGeneration(boolean nextGenerationShouldBeLive) {
    toggleLiveGeneration(nextGenerationShouldBeLive, null, null);
  }

  public IModule getLastLiveModule() {
    return MPSModuleRepository.getInstance().getModule(this.lastLiveModuleReference);
  }

  public void toggleLiveGeneration(boolean nextGenerationShouldBeLive, ModuleReference moduleReference, ILiveCodingRunConfiguration liveCodingConfiguration) {
    this.nextGenerationShouldBeLive = nextGenerationShouldBeLive;
    if (nextGenerationShouldBeLive) {
      prepareNextSession(moduleReference, liveCodingConfiguration);
    }
  }

  public void prepareNextSession(ModuleReference moduleReference, ILiveCodingRunConfiguration liveCodingConfiguration) {
    this.lastLiveModuleReference = moduleReference;
    this.lastLiveCodingConfiguration = liveCodingConfiguration;
  }

  public ILiveCodingRunConfiguration getLastLiveCodingConfiguration() {
    return lastLiveCodingConfiguration;
  }

  public boolean nextGenerationMustBeLive() {
    return nextGenerationShouldBeLive;
  }

  public void pauseCurrentSession(boolean pause) {
    fireSessionPause(pause);
  }

  public SModel getLiveCodingModel() {
    Solution liveCodingModule = getLiveCodingModule();
    if (liveCodingModule == null) {
      return null;
    }

    List<SModelDescriptor> ownModelDescriptors = liveCodingModule.getOwnModelDescriptors();
    if (ownModelDescriptors != null && !ownModelDescriptors.isEmpty()) {
      return ownModelDescriptors.get(0).getSModel();
    }

    return null;
  }

  public synchronized void startSession(String sessionId, SocketWriter socketWriter) {
    // RE-4712 - This may happen if a live-coding-compiled SWF is started w/o an appropriate run configuration
    if (lastLiveModuleReference == null) {
      return;
    }

    startSession(new LiveCodingSessionImpl(sessionId, lastLiveModuleReference, System.currentTimeMillis(), socketWriter, getLastLiveCodingConfiguration()));
  }

  public LiveCodingSession getCurrentSession() {
    return this.currentSession;
  }

  public synchronized void startSession(LiveCodingSession liveCodingSession) {
    // Stop the existing session
    if (this.currentSession != null) {
      stopSession();
    }

    this.currentSession = liveCodingSession;

    if (!RGSParametersCLI.isInServerMode()) {
      // Recreate the live coding module if needed
      try {
        SwingUtilities.invokeAndWait(new Runnable() {
          @Override
          public void run() {
            getOrCreateLiveCodingModule();
          }
        });
      } catch (Throwable t) {
        throw new RuntimeException("Can't get or create live coding module", t);
      }
    }

    if (!RGSParametersCLI.isInServerMode() && RGSClientSettings.getInstance().isUseRemoteGeneration()) {
      try {
        ApplicationRGSClient.getInstance().reportLiveCodingSessionStart(
          liveCodingSession.getSessionId(),
          liveCodingSession.getStartTimestamp(),
          AbstractRemoteModuleReference.ofModule(MPSModuleRepository.getInstance().getModule(liveCodingSession.getRootModuleReference())));
      } catch (RGSException e) {
        ApplicationRGSClient.getInstance().reportRGSError("Can't report live coding session start to RGS", e, "Live Coding on RGS");
      }
    }

    fireSessionStart();

    if (lastLiveCodingConfiguration != null && lastLiveCodingConfiguration.isInAutoPauseMode()) {
      pauseCurrentSession(true);
    }
  }

  public synchronized boolean stopSession() {
    if (this.currentSession == null) {
      return false;
    }

    if (!RGSParametersCLI.isInServerMode() && RGSClientSettings.getInstance().isUseRemoteGeneration()) {
      try {
        ApplicationRGSClient.getInstance().reportLiveCodingSessionStop();
      } catch (RGSException e) {
        ApplicationRGSClient.getInstance().reportRGSError("Can't report live coding session stop to RGS", e, "Live Coding on RGS");
      }
    }

    fireSessionEnd();
    this.currentSession = null;

    return true;
  }

  public Solution getOrCreateLiveCodingModule() {
    // Return the existing solution
    Solution liveCodingSolution = getLiveCodingModule();
    if (liveCodingSolution != null) {
      return liveCodingSolution;
    }

    // Or create it
    return LiveCodingUtils.createLiveCodingModule(myProject);
  }

  private Solution getLiveCodingModule() {
    return MPSModuleRepository.getInstance().getSolution(getLiveCodingModuleName(myProject));
  }

  public static String getLiveCodingModuleName(Project project) {
    return project.getName() + "_" + "liveCoding";
  }


  public void addListener(LiveCodingListener listener) {
    synchronized (listenerMonitor) {
      liveCodingListeners.add(listener);
    }
  }

  public void removeListener(LiveCodingListener listener) {
    synchronized (listenerMonitor) {
      liveCodingListeners.remove(listener);
    }
  }

  private void fireSessionPause(boolean pause) {
    synchronized (listenerMonitor) {
      for (LiveCodingListener listener : liveCodingListeners) {
        if (pause) {
          listener.onSessionPause();
        } else {
          listener.onSessionResume();
        }
      }
    }
  }

  private void fireSessionStart() {
    synchronized (listenerMonitor) {
      for (LiveCodingListener listener : liveCodingListeners) {
        listener.onSessionStart(currentSession);
      }
    }
  }

  private void fireSessionEnd() {
    synchronized (listenerMonitor) {
      for (LiveCodingListener listener : liveCodingListeners) {
        listener.onSessionEnd(currentSession);
      }
    }
  }

  private class SessionHandleListener extends LiveCodingAdapter implements LiveCodingListener {

    private SessionFinisher sessionFinisherThread;

    @Override
    public void onSessionStart(LiveCodingSession session) {
      if (session.isProxy()) {
        return;
      }

      if (sessionFinisherThread != null) {
        sessionFinisherThread.stopRightThere();
      }
      sessionFinisherThread = new SessionFinisher();
      sessionFinisherThread.start();
    }

    @Override
    public void onSessionEnd(LiveCodingSession session) {
      if (session != null && session.isProxy()) {
        return;
      }

      customMetadataSet.clear();

      if (sessionFinisherThread != null) {
        sessionFinisherThread.stopRightThere();
        sessionFinisherThread = null;
      }
    }
  }

  private class SessionFinisher extends Thread implements PongListener {

    public static final int PING_TIMEOUT = 2000;
    public static final String PING_COMMAND = "ping";

    private boolean stop;

    private long lastPing;
    private long lastPong;

    public SessionFinisher() {
      PongTraceCommand.getInstance().addPongListener(this);
    }

    public void stopRightThere() {
      this.stop = true;
      PongTraceCommand.getInstance().removePongListener(this);
    }

    private void ping() {
      assert currentSession != null;
      lastPing = System.currentTimeMillis();
      currentSession.getSocketWriter().writeToSocket(PING_COMMAND);
    }

    @Override
    public void pong() {
      lastPong = System.currentTimeMillis();
    }

    @Override
    public void run() {
      while (!stop) {
        if (currentSession == null) {
          continue;
        }

        ping();

        try {
          Thread.sleep(PING_TIMEOUT);
        } catch (InterruptedException e) {
          // do nothing
        }

        if (lastPong < lastPing) {
          stopSession();
        }
      }
    }
  }

}
