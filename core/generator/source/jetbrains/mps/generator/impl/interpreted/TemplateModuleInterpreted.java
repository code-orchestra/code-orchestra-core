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
package jetbrains.mps.generator.impl.interpreted;

import jetbrains.mps.generator.impl.plan.ModelContentUtil;
import jetbrains.mps.generator.runtime.TemplateMappingPriorityRule;
import jetbrains.mps.generator.runtime.TemplateModel;
import jetbrains.mps.generator.runtime.TemplateModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Generator;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.language.LanguageRuntime;
import org.jetbrains.annotations.NotNull;

import java.util.*;

/**
 * evgeny, 3/10/11
 */
public class TemplateModuleInterpreted implements TemplateModule {

  private LanguageRuntime sourceLanguage;
  private Generator generator;
  private Collection<TemplateModel> models;

  public TemplateModuleInterpreted(LanguageRuntime sourceLanguage, @NotNull Generator generator) {
    this.sourceLanguage = sourceLanguage;
    this.generator = generator;
    this.models = new ArrayList<TemplateModel>();
    for (SModelDescriptor sModelDescriptor : generator.getOwnTemplateModels()) {
      SModel sModel = sModelDescriptor.getSModel();
      if(sModel != null) {
        models.add(new TemplateModelInterpreted(this, sModel));
      }
    }
  }

  @Override
  public LanguageRuntime getSourceLanguage() {
    return sourceLanguage;
  }

  @Override
  public ModuleReference getReference() {
    return generator.getModuleReference();
  }

  @Override
  public List<TemplateMappingPriorityRule> getPriorities() {
    return Collections.<TemplateMappingPriorityRule>unmodifiableList(generator.getModuleDescriptor().getPriorityRules());
  }

  @Override
  public Collection<TemplateModel> getModels() {
    return Collections.unmodifiableCollection(models);
  }

  @Override
  public Collection<String> getReferencedModules() {
    List<Generator> referencedGenerators = generator.getReferencedGenerators();
    List<String> result = new ArrayList<String>(referencedGenerators.size());
    for (Generator referencedGenerator : referencedGenerators) {
      String moduleId = referencedGenerator.getSourceLanguage().getModuleFqName() + "/" + referencedGenerator.getModuleFqName();
      result.add(moduleId);
    }
    return result;
  }

  @Override
  public Collection<String> getUsedLanguages() {
    Set<String> languages = new HashSet<String>();
    for (SModelDescriptor templateModel : generator.getOwnTemplateModels()) {
      languages.addAll(ModelContentUtil.getUsedLanguageNamespaces(templateModel.getSModel(), true));
    }
    return languages;
  }

  @Override
  public String getAlias() {
    return generator.getAlias();
  }
}
