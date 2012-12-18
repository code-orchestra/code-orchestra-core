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
package jetbrains.mps.project;

import com.intellij.openapi.progress.EmptyProgressIndicator;
import jetbrains.mps.library.ModulesMiner.ModuleHandle;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.persistence.LibraryDescriptorPersistence;
import jetbrains.mps.project.structure.modules.LibraryDescriptor;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.runtime.BytecodeLocator;
import jetbrains.mps.smodel.MPSModuleOwner;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.vfs.IFile;

import java.util.UUID;

public class Library extends AbstractModule {
  private static final Logger LOG = Logger.getLogger(Solution.class);

  private LibraryDescriptor myDescriptor;

  // -------------------------------------------------------------------

  private Library() {

  }

  public static Library createLibrary(String namespace, IFile descriptorFile, MPSModuleOwner moduleOwner) {
    Library lib = new Library();
    LibraryDescriptor descriptor;
    if (descriptorFile.exists()) {
      descriptor = LibraryDescriptorPersistence.loadLibraryDescriptor(descriptorFile);
      if (descriptor.getUUID() == null) {
        descriptor.setUUID(UUID.randomUUID().toString());
        LibraryDescriptorPersistence.saveLibraryDescriptor(descriptorFile,descriptor);
      }
    } else {
      descriptor = createNewDescriptor(namespace, descriptorFile);
    }
    lib.myDescriptorFile = descriptorFile;

    MPSModuleRepository repository = MPSModuleRepository.getInstance();
    if (repository.existsModule(descriptor.getModuleReference())) {
      LOG.error("Loading module " + descriptor.getNamespace() + " for the second time");
      return repository.getLibrary(descriptor.getModuleReference());
    }

    lib.setLibraryDescriptor(descriptor, false);
    repository.addModule(lib, moduleOwner);

    return lib;
  }

  private static LibraryDescriptor createNewDescriptor(String namespace, IFile descriptorFile) {
    LibraryDescriptor descriptor = new LibraryDescriptor();
    descriptor.setNamespace(namespace);
    descriptor.setUUID(UUID.randomUUID().toString());
    return descriptor;
  }

  //this is for stubs framework only

  public static Library newInstance(LibraryDescriptor descriptor, MPSModuleOwner moduleOwner) {
    Library lib = new Library();

    MPSModuleRepository repository = MPSModuleRepository.getInstance();
    if (repository.existsModule(descriptor.getModuleReference())) {
      LOG.error("Loading module " + descriptor.getNamespace() + " for the second time");
      return repository.getLibrary(descriptor.getModuleReference());
    }

    lib.setLibraryDescriptor(descriptor, false);
    repository.addModule(lib, moduleOwner);

    return lib;
  }

  @Deprecated
  public static Library newInstance(IFile descriptorFile, MPSModuleOwner moduleOwner) {
    return newInstance(new ModuleHandle(descriptorFile, null), moduleOwner);
  }

  public static Library newInstance(ModuleHandle handle, MPSModuleOwner moduleOwner) {
    Library solution = new Library();
    LibraryDescriptor descriptor;
    if (handle.getDescriptor() != null) {
      descriptor = (LibraryDescriptor) handle.getDescriptor();
      if (descriptor.getUUID() == null) {
        descriptor.setUUID(UUID.randomUUID().toString());
        LibraryDescriptorPersistence.saveLibraryDescriptor(handle.getFile(), descriptor);
      }
    } else {
      descriptor = new LibraryDescriptor();
      descriptor.setUUID(UUID.randomUUID().toString());
    }
    solution.myDescriptorFile = handle.getFile();

    MPSModuleRepository repository = MPSModuleRepository.getInstance();
    if (repository.existsModule(descriptor.getModuleReference())) {
      LOG.error("Loading module " + descriptor.getNamespace() + " for the second time");
      return repository.getLibrary(descriptor.getModuleReference());
    }

    solution.setLibraryDescriptor(descriptor, false);
    repository.addModule(solution, moduleOwner);

    return solution;
  }

  protected void readModels() {
    if (!isInitialized()) {
      super.readModels();

      if (isInitialized()) {
        fireModuleInitialized();
      }
    }
  }

  public LibraryDescriptor getModuleDescriptor() {
    return myDescriptor;
  }

  public void setModuleDescriptor(ModuleDescriptor moduleDescriptor, boolean reloadClasses) {
    setLibraryDescriptor((LibraryDescriptor) moduleDescriptor, reloadClasses);
  }

  public void setLibraryDescriptor(LibraryDescriptor newDescriptor, boolean reloadClasses) {
    myDescriptor = newDescriptor;

    ModuleReference mp;
    if (myDescriptor.getNamespace() != null) {
      mp = new ModuleReference(myDescriptor.getNamespace(), myDescriptor.getUUID());
    } else {
      assert myDescriptorFile != null;
      mp = new ModuleReference(myDescriptorFile.getPath(), myDescriptor.getUUID());
    }

    setModuleReference(mp);

    reloadAfterDescriptorChange();

    MPSModuleRepository.getInstance().fireModuleChanged(this);

    if (reloadClasses) {
      ClassLoaderManager.getInstance().reloadAll(new EmptyProgressIndicator());
    }

    invalidateDependencies();
  }

  public void dispose() {
    super.dispose();
    SModelRepository.getInstance().unRegisterModelDescriptors(this);
  }

  public void save() {
    LibraryDescriptorPersistence.saveLibraryDescriptor(myDescriptorFile, getModuleDescriptor());
  }

  public String toString() {
    String namespace = myDescriptor.getNamespace();
    if (namespace != null && namespace.length() != 0) return namespace;
    assert myDescriptorFile != null;
    namespace = myDescriptorFile.getName();
    return namespace;
  }

  protected LibraryDescriptor loadDescriptor() {
    IFile file = getDescriptorFile();
    assert file != null;
    return LibraryDescriptorPersistence.loadLibraryDescriptor(file);
  }

  public BytecodeLocator getBytecodeLocator() {
    return new ModuleBytecodeLocator() {
      public byte[] find(String fqName) {
        return super.find(fqName);
      }
    };
  }
}