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
package jetbrains.mps.vfs;

import jetbrains.mps.vfs.impl.FileSystemImpl;
import org.jetbrains.annotations.NotNull;

/**
 * @author Evgeny Gerashchenko
 */
public abstract class FileSystem {
  private static final FileSystem INSTANCE = new FileSystemImpl();

  public abstract void setFileSystemProvider(@NotNull FileSystemProvider fileSystemProvider);

  public abstract FileSystemProvider getFileSystemProvider();

  public abstract IFile getFileByPath(@NotNull String path);

  public abstract boolean isPackaged(IFile file);

  public abstract IFile getBundleHome(IFile file);

  public abstract boolean setTimeStamp(IFile file, long time);

  public abstract void refresh(IFile file);

  public static FileSystem getInstance() {
    return INSTANCE;
  }

  /**
   * @deprecated Use FileSystem.getInstance().getFileByPath(String) instead.
   */
  @Deprecated()
  public IFile getFile(String path) {
    return FileSystem.getInstance().getFileByPath(path);
  }
}
