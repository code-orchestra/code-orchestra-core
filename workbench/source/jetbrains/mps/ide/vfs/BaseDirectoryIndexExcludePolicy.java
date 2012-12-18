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

import com.intellij.openapi.module.Module;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.roots.ModuleRootModel;
import com.intellij.openapi.roots.impl.DirectoryIndexExcludePolicy;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.openapi.vfs.pointers.VirtualFilePointer;
import com.intellij.openapi.vfs.pointers.VirtualFilePointerManager;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

public abstract class BaseDirectoryIndexExcludePolicy implements DirectoryIndexExcludePolicy {
  private Project myProject;

  protected BaseDirectoryIndexExcludePolicy(@NotNull Project project) {
    myProject = project;
  }

  protected Project getProject() {
    return myProject;
  }

  @NotNull
  protected abstract Set<VirtualFile> getAllExcludeRoots();

  public boolean isExcludeRoot(VirtualFile file) {
    return getAllExcludeRoots().contains(file);
  }

  public boolean isExcludeRootForModule(Module module, VirtualFile file) {
    return getAllExcludeRoots().contains(file);
  }

  public VirtualFile[] getExcludeRootsForProject() {
    if (myProject.isDisposed()) {
      return VirtualFile.EMPTY_ARRAY;
    }
    final Collection<VirtualFile> roots = getAllExcludeRoots();
    return roots.toArray(new VirtualFile[roots.size()]);
  }

  public VirtualFilePointer[] getExcludeRootsForModule(ModuleRootModel rootModel) {
    Set<VirtualFile> roots = getAllExcludeRoots();
    ArrayList<VirtualFilePointer> filePointers = new ArrayList<VirtualFilePointer>();
    for (VirtualFile root : roots) {
      filePointers.add(VirtualFilePointerManager.getInstance().create(root, myProject, null));
    }
    return filePointers.toArray(new VirtualFilePointer[filePointers.size()]);
  }
}
