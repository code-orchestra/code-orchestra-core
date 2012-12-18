package codeOrchestra.actionScript.assets.util;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFileAdapter;
import com.intellij.openapi.vfs.VirtualFileCopyEvent;
import com.intellij.openapi.vfs.VirtualFileEvent;
import com.intellij.openapi.vfs.VirtualFileMoveEvent;
import codeOrchestra.actionScript.assets.AssetsManager;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.ModelAccess;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class AssetsReloadFileListener extends VirtualFileAdapter {

  private static final Logger LOG = Logger.getLogger(AssetsReloadFileListener.class);

  private Project project;

  public AssetsReloadFileListener(Project project) {
    this.project = project;
  }

  public void reloadAssetsIfNeeded(VirtualFileEvent event) {
    try {
      final AssetsManager assetsManager = project.getComponent(AssetsManager.class);

      String sourceFilePath = new File(event.getFile().getPath()).getPath();
      String assetsPath = assetsManager.createOrGetProjectAssetsDir().getPath();

      if (sourceFilePath.startsWith(assetsPath)) {
        // This is an asset file!
        ModelAccess.instance().runWriteAction(new Runnable() {
        public void run() {
          assetsManager.reloadProjectAssetsStubs();
        }
      });
      }
    } catch (Throwable t) {
      LOG.warning("Error while updaing assets dir", t);
    }
  }

  @Override
  public void fileCreated(VirtualFileEvent event) {
    reloadAssetsIfNeeded(event);
  }

  @Override
  public void fileDeleted(VirtualFileEvent event) {
    reloadAssetsIfNeeded(event);
  }

  @Override
  public void fileMoved(VirtualFileMoveEvent event) {
    reloadAssetsIfNeeded(event);
  }

  @Override
  public void fileCopied(VirtualFileCopyEvent event) {
    reloadAssetsIfNeeded(event);
  }
}
