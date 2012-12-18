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
package jetbrains.mps.ide.findusages.caches;

import com.intellij.openapi.fileTypes.FileTypeManager;
import com.intellij.openapi.roots.ex.ProjectRootManagerEx;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.ide.vfs.VirtualFileUtils;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.SModelRoot;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;

import java.util.HashSet;
import java.util.Set;

class CacheUtil {
  static Set<VirtualFile> getIndexableRoots() {
    final Set<VirtualFile> files = new HashSet<VirtualFile>();

    for (IModule m : MPSModuleRepository.getInstance().getAllModules()) {
      for (final SModelRoot root : m.getSModelRoots()) {
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            VirtualFile file = VirtualFileUtils.getVirtualFile(root.getPath());
            if (file != null) { //i.e. files doesn't exist
              files.add(file);
            }
          }
        });
      }
    }

    return files;
  }

  public static boolean checkFile(VirtualFile file,ProjectRootManagerEx manager) {
    if (FileTypeManager.getInstance().isFileIgnored(file.getName())) return false;
    if (manager.getFileIndex().isIgnored(file)) return false;
    return true;
  }
}
