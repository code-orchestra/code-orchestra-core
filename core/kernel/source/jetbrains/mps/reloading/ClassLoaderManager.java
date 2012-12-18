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
package jetbrains.mps.reloading;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.progress.ProgressIndicator;
import jetbrains.mps.cleanup.CleanupManager;
import jetbrains.mps.library.LibraryInitializer;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.runtime.RBundle;
import jetbrains.mps.runtime.RuntimeEnvironment;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.language.LanguageRegistry;
import jetbrains.mps.stubs.StubReloadManager;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.annotation.Hack;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

public class ClassLoaderManager implements ApplicationComponent {
  private static final Logger LOG = Logger.getLogger(ClassLoaderManager.class);
  private ReloadAdapter myReloadHandler = new ReloadAdapter() {
    public void unload() {
      myRepository.invalidateCaches();
    }
  };

  public static ClassLoaderManager getInstance() {
    return ApplicationManager.getApplication().getComponent(ClassLoaderManager.class);
  }

  private List<ReloadListener> myReloadHandlers = new CopyOnWriteArrayList<ReloadListener>();

  private final Object myLock = new Object();
  private RuntimeEnvironmentExt myRuntimeEnvironment;
  private MPSModuleRepository myRepository;

  public ClassLoaderManager(MPSModuleRepository repository) {
    myRepository = repository;
  }

  public void init() {
    synchronized (myLock) {
      if (myRuntimeEnvironment == null) {
        myRuntimeEnvironment = createRuntimeEnvironment();
      }
    }
  }

  public Class getClassFor(IModule module, String classFqName) throws RuntimeEnvironmentNotInitializedException {
    synchronized (myLock) {
      // RE-2681
      if (myRuntimeEnvironment == null) {
        throw new RuntimeEnvironmentNotInitializedException();
      }

      RBundle<ModuleReference> bundle = myRuntimeEnvironment.get(module.getModuleReference());

      if (bundle == null) {
        LOG.error("Can't find a bundle " + module.getModuleReference().getModuleFqName(), new Throwable());
        return null;
      }

      return bundle.getClassLoader().getClass(classFqName);
    }
  }

  public ClassLoader getClassLoaderFor(IModule module, boolean reportError) {
    synchronized (myLock) {
      RBundle<ModuleReference> bundle = myRuntimeEnvironment.get(module.getModuleReference());

      if (bundle == null) {
        if (reportError) {
          LOG.error("Can't find a bundle " + module.getModuleReference().getModuleFqName(), new Throwable());
        }
        return null;
      }

      return bundle.getClassLoader();
    }
  }

  public void reloadAll(@NotNull ProgressIndicator indicator) {
    LOG.assertCanWrite();

    indicator.pushState();
    try {
      indicator.setIndeterminate(true);
      indicator.setText("Reloading classes...");

      indicator.setText2("Performing cleanup...");
      CleanupManager.getInstance().cleanup();

      indicator.setText2("Updating classpath...");
      updateClassPath();

      indicator.setText2("Refreshing models...");
      SModelRepository.getInstance().refreshModels();

      indicator.setText2("Updating stub models...");
      StubReloadManager.getInstance().reload();

      indicator.setText2("Disposing old classes...");
      callListeners(new ListenerCaller() {
        public void call(ReloadListener l) {
          l.unload();
        }
      });

      indicator.setText2("Updating language registry...");
      LanguageRegistry.getInstance().reloadLanguages();

      indicator.setText2("Reloading classes...");
      callListeners(new ListenerCaller() {
        public void call(ReloadListener l) {
          l.load();
        }
      });

      indicator.setText2("Rebuilding ui...");
      callListeners(new ListenerCaller() {
        public void call(ReloadListener l) {
          l.onAfterReload();
        }
      });
    } finally {
      indicator.popState();
    }
  }

  public void unloadAll(@NotNull ProgressIndicator indicator) {
    LOG.assertCanWrite();

    indicator.pushState();
    try {
      indicator.setIndeterminate(true);
      indicator.setText("Reloading classes...");

      indicator.setText2("Disposing old classes...");
      callListeners(new ListenerCaller() {
        public void call(ReloadListener l) {
          l.unload();
        }
      });
    } finally {
      indicator.popState();
    }
  }

  @CodeOrchestraPatch
  @Hack
  public void updateClassPath() {
    synchronized (myLock) {
      if (myRuntimeEnvironment == null) {
        myRuntimeEnvironment = createRuntimeEnvironment();
      }

      Set<ModuleReference> added = new HashSet<ModuleReference>();
      for (IModule m : myRepository.getAllModules()) {
        boolean containsBundle;
        synchronized (myLock) {
          containsBundle = myRuntimeEnvironment.get(m.getModuleReference()) != null;
        }

        if (!containsBundle) {
          // RF-900
          try {
            addModule(m.getModuleReference());
          } catch (Throwable t) {
            // We ignore this as the assets module from the disposed project may still be available
            continue;
          }

          added.add(m.getModuleReference());
        }
      }

      for (IModule m : myRepository.getAllModules()) {
        RBundle<ModuleReference> b = myRuntimeEnvironment.get(m.getModuleReference());
        assert b != null : "There is no budle for module " + m.getModuleFqName();
        b.clearDependencies();

        for (IModule dep : m.getDependenciesManager().getAllVisibleModules()) {
          b.addDependency(dep.getModuleReference());
        }
      }

      for (ModuleReference addedBundle : added) {
        RBundle<ModuleReference> bundle = myRuntimeEnvironment.get(addedBundle);
        assert bundle != null : "Can't find " + addedBundle.getModuleFqName();
        myRuntimeEnvironment.init(bundle);
      }

      List<RBundle> toRemove = new ArrayList<RBundle>();
      for (RBundle<ModuleReference> b : myRuntimeEnvironment.getBundles()) {
        if (myRepository.getModule(b.getId()) == null) {
          toRemove.add(b);
        }
      }
      myRuntimeEnvironment.unload(toRemove.toArray(new RBundle[toRemove.size()]));

      myRuntimeEnvironment.reloadAll();

      ClassPathFactory.getInstance().invalidateAll();
    }
  }

  private void addModule(ModuleReference ref) {
    synchronized (myLock) {
      IModule module = myRepository.getModule(ref);

      if (module == null) {
        throw new RuntimeException("Can't find module : " + ref.getModuleFqName());
      }

      RBundle<ModuleReference> bundle = new RBundle<ModuleReference>(ref, module.getBytecodeLocator());
      myRuntimeEnvironment.add(bundle);
    }
  }

  //---------------component stuff------------------

  public void initComponent() {
    addReloadHandler(myReloadHandler);
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "Class Loader Manager";
  }

  public void disposeComponent() {
    removeReloadHandler(myReloadHandler);
  }

  //---------------reload handlers------------------

  public void addReloadHandler(ReloadListener handler) {
    myReloadHandlers.add(handler);
  }

  public void removeReloadHandler(ReloadListener handler) {
    myReloadHandlers.remove(handler);
  }

  private void callListeners(ListenerCaller caller) {
    for (ReloadListener listener : myReloadHandlers) {
      try {
        caller.call(listener);
      } catch (Throwable t) {
        LOG.error(t);
      }
    }
  }

  private interface ListenerCaller {
    void call(ReloadListener l);
  }

  //---------------runtime environment------------------

  private RuntimeEnvironmentExt createRuntimeEnvironment() {
    return new RuntimeEnvironmentExt();
  }

  private class RuntimeEnvironmentExt extends RuntimeEnvironment<ModuleReference> {
    private Set<String> myExcludedPackages;

    RuntimeEnvironmentExt() {
      reloadExcludedPackages();
    }

    @Override
    public Class loadFromParent(String cls, RBundle<ModuleReference> bundle) {
      IModule module = MPSModuleRepository.getInstance().getModule(bundle.getId());
      if (module instanceof Solution) {
        return null;
      }
      String pack = NameUtil.namespaceFromLongName(cls);
      synchronized (this) {
        if (myExcludedPackages.contains(pack)) {
          return null;
        }
      }
      return getFromParent(cls);
    }

    @Override
    @CodeOrchestraPatch
    public RuntimeEnvironment reload(RBundle<ModuleReference>... rBundles) {
      //assertOnlyBootstrapLanguagesAreInClasspath(); // RE-472
      RuntimeEnvironment result = super.reload(rBundles);
      if (result instanceof RuntimeEnvironmentExt) {
        ((RuntimeEnvironmentExt) result).reloadExcludedPackages();
      }
      return result;
    }

    private void assertOnlyBootstrapLanguagesAreInClasspath() {
      Set<Language> bootstrapLanguages = LibraryInitializer.getInstance().getBootstrapModules(Language.class);
      for (Language language : MPSModuleRepository.getInstance().getAllLanguages()) {
        if (bootstrapLanguages.contains(language)) {
          continue;
        }
        SModelDescriptor descriptor = LanguageAspect.STRUCTURE.get(language);
        if (descriptor == null) {
          continue;
        }
        String fqName_language = descriptor.getLongName() + "." +
          NameUtil.capitalize(NameUtil.shortNameFromLongName(language.getModuleFqName())) + "_Language";
        try {
          Class.forName(fqName_language);
          LOG.error("Non-bootstrap language class is available in application classpath: " + fqName_language);
        } catch (ClassNotFoundException e) {
          //todo this can slow down startup process
        }
      }
    }

    private boolean isNotStubModel(SModelDescriptor modelDescriptor) {
      return !SModelStereotype.isStubModelStereotype(modelDescriptor.getStereotype());
    }

    private synchronized void reloadExcludedPackages() {
      myExcludedPackages = new HashSet();
      Set<Language> bootstrapLanguages = LibraryInitializer.getInstance().getBootstrapModules(Language.class);
      /**
       * Iterating through all known bundles because we need to exclude following non-bootstrap modules available in
       * application classpath:
       * - jetbrains.mps.baseLanguage.builders
       * - jetbrains.mps.xml
       * - jetbrains.mps.xmlSchema
       */
      for (RBundle<ModuleReference> bundle : getBundles()) {
        IModule module = MPSModuleRepository.getInstance().getModule(bundle.getId());
        if (!(module instanceof Language)) {
          continue;
        }
        Language l = (Language) module;
        boolean bootstrapModule = bootstrapLanguages.contains(l);
        for (LanguageAspect aspect : LanguageAspect.values()) {
          if (bootstrapModule && aspect == LanguageAspect.STRUCTURE) {
            // Always loading STRUCTURE aspects of bootstrap modules using "boot" classloader (classloader of this class)
            continue;
          }
          SModelDescriptor modelDescriptor = aspect.get(l);
          if (modelDescriptor != null) {
            myExcludedPackages.add(modelDescriptor.getLongName());
          }
        }

        for (SModelDescriptor model : l.getUtilModels()) {
          myExcludedPackages.add(model.getLongName());
        }

        for (Generator generator : l.getGenerators()) {
          for (SModelDescriptor templateModel : generator.getOwnModelDescriptors()) {
            if (isNotStubModel(templateModel)) {
              myExcludedPackages.add(templateModel.getLongName());
            }
          }
        }
      }
    }
  }
}
                                          
