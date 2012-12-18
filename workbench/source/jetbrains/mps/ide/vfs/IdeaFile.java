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
package jetbrains.mps.ide.vfs;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.vfs.JarFileSystem;
import com.intellij.openapi.vfs.LocalFileSystem;
import com.intellij.openapi.vfs.VfsUtil;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.openapi.vfs.newvfs.NewVirtualFile;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.vfs.ex.IFileEx;
import org.apache.commons.lang.ObjectUtils;
import org.jetbrains.annotations.NotNull;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @author Evgeny Gerashchenko
 */
public class IdeaFile implements IFileEx {
  private static final Logger LOG = Logger.getLogger(IdeaFileSystemProvider.class);

  // Class invariant: myVirtualFile and myPath cannot be both null/both not-null
  private String myPath = null;
  private VirtualFile myVirtualFile = null;

  IdeaFile(@NotNull String path) {
    myPath = path;
  }

  IdeaFile(@NotNull VirtualFile virtualFile) {
    myVirtualFile = virtualFile;
  }

  @Override
  public String getPath() {
    if (findVirtualFile()) {
      return myVirtualFile.getPath();
    } else {
      return myPath;
    }
  }

  @Override
  @Deprecated
  public String getAbsolutePath() {
    return getPath();
  }

  @Override
  public String getName() {
    if (findVirtualFile()) {
      return myVirtualFile.getName();
    } else {
      return truncFileName(myPath);
    }
  }

  @Override
  public IdeaFile getParent() {
    if (findVirtualFile()) {
      VirtualFile parentVirtualFile = myVirtualFile.getParent();
      if (parentVirtualFile != null) {
        return new IdeaFile(parentVirtualFile);
      }
      return null;
    } else {
      return new IdeaFile(truncDirPath(myPath));
    }
  }

  @Override
  public List<IFile> getChildren() {
    if (findVirtualFile()) {
      VirtualFile[] children = new VirtualFile[0];
      if (myVirtualFile.isValid()) {
        children = myVirtualFile.getChildren();
      }
      ArrayList<IFile> result = new ArrayList<IFile>();
      for (VirtualFile child : children) {
        result.add(new IdeaFile(child));
      }
      return Collections.unmodifiableList(result);
    } else {
      return Arrays.asList();
    }
  }

  @Override
  public IFile getDescendant(String suffix) {
    String path = getPath();
    String separator = path.contains("!") ? "/" : File.separator;
    return new IdeaFile(path + (path.endsWith(separator) ? "" : separator) + suffix);
  }

  @Override
  public boolean isDirectory() {
    return findVirtualFile() ? myVirtualFile.isDirectory() : new File(myPath).isDirectory();
  }

  @Override
  public boolean isReadOnly() {
    return exists() && !myVirtualFile.isWritable();
  }

  @Override
  public long lastModified() {
    if (findVirtualFile()) {
      return myVirtualFile.getTimeStamp();
    } else {
      return -1;
    }
  }

  @Override
  public long length() {
    if (findVirtualFile()) {
      return myVirtualFile.getLength();
    } else {
      return -1;
    }
  }

  @Override
  public boolean createNewFile() {
    ApplicationManager.getApplication().assertWriteAccessAllowed();
    if (findVirtualFile()) {
      return !myVirtualFile.isDirectory();
    } else {
      try {
        VirtualFile directory = VfsUtil.createDirectories(truncDirPath(myPath));
        String fileName = truncFileName(myPath);
        directory.findChild(fileName); // This is a workaround for IDEA-67279
        myVirtualFile = directory.createChildData(IdeaFileSystemProvider.class, fileName);
        myPath = null;
        return true;
      } catch (IOException e) {
        LOG.error(e);
        return false;
      }
    }
  }

  @Override
  public boolean mkdirs() {
    ApplicationManager.getApplication().assertWriteAccessAllowed();
    if (findVirtualFile()) {
      return myVirtualFile.isDirectory();
    } else {
      try {
        myVirtualFile = VfsUtil.createDirectories(myPath);
        myPath = null;
        return true;
      } catch (IOException e) {
        return false;
      }
    }
  }

  @Override
  public boolean exists() {
    return findVirtualFile() && myVirtualFile.exists();
  }

  @Override
  public boolean delete() {
    if (findVirtualFile()) {
      try {
        myVirtualFile.delete(IdeaFileSystemProvider.class);
        myPath = myVirtualFile.getPath();
        myVirtualFile = null;
        return true;
      } catch (IOException e) {
        IdeaFileSystemProvider.LOG.warning("Could not delete file: ", e);
        return false;
      }
    } else {
      return true;
    }
  }

  @Override
  public InputStream openInputStream() throws IOException {
    if (findVirtualFile()) {
      return myVirtualFile.getInputStream();
    } else {
      throw new FileNotFoundException("File not found: " + myPath);
    }
  }

  @Override
  public OutputStream openOutputStream() throws IOException {
    //ApplicationManager.getApplication().assertWriteAccessAllowed(); // RE-1816

    if (findVirtualFile() || createNewFile()) {
      if (myVirtualFile.getFileSystem() instanceof JarFileSystem) {
        throw new UnsupportedOperationException("Cannot write to Jar files");
      } else {
        return myVirtualFile.getOutputStream(IdeaFileSystemProvider.class);
      }
    } else {
      throw new IOException("Could not create file: " + myPath);
    }
  }

  VirtualFile getVirtualFile() {
    findVirtualFile();
    return myVirtualFile;
  }

  @Override
  public boolean setTimeStamp(long time) {
    if (findVirtualFile() && myVirtualFile instanceof NewVirtualFile) {
      try {
        ((NewVirtualFile) myVirtualFile).setTimeStamp(time);
        return true;
      } catch (IOException e) {
        LOG.warning("", e);
      }
    }
    return false;
  }

  @Override
  public void refresh() {
    ApplicationManager.getApplication().assertWriteAccessAllowed();
    if (findVirtualFile()) {
      myVirtualFile.getChildren(); // This was added to force refresh
      myVirtualFile.refresh(false, false);
    } else {
      findVirtualFile(true);
    }
  }

  @Override
  public boolean isPackaged() {
    if (findVirtualFile()) {
      return myVirtualFile.getFileSystem() instanceof JarFileSystem;
    } else {
      return myPath.contains("!");
    }
  }

  @Override
  public IFile getBundleHome() {
    if (findVirtualFile()) {
      if (myVirtualFile.getFileSystem() instanceof JarFileSystem) {
        VirtualFile fileForJar = ((JarFileSystem) myVirtualFile.getFileSystem()).getVirtualFileForJar(myVirtualFile);
        if (fileForJar == null) {
          return null;
        }
        return new IdeaFile(fileForJar);
      } else {
        return getParent();
      }
    } else {
      if (myPath.contains("!")) {
        return new IdeaFile(myPath.substring(0, myPath.indexOf("!")));
      } else {
        return getParent();
      }
    }
  }

  private boolean findVirtualFile() {
    return findVirtualFile(false);
  }

  private boolean findVirtualFile(boolean withRefresh) {
    if (myVirtualFile != null && !myVirtualFile.isValid()) {
      myPath = myVirtualFile.getPath();
      myVirtualFile = null;
    }
    if (myVirtualFile == null) {
      LocalFileSystem localFileSystem = LocalFileSystem.getInstance();
      if (myPath.contains("!")) {
        int index = myPath.indexOf("!");
        String jarPath = myPath.substring(0, index);
        String entryPath = myPath.substring(index + 1);

        // RF-573
        //assert entryPath.indexOf('\\') == -1 : "No backslashes are allowed in JAR entry path: " + myPath;
        entryPath = entryPath.replace('\\', '/');
        if (entryPath.startsWith("/")) {
          entryPath = entryPath.substring(1);
        }

        JarFileSystem jarFileSystem = JarFileSystem.getInstance();
        VirtualFile jarFile;
        if (withRefresh) {
          jarFile = localFileSystem.refreshAndFindFileByPath(jarPath);
        } else {
          jarFile = localFileSystem.findFileByPath(jarPath);
        }
        if (jarFile != null) {
          VirtualFile jarRootFile = jarFileSystem.getJarRootForLocalFile(jarFile);
          if (jarRootFile != null) {
            myVirtualFile = jarRootFile.findFileByRelativePath(entryPath);
          }
        }
      } else {
        if (withRefresh) {
          myVirtualFile = localFileSystem.refreshAndFindFileByPath(myPath);
        } else {
          myVirtualFile = localFileSystem.findFileByPath(myPath);
        }
      }
    }
    if (myVirtualFile != null) {
      myPath = null;
    }
    return myVirtualFile != null;
  }

  private static String truncDirPath(String path) {
    int index = Math.max(path.lastIndexOf('/'), path.lastIndexOf('\\'));
    if (index == -1) {
      return null;
    } else {
      return path.substring(0, index);
    }
  }

  private static String truncFileName(String path) {
    int index = Math.max(path.lastIndexOf('/'), path.lastIndexOf('\\'));
    if (index == -1) {
      return path;
    } else {
      return path.substring(index + 1);
    }
  }

  private String getSystemIndependentPath() {
    return getPath().replace('\\', '/');
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    IdeaFile ideaFile = (IdeaFile) o;

    return ObjectUtils.equals(getSystemIndependentPath(), ideaFile.getSystemIndependentPath());
  }

  @Override
  public int hashCode() {
    if (getPath() == null) {
      return 0;
    } else {
      return getSystemIndependentPath().hashCode();
    }
  }

  @Override
  public String toString() {
    if (myVirtualFile != null) {
      return "IdeaFile{" + myVirtualFile + "}";
    } else {
      return "IdeaFile{path: " + myPath + "}";
    }
  }

}
