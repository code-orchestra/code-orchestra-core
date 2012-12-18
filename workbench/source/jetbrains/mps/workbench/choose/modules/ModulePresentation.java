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
package jetbrains.mps.workbench.choose.modules;

import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Generator;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.workbench.choose.base.BasePresentation;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;

public class ModulePresentation extends BasePresentation {
  private ModuleReference myModuleReference;

  public ModulePresentation(ModuleReference moduleReference) {
    myModuleReference = moduleReference;
  }

  @NotNull
  public String doGetPresentableText() {
    IModule module = getModule();
    if (module instanceof Generator) {
      return ((Generator) module).getAlias();
    }
    return myModuleReference.getModuleFqName();
  }

  private IModule getModule() {
    return MPSModuleRepository.getInstance().getModule(myModuleReference);
  }

  public String doGetLocationString() {
    return "";
  }

  public Icon doGetIcon() {
    return IconManager.getIconFor(getModule());
  }
}
