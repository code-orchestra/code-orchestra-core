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
package jetbrains.mps.workbench.languagesFs;

import com.intellij.openapi.util.Computable;
import com.intellij.openapi.vfs.DeprecatedVirtualFile;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.openapi.vfs.VirtualFileSystem;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.ModelAccess;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class MPSLanguageVirtualFile extends DeprecatedVirtualFile {
  private Language myLanguage;
  private String myPath;
  private String myName;

  public MPSLanguageVirtualFile(@NotNull Language language) {
    myLanguage = language;
    myPath = myLanguage.getModuleFqName();
    myName = myLanguage.getModuleFqName();
  }

  public String getPath() {
    return myPath;
  }

  @NotNull
  public VirtualFileSystem getFileSystem() {
    return MPSLanguagesVirtualFileSystem.getInstance();
  }

  @NotNull
  @NonNls
  public String getName() {
    // language name could end with .java, .xml etc. which might confuse IDEA file system
    // see also MPS-11156
    return myName + " (language) ";
  }

  public boolean isDirectory() {
    return false;
  }

  public long getLength() {
    return 0;
  }

  public InputStream getInputStream() throws IOException {
    throw new UnsupportedOperationException();
  }

  public OutputStream getOutputStream(Object requestor, long newModificationStamp, long newTimeStamp) throws IOException {
    throw new UnsupportedOperationException();
  }

  public byte[] contentsToByteArray() throws IOException {
    throw new UnsupportedOperationException();
  }

  @Nullable
  public VirtualFile getParent() {
    return null;
  }

  public VirtualFile[] getChildren() {
    return null;
  }

  public void refresh(boolean asynchronous, boolean recursive, Runnable postRunnable) {
    if (postRunnable != null) {
      postRunnable.run();
    }
  }

  public boolean isWritable() {
    return true;
  }

  public boolean isValid() {
    return true;
  }

  public long getTimeStamp() {
    return ModelAccess.instance().runReadAction(new Computable<Long>() {
      public Long compute() {
        return System.currentTimeMillis();
      }
    });
  }

  public long getModificationStamp() {
    return getTimeStamp();
  }

  public Language getLanguage() {
    return myLanguage;
  }
}
