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

import jetbrains.mps.vfs.IFile;
import jetbrains.mps.vfs.ex.IFileEx;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

public class JarEntryFile implements IFileEx {
  private JarFileData myJarFileData;
  private File myJarFile;
  private String myEntryPath;

  JarEntryFile(JarFileData jarFileData, File jarFile, String path) {
    myJarFileData = jarFileData;
    myJarFile = jarFile;
    myEntryPath = path.replace(File.separator, "/");
    if (myEntryPath.endsWith("/")) {
      myEntryPath = myEntryPath.substring(0, myEntryPath.length() - 1);
    }
  }

  public String getName() {
    String result = myEntryPath;

    int index = result.lastIndexOf('/');
    if (index != -1) {
      result = result.substring(index + 1);
    }
    if (myEntryPath.isEmpty()) {
      return "/";
    }
    return result;
  }

  public IFile getParent() {
    if (myEntryPath.isEmpty()) {
      return null;
    } else {
      return new JarEntryFile(myJarFileData, myJarFile, myJarFileData.getParentDirectory(myEntryPath));
    }
  }

  public List<IFile> getChildren() {
    if (!isDirectory()) {
      return null;
    }

    List<IFile> result = new ArrayList<IFile>();
    for (String e : myJarFileData.getSubdirectories(myEntryPath)) {
      result.add(new JarEntryFile(myJarFileData, myJarFile, e));
    }
    for (String e : myJarFileData.getFiles(myEntryPath)) {
      result.add(new JarEntryFile(myJarFileData, myJarFile, myEntryPath.length() > 0 ? myEntryPath + "/" + e : e));
    }

    return result;
  }

  public IFile getDescendant(String suffix) {
    String path = myEntryPath.length() > 0 ? myEntryPath + "/" + suffix : suffix;
    return new JarEntryFile(myJarFileData, myJarFile, path);
  }

  public boolean isDirectory() {
    return myJarFileData != null && myJarFileData.isDirectory(myEntryPath);
  }

  public String getPath() {
    return myJarFile.getAbsolutePath() + "!/" + myEntryPath;
  }

  @Override
  @Deprecated
  public String getAbsolutePath() {
    return getPath();
  }

  public long lastModified() {
    return myJarFile.lastModified();
  }

  public boolean exists() {
    return myJarFileData != null && myJarFileData.exists(myEntryPath);
  }

  public boolean createNewFile() {
    return false;
  }

  public boolean mkdirs() {
    return false;
  }

  public boolean delete() {
    return false;
  }

  public InputStream openInputStream() throws IOException {
    if (myJarFileData == null) {
      throw new IOException("File is not found " + getPath());
    }
    return myJarFileData.openStream(myEntryPath);
  }

  public OutputStream openOutputStream() throws IOException {
    throw new UnsupportedOperationException();
  }

  public boolean isReadOnly() {
    return true;
  }

  public long length() {
    if (myJarFileData == null) {
      return -1;
    }
    return myJarFileData.getLength(myEntryPath);
  }

  public String toString() {
    return myEntryPath;
  }

  @Override
  public boolean isPackaged() {
    return true;
  }

  @Override
  public IFile getBundleHome() {
    return new IoFile(myJarFile);
  }

  @Override
  public boolean setTimeStamp(long time) {
    return false;
  }

  @Override
  public void refresh() {
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    JarEntryFile that = (JarEntryFile) o;

    if (myEntryPath != null ? !myEntryPath.equals(that.myEntryPath) : that.myEntryPath != null) return false;
    if (myJarFile != null ? !myJarFile.equals(that.myJarFile) : that.myJarFile != null) return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result = myJarFile != null ? myJarFile.hashCode() : 0;
    result = 31 * result + (myEntryPath != null ? myEntryPath.hashCode() : 0);
    return result;
  }
}
