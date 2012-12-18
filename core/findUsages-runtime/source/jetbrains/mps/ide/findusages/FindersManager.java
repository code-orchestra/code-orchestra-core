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
package jetbrains.mps.ide.findusages;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.findusages.findalgorithm.finders.GeneratedFinder;
import jetbrains.mps.ide.findusages.findalgorithm.finders.ReloadableFinder;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.language.LanguageRegistry;
import jetbrains.mps.smodel.language.LanguageRegistryListener;
import jetbrains.mps.smodel.language.LanguageRuntime;
import jetbrains.mps.util.InternUtil;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.*;

public class FindersManager implements ApplicationComponent, LanguageRegistryListener {
  private static final Logger LOG = Logger.getLogger(FindersManager.class);

  private Map<String, Set<GeneratedFinder>> myFinders = new HashMap<String, Set<GeneratedFinder>>();
  private Map<GeneratedFinder, SNodePointer> myNodesByFinder = new HashMap<GeneratedFinder, SNodePointer>();
  private boolean myLoaded = false;

  private LanguageRegistry myLanguageRegistry;

  public FindersManager(LanguageRegistry registry) {
    myLanguageRegistry = registry;
  }

  public Set<ReloadableFinder> getAvailableFinders(final SNode node) {
    checkLoaded();
    return
      ModelAccess.instance().runReadAction(new Computable<Set<ReloadableFinder>>() {
        public Set<ReloadableFinder> compute() {
          Set<ReloadableFinder> result = new HashSet<ReloadableFinder>();

          for (String conceptFQName : myFinders.keySet()) {
            if (node.isInstanceOfConcept(conceptFQName)) {
              for (GeneratedFinder finder : Collections.unmodifiableSet(myFinders.get(conceptFQName))) {
                try {
                  if (finder.isVisible(node)) {
                    if (finder.isApplicable(node)) {
                      result.add(new ReloadableFinder(getFinderModule(finder), finder));
                    }
                  }
                } catch (Throwable t) {
                  LOG.error("Finder's isApplicable method failed " + t.getMessage(), t);
                }
              }
            }
          }
          return Collections.unmodifiableSet(result);
        }
      });
  }

  public ReloadableFinder getFinderByClassName(String className) {
    checkLoaded();
    for (Set<GeneratedFinder> finders : myFinders.values()) {
      for (GeneratedFinder finder : finders) {
        if (finder.getClass().getName().equals(className)) {
          return new ReloadableFinder(getFinderModule(finder), finder);
        }
      }
    }
    return null;
  }

  public SNode getNodeByFinder(ReloadableFinder finder) {
    checkLoaded();
    return myNodesByFinder.get(finder.getFinder()).getNode();
  }

  public SNode getNodeByFinder(GeneratedFinder finder) {
    checkLoaded();
    return myNodesByFinder.get(finder).getNode();
  }

  private ModuleReference getFinderModule(GeneratedFinder finder) {
    SModelDescriptor finderModel = myNodesByFinder.get(finder).getModel();
    Language finderLanguage = Language.getLanguageForLanguageAspect(finderModel);
    ModuleReference moduleReference = finderLanguage.getModuleReference();
    return moduleReference;
  }

  //-------------reloading stuff----------------

  private void checkLoaded() {
    if (myLoaded) return;
    myLoaded = true;
    load();
  }

  public void addFinder(GeneratedFinder finder, ModuleReference moduleRef, SNodePointer np) {
    String conceptName = finder.getConcept();
    Set<GeneratedFinder> finders = myFinders.get(conceptName);
    if (finders == null) {
      finders = new HashSet<GeneratedFinder>();
      myFinders.put(InternUtil.intern(conceptName), finders);
    }
    finders.add(finder);
    myNodesByFinder.put(finder, np);
  }

  private void load() {
    Collection<LanguageRuntime> availableLanguages = LanguageRegistry.getInstance().getAvailableLanguages();
    if(availableLanguages == null) {
      return;
    }
    for (LanguageRuntime language : availableLanguages) {
      initFindersDescriptor(language);
    }
  }

  private void clear() {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        myFinders.clear();
        myNodesByFinder.clear();
        myLoaded = false;
      }
    });
  }

  private void initFindersDescriptor(LanguageRuntime language) {
    try {
      BaseFindUsagesDescriptor descr = language.getFindUsages();
      if(descr != null) {
        descr.init();
      }
    } catch (Throwable throwable) {
      LOG.error("Error while initializing find usages descriptor for language " + language.getNamespace(), throwable);
    }
  }

  //-------------component stuff----------------

  public static FindersManager getInstance() {
    return ApplicationManager.getApplication().getComponent(FindersManager.class);
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "Finders Manager";
  }

  public void initComponent() {
    myLanguageRegistry.addRegistryListener(this);
  }

  public void disposeComponent() {
    myLanguageRegistry.removeRegistryListener(this);
  }

  @Override
  public void languagesLoaded(Iterable<LanguageRuntime> languages) {
  }

  @Override
  public void languagesUnloaded(Iterable<LanguageRuntime> languages, boolean unloadAll) {
    clear();
  }
}
