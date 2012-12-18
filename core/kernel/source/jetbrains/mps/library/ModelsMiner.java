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
package jetbrains.mps.library;

import com.intellij.openapi.fileTypes.FileTypeManager;
import codeOrchestra.rgs.server.util.ProjectReloadUtil;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.SModelRoot;
import jetbrains.mps.smodel.SModelId;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.persistence.def.DescriptorLoadResult;
import jetbrains.mps.smodel.persistence.def.ModelPersistence;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.vfs.IFileUtils;

import java.io.File;
import java.util.Collection;
import java.util.List;

/**
 * evgeny, 3/18/11
 */
public class ModelsMiner {

  @CodeOrchestraPatch
  public static void collectModelDescriptors(IFile dir, SModelRoot modelRoot, Collection<ModelHandle> models) {
    if (FileTypeManager.getInstance().isFileIgnored(dir.getName())) return;
    if (!dir.isDirectory()) return;

    List<IFile> files = dir.getChildren();
    for (IFile file : files) {
      String fileName = file.getName();
      boolean isMPSModel = fileName.endsWith(MPSExtentions.DOT_MODEL);
      if (!(isMPSModel)) continue;

      DescriptorLoadResult dr = ModelPersistence.loadDescriptor(file);

      // RE-4651
      if (dr.getHeader().getPersistenceVersion() == -1) {
        ProjectReloadUtil.refreshVfs(file);
        dr = ModelPersistence.loadDescriptor(file);
      }

      SModelReference modelReference;
      if (dr.getUID() != null) {
        modelReference = SModelReference.fromString(dr.getUID());
      } else {
        modelReference = createModelReference(file, FileSystem.getInstance().getFileByPath(modelRoot.getPath()), modelRoot.getPrefix());
      }


      //this code is for migration from old models (with no IDS)
      if (modelReference.getSModelId() == null) {
        modelReference = new SModelReference(modelReference.getSModelFqName(), SModelId.generate());
      }

      models.add(new ModelHandle(file, modelReference, dr));
    }
    for (IFile childDir : files) {
      if (childDir.isDirectory()) {
        collectModelDescriptors(childDir, modelRoot, models);
      }
    }
  }

  private static SModelReference createModelReference(IFile modelFile, IFile root, String namespacePrefix) {
    String rawLongName = getModelReferenceString(modelFile, root, namespacePrefix);
    return SModelReference.fromString(rawLongName);
  }

  private static String getModelReferenceString(IFile modelFile, IFile root, String namespacePrefix) {
    String longName = cropModelPath(modelFile, root);
    if (longName == null) return null;

    String namespace = NameUtil.namespaceFromLongName(longName);
    namespace = NameUtil.namespaceFromPath(namespace);

    if (namespacePrefix != null && namespacePrefix.length() > 0) {
      namespace = namespacePrefix + ((namespace.length() > 0) ? "." + namespace : "");
    }
    return namespace;
  }

  private static String cropModelPath(IFile modelFile, IFile root) {
    String modelPath = IFileUtils.getCanonicalPath(modelFile);
    String rootPath = IFileUtils.getCanonicalPath(root);
    if (!modelPath.startsWith(rootPath)) return null;

    int length = rootPath.length();
    if (rootPath.endsWith(File.separator) || rootPath.endsWith("!")) {
      length--;
    }
    return modelPath.substring(length + 1);
  }

  public static class ModelHandle {
    private IFile file;
    private SModelReference reference;
    private DescriptorLoadResult loadResult;

    public ModelHandle(IFile file, SModelReference reference, DescriptorLoadResult loadResult) {
      this.file = file;
      this.reference = reference;
      this.loadResult = loadResult;
    }

    public IFile getFile() {
      return file;
    }

    public SModelReference getReference() {
      return reference;
    }

    public DescriptorLoadResult getLoadResult() {
      return loadResult;
    }
  }
}
