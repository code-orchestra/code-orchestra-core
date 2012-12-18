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
package jetbrains.mps.generator.impl.plan;

import codeOrchestra.actionscript.liveCoding.LiveCodingManager;
import codeOrchestra.actionscript.modulemaker.CompilerKind;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.actionscript.view.utils.Languages;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import jetbrains.mps.generator.impl.TemplateModelScanner;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.LanguageDescriptor;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 * evgeny, 4/28/11
 */
public class ModelContentUtil {

  public static Collection<String> getUsedLanguageNamespacesInTemplateModel(SModel model) {
    TemplateModelScanner templateModelScanner = new TemplateModelScanner(model);
    templateModelScanner.scan();
    return templateModelScanner.getTargetLanguages();
  }

  @CodeOrchestraPatch
  public static Collection<String> getUsedLanguageNamespaces(SModel model, boolean isTemplateModel) {
    if (isTemplateModel) {
      return getUsedLanguageNamespacesInTemplateModel(model);
    }

    Set<String> namespaces = new HashSet<String>();
    SModelDescriptor modelDescriptor = model.getModelDescriptor();

    // CO-4942
    if (modelDescriptor != null) {
      IModule module = modelDescriptor.getModule();
      if (module != null && module instanceof Solution && SolutionUtils.isActionScriptDependent((Solution) module)) {
        for (Language language : MPSModuleRepository.getInstance().getAllLanguages()) {
          LanguageDescriptor languageDescriptor = language.getModuleDescriptor();
          if (languageDescriptor != null && languageDescriptor.isGlobalEngage()) {
            namespaces.add(languageDescriptor.getNamespace());
          }
        }
      }
    }

    // RE-4273
    try {
      if (modelDescriptor.getModule() instanceof Solution && LiveCodingManager.instance().nextGenerationMustBeLive()) {
        namespaces.add(Languages.LIVE_CODING);
      }
    } catch (Throwable t) {
    }

    // CO-4812
    try {
      if (FlexSDKSettings.getInstance().getCompilerKind() == CompilerKind.FALCON) {
        namespaces.add(Languages.FALCON);
      }
    } catch (Throwable t) {
    }

    // RE-3026
    CodeOrchestraGenerationContext lastPushedContext = CodeOrchestraGenerateManager.getSharedContext();
    if (lastPushedContext != null && lastPushedContext.hasModel(model)) {
      OutputType rootOutputType = CodeOrchestraGenerateManager.getOwnOutputType(lastPushedContext.getRootModule());
      namespaces.addAll(rootOutputType.getLanguagesNamespaces());
    }

    // RE-3439
    for (ModuleReference languageRef : model.importedLanguages()) {
      Language language = MPSModuleRepository.getInstance().getLanguage(languageRef);
      if (language != null) {
        LanguageDescriptor languageDescriptor = language.getModuleDescriptor();
        if (languageDescriptor != null && languageDescriptor.isEngageOnImport()) {
          namespaces.add(languageDescriptor.getNamespace());
        }
      }
    }

    for (ModuleReference ref : model.engagedOnGenerationLanguages()) {
      namespaces.add(ref.getModuleFqName());
    }
    for (SNode root : model.roots()) {
      for (SNode child : root.getDescendantsIterable(null, true)) {
        String namespace1 = child.getLanguageNamespace();
        namespaces.add(namespace1);
      }
    }
    // empty behavior model should have it's behavior aspect descriptor generated
    if (modelDescriptor != null && modelDescriptor.getModule() instanceof Language && LanguageAspect.BEHAVIOR.is(modelDescriptor)) {
      namespaces.add(BootstrapLanguages.BEHAVIOR.getModuleFqName());
    }
    return namespaces;
  }
}
