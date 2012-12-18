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
package jetbrains.mps.vcs;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.vcs.ProjectLevelVcsManager;
import com.intellij.openapi.vcs.VcsRoot;
import com.intellij.openapi.vcs.changes.DirtBuilder;
import com.intellij.openapi.vcs.changes.VcsGuess;
import com.intellij.openapi.vcs.impl.BasicDefaultVcsRootPolicy;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.platform.ProjectBaseDirectory;

public class ExtendedDefaultVcsRootPolicy extends BasicDefaultVcsRootPolicy {
  private Project myProject;

  public ExtendedDefaultVcsRootPolicy(Project project) {
    super(project);
    myProject = project;
  }

  @Override
  public void markDefaultRootsDirty(DirtBuilder builder, final VcsGuess vcsGuess) {
    super.markDefaultRootsDirty(builder, vcsGuess);

    ProjectLevelVcsManager manager = ProjectLevelVcsManager.getInstance(myProject);
    VcsRoot[] roots = manager.getAllVcsRoots();

    for (VcsRoot root : roots) {
      builder.addDirtyDirRecursively(root);
    }
  }

  @Override
  public boolean matchesDefaultMapping(VirtualFile file, Object matchContext) {
    if (ProjectBaseDirectory.getInstance(myProject).getBaseDir() == null) {
      return false;
    }
    return super.matchesDefaultMapping(file, matchContext);
  }
}
