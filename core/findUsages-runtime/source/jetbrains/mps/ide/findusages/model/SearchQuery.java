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
package jetbrains.mps.ide.findusages.model;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.BootstrapScope;
import jetbrains.mps.ide.findusages.CantLoadSomethingException;
import jetbrains.mps.ide.findusages.CantSaveSomethingException;
import jetbrains.mps.ide.findusages.IExternalizeable;
import jetbrains.mps.ide.findusages.model.holders.*;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.*;
import jetbrains.mps.project.AbstractModule.ModuleScope;
import jetbrains.mps.smodel.*;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

public class SearchQuery implements IExternalizeable {
  private static final Logger LOG = Logger.getLogger(SearchQuery.class);

  private static final String SCOPE = "scope";
  private static final String SCOPE_TYPE = "scope_type";

  private static final String HOLDER = "holder";
  private static final String HOLDER_CLASS = "holder_class";

  private static final String SCOPE_TYPE_GLOBAL = "global_scope";
  private static final String SCOPE_TYPE_PROJECT = "project_scope";
  private static final String SCOPE_TYPE_MODULE = "module_scope";
  private static final String SCOPE_TYPE_MODELS = "model_scope";
  private static final String SCOPE_TYPE_BOOTSTRAP = "bootstrap_scope";

  private static final String MODULE_ID = "module_id";
  private static final String MODELS = "models";
  private static final String MODEL = "model";
  private static final String MODEL_ID = "model_id";

  private IScope myScope;
  private IHolder myObjectHolder = new VoidHolder();

  public SearchQuery(Element element, Project project) throws CantLoadSomethingException {
    read(element, project);
  }

  public SearchQuery(IHolder objectHolder, IScope scope) {
    myScope = scope;
    myObjectHolder = objectHolder;
  }

  public SearchQuery(SModel model, IScope scope) {
    this(new ModelHolder(model), scope);
  }

  public SearchQuery(SNode node, IScope scope) {
    this(new NodeHolder(node), scope);
  }

  public SearchQuery(IModule module, IScope scope) {
    this(new ModuleHolder(module), scope);
  }

  public SearchQuery(IScope scope) {
    this(new VoidHolder(), scope);
  }

  public IScope getScope() {
    return myScope;
  }

  public IHolder getObjectHolder() {
    return myObjectHolder;
  }

  @NotNull
  public String getCaption() {
    return myObjectHolder.getCaption();
  }

  public void write(Element element, Project project) throws CantSaveSomethingException {
    Element scopeXML = new Element(SCOPE);
    if (myScope instanceof GlobalScope) {
      scopeXML.setAttribute(SCOPE_TYPE, SCOPE_TYPE_GLOBAL);
    } else if (myScope instanceof ProjectScope) {
      scopeXML.setAttribute(SCOPE_TYPE, SCOPE_TYPE_PROJECT);
    } else if (myScope instanceof ModuleScope) {
      scopeXML.setAttribute(SCOPE_TYPE, SCOPE_TYPE_MODULE);
      AbstractModule abstractModule = (AbstractModule) ((ModuleScope) myScope).getModule();
      if (abstractModule == null) {
        LOG.warning("Owner is not found for module");
        throw new CantSaveSomethingException("Module is not found for module. Maybe the module was deleted.");
      }
      scopeXML.setAttribute(MODULE_ID, abstractModule.getModuleFqName());
    } else if (myScope instanceof ModelsOnlyScope) {
      scopeXML.setAttribute(SCOPE_TYPE, SCOPE_TYPE_MODELS);
      Element modelsXML = new Element(MODELS);
      for (SModelDescriptor sModelDescriptor : ((ModelsOnlyScope) myScope).getModelDescriptors()) {
        Element modelXML = new Element(MODEL);
        if (sModelDescriptor == null) {
          LOG.warning("No model descriptor for model. Maybe the model was deleted");
          throw new CantSaveSomethingException("Module is not found for module. Maybe the model was deleted");
        }
        modelXML.setAttribute(MODEL_ID, sModelDescriptor.getSModelReference().toString());
        modelsXML.addContent(modelXML);
      }
      scopeXML.addContent(modelsXML);
    } else if (myScope instanceof BootstrapScope) {
      scopeXML.setAttribute(SCOPE_TYPE, SCOPE_TYPE_BOOTSTRAP);
    } else {
      throw new CantSaveSomethingException("unsupported scope " + myScope.getClass());
    }
    element.addContent(scopeXML);

    Element holderXML = new Element(HOLDER);
    holderXML.setAttribute(HOLDER_CLASS, myObjectHolder.getClass().getName());
    myObjectHolder.write(holderXML, project);
    element.addContent(holderXML);
  }

  public void read(Element element, Project project) throws CantLoadSomethingException {
    Element scopeXML = element.getChild(SCOPE);
    String scopeType = scopeXML.getAttribute(SCOPE_TYPE).getValue();
    if (scopeType.equals(SCOPE_TYPE_GLOBAL)) {
      myScope = GlobalScopeMinusTransient.getInstance();
    } else if (scopeType.equals(SCOPE_TYPE_PROJECT)) {
      myScope = project.getComponent(ProjectScope.class);
    } else if (scopeType.equals(SCOPE_TYPE_MODULE)) {
      String moduleUID = scopeXML.getAttribute(MODULE_ID).getValue();
      myScope = null;
      for (IModule module : MPSModuleRepository.getInstance().getAllModules()) {
        if (module.getModuleFqName().equals(moduleUID)) {
          myScope = module.getScope();
        }
      }
      if (myScope == null) {
        LOG.warning("module scope not found for module  " + moduleUID);
        throw new CantLoadSomethingException("module scope not found for module  " + moduleUID);
      }
    } else if (scopeType.equals(SCOPE_TYPE_MODELS)) {
      Element modelsXML = scopeXML.getChild(MODELS);
      List<SModelDescriptor> models = new ArrayList<SModelDescriptor>();
      for (Element modelXML : (List<Element>) modelsXML.getChildren(MODEL)) {
        String modelUID = modelXML.getAttribute(MODEL_ID).getValue();
        SModelDescriptor sModelDescriptor = project.getComponent(ProjectScope.class).getModelDescriptor(SModelReference.fromString(modelUID));
        if (sModelDescriptor == null) {
          LOG.warning("model scope not found for model " + modelUID);
          throw new CantLoadSomethingException("model scope not found for model " + modelUID);
        }
      }
      myScope = new ModelsOnlyScope(models.toArray(new SModelDescriptor[models.size()]));
    }
    if (scopeType.equals(SCOPE_TYPE_BOOTSTRAP)) {
      myScope = BootstrapScope.getInstance();
    }

    Element holderXML = element.getChild(HOLDER);
    String holderClass = holderXML.getAttributeValue(HOLDER_CLASS);
    try {
      myObjectHolder = (IHolder) Class.forName(holderClass).getConstructor(Element.class, Project.class).newInstance(holderXML, project);
    } catch (Exception e) {
      throw new CantLoadSomethingException(e);
    }
  }
}
