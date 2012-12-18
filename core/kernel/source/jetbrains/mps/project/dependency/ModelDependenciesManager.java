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
package jetbrains.mps.project.dependency;

import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModel;

import java.util.LinkedHashSet;
import java.util.Set;

public class ModelDependenciesManager {
  private SModel myModel;

  public ModelDependenciesManager(SModel model) {
    myModel = model;
  }

  public Iterable<ModuleReference> getAllImportedLanguages() {
    Set<ModuleReference> result = new LinkedHashSet<ModuleReference>();
    result.addAll(myModel.importedLanguages());
    for (ModuleReference dk : myModel.importedDevkits()) {
      DevKit devkit = MPSModuleRepository.getInstance().getDevKit(dk);
      if (devkit == null) continue;
      for (Language l : devkit.getAllExportedLanguages()) {
        result.add(l.getModuleReference());
      }
    }
    return result;
  }
}
