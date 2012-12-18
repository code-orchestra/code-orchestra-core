/*
 * Copyright 2000-2009 JetBrains s.r.o.
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

package jetbrains.mps;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.vcs.changes.patch.PatchBaseDirectoryDetector;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.psi.search.FilenameIndex;
import com.intellij.psi.search.GlobalSearchScope;
import jetbrains.mps.util.annotation.Patch;
import org.jetbrains.annotations.Nullable;

import java.util.Collection;

//copied from PsiPatchBaseDirectoryDetector, except that allScope is used instead of projectScope
public class MPSPatchBaseDirectoryDetector extends PatchBaseDirectoryDetector {
  private final Project myProject;

  public MPSPatchBaseDirectoryDetector(final Project project) {
    myProject = project;
  }

  @Nullable
  public Result detectBaseDirectory(final String patchFileName) {
    String[] nameComponents = patchFileName.split("/");
    String patchName = nameComponents[nameComponents.length - 1];
    if (patchName.length() == 0) {
      return null;
    }
    // MPS Patch Start
    final Collection<VirtualFile> vfiles = FilenameIndex.getVirtualFilesByName(myProject, patchName, GlobalSearchScope.allScope(myProject));
    // MPS Patch End
    if (vfiles.size() == 1) {
      VirtualFile parent = vfiles.iterator().next().getParent();
      for (int i = nameComponents.length - 2; i >= 0; i--) {
        if (!parent.getName().equals(nameComponents[i]) || parent == myProject.getBaseDir()) {
          return new Result(parent.getPresentableUrl(), i + 1);
        }
        parent = parent.getParent();
      }
      if (parent == null) return null;
      return new Result(parent.getPresentableUrl(), 0);
    }
    return null;
  }

  public Collection<VirtualFile> findFiles(final String fileName) {
    // MPS Patch Start
    return FilenameIndex.getVirtualFilesByName(myProject, fileName, GlobalSearchScope.allScope(myProject));
    // MPS Patch End
  }
}
