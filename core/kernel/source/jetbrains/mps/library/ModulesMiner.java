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
import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.*;
import jetbrains.mps.project.persistence.DeploymentDescriptorPersistence;
import jetbrains.mps.project.persistence.DevkitDescriptorPersistence;
import jetbrains.mps.project.persistence.LanguageDescriptorPersistence;
import jetbrains.mps.project.persistence.SolutionDescriptorPersistence;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.model.RootReference;
import jetbrains.mps.project.structure.modules.DeploymentDescriptor;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleOwner;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.*;

/**
 * Detects modules in a folder. Loads them into MPSModuleRepository
 */
public class ModulesMiner {

  private static final Logger LOG = Logger.getLogger(ModulesMiner.class);
  private static final ModulesMiner INSTANCE = new ModulesMiner();
  public static final String META_INF_MODULE_XML = "!/META-INF/module.xml";

  public static ModulesMiner getInstance() {
    return INSTANCE;
  }

  private Map<String, Class<? extends IModule>> myExtensionsToModuleTypes = new LinkedHashMap<String, Class<? extends IModule>>();

  private ModulesMiner() {
    initializeExtensionsToModuleTypesMap();
  }

  private void initializeExtensionsToModuleTypesMap() {
    myExtensionsToModuleTypes.put(MPSExtentions.LANGUAGE, Language.class);
    myExtensionsToModuleTypes.put(MPSExtentions.SOLUTION, Solution.class);
    myExtensionsToModuleTypes.put(MPSExtentions.DEVKIT, DevKit.class);
  }

  public Set<String> getModuleExtensions() {
    return new HashSet<String>(myExtensionsToModuleTypes.keySet());
  }

  public void readModuleDescriptors(Iterator<? extends RootReference> roots, MPSModuleOwner owner) {
    assertCanWrite();

    while (roots.hasNext()) {
      RootReference root = roots.next();
      IFile moduleRoot = FileSystem.getInstance().getFileByPath(root.getPath());

      if (moduleRoot.exists()) {
        readModuleDescriptors(moduleRoot, owner);
      } else {
        String error = "Couldn't load modules from " + moduleRoot.getPath() + " for owner " + owner +
          "\nDirectory doesn't exist: ";
        LOG.error(error);
      }
    }
  }

  public List<IModule> readModuleDescriptors(IFile dir, MPSModuleOwner owner) {
    return readModuleDescriptors(dir, owner, false);
  }

  public List<IModule> readModuleDescriptors(IFile dir, final MPSModuleOwner owner, boolean refreshFiles) {
    assertCanWrite();

    List<IModule> result = new ArrayList<IModule>();
    readModuleDescriptors(dir, new HashSet<IFile>(), result, refreshFiles, new DescriptorReader<IModule>() {
      @Override
      public IModule read(ModuleHandle handle) {
        return MPSModuleRepository.getInstance().registerModule(handle, owner);
      }
    });
    return result;
  }

  public List<ModuleHandle> collectModules(IFile dir, boolean refreshFiles) {
    List<ModuleHandle> result = new ArrayList<ModuleHandle>();
    readModuleDescriptors(dir, new HashSet<IFile>(), result, refreshFiles, new DescriptorReader<ModuleHandle>() {
      @Override
      public ModuleHandle read(ModuleHandle handle) {
        return handle;
      }
    });
    return result;
  }

  @CodeOrchestraPatch
  private <T> void readModuleDescriptors(IFile dir, Set<IFile> excludes, List<T> result, boolean refreshFiles, DescriptorReader<T> reader) {
    if (refreshFiles) {
      FileSystem.getInstance().refresh(dir);
    }

    String dirName = dir.getName();

    if (FileTypeManager.getInstance().isFileIgnored(dirName)) return;

    List<IFile> files = dir.getChildren();
    if (files == null) {
      return;
    }

    for (IFile file : files) {
      if (hasModuleExtension(file.getName())) {
        ModuleDescriptor moduleDescriptor = loadDescriptorOnly_internal(file, excludes);
        if (moduleDescriptor != null) {
          T descriptor = reader.read(new ModuleHandle(file, moduleDescriptor));
          if (descriptor != null) {
            result.add(descriptor);
          }
        }
      }
    }

    for (IFile childDir : files) {
      if (FileTypeManager.getInstance().isFileIgnored(childDir.getName())) continue;
      if (hasModuleExtension(childDir.getName())) continue;
      if (excludes.contains(childDir)) continue;

      // RF-743
      if (childDir.getName().endsWith(MPSExtentions.MPS_ARCH)) {
        IFile dirInJar = FileSystem.getInstance().getFileByPath(childDir.getAbsolutePath() + "!/" + AbstractModule.MODULE_DIR);
        readModuleDescriptors(dirInJar, excludes, result, refreshFiles, reader);
        continue;
      }

      if (childDir.getName().endsWith(".jar")) {
        IFile moduleFile = FileSystem.getInstance().getFileByPath(childDir.getPath() + META_INF_MODULE_XML);
        // a way to load all modules packed into /modules folder inside mps.jar/plugin jars
        IFile dirInJar = FileSystem.getInstance().getFileByPath(childDir.getPath() + "!/modules");
        if (moduleFile.exists()) {
          ModuleDescriptor moduleDescriptor = loadModuleDescriptor(moduleFile);
          if (moduleDescriptor != null) {
            T descriptor = reader.read(new ModuleHandle(moduleFile, moduleDescriptor));
            if (descriptor != null) {
              result.add(descriptor);
            }
          }
        } else if (dirInJar.exists()) {
          readModuleDescriptors(dirInJar, excludes, result, refreshFiles, reader);
        }
      }

      readModuleDescriptors(childDir, excludes, result, refreshFiles, reader);
    }
  }

  public ModuleDescriptor loadModuleDescriptor(IFile file) {
    try {
      String filePath = file.getPath();
      if (filePath.endsWith(META_INF_MODULE_XML)) {
        DeploymentDescriptor deploymentDescriptor = DeploymentDescriptorPersistence.loadDeploymentDescriptor(file);
        ModuleDescriptor result = null;
        IFile realDescriptorFile = getRealDescriptorFile(filePath, deploymentDescriptor);
        if (realDescriptorFile != null) {
          result = loadModuleDescriptor(realDescriptorFile);
        }
        // TODO create module without sources
        if (result != null) {
          result.setDeploymentDescriptor(deploymentDescriptor);
          // TODO fix stubs
        }
        return result;
      } else {

        String extension = getModuleExtension(file.getName());
        Class<? extends IModule> cls = myExtensionsToModuleTypes.get(extension);
        if (cls == Language.class) {
          return LanguageDescriptorPersistence.loadLanguageDescriptor(file);
        } else if (cls == Solution.class) {
          return SolutionDescriptorPersistence.loadSolutionDescriptor(file);
        } else {
          return DevkitDescriptorPersistence.loadDevKitDescriptor(file);
        }
      }
    } catch (Exception t) {
      LOG.error("Fail to load module from descriptor " + file.getPath(), t);
      return null;
    }
  }

  private ModuleDescriptor loadDescriptorOnly_internal(IFile descriptorFile, Set<IFile> excludes) {
    try {
      ModuleDescriptor descriptor = loadModuleDescriptor(descriptorFile);
      if (descriptor != null) {
        processExcludes(descriptorFile, descriptor, excludes);
      }
      return descriptor;
    } catch (Exception t) {
      LOG.error("Fail to load module from descriptor " + descriptorFile.getPath(), t);
    }
    return null;
  }

  private void processExcludes(@NotNull IFile descriptorFile, ModuleDescriptor descriptor, Set<IFile> excludes) {
    if (descriptor == null) {
      return;
    }

    for (String p : descriptor.getSourcePaths()) {
      excludes.add(FileSystem.getInstance().getFileByPath(p));
    }

    IFile genPath = ProjectPathUtil.getGeneratorOutputPath(descriptorFile, descriptor);
    if (genPath != null) {
      excludes.add(genPath);
      if (!descriptorFile.isReadOnly()) {
        FileSystem.getInstance().getFileByPath(FileGenerationUtil.getCachesPath(genPath.getPath()));
      }
    }

    IFile testsGenPath = ProjectPathUtil.getGeneratorTestsOutputPath(descriptorFile, descriptor);
    if (testsGenPath != null) {
      excludes.add(genPath);
      if (!descriptorFile.isReadOnly()) {
        FileSystem.getInstance().getFileByPath(FileGenerationUtil.getCachesPath(testsGenPath.getPath()));
      }
    }

    for (jetbrains.mps.project.structure.model.ModelRoot root : descriptor.getModelRoots()) {
      excludes.add(FileSystem.getInstance().getFileByPath(root.getPath()));
    }

    IFile classesGen = ProjectPathUtil.getClassesGenFolder(descriptorFile);
    if (classesGen != null) {
      excludes.add(classesGen);
    }

    for (ModelRoot entry : descriptor.getStubModelEntries()) {
      excludes.add(FileSystem.getInstance().getFileByPath(entry.getPath()));
    }
  }

  private boolean hasModuleExtension(String name) {
    return getModuleExtension(name) != null;
  }

  private String getModuleExtension(String name) {
    if (name.endsWith(MPSExtentions.DOT_LANGUAGE)) return MPSExtentions.LANGUAGE;
    if (name.endsWith(MPSExtentions.DOT_SOLUTION)) return MPSExtentions.SOLUTION;
    if (name.endsWith(MPSExtentions.DOT_DEVKIT)) return MPSExtentions.DEVKIT;
    return null;
  }

  private void assertCanWrite() {
    if (!ModelAccess.instance().canWrite()) {
      throw new IllegalStateException("Can't write");
    }
  }

  private static interface DescriptorReader<T> {
    T read(ModuleHandle module);
  }

  public static class ModuleHandle {
    private IFile file;
    private ModuleDescriptor descriptor;

    public ModuleHandle(IFile file, ModuleDescriptor descriptor) {
      this.file = file;
      this.descriptor = descriptor;
    }

    public IFile getFile() {
      return file;
    }

    public ModuleDescriptor getDescriptor() {
      return descriptor;
    }
  }

  @Nullable
  public static IFile getRealDescriptorFile(String filePath, DeploymentDescriptor deploymentDescriptor) {
    if (deploymentDescriptor.getSourcesJar() != null) {
      IFile moduleJar = FileSystem.getInstance().getFileByPath(filePath.substring(0, filePath.length() - META_INF_MODULE_XML.length()));
      IFile sourcesJar = moduleJar.getParent().getDescendant(deploymentDescriptor.getSourcesJar());
      if (sourcesJar.exists() && deploymentDescriptor.getDescriptorFile() != null) {
        return FileSystem.getInstance().getFileByPath(sourcesJar.getPath() + "!/module/" + deploymentDescriptor.getDescriptorFile());
      }
    }
    return null;
  }

  @Nullable
  public static IFile getRealDescriptorFile(IModule module) {
    if (module.getDescriptorFile() != null && module.getModuleDescriptor() != null && module.getModuleDescriptor().getDeploymentDescriptor() != null) {
      return getRealDescriptorFile(module.getDescriptorFile().getPath(), module.getModuleDescriptor().getDeploymentDescriptor());
    }
    return null;
  }

}
