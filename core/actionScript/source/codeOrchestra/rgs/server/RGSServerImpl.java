package codeOrchestra.rgs.server;

import codeOrchestra.actionscript.liveCoding.settings.LiveCodingSettings;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.rgs.state.model.*;
import com.intellij.ide.impl.ProjectUtil;
import com.intellij.openapi.command.impl.DummyProject;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.liveCoding.LiveCodingSession;
import codeOrchestra.actionscript.liveCoding.run.config.ILiveCodingRunConfiguration;
import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.actionscript.make.ASModuleMakeTypeManager;
import codeOrchestra.generator.CodeOrchestraGenerationUtil;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.IRemoteGenerationCallback;
import codeOrchestra.rgs.IRemoteGenerationService;
import codeOrchestra.rgs.logging.RemoteLoggingHandlerAdapter;
import codeOrchestra.rgs.progress.IRemoteProgressIndicator;
import codeOrchestra.rgs.server.live.RGSLiveCodingSession;
import codeOrchestra.rgs.server.sshd.RGSSSHDServer;
import codeOrchestra.rgs.server.util.ProjectReloadUtil;
import codeOrchestra.rgs.state.*;
import codeOrchestra.utils.ApplicationRestarter;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.logging.ILoggingHandler;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.smodel.*;

import javax.swing.SwingUtilities;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.rmi.RemoteException;

/**
 * @author Alexander Eliseyev
 */
public class RGSServerImpl implements IRemoteGenerationService, Serializable {

  private Object stateMonitor = new Object();
  private RGSState state = RGSNoProjectState.instance();
  private long lastPing = -1;

  public RGSServerImpl() {
    // Start the ping timeout thread in the headless (local) mode
    if (RGSParametersCLI.isHeadless()) {
      new PingTimeoutThread().start();
    }
  }

  @Override
  public RGSState getState() throws RemoteException {
    synchronized (stateMonitor) {
      if (state instanceof RGSConnectedState) {
        ((RGSConnectedState) state).updateMemoryInfo();
      }
      return state;
    }
  }

  @Override
  public void restartSyncServer() throws RemoteException {
    try {
      RGSSSHDServer.getInstance().restart();
    } catch (IOException e) {
      throw new RuntimeException("Can't restart the sync server", e);
    }
  }

  private void setState(RGSState state) {
    synchronized (stateMonitor) {
      this.state = state;
    }
    System.out.println("State changed -> " + state);
  }

  @Override
  public void loadProject(RemoteProject remoteProject) throws RemoteException {
    // TODO: check state

    setState(new RGSProjectIsLoadingState(remoteProject));

    try {
      String workspacePath = RGSParametersCLI.getWorkspacePath();
      File mprPath = getMPRFilePath(remoteProject, workspacePath);
      ProjectLoader.load(mprPath);
    } catch (Throwable t) {
      setState(RGSNoProjectState.instance());
      throw new RuntimeException("Can't load the project " + remoteProject.getProjectName(), t);
    }

    setState(new RGSProjectLoadedState(remoteProject));
  }

  @Override
  public void unloadProject() throws RemoteException {
    // TODO: check state

    assert state instanceof RGSProjectState;
    RGSProjectState projectState = (RGSProjectState) state;
    RemoteProject remoteProject = projectState.getProject();

    setState(new RGSProjectIsUnloadingState(remoteProject));

    final Project openProject = ProjectHolder.getProject();
    if (!(openProject instanceof DummyProject)) {
      ThreadUtils.runInUIThreadAndWait(new Runnable() {
        @Override
        public void run() {
          ProjectUtil.closeAndDispose(openProject);
        }
      });
    }

    setState(RGSNoProjectState.instance());
  }

  @Override
  public synchronized void generate(AbstractRemoteModuleReference remoteModuleReference, final boolean rebuildAll, final BuildProvider buildProvider, final IRemoteGenerationCallback generationCallback, IRemoteProgressIndicator indicator) throws RemoteException {
    assert state instanceof RGSProjectState;

    // TODO: check state

    // TODO: postpone the generation if it's already in progress - will the synchronized do the job?


    RGSProjectState projectState = (RGSProjectState) state;
    RemoteProject remoteProject = projectState.getProject();

    final IModule module = MPSModuleRepository.getInstance().getModule(remoteModuleReference.toLocalModuleReference());
    if (module == null) {
      throw new RuntimeException("Can't locate the module " + remoteModuleReference.getModuleName() + " on the RGS");
    }

    setState(new RGSGenerationInProgressState(remoteProject, remoteModuleReference, generationCallback, indicator));

    final Project project = ProjectHolder.getProject();
    final IOperationContext operationContext = new ModuleContext(module, project);
    final ILoggingHandler loggingHandler = new RemoteLoggingHandlerAdapter(generationCallback);

    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      @Override
      public void run() {
        Logger.addLoggingHandler(loggingHandler);
        CodeOrchestraGenerationUtil.generateModuleWithDependencies(operationContext, project, rebuildAll, module, generationCallback, buildProvider);
        Logger.removeLoggingHandler(loggingHandler);
      }
    });

    setState(new RGSProjectLoadedState(remoteProject));
  }

  public void toggleLiveGeneration(boolean nextGenerationShouldBeLive, AbstractRemoteModuleReference remoteModelReference, ILiveCodingRunConfiguration liveCodingRunConfiguration) throws RemoteException {
    LiveCodingManager.instance().toggleLiveGeneration(true, remoteModelReference.toLocalModuleReference(), liveCodingRunConfiguration);
  }

  @Override
  public void updateProject() throws RemoteException {
    if (!(state instanceof RGSProjectLoadedState)) {
      return;
    }

    RGSProjectState projectState = (RGSProjectState) state;
    final RemoteProject remoteProject = projectState.getProject();

    setState(new RGSProjectIsLoadingState(remoteProject));


    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      @Override
      public void run() {
        try {
          ProjectReloadUtil.reloadProject();
        } finally {
          setState(new RGSProjectLoadedState(remoteProject));
        }
      }
    });
  }

  @Override
  public void updateModule(final String moduleName) throws RemoteException {
    if (!(state instanceof RGSProjectLoadedState)) {
      return;
    }

    RGSProjectState projectState = (RGSProjectState) state;
    RemoteProject remoteProject = projectState.getProject();

    setState(new RGSProjectIsLoadingState(remoteProject));

    try {
      ThreadUtils.runInUIThreadAndWait(new Runnable() {
        @Override
        public void run() {
          ProjectReloadUtil.reloadModule(moduleName);
        }
      });
    } finally {
      setState(new RGSProjectLoadedState(remoteProject));
    }
  }

  @Override
  public void updateModel(final RemoteModelReference modelReference) throws RemoteException {
    if (!(state instanceof RGSProjectLoadedState)) {
      return;
    }

    RGSProjectState projectState = (RGSProjectState) state;
    RemoteProject remoteProject = projectState.getProject();

    setState(new RGSProjectIsLoadingState(remoteProject));

    try {
      ThreadUtils.runInUIThreadAndWait(new Runnable() {
        @Override
        public void run() {
          final SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(modelReference.toRegularReference());
          if (modelDescriptor == null) {
            throw new RuntimeException("Can't locate the model " + modelReference.toRegularReference() + " at the RGS repository");
          }

          ProjectReloadUtil.reloadModel(modelDescriptor);
        }
      });
    } finally {
      setState(new RGSProjectLoadedState(remoteProject));
    }
  }

  @Override
  public void reportLiveCodingSessionStart(String sessionId, long timestamp, AbstractRemoteModuleReference remoteModuleReference) throws RemoteException {
    LiveCodingSession session = new RGSLiveCodingSession(remoteModuleReference.toLocalModuleReference(), sessionId, timestamp);
    LiveCodingManager.instance().startSession(session);
  }

  @Override
  public void reportLiveCodingSessionEnd() throws RemoteException {
    LiveCodingManager liveCodingManager = LiveCodingManager.instance();
    if (liveCodingManager != null) {
      liveCodingManager.stopSession();
    }
  }

  @Override
  public boolean pushNewMakeType(String moduleName, ASModuleMakeType makeType) throws RemoteException {
    if (!(state instanceof RGSProjectState)) {
      return false;
    }

    ASModuleMakeTypeManager moduleMakeTypeManager = ProjectHolder.getProject().getComponent(ASModuleMakeTypeManager.class);
    return moduleMakeTypeManager.pushNewMakeType(moduleName, makeType);
  }

  @Override
  public void reportPropertyChange(RemoteNodeId nodeId, final String propertyName, final String newValue, final long timestamp) throws RemoteException {
    final SNode node = nodeId.getNode();
    if (node != null) {
      try {
        SwingUtilities.invokeAndWait(new Runnable() {
          @Override
          public void run() {
            ModelAccess.instance().runWriteActionInCommand(new Runnable() {
              @Override
              public void run() {
                node.setProperty(propertyName, newValue);
                LiveCodingManager.instance().fireSimplePropertyChangeEvent(node, timestamp);
              }
            });
          }
        });
      } catch (InterruptedException e) {
        // ignore
      } catch (InvocationTargetException e) {
        throw new RemoteException("Error while changing property", e);
      }
    }
  }

  @Override
  public void ping() throws RemoteException {
    this.lastPing = System.currentTimeMillis();
  }

  @Override
  public void setGenerationSettings(RemoteGenerationSettings generationSettings) throws RemoteException {
    FlexSDKSettings.getInstance().setCompilerKind(generationSettings.getCompilerKind());
    LiveCodingSettings.getInstance().setCompilerKind(generationSettings.getLiveCodingCompilerKind());
  }

  @Override
  public void restart() throws RemoteException {
    try {
      ApplicationRestarter.restart();
    } catch (IOException e) {
      throw new RuntimeException("Unable to restart the application", e);
    }
  }

  private File getMPRFilePath(RemoteProject remoteProject, String workspacePath) {
    return new File(new File(workspacePath, remoteProject.getProjectName()), remoteProject.getProjectName() + MPSExtentions.DOT_MPS_PROJECT);
  }

  private void shutdown() {
    System.exit(0);
  }

  private class PingTimeoutThread extends Thread {

    public static final int PING_TIMEOUT = 30 * 1000;

    @Override
    public void run() {
      while (true) {
        try {
          Thread.sleep(PING_TIMEOUT);
        } catch (InterruptedException e) {
          // ignore
        }

        if (lastPing != -1 && (System.currentTimeMillis() - lastPing > PING_TIMEOUT)) {
          shutdown();
          return;
        }
      }
    }
  }

}
