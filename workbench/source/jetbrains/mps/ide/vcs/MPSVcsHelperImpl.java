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
package jetbrains.mps.ide.vcs;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.vcs.impl.AbstractVcsHelperImpl;
import com.intellij.openapi.vcs.merge.MergeProvider;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.ide.vfs.VirtualFileUtils;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.vcs.VcsMigrationUtil;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MPSVcsHelperImpl extends AbstractVcsHelperImpl {
  private Project myProject;

  public MPSVcsHelperImpl(Project project) {
    super(project);
    myProject = project;
  }

  @NotNull
  public List<VirtualFile> showMergeDialog(List<VirtualFile> files, final MergeProvider provider) {
    if (files.isEmpty()) return Collections.emptyList();
    MergeProvider providerDecorator = new MergeProviderDecorator(myProject, provider);

    // recheck files status
    List<VirtualFile> toMerge = new ArrayList<VirtualFile>();
    List<VirtualFile> alreadyResolved = new ArrayList<VirtualFile>();
    for (VirtualFile f : files) {
      if (VcsMigrationUtil.getHandler().isInConflict(VirtualFileUtils.toIFile(f), false)) {
        toMerge.add(f);
      } else {
        alreadyResolved.add(f);
      }
    }
    if (toMerge.isEmpty()) return alreadyResolved;

    List<VirtualFile> userResolved = super.showMergeDialog(files, providerDecorator);
    return CollectionUtil.union(userResolved, alreadyResolved);
  }
}
