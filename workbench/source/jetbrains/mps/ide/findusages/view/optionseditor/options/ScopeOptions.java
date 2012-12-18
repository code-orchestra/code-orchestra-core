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
package jetbrains.mps.ide.findusages.view.optionseditor.options;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.BootstrapScope;
import jetbrains.mps.ide.findusages.model.SearchQuery;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.GlobalScopeMinusTransient;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ProjectScope;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;

import java.util.List;

public class ScopeOptions extends BaseOptions {
  private static final Logger LOG = Logger.getLogger(ScopeOptions.class);

  public static final String SCOPE_TYPE = "scope_type";

  public static final String GLOBAL_SCOPE = "global_scope";
  public static final String PROJECT_SCOPE = "project_scope";
  public static final String MODULE_SCOPE = "module_scope";
  public static final String MODEL_SCOPE = "model_scope";
  public static final String BOOTSTRAP_SCOPE = "bootstrap_scope";

  private static final String MODEL = "model";
  private static final String MODULE = "module";

  @NotNull
  private String myScopeType;
  private String myModel;
  private String myModule;
  public static final String DEFAULT_VALUE = "<default>";

  public ScopeOptions() {
    myScopeType = GLOBAL_SCOPE;
  }

  public ScopeOptions(Element element, Project project) {
    read(element, project);
  }

  public ScopeOptions(String scopeType, String model, String module) {
    myScopeType = scopeType;
    myModel = model;
    myModule = module;
  }

  public ScopeOptions clone() {
    return new ScopeOptions(myScopeType, myModel, myModule);
  }

  public void setScopeType(@NotNull String scopeType) {
    myScopeType = scopeType;
  }

  @NotNull
  public String getScopeType() {
    return myScopeType;
  }

  public String getModel() {
    return myModel;
  }

  public void setModel(String model) {
    myModel = model;
  }

  public String getModule() {
    return myModule;
  }

  public void setModule(String module) {
    myModule = module;
  }

  public IScope getScope(IOperationContext operationContext, SModelDescriptor descriptor) {
    IScope scope;

    if (myScopeType.equals(GLOBAL_SCOPE)) {
      scope = GlobalScopeMinusTransient.getInstance();
    } else if (myScopeType.equals(PROJECT_SCOPE)) {
      scope = operationContext.getProject().getComponent(ProjectScope.class);
    } else if (myScopeType.equals(MODULE_SCOPE)) {
      if (myModule.equals(DEFAULT_VALUE)) {
        scope = new OnlyModuleScope(operationContext.getModule());
      } else {
        IModule module = getModuleByNamespace(myModule);
        if (module == null) {
          LOG.error("Module is not found for " + myModule + ". Using current module.");
          module = operationContext.getModule();
          myModule = module.getModuleFqName();
        }
        scope = new OnlyModuleScope(module);
      }
    } else if (myScopeType.equals(MODEL_SCOPE)) {
      if (myModel.equals(DEFAULT_VALUE)) {
        scope = new ModelsOnlyScope(descriptor);
      } else {
        List<SModelDescriptor> models = SModelRepository.getInstance().getModelDescriptorsByModelName(myModel);
        if (models.isEmpty()) {
          myModel = descriptor.getLongName();
          models = SModelRepository.getInstance().getModelDescriptorsByModelName(myModel);
          LOG.error("Model is not found for " + myModel + ". Using current model.");
        }
        SModelDescriptor modelDescriptor = models.get(0);
        scope = new ModelsOnlyScope(modelDescriptor);
      }
    } else if (myScopeType.equals(BOOTSTRAP_SCOPE)) {
      return BootstrapScope.getInstance();
    } else throw new IllegalArgumentException();

    return scope;
  }

  private IModule getModuleByNamespace(String namespace) {
    MPSModuleRepository repo = MPSModuleRepository.getInstance();

    IModule result = repo.getModule(new ModuleReference(namespace));
    if (result != null) return result;

    for (IModule module : repo.getAllModules()) {
      String moduleNamespace = module.getModuleFqName();
      if (moduleNamespace == null) continue;
      if (moduleNamespace.equals(namespace)) return module;
    }

    return null;
  }

  @NotNull
  public SearchQuery getResult(SNode node, IOperationContext context, SModelDescriptor modelDescriptor) {
    return new SearchQuery(node, getScope(context, modelDescriptor));
  }

  public void write(Element element, Project project) {
    Element scopeTypeXML = new Element(SCOPE_TYPE);
    scopeTypeXML.setAttribute(SCOPE_TYPE, myScopeType);
    scopeTypeXML.setAttribute(MODULE, myModule == null ? "" : myModule);
    scopeTypeXML.setAttribute(MODEL, myModel == null ? "" : myModel);
    element.addContent(scopeTypeXML);
  }

  public void read(Element element, Project project) {
    Element scopeTypeXML = element.getChild(SCOPE_TYPE);
    myScopeType = scopeTypeXML.getAttributeValue(SCOPE_TYPE);
    myModule = scopeTypeXML.getAttributeValue(MODULE);
    myModel = scopeTypeXML.getAttributeValue(MODEL);
  }
}
