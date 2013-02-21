package codeOrchestra.rgs.client.facade;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.Progressive;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionScript.compiler.report.CompilerMessagesComponent;
import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.actionscript.make.ASModuleMakeTypeManager;
import codeOrchestra.actionscript.modulemaker.CompilationResult;
import codeOrchestra.actionscript.modulemaker.messages.CompilerMessage;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import codeOrchestra.generator.listener.BuildBroadcaster;
import codeOrchestra.generator.listener.BuildEvent;
import codeOrchestra.generator.listener.BuildListener;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.IFetchCallback;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.client.FileSyncOperationWrapper;
import codeOrchestra.rgs.client.appimpl.ApplicationRGSClient;
import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import codeOrchestra.rgs.logging.Severity;
import codeOrchestra.rgs.progress.IRemoteProgressIndicator;
import codeOrchestra.rgs.progress.RegularToRemoteProgressIndicatorAdapter;
import codeOrchestra.rgs.state.*;
import codeOrchestra.rgs.state.generation.GenerationResult;
import codeOrchestra.rgs.state.model.AbstractRemoteModuleReference;
import codeOrchestra.rgs.state.model.GenerateInput;
import codeOrchestra.rgs.state.model.RemoteModelReference;
import codeOrchestra.rgs.state.model.RemoteProject;
import codeOrchestra.utils.NotificationUtils;
import jetbrains.mps.ide.messages.MessagesViewTool;
import jetbrains.mps.project.IModule;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import javax.swing.SwingUtilities;
import java.io.File;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public final class RemoteGenerationUIFacade extends AbstractRGSFacade {

  private static final int FINISH_CHECK_INTERVAL = 200;

  private boolean rebuildAll;
  private IModule rootModule;

  private AbstractRemoteModuleReference remoteModuleReference;
  private GenerateInput generateInput;
  private OutputType rootOutputType;

  private boolean buildEventReported;
  private boolean finished;
  private boolean failed;

  private BuildProvider buildProvider;

  public RemoteGenerationUIFacade(Project project, boolean rebuildAll, IModule rootModule, BuildProvider buildProvider) {
    super(project);

    this.rebuildAll = rebuildAll;
    this.rootModule = rootModule;

    this.remoteModuleReference = AbstractRemoteModuleReference.ofModule(rootModule);
    this.rootOutputType = CodeOrchestraGenerateManager.getOwnOutputType(rootModule.getModuleReference());
    this.buildProvider = buildProvider;

    this.generateInput = new GenerateInput(rootModule.getModuleReference(), buildProvider == BuildProvider.LOCAL ? BuildProvider.RGS : buildProvider);

    BuildBroadcaster.getInstance().addBuildListener(new BuildListener() {
      @Override
      public void onBuild(BuildEvent buildEvent) {
        if (buildEventReported) {
          return;
        }

        RemoteGenerationUIFacade.this.finished = true;
        if (!buildEvent.isSuccessful()) {
          RemoteGenerationUIFacade.this.failed = true;
        }

        buildEventReported = true;
      }
    });
  }

  public RemoteGenerationUIFacade(Project project, boolean rebuildAll, IModule rootModule) {
    this(project, rebuildAll, rootModule, BuildProvider.RGS);
  }

  @Override
  public void call() {
    generateRemotely();
  }

  public boolean generateRemotelyAndWait() {
    generateRemotely();

    while (true) {
      try {
        Thread.sleep(FINISH_CHECK_INTERVAL);
      } catch (InterruptedException e) {
        // ignore
      }

      if (failed) {
        return false;
      }

      if (finished) {
        return true;
      }
    }
  }

  public void generateRemotely() {
    // RE-4388 - Don't clear the output during live incremental generation
    if (buildProvider != BuildProvider.LIVE_CODING_INCREMENTAL) {
      getProject().getComponent(MessagesViewTool.class).clear();
    }

    RGSState state = ApplicationRGSClient.getInstance().getState();

    if (state instanceof RGSNotConnectedState) {
      // Init client, next phase
      RGSTaskStack.create(this, initClient(), nextPhase()).process();
    } else if (state instanceof RGSUnknownState) {
      // Re-Init client, next phase
      RGSTaskStack.create(this, reInitClient(), nextPhase()).process();
    } else if (state instanceof RGSNoProjectState) {
      // Sync project, load project, next phase
      RGSTaskStack.create(this, syncProject(), loadProject(), nextPhase()).process();
    } else if (state instanceof RGSProjectLoadedState) {
      RemoteProject remoteProject = ((RGSProjectLoadedState) state).getProject();
      if (remoteProject.isTheSameAs(getProject())) {
        // Sync, generate, fetch artifacts
        RGSTaskStack.create(this, syncProject(), reloadAfterSync(), pushMakeType(), toggleLive(), syncGenerationSettings(), generate(), fetch(), finishGeneration()).process();
      } else {
        // Unload previous project
        RGSTaskStack.create(this, unloadProject(), nextPhase()).process();
      }
    } else {
      // Busy/illegal state
      //ApplicationRGSClient.getInstance().reportGenerationError(generateInput, "Invalid RGS State: " + state.getPresentation(), null);
      NotificationUtils.showRGSBalloon("The project is currently syncing and can't be generated yet...");
      this.failed = true;
    }
  }

  private RGSTask pushMakeType() {
    return new RGSTask(getGenerateInput(), "Pushing the Make Type", false) {
      @Override
      protected void doTask(ProgressIndicator indicator) throws RGSException {
        String moduleName = remoteModuleReference.getModuleName();

        ASModuleMakeTypeManager moduleMakeTypeManager = getProject().getComponent(ASModuleMakeTypeManager.class);
        ASModuleMakeType moduleMakeType = moduleMakeTypeManager.getModuleMakeType(moduleName);

        if (ApplicationRGSClient.getInstance().pushNewMakeType(moduleName, moduleMakeType)) {
          ApplicationRGSClient.getInstance().updateModule(moduleName);
        }
      }
    };
  }

  private RGSTask toggleLive() {
    if (LiveCodingManager.instance().nextGenerationMustBeLive()) {
      return new RGSTask(getGenerateInput(), "Toggling Live Coding generation", false) {
        @Override
        protected void doTask(ProgressIndicator indicator) throws RGSException {
          ApplicationRGSClient.getInstance().toggleLiveGeneration(
            true,
            AbstractRemoteModuleReference.ofModule(LiveCodingManager.instance().getLastLiveModule()),
            LiveCodingManager.instance().getLastLiveCodingConfiguration()
          );
          LiveCodingManager.instance().toggleLiveGeneration(false);
        }
      };
    }
    return RGSTask.NOP;
  }

  private RGSTask finishGeneration() {
    return new RGSTask(getGenerateInput(), "Finishing Generating on RGS", false) {
      @Override
      protected void doTask(ProgressIndicator indicator) throws RGSException {
        if (failed) {
          return;
        }

        // Notify visually
        if (buildProvider != BuildProvider.LIVE_CODING_INCREMENTAL) {
          NotificationUtils.notifyWithABalloon("Successful Generation", rootModule.getModuleFqName() + " has been built on the RGS successfully", Severity.INFO);
        }

        // Report the success
        ApplicationRGSClient.getInstance().reportGenerationSuccess(new GenerateInput(rootModule.getModuleReference(), buildProvider));

        // Mark as finished
        RemoteGenerationUIFacade.this.finished = true;

        // Reload classes
        if (needClassedReload()) {
          SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
              ModelAccess.instance().runWriteActionWithProgressSynchronously(new Progressive() {
                @Override
                public void run(@NotNull ProgressIndicator indicator) {
                  // Reload the classes if needed
                  if (needClassedReload()) {
                    ClassLoaderManager.getInstance().reloadAll(indicator);
                  }
                }
              }, "Reloading Classes", false, getProject());
            }
          });
        }
      }

      private boolean needClassedReload() {
        return RemoteGenerationUIFacade.this.rootModule instanceof Language;
      }
    };
  }

  private RGSTask syncGenerationSettings() {
    return new RGSTask(getGenerateInput(), "Syncing generation settings", false) {
      @Override
      protected void doTask(ProgressIndicator indicator) throws RGSException {
        ApplicationRGSClient.getInstance().syncGenerationSettings();
      }
    };
  }

  private RGSTask generate() {
    return new RGSTask(getGenerateInput(), "Building on RGS", false) {
      @Override
      protected void doTask(ProgressIndicator indicator) throws RGSException {
        final RGSException[] generationException = new RGSException[1];
        final GenerationResult[] generationResult = new GenerationResult[1];

        IRemoteProgressIndicator remoteProgressIndicator = new RegularToRemoteProgressIndicatorAdapter(indicator);

        AbstractGenerationCallback generationCallback = new AbstractGenerationCallback(getGenerateInput()) {
          @Override
          public void handleException(Throwable t) throws RemoteException {
            generationException[0] = new RGSException(t);
          }

          @Override
          public void onFinish(GenerationResult result) throws RemoteException {
            generationResult[0] = result;
          }
        };
        ApplicationRGSClient.getInstance().generate(
          remoteModuleReference,
          rebuildAll,
          getGenerateInput().getBuildProvider(),
          generationCallback,
          remoteProgressIndicator);

        if (generationException[0] != null) {
          throw generationException[0];
        }

        if (generationResult[0] == null) {
          // Nothing to generate
          return;
        }

        CompilationResult compilationResult = generationResult[0].getCompilationResult();
        if (compilationResult != null) {
          CompilerMessagesComponent.instance().invalidate();
          for (CompilerMessage compilerMessage : compilationResult.getMessages()) {
            CompilerMessagesComponent.instance().addMessage(compilerMessage);
          }
        }

        if (!generationResult[0].isSuccessful()) {
          String defaultMessage = "Remote generation of module " + remoteModuleReference.getModuleName() + " has failed";

          if (compilationResult != null && compilationResult.getFirstErrorMessage() != null) {
            onFail(compilationResult.getFirstErrorMessage().getContent());
          } else {
            onFail(generationCallback.getLastMessage() == null ? defaultMessage : generationCallback.getLastMessage());
          }
        }
      }

      @Override
      protected boolean ignoreFail() {
        return true;
      }
    };
  }

  @Override
  protected RGSTask reloadAfterSync() {
    return new RGSTask(getGenerateInput(), "Reloading project after synchronization", false) {
      @Override
      protected void doTask(ProgressIndicator indicator) throws RGSException {
        boolean needReloadProject = false;
        List<String> modulesToReload = new ArrayList<String>();
        List<SModelReference> modelsToReload = new ArrayList<SModelReference>();

        for (FileSyncOperationWrapper operationWrapper : lastSyncOperationWrappers) {
          // Ignore remote deletes
          if (operationWrapper.getOperation() == SyncFileOperation.DELETE) {
            continue;
          }

          String remoteFilePath = operationWrapper.getRemoteFilePath();
          if (remoteFilePath.endsWith(".mpr")) {
            // Project paths were modified
            needReloadProject = true;
            break;
          } else if (remoteFilePath.endsWith(".msd") || remoteFilePath.endsWith(".mpl")) {
            // Module descriptor was modified
            modulesToReload.add(getModuleNameByFilename(new File(remoteFilePath).getName()));
          } else if (remoteFilePath.endsWith(".mps")) {
            // Model was modified
            String localFilePath = operationWrapper.getLocalFilePath();
            if (localFilePath == null) {
              continue;
            }

            IFile modelFile = FileSystem.getInstance().getFileByPath(localFilePath);
            if (modelFile == null || !modelFile.exists()) {
              continue;
            }

            EditableSModelDescriptor modelDescriptor = SModelRepository.getInstance().findModel(modelFile);
            if (modelDescriptor != null) {
              if (operationWrapper.getOperation() == SyncFileOperation.MODIFY) {
                modelsToReload.add(modelDescriptor.getSModelReference());
              } else if (operationWrapper.getOperation() == SyncFileOperation.UPLOAD) {
                modulesToReload.add(modelDescriptor.getModule().getModuleFqName());
                modelsToReload.add(modelDescriptor.getSModelReference());
              }
            }
          }
        }

        // Reload project
        if (needReloadProject) {
          rebuildAll = true;
          indicator.setText("Updating the project paths");
          ApplicationRGSClient.getInstance().updateProject();
        }

        // Reload modules
        for (String moduleToReload : modulesToReload) {
          if (moduleToReload.equals(rootModule.getModuleFqName())) {
            rebuildAll = true;
          }
          indicator.setText("Updating the module " + moduleToReload);
          ApplicationRGSClient.getInstance().updateModule(moduleToReload);
        }

        // Reload models
        for (SModelReference modelToReload : modelsToReload) {
          indicator.setText("Updating the model " + modelToReload);
          ApplicationRGSClient.getInstance().updateModel(RemoteModelReference.fromRegularReference(modelToReload));
        }
      }
    };
  }

  private RGSTask fetch() {
    return new RGSTask(getGenerateInput(), "Fetching Build Artifacts from RGS", true) {
      @Override
      protected void doTask(final ProgressIndicator indicator) throws RGSException {
        ApplicationRGSClient.getInstance().fetchBuildArtifacts(rootOutputType, remoteModuleReference, new IFetchCallback() {
          @Override
          public void onFetch(String filename) throws RemoteException {
            indicator.setText("Fetching " + filename);
          }
        });
      }
    };
  }

  private RGSTask nextPhase() {
    return new RGSTask(getGenerateInput(), "Stepping to the next RGS generation phase", true) {
      @Override
      protected void doTask(final ProgressIndicator indicator) throws RGSException {
        generateRemotely();
      }
    };
  }

  @Override
  protected GenerateInput getGenerateInput() {
    return this.generateInput;
  }

}
