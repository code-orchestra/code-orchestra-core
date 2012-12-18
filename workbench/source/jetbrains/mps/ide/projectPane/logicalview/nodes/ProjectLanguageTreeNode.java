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
package jetbrains.mps.ide.projectPane.logicalview.nodes;

import com.intellij.openapi.actionSystem.ActionGroup;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.projectPane.ProjectPaneActionGroups;
import jetbrains.mps.ide.projectPane.SModelsSubtree;
import jetbrains.mps.ide.projectPane.SortUtil;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.ide.ui.smodel.SModelReferenceTreeNode;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.workbench.action.ActionUtils;
import org.jetbrains.annotations.NotNull;

import java.util.List;

public class ProjectLanguageTreeNode extends ProjectModuleTreeNode {
  private Language myLanguage;
  private MPSProject myProject;
  private boolean myShortNameOnly;
  private boolean myInitialized;

  protected ProjectLanguageTreeNode(@NotNull Language language, MPSProject project, boolean shortNameOnly) {
    super(new ModuleContext(language, project));
    myShortNameOnly = shortNameOnly;
    myLanguage = language;
    myProject = project;

    setNodeIdentifier(myLanguage.getModuleReference().toString());
    setIcon(Icons.PROJECT_LANGUAGE_ICON);
    init();
  }

  public boolean isInitialized() {
    return myInitialized;
  }

  public void init() {
    populate();
    myInitialized = true;
  }

  public IModule getModule() {
    return myLanguage;
  }

  public Language getLanguage() {
    return myLanguage;
  }

  public Object getUserObject() {
    return myLanguage;
  }

  public ActionGroup getQuickCreateGroup(boolean plain) {
    return ActionUtils.getGroup(ProjectPaneActionGroups.LANGUAGE_NEW_ACTIONS);
  }

  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ProjectPaneActionGroups.PROJECT_PANE_LANGUAGE_ACTIONS);
  }

  protected String getModulePresentation() {
    String languageUID = myLanguage.getModuleFqName();

    if (myShortNameOnly) {
      languageUID = NameUtil.shortNameFromLongName(languageUID);
    }

    return languageUID;
  }

  private void populate() {
    IOperationContext operationContext = getOperationContext();

    // language aspect
    for (LanguageAspect aspect : LanguageAspect.values()) {
      if (aspect.get(getLanguage()) != null) {
        add(new SModelTreeNode(aspect.get(getLanguage()), null, operationContext, false));
      }
    }

    // language accessory models
    if (myLanguage.getAccessoryModels().size() > 0) {
      TextTreeNode accessories = new AccessoriesModelTreeNode(this);

      List<SModelDescriptor> sortedModels = SortUtil.sortModels(myLanguage.getAccessoryModels());
      for (SModelDescriptor model : sortedModels) {
        IModule m = model.getModule();
        boolean currentModule = m == null || m == myLanguage;
        IModule module = m == null ? myLanguage : m;
        if (!currentModule) {
          accessories.add(new SModelReferenceTreeNode(model, new ModuleContext(module, myProject)));
        } else {
          accessories.add(new SModelTreeNode(model, null, new ModuleContext(module, myProject)));
        }
      }
      this.add(accessories);
    }

    for (Generator generator : myLanguage.getGenerators()) {
      MPSTreeNode generatorNode = new GeneratorTreeNode(generator, myProject);
      add(generatorNode);
    }

    TextTreeNode languageRuntime = new RuntimeModulesTreeNode();
    for (ModuleReference mr : myLanguage.getRuntimeModulesReferences()) {
      IModule m = MPSModuleRepository.getInstance().getModule(mr);
      if (m == null) continue;
      languageRuntime.add(createFor(myProject, m));
    }
    add(languageRuntime);

    if (myLanguage.getUtilModels().size() > 0) {
      TextTreeNode utilModels = new SModelGroupTreeNode(this, operationContext);
      SModelsSubtree.create(utilModels, operationContext, (List) myLanguage.getUtilModels(), false);
      this.add(utilModels);
    }

    TextTreeNode allModels = new AllModelsTreeNode();
    allModels.setIcon(Icons.PROJECT_MODELS_ICON, false);
    allModels.setIcon(Icons.PROJECT_MODELS_EXPANDED_ICON, true);
    SModelsSubtree.create(allModels, getOperationContext());
    add(allModels);
  }

  public class AllModelsTreeNode extends TextTreeNode {
    public AllModelsTreeNode() {
      super("all models");
    }
  }
}
