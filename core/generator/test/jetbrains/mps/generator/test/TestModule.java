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
package jetbrains.mps.generator.test;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.AbstractModule;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.persistence.IModelRootManager;
import jetbrains.mps.smodel.persistence.def.ModelPersistence;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.JDOMUtil;
import org.jdom.Document;
import org.jdom.Element;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Evgeny Gryaznov, 10/18/10
 */
public class TestModule extends AbstractModule {

  private static final Logger LOG = Logger.getLogger(TestModule.class);

  private IModule myPeer;
  private Map<SModelFqName, SModelDescriptor> myModels = new ConcurrentHashMap<SModelFqName, SModelDescriptor>();
  private Map<SModelDescriptor, SModelDescriptor> myOriginalModels = new HashMap<SModelDescriptor, SModelDescriptor>();

  public TestModule(String namespace, String moduleId, IModule peer) {
    myPeer = peer;
    ModuleReference reference = new ModuleReference(namespace, moduleId);
    setModuleReference(reference);
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        MPSModuleRepository.getInstance().addModule(TestModule.this, new MPSModuleOwner() {
        });
      }
    });
  }

  public void dispose() {
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        clearAll();
        MPSModuleRepository.getInstance().removeModule(TestModule.this);
      }
    });
    super.dispose();
  }

  public String getOutputFor(SModelDescriptor model) {
    if (myOriginalModels.containsKey(model)) {
      model = myOriginalModels.get(model);
      return model.getModule().getOutputFor(model);
    }
    return super.getOutputFor(model);
  }

  public Class getClass(String fqName) {
    if (myPeer == null) {
      throw new IllegalStateException();
    }
    return myPeer.getClass(fqName);
  }

  public ModuleDescriptor getModuleDescriptor() {
    return null;
  }

  public void setModuleDescriptor(ModuleDescriptor moduleDescriptor, boolean reloadClasses) {
    throw new UnsupportedOperationException();
  }

  public String getGeneratorOutputPath() {
    return null;
  }

  public String getTestsGeneratorOutputPath() {
    return null;
  }

  public void save() {
    // nothing
  }

  private void clearAll() {
    SModelRepository.getInstance().unRegisterModelDescriptors(this);
    invalidateCaches();
    myPeer = null;
    myModels.clear();
    myOriginalModels.clear();
  }

  private boolean isValidName(String longName, String stereotype) {
    SModelFqName sModelFqName = new SModelFqName(longName, stereotype);
    return
      SModelRepository.getInstance().getModelDescriptor(sModelFqName) == null
        && !myModels.containsKey(sModelFqName);
  }

  public SModelDescriptor createModel(SModelDescriptor originalModel) {
    String stereotype = "999";
    while (!isValidName(originalModel.getLongName(), stereotype)) {
      stereotype += "_";
    }

    SModelFqName fqName = new SModelFqName(originalModel.getLongName(), stereotype);
    SModelDescriptor result = new TestSModelDescriptor(fqName, originalModel.getLongName(), originalModel.getSModel());

    myModels.put(result.getSModelReference().getSModelFqName(), result);
    myOriginalModels.put(result, originalModel);
    invalidateCaches();
    return result;
  }

  public void publish(SModelDescriptor descr) {
    SModelRepository.getInstance().registerModelDescriptor(descr, this);
  }

  public String toString() {
    return "Test Transient models";
  }

  public List<SModelDescriptor> getOwnModelDescriptors() {
    return new ArrayList<SModelDescriptor>(myModels.values());
  }

  public List<SModelDescriptor> getHiddenModelDescriptors() {
    return new ArrayList<SModelDescriptor>(myModels.values());
  }

  protected ModuleScope createScope() {
    return new TestModuleScope();
  }

  public class TestModuleScope extends ModuleScope {
    protected Set<IModule> getInitialModules() {
      Set<IModule> result = new HashSet<IModule>();
      result.add(TestModule.this);
      for (IModule m : GlobalScope.getInstance().getVisibleModules()) {
        result.add(m);
      }
      return result;
    }

    protected Set<Language> getInitialUsedLanguages() {
      return CollectionUtil.filter(Language.class, getInitialModules());
    }
  }

  class TestSModelDescriptor extends BaseSModelDescriptor {
    private final String myLongName;
    private final SModel myToCopy;

    private TestSModelDescriptor(SModelFqName fqName, String longName, SModel toCopy) {
      super(IModelRootManager.NULL_MANAGER, new SModelReference(fqName, SModelId.generate()), false);
      myLongName = longName;
      myToCopy = toCopy;
    }

    @Override
    public IModule getModule() {
      return TestModule.this;
    }

    @Override
    protected ModelLoadResult initialLoad() {
      Document document = ModelPersistence.saveModel(myToCopy);
      Element rootElement = document.getRootElement();
      rootElement.setAttribute(ModelPersistence.MODEL_UID, getSModelReference().toString());
      SModel result;
      try {
        String modelContent = JDOMUtil.asString(document);
        result = ModelPersistence.readModel(modelContent, false);
      } catch(IOException e) {
        LOG.error(e);
        result = new StubModel(getSModelReference());
      }
      result.setLoading(true);
      return new ModelLoadResult(result, ModelLoadingState.FULLY_LOADED);
    }

    @Override
    public SModelDescriptor resolveModel(SModelReference reference) {
      if (reference.getLongName().equals(myLongName)) {
        SModelDescriptor descriptor = myModels.get(reference.getSModelFqName());
        if (descriptor != null) {
          return descriptor;
        }
      }
      return super.resolveModel(reference);
    }
  }
}
