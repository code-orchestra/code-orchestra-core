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
package jetbrains.mps.smodel;

import jetbrains.mps.project.IModule;
import jetbrains.mps.project.SModelRoot;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.vfs.IFileUtils;

import java.util.HashSet;
import java.util.Set;

public class ModelRootUtil {
  public static SModelRoot getSModelRoot(SModelDescriptor model) {
    Set<SModelRoot> roots = findAllModelRoots(model);
    if (roots.isEmpty()) return null;
    return roots.iterator().next();
  }

  //finds all model roots from which the model could be loaded, regardless of prefix
  public static Set<SModelRoot> findAllModelRoots(SModelDescriptor model) {
    Set<SModelRoot> result = new HashSet<SModelRoot>();

    if (!(model instanceof EditableSModelDescriptor)) return result;
    IFile modelFile = ((EditableSModelDescriptor) model).getModelFile();
    if (modelFile == null) return result;

    IModule module = model.getModule();
    for (SModelRoot modelRoot : module.getSModelRoots()) {
      String modelCanonicalPath = IFileUtils.getCanonicalPath(modelFile);
      String rootCanonicalPath = FileUtil.getCanonicalPath(modelRoot.getPath());

      if (modelCanonicalPath.startsWith(rootCanonicalPath)) {
        result.add(modelRoot);
      }
    }
    return result;
  }
}
