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
package jetbrains.mps.stubs;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.*;
import jetbrains.mps.project.SModelRoot.ManagerNotFoundException;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.reloading.IClassPathItem;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.ConditionalIterable;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.annotation.Hack;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.apache.commons.lang.ObjectUtils;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.*;

public class StubReloadManager implements ApplicationComponent {
  private static final Logger LOG = Logger.getLogger(StubReloadManager.class);

  private MPSModuleRepository myModuleRepository;

  private Map<StubPath, Map<ModuleId, PathData>> myPath2Data = new HashMap<StubPath, Map<ModuleId, PathData>>();

  private List<String> myLoadedSolutions = new ArrayList<String>();
  private MyStubPaths myLoadedStubPaths = new MyStubPaths();
  private Set<StubPath> myUnchangedStubPaths;

  public StubReloadManager(MPSModuleRepository moduleRepository) {
    myModuleRepository = moduleRepository;
  }

  public void reload() {
    loadNewStubSolutions();
    buildUnchangedPaths();
    disposeStubManagers();

    markOldStubs();
    releaseOldStubDescriptors();
    loadNewStubs();
    markNewStubs();

    updateLoadedStubPaths();
  }

  @CodeOrchestraPatch
  public List<IStubRootNodeDescriptor> getRootNodeDescriptors(AbstractModule module) {
    List<IStubRootNodeDescriptor> result = new ArrayList<IStubRootNodeDescriptor>();

    ModuleReference ref = module.getModuleReference();
    for (StubPath path : myLoadedStubPaths.get(ref.getModuleId())) {
      PathData pd = myPath2Data.get(path).get(ref.getModuleId());
      StubLocation location = new StubLocation(path.getPath(), "", ref);

      // RE-2388
      try {
        result.addAll(pd.getModelRootManager().getCachedRootNodeDescriptors(location)); // RE-1419
      } catch (Throwable t) {
        LOG.warning("Error while getting root node descriptors", t);
      }
    }

    return result;
  }

  //---------stub models reloading----------

  public boolean needsUpdate(BaseStubModelDescriptor descriptor, StubLocation stubLocation) {
    return needsFullReload(descriptor) || isNewPath(descriptor, stubLocation.getPath());
  }

  private boolean needsFullReload(BaseStubModelDescriptor model) {
    return model.isNeedsReloading();
  }

  //-----hack for vars evaluation speedup------

  @Hack
  @Deprecated
  //TODO replace with incremental getModelDescriptors()
  //must not be used anywhere except var eval in debugger
  //added just because we don't want to refactor stubs reloading before 1.5.
  //models loaded using this method MUST not intersect with other stub models
  //you MUST new model descriptor every time, not get them from repository
  public void loadImmediately(AbstractModule m, Set<StubPath> stubs) {
    for (StubPath sp : stubs) {
      BaseStubModelRootManager manager = createStubManager(m, sp);
      if (manager == null) {
        LOG.warning("Manager for path " + sp + " can't be created. Path will be ignored.");
        continue;
      }

      manager.updateModels(sp.getPath(), "", m);
    }
  }

  //---------stub solutions reloading----------

  private void loadNewStubSolutions() {
    for (BaseLibStubDescriptor d : createLibDescrs()) {
      if (myLoadedSolutions.contains(d.getModuleId())) continue;

      myLoadedSolutions.add(d.getModuleId());
      Solution solution = myModuleRepository.getSolution(new ModuleReference(d.getModuleName(), d.getModuleId()));
      assert solution != null : d.getModuleName();

      SolutionDescriptor sd = solution.getModuleDescriptor();

      for (String path : d.getPaths()) {
        ModelRoot sme = new ModelRoot();
        sme.setPath(path);
        sme.setManager(d.getManager());
        sd.getStubModelEntries().add(sme);
      }

      d.init(sd);

      solution.setSolutionDescriptor(sd, false);

      StubPath fakePath = new StubPath("", d.getManager());
      BaseStubModelRootManager manager = createStubManager(solution, fakePath);
      if (manager != null) {
        for (Language l : manager.getLanguagesToImport()) {
          sd.getUsedLanguages().add(l.getModuleReference());
        }
        solution.setSolutionDescriptor(sd, false);
      }
    }
  }

  private List<BaseLibStubDescriptor> createLibDescrs() {
    List<BaseLibStubDescriptor> result = new ArrayList<BaseLibStubDescriptor>();

    List<Language> languages = myModuleRepository.getAllLanguages();
    for (Language l : languages) {
      SModelDescriptor descriptor = LanguageAspect.STUBS.get(l);
      if (descriptor == null) continue;

      Condition<SNode> cond = new Condition<SNode>() {
        public boolean met(SNode node) {
          return node.getConceptFqName().equals(BootstrapLanguages.concept_stubs_LibraryStubDescriptor);
        }
      };
      Iterable<SNode> iterable = new ConditionalIterable<SNode>(descriptor.getSModel().roots(), cond);

      for (SNode node : iterable) {
        Class descrClass = l.getClass(l.getModuleFqName() + "." + LanguageAspect.STUBS.getName() + "." + node.getPersistentProperty(SNodeUtil.property_INamedConcept_name) + "_StubDescriptor");
        if (descrClass == null) continue;

        try {
          BaseLibStubDescriptor descr = (BaseLibStubDescriptor) descrClass.newInstance();
          result.add(descr);
        } catch (Throwable t) {
          LOG.error(t);
        }
      }
    }

    return result;
  }

  //----------------------------------------

  private void markOldStubs() {
    for (BaseStubModelDescriptor sm : getAllStubModels()) {
      if (modelPathsAffected(sm)) {
        sm.markReload();
      }
    }
  }

  private void markNewStubs() {
    for (BaseStubModelDescriptor m : getAllStubModels()) {
      if (m.getLoadingState() != ModelLoadingState.NOT_LOADED) {
        m.unmarkReload();
      }
    }
  }

  private void disposeStubManagers() {
    //dispose all created model root managers
    for (Map<ModuleId, PathData> d : myPath2Data.values()) {
      for (PathData data : d.values()) {
        data.getModelRootManager().dispose();
      }
    }

    //clean references to old managers in stub models
    for (BaseStubModelDescriptor md : getAllStubModels()) {
      md.setModelRootManager(null);
    }
  }

  private void releaseOldStubDescriptors() {
    for (SModelDescriptor sm : getAllStubModels()) {
      if (!needsFullReload(((BaseStubModelDescriptor) sm))) continue;

      SModelRepository.getInstance().removeModelDescriptor(sm);
    }
  }

  private void loadNewStubs() {
    Map<StubPath, Map<ModuleId, PathData>> oldp2d = myPath2Data;
    myPath2Data = new HashMap<StubPath, Map<ModuleId, PathData>>();

    for (AbstractModule m : getAllModules()) {
      for (StubPath sp : getModuleStubPaths(m)) {
        BaseStubModelRootManager manager = createStubManager(m, sp);
        if (manager == null) {
          LOG.warning("Manager for path " + sp + " can't be created. Path will be ignored.");
          continue;
        }

        PathData data = new PathData(sp);
        data.setModelRootManager(manager);

        Map<ModuleId, PathData> d = myPath2Data.get(sp);
        if (d == null) {
          d = new HashMap<ModuleId, PathData>();
          myPath2Data.put(sp, d);
        }

        ModuleId mid = m.getModuleReference().getModuleId();
        d.put(mid, data);

        Map<ModuleId, PathData> oldD = oldp2d.get(sp);
        PathData oldData = oldD == null ? null : oldD.get(mid);
        if (oldData == null || !oldData.isFresh()) {
          Set<BaseStubModelDescriptor> descriptors = manager.updateModels(sp.getPath(), "", m);
          data.setDescriptors(copyDescriptors(descriptors, null));
        } else {
          Set<BaseStubModelDescriptor> descriptors = oldData.getDescriptors();
          manager.updateModels(sp.getPath(), "", m, copyDescriptors(descriptors, manager));
          data.setDescriptors(descriptors);
        }
      }
    }
  }

  private Set<BaseStubModelDescriptor> copyDescriptors(Set<BaseStubModelDescriptor> descriptors, BaseStubModelRootManager manager) {
    HashSet<BaseStubModelDescriptor> result = new HashSet<BaseStubModelDescriptor>();
    for (BaseStubModelDescriptor d : descriptors) {
      result.add(d.copy(manager));
    }
    return result;
  }

  private void updateLoadedStubPaths() {
    myLoadedStubPaths.clear();

    for (AbstractModule m : getAllModules()) {
      for (StubPath sp : getModuleStubPaths(m)) {
        //error was already reported in loadNewStubs
        if (myPath2Data.get(sp) == null || myPath2Data.get(sp).get(m.getModuleReference().getModuleId()) == null)
          continue;
        myLoadedStubPaths.add(m, sp);
      }
    }
  }

  private List<StubPath> getModuleStubPaths(AbstractModule m) {
    return m.areJavaStubsEnabled() ? m.getAllStubPaths() : m.getStubPaths();
  }

  private void buildUnchangedPaths() {
    List<StubPath> newStubs = new ArrayList<StubPath>();
    for (AbstractModule module : getAllModules()) {
      List<StubPath> moduleStubs = getModuleStubPaths(module);
      newStubs.addAll(moduleStubs);
    }

    Set<StubPath> oldStubs = myLoadedStubPaths.getAllStubPaths();
    Set<StubPath> unchangedStubPaths = new HashSet<StubPath>(oldStubs.size());

    outer:
    for (StubPath nns : newStubs) {
      if (!oldStubs.contains(nns)) {
        continue;
      }

      Map<ModuleId, PathData> p = myPath2Data.get(nns);
      if (p == null || p.size() == 0) continue;
      for (PathData pd : p.values()) {
        if (!pd.isFresh()) continue outer;
      }

      unchangedStubPaths.add(nns);
    }

    // publish
    myUnchangedStubPaths = unchangedStubPaths;
  }

  private boolean modelPathsAffected(BaseStubModelDescriptor sm) {
    for (StubPath s : sm.getPaths()) {
      if (!myUnchangedStubPaths.contains(s)) {
        return true;
      }
    }

    return false;
  }

  private boolean isNewPath(BaseStubModelDescriptor descriptor, String path) {
    for (StubPath sp : myUnchangedStubPaths) {
      String oldManagerClass = descriptor.getManagerClass();
      String newManagerClass = sp.getManager().getClassName();
      boolean managersEqual = ObjectUtils.equals(oldManagerClass, newManagerClass);

      if (managersEqual && path.startsWith(sp.getPath())) return false;
    }
    return true;
  }

  private List<AbstractModule> getAllModules() {
    List<AbstractModule> modules = new ArrayList<AbstractModule>();
    for (IModule m : myModuleRepository.getAllModules()) {
      if (!(m instanceof AbstractModule)) continue;
      if (m instanceof Library) continue;
      modules.add(((AbstractModule) m));
    }
    return modules;
  }

  private List<BaseStubModelDescriptor> getAllStubModels() {
    List<BaseStubModelDescriptor> result = new ArrayList<BaseStubModelDescriptor>();
    for (SModelDescriptor d : SModelRepository.getInstance().getModelDescriptors()) {
      if (!(d instanceof BaseStubModelDescriptor)) continue;
      if (d.getModule() instanceof Library) continue;
      result.add(((BaseStubModelDescriptor) d));
    }
    return result;
  }

  @Nullable
  private BaseStubModelRootManager createStubManager(AbstractModule m, StubPath sp) {
    try {
      if (sp.getManager() == null) return null;

      String moduleId = sp.getManager().getModuleId();
      String className = sp.getManager().getClassName();

      // TODO: fixme
      // while loading a language we can't refer to it by ID, since it hasn't been created yet
      // fortunately, we don't have to
      if (m.getModuleReference().getModuleId().equals(ModuleId.fromString(moduleId))) {
        // well, that's weird... this causes an NPE in ClassLoaderManager
        return (BaseStubModelRootManager) BaseStubModelRootManager.create((AbstractModule) m, className);
      }

      return (BaseStubModelRootManager) BaseStubModelRootManager.create(moduleId, className);
    } catch (ManagerNotFoundException e) {
      LOG.error("Can't create stub manager " + sp.getManager().getClassName() + " for " + sp.getPath(), e);
      return null;
    }
  }

  private static class MyStubPaths extends HashMap<ModuleId, List<StubPath>> {
    public Set<StubPath> getAllStubPaths() {
      Set<StubPath> result = new HashSet<StubPath>();
      for (List<StubPath> lsp : values()) {
        result.addAll(lsp);
      }
      return result;
    }

    public List<StubPath> get(Object key) {
      List<StubPath> res = super.get(key);
      if (res == null) return new ArrayList<StubPath>();
      return res;
    }

    public void add(final AbstractModule m, StubPath sp) {
      ModuleId key = m.getModuleReference().getModuleId();
      List<StubPath> value = get(key);
      if (value == null) {
        value = new ArrayList<StubPath>();
      }

      value.add(sp);
      put(key, value);
    }
  }

  private static class PathData {
    private StubPath myStubPath;

    private BaseStubModelRootManager myModelRootManager;
    private Set<BaseStubModelDescriptor> myDescriptors = new HashSet<BaseStubModelDescriptor>(2);

    private long myPathTimestamp;
    private long myManagerTimestamp;

    public PathData(StubPath stubPath) {
      myStubPath = stubPath;
      init();
    }

    public boolean isFresh() {
      return myPathTimestamp == getTimestamp() && myManagerTimestamp == getManagerTimestamp();
    }

    public void setDescriptors(Set<BaseStubModelDescriptor> descriptors) {
      myDescriptors = descriptors;
    }

    public Set<BaseStubModelDescriptor> getDescriptors() {
      return myDescriptors;
    }

    public BaseStubModelRootManager getModelRootManager() {
      return myModelRootManager;
    }

    public void setModelRootManager(BaseStubModelRootManager modelRootManager) {
      myModelRootManager = modelRootManager;
    }

    private long getTimestamp() {
      //todo this can be rewritten using filesystem listeners
      IFile path = FileSystem.getInstance().getFileByPath(myStubPath.getPath());
      if (path == null) return 0L;
      return getTimestampRecursive(path);
    }

    private static long getTimestampRecursive(IFile path) {
      long max = path.lastModified();
      if (path.isDirectory()) {
        for (IFile child : path.getChildren()) {
          long timestamp = getTimestampRecursive(child);
          if (timestamp > max) {
            max = timestamp;
          }
        }
      }
      return max;
    }

    private long getManagerTimestamp() {
      ModuleId moduleId = ModuleId.fromString(myStubPath.getManager().getModuleId());
      IModule module = MPSModuleRepository.getInstance().getModuleById(moduleId);
      if (module == null) return 0L;

      String classNamespace = NameUtil.namespaceFromLongName(myStubPath.getManager().getClassName());
      IClassPathItem cpItem = module.getClassPathItem();
      if (cpItem == null) return 0L;

      return cpItem.getClassesTimestamp(classNamespace);
    }

    private void init() {
      myPathTimestamp = getTimestamp();
      myManagerTimestamp = getManagerTimestamp();
    }
  }

  //---------component stuff----------

  public static StubReloadManager getInstance() {
    return ApplicationManager.getApplication().getComponent(StubReloadManager.class);
  }

  @NotNull
  public String getComponentName() {
    return "Stub Reload Manager";
  }

  public void initComponent() {

  }

  public void disposeComponent() {
    myLoadedSolutions.clear();
  }
}
