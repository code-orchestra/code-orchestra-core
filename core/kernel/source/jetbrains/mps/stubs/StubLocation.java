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

import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;

public class StubLocation {
  private String myPath;
  private String myPrefix;
  private ModuleReference myModuleReference;

  public StubLocation(String path, String prefix, ModuleReference moduleRef) {
    myPath = path;
    myPrefix = prefix;
    myModuleReference = moduleRef;
  }

  public String getPath() {
    return myPath == null ? "" : myPath;
  }

  public String getPrefix() {
    return myPrefix == null ? "" : myPrefix;
  }

  public ModuleReference getModuleRef() {
    return myModuleReference;
  }

  public IModule getModule() {
    if (myModuleReference == null) return null;
    return MPSModuleRepository.getInstance().getModule(myModuleReference);
  }
}
