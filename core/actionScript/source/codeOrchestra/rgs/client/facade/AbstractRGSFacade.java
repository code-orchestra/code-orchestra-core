package codeOrchestra.rgs.client.facade;

import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.client.FileSyncOperationWrapper;
import codeOrchestra.rgs.client.ISyncCallback;
import codeOrchestra.rgs.client.appimpl.ApplicationRGSClient;
import codeOrchestra.rgs.client.sshd.SyncFileOperation;
import codeOrchestra.rgs.state.model.GenerateInput;
import codeOrchestra.utils.ProjectHolder;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.project.Project;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.Nullable;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractRGSFacade implements IRGSTaskCaller {

  private static final Runnable SAVE_ALL_RUNNABLE = new Runnable() {
    @Override
    public void run() {
      SModelRepository.getInstance().saveAll();
      ProjectHolder.getProject().getComponent(MPSProject.class).forceSave();
      ApplicationManager.getApplication().saveAll();
    }
  };
  public static final Runnable SAVE_LIVE_CODING_RUNNABLE = new Runnable() {
    @Override
    public void run() {
      SModel liveCodingModel = LiveCodingManager.instance().getLiveCodingModel();
      if (liveCodingModel != null) {
        EditableSModelDescriptor liveModelDescriptor = (EditableSModelDescriptor) liveCodingModel.getModelDescriptor();
        liveModelDescriptor.save();
      }
    }
  };

  private Project project;

  protected List<FileSyncOperationWrapper> lastSyncOperationWrappers = new ArrayList<FileSyncOperationWrapper>();
  protected boolean syncedAlready;

  public AbstractRGSFacade(Project project) {
    this.project = project;
  }

  public Project getProject() {
    return project;
  }

  protected abstract GenerateInput getGenerateInput();

  protected RGSTask reloadAfterSync() {
    return new RGSTask(getGenerateInput(), "Reloading project after synchronization", false) {
      @Override
      protected void doTask(ProgressIndicator indicator) throws RGSException {
        List<String> modulesToReload = new ArrayList<String>();
        List<SModelReference> modelsToReload = new ArrayList<SModelReference>();

        for (FileSyncOperationWrapper operationWrapper : lastSyncOperationWrappers) {
          // Ignore remote deletes
          if (operationWrapper.getOperation() == SyncFileOperation.DELETE) {
            continue;
          }

          String remoteFilePath = operationWrapper.getRemoteFilePath();
          if (remoteFilePath.endsWith(".msd") || remoteFilePath.endsWith(".mpl")) {
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
              }
            }
          }
        }
      }
    };
  }

  protected static String getModuleNameByFilename(String filename) {
    return filename.substring(0, filename.length() - 4);
  }

  protected RGSTask reInitClient() {
    return new RGSTask(getGenerateInput(), "Trying to re-initialize RGS connection", false) {
      @Override
      protected void doTask(ProgressIndicator indicator) throws RGSException {
        ApplicationRGSClient.getInstance().initAndTryToRestart();
      }
    };
  }

  protected RGSTask initClient() {
    return new RGSTask(getGenerateInput(), "Initializing RGS connection", false) {
      @Override
      protected void doTask(ProgressIndicator indicator) throws RGSException {
        ApplicationRGSClient.getInstance().initAndTryToRestart();
      }
    };
  }

  protected RGSTask loadProject() {
    return new RGSTask(getGenerateInput(), "Loading Project Remotely", false) {
      @Override
      protected void doTask(ProgressIndicator indicator) throws RGSException {
        indicator.setText("Loading the project " + getProject().getName() + " into the RGS");
        ApplicationRGSClient.getInstance().loadProject();
      }
    };
  }

  protected RGSTask unloadProject() {
    return new RGSTask(getGenerateInput(), "Unloading Project Remotely", false) {
      @Override
      protected void doTask(ProgressIndicator indicator) throws RGSException {
        indicator.setText2("Unloading the project from the RGS");
        ApplicationRGSClient.getInstance().unloadProject();
      }
    };
  }

  protected RGSTask syncProject() {
    lastSyncOperationWrappers.clear();

    if (syncedAlready) {
      return RGSTask.NOP;
    }

    if (getGenerateInput().getBuildProvider() == BuildProvider.LIVE_CODING_INCREMENTAL && LiveCodingManager.instance().skipSyncForNextGeneration()) {
      return RGSTask.NOP;
    }

    syncedAlready = true;

    if (getGenerateInput().getBuildProvider() == BuildProvider.LIVE_CODING_INCREMENTAL) {
      saveLiveCodingModel();
    } else {
      saveAll();
    }

    return new RGSTask(getGenerateInput(), "Synchronizing with RGS", true) {
      @Override
      protected void doTask(final ProgressIndicator indicator) throws RGSException {
        indicator.setText("Synchronizing project files with RGS");
        ApplicationRGSClient.getInstance().syncProject(new ISyncCallback() {
          @Override
          public void syncingFile(SyncFileOperation operation, String remoteFilePath, @Nullable String localFilePath) {
            String message = String.format("[%s] %s", operation.name(), remoteFilePath);

            lastSyncOperationWrappers.add(new FileSyncOperationWrapper(operation, remoteFilePath, localFilePath));
            indicator.setText2(message);
          }

          @Override
          public void done() {
            indicator.stop();
          }
        });
      }
    };
  }

  private void saveLiveCodingModel() {
    ModelAccess.instance().runWriteInEDT(SAVE_LIVE_CODING_RUNNABLE);
  }

  private void saveAll() {
    ModelAccess.instance().runWriteInEDT(SAVE_ALL_RUNNABLE);
  }

}
