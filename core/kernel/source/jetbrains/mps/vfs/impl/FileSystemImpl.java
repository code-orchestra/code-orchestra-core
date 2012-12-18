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
package jetbrains.mps.vfs.impl;

import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.FileSystemProvider;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.vfs.ex.IFileEx;
import org.jetbrains.annotations.NotNull;

/**
 * @author Evgeny Gerashchenko
 */
public class FileSystemImpl extends FileSystem {
  private FileSystemProvider myFileSystemProvider = new IoFileSystemProvider();

  @Override
  public void setFileSystemProvider(@NotNull FileSystemProvider fileSystemProvider) {
    myFileSystemProvider = fileSystemProvider;
  }

  @Override
  public FileSystemProvider getFileSystemProvider() {
    return myFileSystemProvider;
  }

  @Override
  public IFile getFileByPath(@NotNull String path) {
    return myFileSystemProvider.getFile(path.replace("//", "/").replace("\\\\", "\\"));
  }

  @Override
  public boolean isPackaged(IFile file) {
    return file instanceof IFileEx && ((IFileEx) file).isPackaged();
  }

  @Override
  public IFile getBundleHome(IFile file) {
    if (file instanceof IFileEx) {
      return ((IFileEx) file).getBundleHome();
    } else {
      return null;
    }
  }

  @Override
  public boolean setTimeStamp(IFile file, long time) {
    return file instanceof IFileEx && ((IFileEx) file).setTimeStamp(time);
  }

  @Override
  public void refresh(IFile file) {
    if (file instanceof IFileEx) {
      ((IFileEx) file).refresh();
    }
  }
}
