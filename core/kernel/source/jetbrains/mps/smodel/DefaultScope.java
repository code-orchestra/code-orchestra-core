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

import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ModuleUtil;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.util.CollectionUtil;

import java.util.*;

public abstract class DefaultScope extends BaseScope {
  private static final Logger LOG = Logger.getLogger(DefaultScope.class);

  private final Object LOCK = new Object();

  private boolean myInitialized;
  private boolean myInitializationInProgress;

  private Set<IModule> myVisibleModules;
  private Set<Language> myUsedLanguages;
  private Set<DevKit> myUsedDevkits;

  public SModelDescriptor getModelDescriptor(SModelReference modelReference) {
    if (modelReference == null) return null;

    SModelDescriptor model = SModelRepository.getInstance().getModelDescriptor(modelReference);
    if (model == null) {
      //this is because we have modules (such as TransientModelsModule) not publishing their models
      //todo move this logic to corresponding scopes
      for (SModelDescriptor md : getHiddenModelDescriptors()) {
        if (md.getSModelReference().equals(modelReference)) return md;
      }
      return null;
    }

    synchronized (LOCK) {
      initialize();

      // RF-637
      if (CollectionUtil.intersects(myVisibleModules, model.getModules())) {
        return model;
      }
      // if (myVisibleModules.contains(model.getModule())) return model;

      for (Language l : myUsedLanguages) {
        if (l.getAccessoryModels().contains(model)) return model;
      }
    }

    return null;
  }

  public Language getLanguage(ModuleReference moduleReference) {
    Language l = MPSModuleRepository.getInstance().getLanguage(moduleReference);
    if (l == null) return null;

    synchronized (LOCK) {
      initialize();
      if (!myUsedLanguages.contains(l)) return null;
      return l;
    }
  }

  public DevKit getDevKit(ModuleReference ref) {
    DevKit d = MPSModuleRepository.getInstance().getDevKit(ref);
    if (d == null) return null;

    synchronized (LOCK) {
      initialize();
      if (!myUsedDevkits.contains(d)) return null;
      return d;
    }
  }

  @Deprecated //todo remove
  private List<SModelDescriptor> getHiddenModelDescriptors() {
    ArrayList<SModelDescriptor> result = new ArrayList<SModelDescriptor>();
    synchronized (LOCK) {
      initialize();
      for (IModule m : myVisibleModules) {
        result.addAll(m.getHiddenModelDescriptors());
      }
    }
    return result;
  }

  //todo replace with iterable
  public List<SModelDescriptor> getModelDescriptors() {
    ArrayList<SModelDescriptor> result = new ArrayList<SModelDescriptor>();
    synchronized (LOCK) {
      initialize();
      for (SModelDescriptor d: SModelRepository.getInstance().getModelDescriptors()){
        IModule module = d.getModule();
        if (myVisibleModules.contains(module)){
          result.add(d);
        }
      }

      for (Language l : myUsedLanguages) {
        for (SModelDescriptor accessory : l.getAccessoryModels()) {
          result.add(accessory);
        }
      }
    }
    return result;
  }

  //todo replace with iterable
  public List<SModelDescriptor> getOwnModelDescriptors() {
    ArrayList<SModelDescriptor> result = new ArrayList<SModelDescriptor>();
    synchronized (LOCK) {
      for (IModule module : getInitialModules()) {
        result.addAll(module.getOwnModelDescriptors());
      }
    }
    return result;
  }

  public Iterable<Language> getVisibleLanguages() {
    synchronized (LOCK) {
      initialize();
      return Collections.unmodifiableSet(myUsedLanguages);
    }
  }

  public Iterable<DevKit> getVisibleDevkits() {
    synchronized (LOCK) {
      initialize();
      return Collections.unmodifiableSet(myUsedDevkits);
    }
  }

  public Iterable<IModule> getVisibleModules() {
    synchronized (LOCK) {
      initialize();
      return Collections.unmodifiableSet(myVisibleModules);
    }
  }

  protected Collection<Language> getInitialUsedLanguages() {
    return CollectionUtil.filter(Language.class, getInitialModules());
  }

  public void invalidateCaches() {
    synchronized (LOCK) {
      myVisibleModules = null;
      myUsedLanguages = null;
      myUsedDevkits = null;
      myInitialized = false;
    }
  }

  private void initialize() {
    synchronized (LOCK) {
      if (myInitialized) return;
      if (myInitializationInProgress) return;

      myInitializationInProgress = true;

      Set<IModule> initialModules = getInitialModules();
      fillInDevkits(initialModules);
      fillInLanguages();
      fillInVisible(initialModules);

      myInitializationInProgress = false;
      myInitialized = true;
    }
  }

  private void fillInVisible(Set<IModule> initialModules) {
    myVisibleModules = new HashSet<IModule>();
    for (IModule module : initialModules) {
      module.getDependenciesManager().collectVisibleModules(myVisibleModules, false);
    }
  }

  private void fillInLanguages() {
    myUsedLanguages = new HashSet<Language>();
    myUsedLanguages.addAll(getInitialUsedLanguages());
    for (DevKit dk : myUsedDevkits) {
      myUsedLanguages.addAll(dk.getAllExportedLanguages());
    }
    for (Language l : new ArrayList<Language>(myUsedLanguages)) {
      myUsedLanguages.addAll(l.getAllExtendedLanguages());
    }
  }

  private void fillInDevkits(Set<IModule> initialModules) {
    myUsedDevkits = new HashSet<DevKit>();
    for (IModule m : initialModules) {
      if (m instanceof DevKit) {
        DevKit dk = (DevKit) m;
        myUsedDevkits.add(dk);
        myUsedDevkits.addAll(dk.getAllExtendedDevkits());
      }

      for (DevKit dk : ModuleUtil.refsToDevkits(m.getUsedDevkitReferences())) {
        myUsedDevkits.add(dk);
        myUsedDevkits.addAll(dk.getAllExtendedDevkits());
      }
    }
  }


  protected abstract Set<IModule> getInitialModules();
}
