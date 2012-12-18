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

import jetbrains.mps.generator.impl.plan.ModelContentUtil;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class GeneratorValidator extends BaseModuleValidator<Generator> {
  public GeneratorValidator(Generator module) {
    super(module);
  }

  public List<String> getErrors() {
    List<String> errors = new ArrayList<String>(super.getErrors());
    for (ModuleReference gen : myModule.getModuleDescriptor().getDepGenerators()) {
      if (MPSModuleRepository.getInstance().getModule(gen) == null) {
        errors.add("Can't find generator dependency: " + gen.getModuleFqName());
      }
    }
    Set<String> usedLanguages = new HashSet<String>();
    for (SModelDescriptor model : myModule.getOwnTemplateModels()) {
      if(SModelStereotype.isGeneratorModel(model)) {
        usedLanguages.addAll(ModelContentUtil.getUsedLanguageNamespacesInTemplateModel(model.getSModel()));
      }
    }
    Set<String> extendedLanguages = new HashSet<String>();
    Language sourceLanguage = myModule.getSourceLanguage();
    usedLanguages.remove(sourceLanguage.getModuleFqName());
    for(Language language : sourceLanguage.getAllExtendedLanguages()){
      extendedLanguages.add(language.getModuleFqName());
    }

    /*
    for (String lang : usedLanguages) {
      Language language = MPSModuleRepository.getInstance().getLanguage(lang);
      if(language == null) continue;

      if (!extendedLanguages.contains(lang) && !language.getRuntimeModulesReferences().isEmpty()) {
        errors.add(sourceLanguage + " should extend " + lang);
      }
    }
    */
    return errors;
  }
}
