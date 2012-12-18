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
import com.intellij.ide.CopyProvider;
import com.intellij.ide.CutProvider;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import com.intellij.openapi.vfs.VirtualFile;

public class FilePaneCopyProvider implements CopyProvider, CutProvider {
  public void performCopy(DataContext dataContext) {
    perform(dataContext, false);
  }

  public void performCut(DataContext dataContext) {
    perform(dataContext, true);
  }

  private void perform(DataContext dataContext, boolean cut) {
    CopyPasteManagerEx.getInstanceEx().setContents(new VirtualFileTransferable(getData(dataContext, cut)));
  }

  private CopyPasteFilesData getData(DataContext dataContext, boolean cut) {
    VirtualFile[] files = PlatformDataKeys.VIRTUAL_FILE_ARRAY.getData(dataContext);
    if (files != null) return new CopyPasteFilesData(files, cut);
    VirtualFile file = PlatformDataKeys.VIRTUAL_FILE.getData(dataContext);
    if (file != null) return new CopyPasteFilesData(new VirtualFile[]{file}, cut);
    return null;
  }

  public boolean isCopyEnabled(DataContext dataContext) {
    return isEnabled(dataContext, false);
  }

  public boolean isCopyVisible(DataContext dataContext) {
    return true;
  }

  public boolean isCutEnabled(DataContext dataContext) {
    return isEnabled(dataContext, true);
  }

  public boolean isCutVisible(DataContext dataContext) {
    return true;
  }

  private boolean isEnabled(DataContext dataContext, boolean cut) {
    return getData(dataContext, cut) != null;
  }
}
