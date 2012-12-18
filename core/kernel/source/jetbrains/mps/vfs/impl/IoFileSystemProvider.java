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

import jetbrains.mps.vfs.FileSystemProvider;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import java.io.File;

/**
 * @author Evgeny Gerashchenko
 */
public class IoFileSystemProvider implements FileSystemProvider {
  @Override
  public IFile getFile(@NotNull String path) {
    // RE-713
    if (path.toLowerCase().contains(".jar!") || path.toLowerCase().contains(".zip!")) {
      int index = path.indexOf("!");
      String jarPath = path.substring(0, index);
      String entryPath = path.substring(index + 1);

      if (entryPath.startsWith("/")) {
        entryPath = entryPath.substring(1);
      }

      File jarFile = new File(jarPath);
      return new JarEntryFile(JarFileDataCache.instance().getDataFor(jarFile), jarFile, entryPath);
    } else {
      return new IoFile(path);
    }
  }
}
