package codeOrchestra.rgs;

import codeOrchestra.actionscript.liveCoding.run.config.ILiveCodingRunConfiguration;
import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.progress.IRemoteProgressIndicator;
import codeOrchestra.rgs.state.RGSState;
import codeOrchestra.rgs.state.model.*;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 * @author Alexander Eliseyev
 */
public interface IRemoteGenerationService extends Remote {

  public static final String REFERENCE_NAME = "IRemoteGenerationService";

  RGSState getState() throws RemoteException;

  void restartSyncServer() throws RemoteException;

  void loadProject(RemoteProject remoteProject) throws RemoteException;

  void unloadProject() throws RemoteException;

  void generate(AbstractRemoteModuleReference remoteModuleReference, boolean rebuildAll, BuildProvider buildProvider, IRemoteGenerationCallback generationCallback, IRemoteProgressIndicator progressIndicator) throws RemoteException;

  void toggleLiveGeneration(boolean nextGenerationShouldBeLive, AbstractRemoteModuleReference remoteModelReference, ILiveCodingRunConfiguration liveCodingRunConfiguration) throws RemoteException;

  void updateProject() throws RemoteException;

  void updateModule(String name) throws RemoteException;

  void restart() throws RemoteException;

  void updateModel(RemoteModelReference modelReference) throws RemoteException;

  void reportLiveCodingSessionStart(String sessionId, long timestamp, AbstractRemoteModuleReference moduleReference) throws RemoteException;

  void reportLiveCodingSessionEnd() throws RemoteException;

  boolean pushNewMakeType(String moduleName, ASModuleMakeType makeType) throws RemoteException;

  void reportPropertyChange(RemoteNodeId nodeId, String propertyName, String newValue, long timestamp) throws RemoteException;

  void ping() throws RemoteException;

  void setGenerationSettings(RemoteGenerationSettings generationSettings) throws RemoteException;
}
