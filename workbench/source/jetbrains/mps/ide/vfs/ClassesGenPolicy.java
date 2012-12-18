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

import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import java.util.HashSet;
import java.util.Set;

public class ClassesGenPolicy extends BaseDirectoryIndexExcludePolicy {
  protected ClassesGenPolicy(@NotNull Project project) {
    super(project);
  }

  @NotNull
  protected Set<VirtualFile> getAllExcludeRoots() {
    final Set<VirtualFile> roots = new HashSet<VirtualFile>();

    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        for (IModule module : MPSModuleRepository.getInstance().getAllModules()) {
          IFile classesGen = module.getClassesGen();
          if (classesGen == null) continue;

          //todo this trash should be removed after reconsidering language packaging. see MPS-11757 for details
          if (classesGen.getName().endsWith("." + MPSExtentions.MPS_ARCH)) continue;

          VirtualFile classesGenVF = VirtualFileUtils.getVirtualFile(classesGen);
          if (classesGenVF != null) {
            roots.add(classesGenVF);
          }
        }
      }
    });
    return roots;
  }
}
