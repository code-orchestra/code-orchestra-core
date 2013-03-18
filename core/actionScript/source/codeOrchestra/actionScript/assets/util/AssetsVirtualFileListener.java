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
public class AssetsVirtualFileListener extends VirtualFileAdapter {

  private static final Logger LOG = Logger.getLogger(AssetsVirtualFileListener.class);

  private Project project;

  public AssetsVirtualFileListener(Project project) {
    this.project = project;
  }

  public void reloadAssetsIfNeeded(VirtualFileEvent event, final AssetEventType eventType) {
    try {
      final AssetsManager assetsManager = project.getComponent(AssetsManager.class);

      final String assetFilePath = new File(event.getFile().getPath()).getPath();
      final String assetsDirPath = assetsManager.createOrGetProjectAssetsDir().getPath();

      // Check if we're dealing with an asset file here
      if (assetFilePath.startsWith(assetsDirPath)) {
        ModelAccess.instance().runWriteAction(new Runnable() {
          public void run() {
            if (eventType != AssetEventType.CHANGED) {
              assetsManager.reloadProjectAssetsStubs();
            }

            assetsManager.fireAssetFileEvent(eventType, assetFilePath);
          }
        });
      }
    } catch (Throwable t) {
      LOG.warning("Error while updating assets dir", t);
    }
  }

  @Override
  public void fileCreated(VirtualFileEvent event) {
    reloadAssetsIfNeeded(event, AssetEventType.CREATED);
  }

  @Override
  public void fileDeleted(VirtualFileEvent event) {
    reloadAssetsIfNeeded(event, AssetEventType.DELETED);
  }

  @Override
  public void fileMoved(VirtualFileMoveEvent event) {
    reloadAssetsIfNeeded(event, AssetEventType.MOVED);
  }

  @Override
  public void fileCopied(VirtualFileCopyEvent event) {
    reloadAssetsIfNeeded(event, AssetEventType.COPIED);
  }

  @Override
  public void contentsChanged(VirtualFileEvent event) {
    reloadAssetsIfNeeded(event, AssetEventType.CHANGED);
  }

}
