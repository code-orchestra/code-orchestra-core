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
package jetbrains.mps.ide.generator;

import com.intellij.openapi.project.Project;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;

import java.util.List;

public class GenerationCheckHelper {

  private static GenerationCheckHelper INSTANCE = new GenerationCheckHelper();

  public static GenerationCheckHelper getInstance() {
    return INSTANCE;
  }

  public boolean checkModelsBeforeGenerationIfNeeded(Project p, IOperationContext operationContext, List<SModelDescriptor> modelDescriptors, Runnable regenerationRunnable) {
    for (ModelValidator modelValidator : ModelValidator.EP_NAME.getExtensions()) {
      if(!modelValidator.check(p, operationContext, modelDescriptors, regenerationRunnable)) {
        return false;
      }
    }
    return true;
  }

  public void checkModelsAndRun(Project p, IOperationContext operationContext, List<SModelDescriptor> modelDescriptors, Runnable runnable) {
    if (checkModelsBeforeGenerationIfNeeded(p, operationContext, modelDescriptors, runnable)) {
      runnable.run();
    }
  }
}
