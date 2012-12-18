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
package jetbrains.mps.stubs;

import jetbrains.mps.project.structure.model.ModelRootManager;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;

import java.util.List;

public abstract class BaseLibStubDescriptor {
  private String myModuleName;
  private String myModuleId;
  private ModelRootManager myManager;

  public BaseLibStubDescriptor(String moduleName, String moduleId, ModelRootManager manager) {
    myModuleName = moduleName;
    myModuleId = moduleId;
    myManager = manager;
  }

  public void init(SolutionDescriptor solution){

  }

  public String getModuleName() {
    return myModuleName;
  }

  public String getModuleId() {
    return myModuleId;
  }

  public ModelRootManager getManager() {
    return myManager;
  }

  public abstract List<String> getPaths();
}
