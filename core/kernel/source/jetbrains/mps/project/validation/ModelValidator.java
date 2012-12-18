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

import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.IterableUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.ArrayList;
import java.util.List;

public class ModelValidator {
  private SModel myModel;

  public ModelValidator(SModel model) {
    myModel = model;
  }

  @CodeOrchestraPatch
  public List<String> validate(IScope scope) {
    ModelAccess.assertLegalRead();

    List<String> errors = new ArrayList<String>();

    for (SModelReference reference : SModelOperations.getImportedModelUIDs(myModel)) {
      if (scope.getModelDescriptor(reference) == null) {
        errors.add("Can't find model: " + reference.getLongName());
      }
    }

    // RE-2857
    /*
    List<ModuleReference> langsToCheck = new ArrayList<ModuleReference>();
    langsToCheck.addAll(IterableUtil.asCollection(myModel.getModelDepsManager().getAllImportedLanguages()));
    langsToCheck.addAll(myModel.engagedOnGenerationLanguages());
    for (ModuleReference lang : langsToCheck) {
      if (scope.getLanguage(lang) == null) {
        errors.add("Can't find language: " + lang.getModuleFqName());
      }
    }
    */

    for (ModuleReference devKit : myModel.importedDevkits()) {
      if (scope.getDevKit(devKit) == null) {
        errors.add("Can't find devkit: " + devKit.getModuleFqName());
      }
    }

    return errors;
  }
}
