package codeOrchestra.rgs.server.util;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.LocalFileSystem;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.openapi.vfs.newvfs.RefreshQueue;
import com.intellij.openapi.vfs.newvfs.RefreshSession;
import com.intellij.util.indexing.FileBasedIndex;
import codeOrchestra.rgs.generation.RGSDigestProvider;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.generator.impl.dependencies.GenerationDependenciesCache;
import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.ide.vfs.VirtualFileUtils;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.persistence.ProjectDescriptorPersistence;
import jetbrains.mps.project.structure.project.ProjectDescriptor;
import jetbrains.mps.smodel.DefaultSModelDescriptor;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.vfs.IFile;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public final class ProjectReloadUtil {

  public static void reloadProject() {
    Project project = ProjectHolder.getProject();
    final MPSProject mpsProject = project.getComponent(MPSProject.class);

    String url = project.getPresentableUrl();

    final File projectFile = new File(url);
    final ProjectDescriptor descriptor = new ProjectDescriptor();
    ProjectDescriptorPersistence.loadProjectDescriptor(descriptor, projectFile);

    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        mpsProject.setProjectDescriptor(descriptor);
      }
    });
  }

  public static void reloadModule(final String moduleName) {
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        Solution solution = MPSModuleRepository.getInstance().getSolution(moduleName);

        refreshVfs(solution.getDescriptorFile());
        refreshVfs(solution.getDescriptorFile().getParent());

        solution.reloadFromDisk(false);
        solution.markForRegeneration();
      }
    });
  }

  public static void reloadModel(final SModelDescriptor modelDescriptor) {
    if (modelDescriptor instanceof DefaultSModelDescriptor) {
      ModelAccess.instance().runWriteAction(new Runnable() {
        @Override
        public void run() {
          DefaultSModelDescriptor defaultSModelDescriptor = (DefaultSModelDescriptor) modelDescriptor;

          refreshVfs(defaultSModelDescriptor.getModelFile());
          defaultSModelDescriptor.reloadFromDisk();

          RGSDigestProvider.getInstance().addModelToRedigest(modelDescriptor.getSModelReference());
        }
      });

      modelDescriptor.markAsRequiringGeneration(true);
    }
  }

  public static void refreshVfs(IFile iFile) {
    File file = new File(iFile.getPath());
    VirtualFile vf = LocalFileSystem.getInstance().findFileByIoFile(file);
    if (vf == null || !vf.exists()) {
      vf = LocalFileSystem.getInstance().findFileByIoFile(file);
    }
    RefreshSession rs = RefreshQueue.getInstance().createSession(false, true, null);
    assert vf != null;
    rs.addFile(vf);
    rs.launch();
  }

}
