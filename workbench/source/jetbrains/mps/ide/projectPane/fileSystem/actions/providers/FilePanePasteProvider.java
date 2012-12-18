/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.ide.projectPane.fileSystem.actions.providers;

import com.intellij.ide.CopyPasteManagerEx;
import com.intellij.ide.PasteProvider;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import com.intellij.openapi.fileTypes.FileTypeManager;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;

public class FilePanePasteProvider implements PasteProvider {
  private final static Logger LOG = Logger.getLogger(FilePanePasteProvider.class);

  public void performPaste(DataContext dataContext) {
    CopyPasteFilesData data = getData(dataContext);
    if (data != null) {
      paste(data, getDir(dataContext));
    }
  }

  @Nullable
  private CopyPasteFilesData getData(DataContext dataContext) {
    Transferable content = CopyPasteManagerEx.getInstanceEx().getSystemClipboardContents();
    if (content == null) return null;

    CopyPasteFilesData files = null;
    if (content.isDataFlavorSupported(VirtualFileTransferable.VIRTUAL_FILE_DATA_FLAVOR)) {
      try {
        files = getData((String[]) content.getTransferData(VirtualFileTransferable.VIRTUAL_FILE_DATA_FLAVOR));

        if (files == null || !files.hasAnythingToDo()) {
          return null;
        }

      } catch (UnsupportedFlavorException e) {
        LOG.error("Exception", e);
        return null;
      } catch (IOException e) {
        LOG.error("Exception", e);
        return null;
      }
    }

    return files;
  }

  private CopyPasteFilesData getData(String[] strings) {
    if (strings == null) return null;
    return new CopyPasteFilesData(strings);
  }

  private VirtualFile getDir(DataContext dataContext) {
    VirtualFile file = PlatformDataKeys.VIRTUAL_FILE.getData(dataContext);
    if (file == null || !file.isDirectory()) return null;
    return file;
  }

  private void paste(@NotNull CopyPasteFilesData data, @NotNull VirtualFile basedir) {
    for (VirtualFile f : data.getFiles()) {
      try {
        if (!FileTypeManager.getInstance().isFileIgnored(f.getName())) {
          if (!data.isCut()) {
            f.copy(this, basedir, f.getName());
          } else {
            f.move(this, basedir);
          }
        }
      } catch (IOException e) {
        LOG.error("Error while pasting " + f + "\n", e);
      }
    }
  }

  public boolean isPastePossible(DataContext dataContext) {
    return (getDir(dataContext) != null) && (getData(dataContext) != null);
  }

  public boolean isPasteEnabled(DataContext dataContext) {
    return (getDir(dataContext) != null) && (getData(dataContext) != null);
  }
}
