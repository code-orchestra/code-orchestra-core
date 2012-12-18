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

import com.intellij.openapi.project.Project;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Generator;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.workbench.choose.base.BaseMPSChooseModel;

public abstract class BaseModuleModel extends BaseMPSChooseModel<ModuleReference> {
  public BaseModuleModel(Project project, String entityName) {
    super(project, entityName);
  }

  public String doGetFullName(Object element) {
    ModuleReference module = ((BaseModuleItem) element).getModuleReference();
    return getModuleLongName(module);
  }

  public String doGetObjectName(ModuleReference module) {
    return NameUtil.shortNameFromLongName(getModuleLongName(module));
  }

  private String getModuleLongName(ModuleReference ref) {
    IModule module = MPSModuleRepository.getInstance().getModule(ref);
    if (module instanceof Generator) {
      Generator gen = (Generator) module;
      return gen.getAlias();
    }
    return ref.getModuleFqName();
  }
}
