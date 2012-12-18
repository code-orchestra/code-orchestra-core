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
package jetbrains.mps.ide.modelchecker;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.generator.ModelValidator;
import jetbrains.mps.ide.modelchecker.actions.ModelCheckerTool_Tool;
import jetbrains.mps.plugins.projectplugins.ProjectPluginManager;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;
import org.jetbrains.annotations.NotNull;

import java.util.List;

/**
 * evgeny, 2/24/11
 */
public class ModelValidatorAdapter implements ModelValidator {

  @Override
  public boolean check(@NotNull Project p, @NotNull IOperationContext operationContext, List<SModelDescriptor> modelDescriptors, Runnable regenerationRunnable) {
    ProjectPluginManager component = p.getComponent(ProjectPluginManager.class);
    if (component == null) {
      return true;
    }

    ModelCheckerTool_Tool tool = component.getTool(ModelCheckerTool_Tool.class);
    if (tool == null) {
      return true;
    }
    return tool.checkModelsBeforeGenerationIfNeeded(operationContext, modelDescriptors, regenerationRunnable);
  }
}
