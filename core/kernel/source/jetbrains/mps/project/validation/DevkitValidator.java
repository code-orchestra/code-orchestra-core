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
package jetbrains.mps.project.validation;

import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.MPSModuleRepository;

import java.util.ArrayList;
import java.util.List;

public class DevkitValidator extends BaseModuleValidator<DevKit> {
  public DevkitValidator(DevKit module) {
    super(module);
  }

  public List<String> getErrors() {
    List<String> errors = new ArrayList<String>(super.getErrors());
    for (ModuleReference extDevkit : myModule.getModuleDescriptor().getExtendedDevkits()) {
      if (MPSModuleRepository.getInstance().getModule(extDevkit) == null) {
        errors.add("Can't find extended devkit: " + extDevkit.getModuleFqName());
      }
    }
    for (ModuleReference expLang : myModule.getModuleDescriptor().getExportedLanguages()) {
      if (MPSModuleRepository.getInstance().getModule(expLang) == null) {
        errors.add("Can't find exported language: " + expLang.getModuleFqName());
      }
    }
    for (ModuleReference expSol : myModule.getModuleDescriptor().getExportedSolutions()) {
      if (MPSModuleRepository.getInstance().getModule(expSol) == null) {
        errors.add("Can't find exported language: " + expSol.getModuleFqName());
      }
    }
    return errors;
  }
}
