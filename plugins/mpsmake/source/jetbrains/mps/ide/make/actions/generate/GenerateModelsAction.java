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
package jetbrains.mps.ide.make.actions.generate;

import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.project.Project;
import jetbrains.mps.generator.generationTypes.IGenerationHandler;
import jetbrains.mps.ide.generator.GenerationCheckHelper;
import jetbrains.mps.ide.generator.GeneratorUIFacade;
import jetbrains.mps.plugins.projectplugins.ProjectPluginManager;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.BaseAction;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Deprecated
public abstract class GenerateModelsAction extends BaseAction {
  private List<SModelDescriptor> myModels;
  private IOperationContext myContext;
  private ProjectPluginManager myPluginManager;
  private final boolean myRebuildAll;

  public GenerateModelsAction(@NotNull String name, boolean rebuildAll) {
    super(name);
    myRebuildAll = rebuildAll;
    setExecuteOutsideCommand(true);
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  public abstract IGenerationHandler getGenerationHandler();

  public void doExecute(AnActionEvent e, Map<String, Object> _params) {
    //noinspection ConstantConditions
    boolean checkSuccessful = GenerationCheckHelper.getInstance()
      .checkModelsBeforeGenerationIfNeeded(myContext.getProject(), myContext, (List<SModelDescriptor>) ((List) myModels), new Runnable() {
        public void run() {
          GeneratorUIFacade.getInstance().generateModels(
            myContext,
            myModels,
            getGenerationHandler(),
            myRebuildAll,
            false);
        }
      });
    if (!(checkSuccessful)) {
      return;
    }

    GeneratorUIFacade.getInstance().generateModels(
      myContext,
      myModels,
      getGenerationHandler(),
      myRebuildAll,
      false);
  }

  protected void doUpdate(AnActionEvent e, Map<String, Object> _params) {
    boolean applicable = true;
    for (SModelDescriptor sm : myModels) {
      if (!getGenerationHandler().canHandle(sm)) {
        applicable = false;
      }
    }

    setEnabledState(e.getPresentation(), applicable);
  }

  @Override
  protected boolean collectActionData(AnActionEvent e, Map<String, Object> _params) {
    if (!super.collectActionData(e, _params)) return false;
    Project project = e.getData(MPSDataKeys.PROJECT);
    myPluginManager = project.getComponent(ProjectPluginManager.class);
    List<SModelDescriptor> models = e.getData(MPSDataKeys.MODELS);

    myModels = new ArrayList<SModelDescriptor>();

    if (models != null) {
      myModels.addAll(models);
    }

    if (myModels.isEmpty()) {
      SModelDescriptor model = e.getData(MPSDataKeys.CONTEXT_MODEL);
      if (model != null) {
        myModels.add(model);
      }
    }
    if (myModels.isEmpty()) return false;
    myContext = e.getData(MPSDataKeys.OPERATION_CONTEXT);
    if (myContext == null) return false;
    return true;
  }
}

