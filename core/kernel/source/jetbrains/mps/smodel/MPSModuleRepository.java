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

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.library.ModulesMiner;
import jetbrains.mps.library.ModulesMiner.ModuleHandle;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.*;
import jetbrains.mps.project.structure.modules.*;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.ManyToManyMap;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.vfs.IFileUtils;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

public class MPSModuleRepository implements ApplicationComponent {
  private static final Logger LOG = Logger.getLogger(MPSModuleRepository.class);

  private static MPSModuleRepository ourInstance = null;

  public static MPSModuleRepository getInstance() {
    if (ourInstance == null) {
      ourInstance = ApplicationManager.getApplication().getComponent(MPSModuleRepository.class);
    }
    return ourInstance;
  }

  private Map<String, IModule> myCanonicalFileToModuleMap = new ConcurrentHashMap<String, IModule>();
  private Map<String, IModule> myFqNameToModulesMap = new ConcurrentHashMap<String, IModule>();
  private Map<ModuleId, IModule> myIdToModuleMap = new ConcurrentHashMap<ModuleId, IModule>();

  private Set<IModule> myModules = new LinkedHashSet<IModule>();

  private ManyToManyMap<IModule, MPSModuleOwner> myModuleToOwners = new ManyToManyMap<IModule, MPSModuleOwner>();

  private List<ModuleRepositoryListener> myModuleListeners = new CopyOnWriteArrayList<ModuleRepositoryListener>();

  private boolean myDirtyFlag = false;

  public MPSModuleRepository() {
  }

  public void initComponent() {
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "MPS Module Repository";
  }

  public void disposeComponent() {

  }

  public void invalidateCaches() {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        for (Project p : ProjectManager.getInstance().getOpenProjects()) {
          p.getComponent(ProjectScope.class).invalidateCaches();
        }

        for (IModule m : getAllModules()) {
          m.invalidateCaches();
        }
        SModelUtil.clearCaches();
      }
    });
  }

  public boolean isKnownModule(IModule m) {
    return myModules.contains(m);
  }

  public boolean existsModule(ModuleReference ref) {
    return getModule(ref) != null;
  }

  public boolean existsModule(IModule module, MPSModuleOwner owner) {
    assertCanRead();

    return myModuleToOwners.contains(module, owner);
  }

  public Set<MPSModuleOwner> getOwners(IModule module) {
    assertCanRead();

    return myModuleToOwners.getByFirst(module);
  }

  public IModule getModuleByFile(IFile file) {
    assertCanRead();

    return myCanonicalFileToModuleMap.get(IFileUtils.getCanonicalPath(file));
  }

  //todo rename to getByFqName
  public IModule getModuleByUID(String moduleUID) {
    return myFqNameToModulesMap.get(moduleUID);
  }

  public IModule getModuleById(ModuleId moduleId) {
    assertCanRead();

    if (moduleId == null) return null;
    return myIdToModuleMap.get(moduleId);
  }

  public void moduleFqNameChanged(IModule module, String oldName) {
    ModelAccess.assertLegalWrite();

    if (myFqNameToModulesMap.get(oldName) != module || myFqNameToModulesMap.containsKey(module.getModuleFqName())) {
      throw new IllegalStateException();
    }
    myFqNameToModulesMap.remove(oldName);
    myFqNameToModulesMap.put(module.getModuleFqName(), module);
  }

  public IModule getModule(@NotNull ModuleReference ref) {
    if (ref.getModuleId() != null) {
      return myIdToModuleMap.get(ref.getModuleId());
    }
    return myFqNameToModulesMap.get(ref.getModuleFqName());
  }

  @Deprecated
  public <TM extends IModule> TM registerModule(IFile file, MPSModuleOwner owner, Class<TM> cls) {
    ModuleDescriptor moduleDescriptor = ModulesMiner.getInstance().loadModuleDescriptor(file);
    if(moduleDescriptor == null) {
      throw new IllegalArgumentException("Unknown module " + file.getName());
    }
    return this.<TM>registerModule(new ModuleHandle(file, moduleDescriptor), owner);
  }

  /*
   *   TODO merge with addModule
   */
  public <TM extends IModule> TM registerModule(ModuleHandle handle, MPSModuleOwner owner) {
    ModelAccess.assertLegalWrite();

    myDirtyFlag = true;
    String canonicalPath = IFileUtils.getCanonicalPath(handle.getFile());
    IModule module = myCanonicalFileToModuleMap.get(canonicalPath);
    if (module == null) {
      if (handle.getDescriptor() instanceof LanguageDescriptor) {
        module = Language.createLanguage(null, handle, owner);
      } else if (handle.getDescriptor() instanceof SolutionDescriptor) {
        module = Solution.newInstance(handle, owner);
      } else if (handle.getDescriptor() instanceof LibraryDescriptor) {
        module = Library.newInstance(handle, owner);
      } else if (handle.getDescriptor() instanceof DevkitDescriptor) {
        module = DevKit.newInstance(handle, owner);
      } else {
        throw new IllegalArgumentException("Unknown module " + handle.getFile().getName());
      }
    } else {
      if (owner == module) {
        LOG.warning("module " + module + " wants to owe itself: will be collected very quickly", module);
      }
      myModuleToOwners.addLink(module, owner);
      myModules.add(module);
    }
    invalidateCaches();
    fireModuleAdded(module);
    return (TM) module;
  }

  private void addCanonicalFile(@Nullable IFile file, IModule module) {
    if (file != null) {
      String canonicalDescriptorPath = IFileUtils.getCanonicalPath(file);
      if (canonicalDescriptorPath != null && !myCanonicalFileToModuleMap.containsKey(canonicalDescriptorPath)) {
        myCanonicalFileToModuleMap.put(canonicalDescriptorPath, module);
      }
    }
  }

  private void removeModuleFile(@Nullable IFile file) {
    if (file != null) {
      String canonicalPath = IFileUtils.getCanonicalPath(file);
      if (canonicalPath != null) {
        myCanonicalFileToModuleMap.remove(canonicalPath);
      }
    }
  }

  public void addModule(IModule module, MPSModuleOwner owner) {
    ModelAccess.assertLegalWrite();

    myDirtyFlag = true;
    if (existsModule(module, owner)) {
      throw new IllegalStateException("Couldn't add module \"" + module.getModuleFqName() + "\" : this module is already registered with this very owner: " + owner);
    }
    addCanonicalFile(module.getDescriptorFile(), module);
    addCanonicalFile(ModulesMiner.getRealDescriptorFile(module), module);

    String moduleFqName = module.getModuleFqName();

    if (myFqNameToModulesMap.containsKey(moduleFqName)) {
      IModule m = myFqNameToModulesMap.get(moduleFqName);
      LOG.error("duplicate module name " + moduleFqName + " : module with the same UID exists at " + m.getDescriptorFile() + " and " + module.getDescriptorFile(), m);
    }

    myFqNameToModulesMap.put(moduleFqName, module);

    ModuleId moduleId = module.getModuleReference().getModuleId();
    if (moduleId != null) {
      if (myIdToModuleMap.containsKey(moduleId)) {
        LOG.warning("duplicate module name " + module.getModuleReference() + " module with the same id already exists " + myIdToModuleMap.get(moduleId).getModuleReference());
      }

      myIdToModuleMap.put(module.getModuleReference().getModuleId(), module);
    }

    myModuleToOwners.addLink(module, owner);
    myModules.add(module);

    fireModuleAdded(module);
  }

  public void removeModule(IModule module) {
    ModelAccess.assertLegalWrite();

    if (!myModules.contains(module)) {
      return;
    }

    IFile descriptorFile = module.getDescriptorFile();

    myModuleToOwners.clearFirst(module);
    myModules.remove(module);
    myFqNameToModulesMap.remove(module.getModuleFqName());
    if (module.getModuleReference().getModuleId() != null) {
      myIdToModuleMap.remove(module.getModuleReference().getModuleId());
    }

    removeModuleFile(descriptorFile);
    removeModuleFile(ModulesMiner.getRealDescriptorFile(module));

    fireModuleRemoved(module);
  }

  public void unRegisterModules(MPSModuleOwner owner, Condition<IModule> condition) {
    ModelAccess.assertLegalWrite();

    myDirtyFlag = true;
    Set<IModule> modules = new HashSet<IModule>(myModuleToOwners.getBySecond(owner));
    for (IModule m : modules) {
      if (condition.met(m)) {
        myModuleToOwners.removeLink(m, owner);
      }
    }
    invalidateCaches();
    fireRepositoryChanged();
  }

  public void unRegisterModules(MPSModuleOwner owner) {
    ModelAccess.assertLegalWrite();

    myDirtyFlag = true;
    myModuleToOwners.clearSecond(owner);
    invalidateCaches();
    fireRepositoryChanged();
  }

  public void removeUnusedModules() {
    ModelAccess.assertLegalWrite();

    if (!myDirtyFlag) return;

    myDirtyFlag = false;
    for (IModule m : getModulesToBeRemoved()) {
      fireBeforeModuleRemoved(m);
      m.dispose();
      removeModule(m);
    }
    //todo: do the similar thing with module stubs
  }

  private Set<IModule> getModulesToBeRemoved() {
    Set<MPSModuleOwner> rootOwners = new HashSet<MPSModuleOwner>();
    for (IModule m : myModules) {
      for (MPSModuleOwner owner : myModuleToOwners.getByFirst(m)) {
        if (owner instanceof IModule) continue;
        rootOwners.add(owner);
      }
    }

    Set<IModule> visibleModules = new HashSet<IModule>(myModules.size());
    for (IModule m : myModules) {
      if (m instanceof Solution && ((Solution) m).isStub()) {
        visibleModules.add(m);
        continue;
      }

      for (MPSModuleOwner r : rootOwners) {
        if (myModuleToOwners.contains(m, r)) {
          visibleModules.add(m);
        }
      }
    }

    Set<IModule> toAdd;
    do {
      toAdd = new HashSet<IModule>();
      for (IModule m : myModules) {
        if (visibleModules.contains(m)) continue;
        for (IModule v : visibleModules) {
          if (!(v instanceof MPSModuleOwner)) continue;
          if (!myModuleToOwners.contains(m, (MPSModuleOwner) v)) continue;
          toAdd.add(m);
        }
      }
      visibleModules.addAll(toAdd);
    } while (!toAdd.isEmpty());

    Set<IModule> toBeRemoved = new HashSet<IModule>(myModules);
    toBeRemoved.removeAll(visibleModules);
    return toBeRemoved;
  }

  public Language getLanguage(String namespace) {
    return (Language) myFqNameToModulesMap.get(namespace);
  }

  public Language getLanguage(ModuleReference ref) {
    return (Language) getModule(ref);
  }

  public Library getLibrary(ModuleReference ref) {
    return (Library) getModule(ref);
  }

  public Generator getGenerator(ModuleReference ref) {
    return (Generator) getModule(ref);
  }

  public DevKit getDevKit(String namespace) {
    return (DevKit) myFqNameToModulesMap.get(namespace);
  }

  public DevKit getDevKit(ModuleReference ref) {
    return (DevKit) getModule(ref);
  }

  public Solution getSolution(String namespace) {
    return (Solution) myFqNameToModulesMap.get(namespace);
  }

  public Solution getSolution(ModuleReference ref) {
    return (Solution) getModule(ref);
  }

  public <MT extends IModule> List<MT> getModules(MPSModuleOwner moduleOwner, Class<MT> cls) {
    assertCanRead();

    List<MT> list = new LinkedList<MT>();
    Set<IModule> modules = myModuleToOwners.getBySecond(moduleOwner);
    if (modules != null) {
      for (IModule m : modules) {
        if (cls == null || cls.isInstance(m)) {
          list.add((MT) m);
        }
      }
    }
    return list;
  }

  public List<Language> getLanguages(MPSModuleOwner moduleOwner) {
    return getModules(moduleOwner, Language.class);
  }

  public List<DevKit> getDevKits(MPSModuleOwner moduleOwner) {
    return getModules(moduleOwner, DevKit.class);
  }

  public List<IModule> getModules(MPSModuleOwner moduleOwner) {
    return getModules(moduleOwner, IModule.class);
  }

  private <MT extends IModule> List<MT> getAllModules(Class<MT> cls) {
    assertCanRead();

    List<MT> result = new ArrayList<MT>();
    for (IModule module : myModules) {
      if (cls.isInstance(module)) result.add((MT) module);
    }
    return result;
  }

  public List<Language> getAllLanguages() {
    return getAllModules(Language.class);
  }

  public List<Solution> getAllSolutions() {
    return getAllModules(Solution.class);
  }

  public List<DevKit> getAllDevkits() {
    return getAllModules(DevKit.class);
  }

  public List<Generator> getAllGenerators() {
    return getAllModules(Generator.class);
  }

  public List<IModule> getAllModules() {
    return getAllModules(IModule.class);
  }

  public Set<Language> getAllExtendingLanguages(Language l) {
    Set<Language> result = new HashSet<Language>();
    for (Language lang : getAllLanguages()) {
      if (lang.getExtendedLanguages().contains(l)) {
        result.add(lang);
      }
    }
    return result;
  }

  public List<IModule> getAllModulesInDirectory(IFile file) {
    assertCanRead();

    String path = IFileUtils.getCanonicalPath(file);
    List<IModule> result = new ArrayList<IModule>();
    for (IModule m : getAllModules()) {
      String moduleCanonicalPath = IFileUtils.getCanonicalPath(m.getDescriptorFile());
      if (moduleCanonicalPath != null && moduleCanonicalPath.startsWith(path)) {
        result.add(m);
      }
    }
    return result;
  }

  public IModule getModuleForModelFile(String path) {
    assertCanRead();

    for (IModule module : getAllModules()) {
      List<SModelRoot> smodelRoots = module.getSModelRoots();
      for (SModelRoot root : smodelRoots) {
        String rootPath = root.getPath();
        if (path.startsWith(rootPath)) {
          return module;
        }
      }
    }
    return null;
  }

  private void assertCanRead() {
    if (!ModelAccess.instance().canRead()) {
      throw new IllegalStateException("Can't read");
    }
  }

  public void addModuleRepositoryListener(ModuleRepositoryListener listener) {
    myModuleListeners.add(listener);
  }

  public void removeModuleRepositoryListener(ModuleRepositoryListener listener) {
    myModuleListeners.remove(listener);
  }

  private void fireRepositoryChanged() {
    for (ModuleRepositoryListener listener : myModuleListeners) {
      try {
        listener.repositoryChanged();
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireModuleAdded(IModule module) {
    for (ModuleRepositoryListener listener : myModuleListeners) {
      try {
        listener.moduleAdded(module);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireBeforeModuleRemoved(IModule module) {
    for (ModuleRepositoryListener listener : myModuleListeners) {
      try {
        listener.beforeModuleRemoved(module);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private void fireModuleRemoved(IModule module) {
    for (ModuleRepositoryListener listener : myModuleListeners) {
      try {
        listener.moduleRemoved(module);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  public void fireModuleChanged(IModule m) {
    if (!myModules.contains(m)) return;

    for (ModuleRepositoryListener l : myModuleListeners) {
      try {
        l.moduleChanged(m);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  public void fireModuleInitialized(IModule module) {
    assertCanRead();

    for (ModuleRepositoryListener listener : myModuleListeners) {
      listener.moduleInitialized(module);
    }
  }

  @CodeOrchestraPatch
  public IModule getModule(String moduleName) {
    return myFqNameToModulesMap.get(moduleName);
  }
}
