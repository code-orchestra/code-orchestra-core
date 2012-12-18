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
package jetbrains.mps.ide.actions;

import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.project.Project;
import codeOrchestra.generator.CodeOrchestraGenerationUtil;
import jetbrains.mps.plugins.pluginparts.actions.GeneratedAction;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.Generator;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.MPSDataKeys;

import java.awt.Frame;
import java.util.*;

public abstract class BaseGenerateAction extends GeneratedAction {
  private boolean myRebuildAll;
  private IOperationContext myOperationContext;
  private Project myProject;
  private Frame myFrame;
  protected Set<IModule> myRootModules;

  public BaseGenerateAction(boolean rebuildAll) {
    super("");
    myRebuildAll = rebuildAll;
    setIsAlwaysVisible(false);
    setExecuteOutsideCommand(true);
    addPlace(null);
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  protected abstract Set<IModule> getRootModules(AnActionEvent e);

  protected abstract String getObject();

  protected void doUpdate(AnActionEvent e,Map<String, Object> _params) {
    for (IModule module : myRootModules) {
      if ((!(module instanceof Solution)) && (!(module instanceof Language)) && (!(module instanceof Generator))) {
        disable(e.getPresentation());
        return;
      }
    }
    enable(e.getPresentation());
    String obj = getObject();
    String newText = (myRebuildAll ? "Regenerate" : "Generate") + " " + obj;
    e.getPresentation().setText(newText);
  }

  protected boolean collectActionData(AnActionEvent e,Map<String, Object> _params) {
    if (!super.collectActionData(e,_params)) return false;
    myProject = e.getData(MPSDataKeys.PROJECT);
    myOperationContext = e.getData(MPSDataKeys.OPERATION_CONTEXT);
    if (myOperationContext == null) return false;
    myRootModules = getRootModules(e);
    if (myRootModules.isEmpty()) return false;
    myFrame = e.getData(MPSDataKeys.FRAME);
    if (myFrame == null) return false;
    return true;
  }

  public String getActionId() {
    return BaseGenerateAction.class.getName() + "#" + myRebuildAll;
  }

  @CodeOrchestraPatch
  protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
    for (IModule rootModule : myRootModules) {
      CodeOrchestraGenerationUtil.generateModuleWithDependencies(myOperationContext, myProject, myRebuildAll, rootModule);
    }
  }

}
