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

import jetbrains.mps.cleanup.CleanupManager;
import jetbrains.mps.library.contributor.LibraryContributor;
import jetbrains.mps.project.IModule;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.language.LanguageRegistry;
import jetbrains.mps.util.PathManager;
import jetbrains.mps.vfs.FileSystem;

import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;

public class LibraryInitializer {
  private Set<String> myLoadedLibs = new HashSet<String>();
  private Map<String, MPSModuleOwner> myLibsToOwners = new HashMap<String, MPSModuleOwner>();

  private MPSModuleRepository myRepo = MPSModuleRepository.getInstance();
  private ClassLoaderManager myCLM = ClassLoaderManager.getInstance();

  private boolean myFirstLoad = true;

  public void update() {
    update(false);
  }

  public void update(boolean refreshFiles) {
    Set<String> newLibs = new HashSet<String>();

    for (LibraryContributor lc : myContributors) {
      for (String s : lc.getLibraries()) {
        newLibs.add(s);
      }
    }

    reload(myLoadedLibs, newLibs, refreshFiles);

    myLoadedLibs = newLibs;
  }

  private void reload(Set<String> loadedLibs, Set<String> newLibs, boolean refreshFiles) {
    ModelAccess.assertLegalWrite();

    //unload
    HashSet<String> toUnload = new HashSet<String>(loadedLibs);
    toUnload.removeAll(newLibs);
    for (String unloadLib : toUnload) {
      myRepo.unRegisterModules(myLibsToOwners.remove(unloadLib));
    }

    //load new
    HashSet<String> toLoad = new HashSet<String>(newLibs);
    toUnload.removeAll(loadedLibs);
    for (String loadLib : toLoad) {
      MPSModuleOwner owner = new MPSModuleOwner() {
      };
      myLibsToOwners.put(loadLib, owner);
      ModulesMiner.getInstance().readModuleDescriptors(FileSystem.getInstance().getFileByPath(loadLib), owner, refreshFiles);
      fireOnLoad(owner);
    }

    CleanupManager.getInstance().cleanup();
    ClassLoaderManager.getInstance().updateClassPath();

    if (myFirstLoad) {
      myFirstLoad = false;
      myCLM.init();
      LanguageRegistry.getInstance().init();
    }
  }

  protected void fireOnLoad(final MPSModuleOwner owner) {
    for (IModule m : myRepo.getModules(owner)) {
      m.onModuleLoad();
    }
  }

  //----------bootstrap modules

  public Collection<IModule> getModules(String path) {
    return myRepo.getModules(myLibsToOwners.get(path));
  }

  public <M extends IModule> Set<M> getBootstrapModules(Class<M> cls) {
    List<M> result = new ArrayList<M>();
    result.addAll(myRepo.getModules(myLibsToOwners.get(PathManager.getBootstrapPath()), cls));
    result.addAll(myRepo.getModules(myLibsToOwners.get(PathManager.getLanguagesPath()), cls));

    addGenerators(cls, result);

    return new HashSet<M>(result);
  }

  public <M extends IModule> void addGenerators(Class<M> cls, Collection<M> result) {
    for (M m : new ArrayList<M>(result)) {
      if (m instanceof Language) {
        if (cls == null || cls.isAssignableFrom(Generator.class)) {
          result.addAll((List<? extends M>) ((Language) m).getGenerators());
        }
      }
    }
  }


  //----------singleton

  private static LibraryInitializer ourInstance = new LibraryInitializer();

  public static LibraryInitializer getInstance() {
    return ourInstance;
  }

  private LibraryInitializer() {

  }

  //----------ext point

  private List<LibraryContributor> myContributors = new CopyOnWriteArrayList<LibraryContributor>();

  public void addContributor(LibraryContributor c) {
    myContributors.add(c);
  }

  public void removeContributor(LibraryContributor c) {
    myContributors.remove(c);
  }
}
