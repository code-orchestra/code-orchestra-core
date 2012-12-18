package codeOrchestra.actionScript.stubs;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFileAdapter;
import com.intellij.openapi.vfs.VirtualFileCopyEvent;
import com.intellij.openapi.vfs.VirtualFileEvent;
import com.intellij.openapi.vfs.VirtualFileMoveEvent;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.smodel.LanguageID;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.stubs.BaseStubModelDescriptor;
import jetbrains.mps.stubs.StubReloadManager;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class ASStubsReloadFileListener extends VirtualFileAdapter {

  private static final Logger LOG = Logger.getLogger(ASStubsReloadFileListener.class);

  private Project project;

  private Map<String, ModuleReference> sourcesPaths;

  public ASStubsReloadFileListener(Project project) {
    this.project = project;
  }

  {
    ClassLoaderManager.getInstance().addReloadHandler(new ReloadAdapter() {
      public void load() {
        ASStubsReloadFileListener.this.sourcesPaths = null;
      }
    });
  }

  private synchronized void updateSourcesPaths() {
    if (this.sourcesPaths != null) {
      return;
    }
    this.sourcesPaths = new HashMap<String, ModuleReference>();

    MPSProject mpsProject = project.getComponent(MPSProject.class);
    if (mpsProject == null) {
      return;
    }

    List<Solution> projectSolutions = mpsProject.getProjectSolutions();
    for (Solution projectSolution : projectSolutions) {
      for (ModelRoot stubModelsEntry : projectSolution.getModuleDescriptor().getStubModelEntries()) {
        if (LanguageID.AS_MANAGER.equals(stubModelsEntry.getManager())) {
          sourcesPaths.put(stubModelsEntry.getPath(), projectSolution.getModuleReference());
          break;
        }
      }
    }
  }

  private void reloadStubs(ModuleReference moduleReference) {
    // Mark models as requiring the reloading
    IModule module = MPSModuleRepository.getInstance().getModule(moduleReference);
    if (module != null) {
      for (SModelDescriptor modelDescriptor : module.getOwnModelDescriptors()) {
        if (modelDescriptor != null && modelDescriptor instanceof BaseStubModelDescriptor) {
          ((BaseStubModelDescriptor) modelDescriptor).markReload();
        }
      }
    }

    // The actual reload
    StubReloadManager.getInstance().reload();

    // Update the view
    IProjectPane currentPane = ViewUtils.getCurrentPane(this.project);
    if (currentPane != null) {
      currentPane.rebuild();
    }
  }

  public void reloadSourceStubsIfNeeded(VirtualFileEvent event) {
    try {
      updateSourcesPaths();

      final String sourceFilePath = new File(event.getFile().getPath()).getPath();
      if (!sourceFilePath.toLowerCase().endsWith(".as")) {
        return;
      }

      for (final String stubSourcesPath : sourcesPaths.keySet()) {
        if (sourceFilePath.startsWith(stubSourcesPath)) {
          ModelAccess.instance().runWriteAction(new Runnable() {
            public void run() {
              reloadStubs(sourcesPaths.get(stubSourcesPath));
            }
          });
        }
      }
    } catch (Throwable t) {
      LOG.warning("Error while updating library sources dir", t);
    }
  }

  @Override
  public void contentsChanged(VirtualFileEvent event) {
    reloadSourceStubsIfNeeded(event);
  }

  @Override
  public void fileCreated(VirtualFileEvent event) {
    reloadSourceStubsIfNeeded(event);
  }

  @Override
  public void fileDeleted(VirtualFileEvent event) {
    reloadSourceStubsIfNeeded(event);
  }

  @Override
  public void fileMoved(VirtualFileMoveEvent event) {
    reloadSourceStubsIfNeeded(event);
  }

  @Override
  public void fileCopied(VirtualFileCopyEvent event) {
    reloadSourceStubsIfNeeded(event);
  }
}
