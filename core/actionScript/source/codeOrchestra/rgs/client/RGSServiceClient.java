package codeOrchestra.rgs.client;

import codeOrchestra.actionscript.liveCoding.run.config.ILiveCodingRunConfiguration;
import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.IFetchCallback;
import codeOrchestra.rgs.IRemoteGenerationCallback;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.progress.IRemoteProgressIndicator;
import codeOrchestra.rgs.state.RGSState;
import codeOrchestra.rgs.state.model.*;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/**
 * @author Alexander Eliseyev
 */
public interface RGSServiceClient {

  void initAndTryToRestart() throws RGSException;

  void init() throws RGSException;

  void syncGenerationSettings() throws RGSException;

  void disconnect() throws RGSException;

  boolean canBeRestarted() throws RGSException;

  void restart() throws RGSException;

  boolean isConnected();

  RGSState getState();

  void reportPropertyChange(RemoteNodeId nodeId, String propertyName, String newValue, long timestamp) throws RGSException;

  void syncProject(ISyncCallback syncCallback) throws RGSException;

  void reportLiveCodingSessionStart(String sessionId, long timestamp, AbstractRemoteModuleReference moduleReference) throws RGSException;

  void fetchBuildArtifacts(@Nullable OutputType outputType, AbstractRemoteModuleReference moduleReference, IFetchCallback fetchCallback) throws RGSException;

  void loadProject() throws RGSException;

  void unloadProject() throws RGSException;

  void toggleLiveGeneration(boolean nextGenerationShouldBeLive, AbstractRemoteModuleReference remoteModelReference, ILiveCodingRunConfiguration liveCodingConfiguration) throws RGSException;

  void generate(AbstractRemoteModuleReference remoteModuleReference, boolean rebuildAll, BuildProvider buildProvider, IRemoteGenerationCallback generationCallback, IRemoteProgressIndicator progressIndicator) throws RGSException;

  void reportGenerationError(GenerateInput generateInput, String message, RGSException e);

  void reportGenerationSuccess(GenerateInput generateInput);

  void updateProject() throws RGSException;

  void updateModule(String name) throws RGSException;

  void updateModel(RemoteModelReference modelReference) throws RGSException;

  void reportLiveCodingSessionStop() throws RGSException;

  boolean pushNewMakeType(@NotNull String moduleName, @NotNull ASModuleMakeType makeType) throws RGSException;

  boolean isProfilingInProgress() throws RGSException;

  void toggleCPUProfiling(boolean on) throws RGSException;

  boolean isProfilingEnabled() throws RGSException;
}
