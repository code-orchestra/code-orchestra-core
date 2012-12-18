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
import com.intellij.openapi.util.Computable;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.event.SModelCommandListener;
import jetbrains.mps.smodel.event.SModelEvent;
import jetbrains.mps.smodel.search.IsInstanceCondition;
import jetbrains.mps.util.ConditionalIterable;
import jetbrains.mps.util.InternAwareStringSet;
import jetbrains.mps.util.InternUtil;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.NotNull;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.CopyOnWriteArrayList;

public class LanguageHierarchyCache implements ApplicationComponent {
  private static LanguageHierarchyCache ourInstance = null;

  public static LanguageHierarchyCache getInstance() {
    if (ourInstance == null) {
      ourInstance = ApplicationManager.getApplication().getComponent(LanguageHierarchyCache.class);
    }
    return ourInstance;
  }

  private ConcurrentMap<String, InternAwareStringSet> myAncestorsNamesMap = new ConcurrentHashMap<String, InternAwareStringSet>();

  private final Object myParentsNamesLock = new Object();
  private Map<String, List<String>> myParentsNamesMap = new HashMap<String, List<String>>();

  private final Object myDescendantsLock = new Object();
  private Map<String, InternAwareStringSet> myDirectDescendantsCache = new HashMap<String, InternAwareStringSet>();
  private boolean myDescendantsCachesAreValid = false;

  private final Object myLanguageLock = new Object();
  private Map<Language, LanguageConceptsCache> myLanguageSpecificCaches = new HashMap<Language, LanguageConceptsCache>();

  private CopyOnWriteArrayList<CacheChangeListener> myCacheChangeListeners = new CopyOnWriteArrayList<CacheChangeListener>();
  private volatile CacheReadAccessListener myCacheReadAccessListener = null;

  private MPSModuleRepository myModuleRepository;

  public LanguageHierarchyCache(MPSModuleRepository moduleRepository) {
    myModuleRepository = moduleRepository;
  }

  @NotNull
  public String getComponentName() {
    return "Language Hierarchy Cache";
  }

  public void initComponent() {
    MPSModuleRepository.getInstance().addModuleRepositoryListener(new ModuleRepositoryAdapter() {
      @Override
      public void repositoryChanged() {
        invalidateCache();
      }
    });

    GlobalSModelEventsManager.getInstance().addGlobalCommandListener(new SModelCommandListener() {
      public void eventsHappenedInCommand(List<SModelEvent> events) {
        for (SModelEvent e : events) {
          if (!LanguageAspect.STRUCTURE.is(e.getModelDescriptor())) continue;
          invalidateCache();
        }
      }
    });
  }

  public void disposeComponent() {
    myCacheChangeListeners.clear();
    myCacheReadAccessListener = null;
  }

  public void addCacheChangeListener(CacheChangeListener listener) {
    myCacheChangeListeners.addIfAbsent(listener);
  }

  public void removeCacheChangeListener(CacheChangeListener listener) {
    myCacheChangeListeners.remove(listener);
  }

  public void setReadAccessListener(CacheReadAccessListener listener) {
    myCacheReadAccessListener = listener;
  }

  public void removeReadAccessListener() {
    myCacheReadAccessListener = null;
  }

  private void fireCacheChanged() {
    for (CacheChangeListener listener : myCacheChangeListeners) {
      listener.languageCacheChanged();
    }
  }

  private void fireReadAccessPerformed() {
    CacheReadAccessListener listener = myCacheReadAccessListener;
    if (listener != null) {
      listener.languageCacheRead();
    }
  }

  public void invalidateCache() {
    synchronized (myDescendantsLock) {
      myDirectDescendantsCache = new HashMap<String, InternAwareStringSet>();
      myDescendantsCachesAreValid = false;
    }
    synchronized (myParentsNamesLock) {
      myParentsNamesMap = new HashMap<String, List<String>>();
    }
    myAncestorsNamesMap.clear();
    synchronized (myLanguageLock) {
      myLanguageSpecificCaches = new HashMap<Language, LanguageConceptsCache>();
    }

    fireCacheChanged();
  }

  public static List<String> getParentsNames(String conceptFqName) {
    return jetbrains.mps.smodel.language.ConceptRegistry.getInstance().getConceptDescriptor(conceptFqName).getParentsNames();
  }

  public List<String> _getParentsNames(final String conceptFqName) {
    fireReadAccessPerformed();
    synchronized (myParentsNamesLock) {
      List<String> result = myParentsNamesMap.get(conceptFqName);
      if (result == null) {
        result = NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<List<String>>() {
          public List<String> compute() {
            SNode declaration = SModelUtil.findConceptDeclaration(conceptFqName, GlobalScope.getInstance());
            if (declaration == null) {
              return Collections.emptyList();
            }
            List<String> result = new ArrayList<String>();
            Set<String> parentsSet = new HashSet<String>();
            if (SNodeUtil.isInstanceOfConceptDeclaration(declaration)) {
              SNode superConcept = SNodeUtil.getConceptDeclaration_Extends(declaration);
              if (superConcept != null) {
                String name = NameUtil.nodeFQName(superConcept);
                if (parentsSet.add(name)) {
                  result.add(name);
                }
              } else if (!SNodeUtil.concept_BaseConcept.equals(NameUtil.nodeFQName(declaration))) {
                if (parentsSet.add(SNodeUtil.concept_BaseConcept)) {
                  result.add(SNodeUtil.concept_BaseConcept);
                }
              }
              for (SNode interfaceConcept : SNodeUtil.getConceptDeclaration_Implements(declaration)) {
                String name = NameUtil.nodeFQName(interfaceConcept);
                if (parentsSet.add(name)) {
                  result.add(name);
                }
              }
            } else if (SNodeUtil.isInstanceOfInterfaceConceptDeclaration(declaration)) {
              for (SNode interfaceConcept : SNodeUtil.getInterfaceConceptDeclaration_Extends(declaration)) {
                String name = NameUtil.nodeFQName(interfaceConcept);
                if (parentsSet.add(name)) {
                  result.add(name);
                }
              }
            }
            return result;
          }
        });
        myParentsNamesMap.put(InternUtil.intern(conceptFqName), Collections.unmodifiableList(result));
      }
      return result;
    }
  }

  public boolean _isAssignable(String fromConceptFqName, String toConceptFqName) {
    return getAncestorsNames_internal(fromConceptFqName).contains(toConceptFqName);
  }

  public static boolean isAssignable(String fromConceptFqName, String toConceptFqName) {
    return jetbrains.mps.smodel.language.ConceptRegistry.getInstance().getConceptDescriptor(fromConceptFqName).isAssignableTo(toConceptFqName);
  }

  public Set<String> _getAncestorsNames(final String conceptFqName) {
    return Collections.unmodifiableSet(getAncestorsNames_internal(conceptFqName));
  }

  public static Set<String> getAncestorsNames(final String conceptFqName) {
    return jetbrains.mps.smodel.language.ConceptRegistry.getInstance().getConceptDescriptor(conceptFqName).getAncestorsNames();
  }

  private Set<String> getAncestorsNames_internal(final String conceptFqName) {
    fireReadAccessPerformed();
    InternAwareStringSet result = myAncestorsNamesMap.get(conceptFqName);
    if (result != null) return result;

    InternAwareStringSet set = NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<InternAwareStringSet>() {
      public InternAwareStringSet compute() {
        InternAwareStringSet res = new InternAwareStringSet();
        collectAncestorNames(conceptFqName, res);
        return res;
      }
    });
    result = myAncestorsNamesMap.putIfAbsent(InternUtil.intern(conceptFqName), set);
    return result != null ? result : set;
  }

  private void collectAncestorNames(String conceptFqName, Set<String> result) {
    if (result.contains(conceptFqName)) return;

    result.add(conceptFqName);

    SNode declaration = SModelUtil.findConceptDeclaration(conceptFqName, GlobalScope.getInstance());
    if (declaration == null) {
      return;
    }

    if (SNodeUtil.isInstanceOfConceptDeclaration(declaration)) {
      SNode extendedConcept = SNodeUtil.getConceptDeclaration_Extends(declaration);
      if (extendedConcept != null) {
        Language declaringLanguage = SModelUtil.getDeclaringLanguage(extendedConcept);
        if (declaringLanguage != null) {
          collectAncestorNames(NameUtil.nodeFQName(extendedConcept), result);
        }
      } else if (!SNodeUtil.concept_BaseConcept.equals(NameUtil.nodeFQName(declaration))) {
        collectAncestorNames(SNodeUtil.concept_BaseConcept, result);
      }

      for (SNode interfaceConcept : SNodeUtil.getConceptDeclaration_Implements(declaration)) {
        if (interfaceConcept == null) continue;
        Language declaringLanguage = SModelUtil.getDeclaringLanguage(interfaceConcept);
        if (declaringLanguage == null) continue;
        collectAncestorNames(NameUtil.nodeFQName(interfaceConcept), result);
      }
    } else if (SNodeUtil.isInstanceOfInterfaceConceptDeclaration(declaration)) {
      for (SNode interfaceConcept : SNodeUtil.getInterfaceConceptDeclaration_Extends(declaration)) {
        if (interfaceConcept == null) continue;
        Language declaringLanguage = SModelUtil.getDeclaringLanguage(interfaceConcept);
        if (declaringLanguage == null) continue;
        collectAncestorNames(NameUtil.nodeFQName(interfaceConcept), result);
      }
    }
  }

  public Set<String> getDescendantsOfConcept(String conceptFQName) {
    fireReadAccessPerformed();
    Set<String> children;
    synchronized (myDescendantsLock) {
      if (!myDescendantsCachesAreValid) {
        NodeReadAccessCasterInEditor.runReadTransparentAction(new Runnable() {
          public void run() {
            rebuildDescendantsCaches();
          }
        });
      }
      children = myDirectDescendantsCache.get(conceptFQName);
    }
    return children == null ? Collections.<String>emptySet() : Collections.unmodifiableSet(children);
  }

  public Set<String> getAllDescendantsOfConcept(String conceptFqName) {
    Set<String> result = new LinkedHashSet<String>();
    collectDescendants(conceptFqName, result);
    return result;
  }

  private void collectDescendants(String concept, Set<String> result) {
    if (result.contains(concept)) return;
    result.add(concept);
    for (String desc : getDescendantsOfConcept(concept)) {
      collectDescendants(desc, result);
    }
  }

  private void addToCache(String nodeFQName) {
    for (String parentFQName : getParentsNames(nodeFQName)) {
      if (!myDirectDescendantsCache.containsKey(parentFQName)) {
        myDirectDescendantsCache.put(parentFQName, new InternAwareStringSet());
      }
      myDirectDescendantsCache.get(parentFQName).add(nodeFQName);
    }
  }

  private void rebuildDescendantsCaches() {
    myDirectDescendantsCache.clear();
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        for (Language language : myModuleRepository.getAllLanguages()) {
          SModelDescriptor structureDescriptor = language.getStructureModelDescriptor();
          if (structureDescriptor == null) continue;
          Iterable<SNode> iterable =
            new ConditionalIterable<SNode>(
              structureDescriptor.getSModel().roots(),
              new IsInstanceCondition(SNodeUtil.concept_AbstractConceptDeclaration));
          for (SNode root : iterable) {
            addToCache(NameUtil.nodeFQName(root));
          }
        }
      }
    });
    myDescendantsCachesAreValid = true;
  }


  private LanguageConceptsCache getLanguageCache(Language l) {
    LanguageConceptsCache result = myLanguageSpecificCaches.get(l);

    if (result == null) {
      result = new LanguageConceptsCache(l);
      myLanguageSpecificCaches.put(l, result);
    }

    return result;
  }

  public Set<String> getDefaultSubstitutableDescendantsOf(String concept, Language l) {
    Set<String> result;
    synchronized (myLanguageLock) {
      result = getLanguageCache(l).getSubconcepts(concept);
    }
    return result == null ? Collections.<String>emptySet() : Collections.unmodifiableSet(result);
  }

  private class LanguageConceptsCache {
    private Language myLanguage;
    private Map<String, Set<String>> mySubconcepts = new HashMap<String, Set<String>>();

    LanguageConceptsCache(Language language) {
      myLanguage = language;

      build();
    }

    void build() {
      for (SNode cd : myLanguage.getConceptDeclarations()) {
        if (!cd.isRoot()) continue;
        if (!SNodeUtil.isDefaultSubstitutable(cd)) {
          continue;
        }

        String fqName = NameUtil.nodeFQName(cd);

        for (String ancestor : getAncestorsNames_internal(fqName)) {
          Set<String> addTo = mySubconcepts.get(ancestor);
          if (addTo == null) {
            addTo = new HashSet<String>();
            mySubconcepts.put(ancestor, addTo);
          }
          addTo.add(fqName);
        }
      }
    }

    Set<String> getSubconcepts(String fqName) {
      return mySubconcepts.get(fqName);
    }
  }

  public static interface CacheChangeListener {
    public void languageCacheChanged();
  }

  public static interface CacheReadAccessListener {
    public void languageCacheRead();
  }
}
