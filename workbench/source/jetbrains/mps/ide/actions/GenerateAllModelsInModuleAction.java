/*
 * Copyright 2003-2010 JetBrains s.r.o.
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
import jetbrains.mps.project.IModule;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.MPSDataKeys;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@CodeOrchestraPatch
public class GenerateAllModelsInModuleAction extends BaseGenerateAction {

  public GenerateAllModelsInModuleAction(boolean regenerate) {
    super(regenerate);
  }

  @Override
  protected Set<IModule> getRootModules(AnActionEvent e) {
    Set<IModule> result;
    List<IModule> moduleList = e.getData(MPSDataKeys.MODULES);
    if (moduleList == null) moduleList = new ArrayList<IModule>();
    result = new HashSet(moduleList);
    if (result.isEmpty()) {
      IModule contextModule = e.getData(MPSDataKeys.CONTEXT_MODULE);
      if (contextModule != null) {
        result.add(contextModule);
      }
    }
    return result;
  }

  @Override
  @CodeOrchestraPatch
  protected String getObject() {
    return myRootModules.size() == 1 ? "Module" : "Modules";
  }

  @Override
  public String getActionId() {
    return getClass().getName();
  }


}
