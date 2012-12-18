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
package jetbrains.mps.generator;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.project.Project;
import jetbrains.mps.generator.generationTypes.IGenerationHandler;
import jetbrains.mps.generator.impl.dependencies.GenerationDependencies;
import jetbrains.mps.generator.impl.dependencies.GenerationDependenciesCache;
import jetbrains.mps.generator.impl.plan.GenerationPartitioner;
import jetbrains.mps.generator.impl.plan.GenerationPartitioningUtil;
import jetbrains.mps.generator.runtime.TemplateMappingConfiguration;
import jetbrains.mps.generator.runtime.TemplateModule;
import jetbrains.mps.messages.IMessageHandler;
import jetbrains.mps.smodel.*;

import java.util.*;
import java.util.Map.Entry;

/**
 * Evgeny Gryaznov, 1/25/11
 */
public class GenerationFacade {

  public static List<SNode/*MappingConfiguration*/> getOwnMappings(Generator generator) {
    List<SModelDescriptor> list = generator.getOwnTemplateModels();
    List<SNode> mappings = new ArrayList<SNode>();
    for (SModelDescriptor templateModel : list) {
      List<SNode> nodes = templateModel.getSModel().getFastNodeFinder().getNodes(BootstrapLanguages.concept_generator_MappingConfiguration, true);
      mappings.addAll(nodes);
    }
    return mappings;
  }

  public static Collection<TemplateModule> getPossiblyEngagedGenerators(SModel model) {
    return GenerationPartitioningUtil.getTemplateModules(model);
  }

  public static Collection<SModelDescriptor> getModifiedModels(Collection<SModelDescriptor> models, IOperationContext context) {
    Set<SModelDescriptor> result = new LinkedHashSet<SModelDescriptor>();
    ModelGenerationStatusManager statusManager = ModelGenerationStatusManager.getInstance();
    for (SModelDescriptor sm : models) {
      if (!sm.isGeneratable()) continue;

      if (statusManager.generationRequired(sm, context)) {
        result.add(sm);
        continue;
      }

      // TODO regenerating all dependant models can be slow, option?
      if(!(SModelStereotype.DESCRIPTOR.equals(sm.getStereotype()) || LanguageAspect.BEHAVIOR.is(sm) || LanguageAspect.CONSTRAINTS.is(sm))) {
        // temporary solution: only descriptor/behavior/constraints models
        continue;
      }

      GenerationDependencies oldDependencies = GenerationDependenciesCache.getInstance().get(sm);
      if (oldDependencies == null) {
        // TODO turn on when generated file will be mandatory
        //result.add(sm);
        continue;
      }

      Map<String, String> externalHashes = oldDependencies.getExternalHashes();
      for (Entry<String, String> entry : externalHashes.entrySet()) {
        String modelReference = entry.getKey();
        SModelDescriptor rmd = SModelRepository.getInstance().getModelDescriptor(SModelReference.fromString(modelReference));
        if (rmd == null) {
          result.add(sm);
          break;
        }
        String oldHash = entry.getValue();
        if (oldHash == null) {
          continue;
        }
        String newHash = ModelGenerationStatusManager.getInstance().currentHash(rmd, context);
        if (newHash == null || !oldHash.equals(newHash)) {
          result.add(sm);
          break;
        }
      }
    }

    return result;
  }

  public static List<List<SNode/*MappingConfiguration*/>> getPlan(Collection<TemplateModule> generators) {
    GenerationPartitioner partitioner = new GenerationPartitioner(generators);
    List<List<TemplateMappingConfiguration>> mappingSets = partitioner.createMappingSets();

    // convert
    List<List<SNode>> result = new ArrayList<List<SNode>>(mappingSets.size());
    for (List<TemplateMappingConfiguration> configurations : mappingSets) {
      List<SNode> step = new ArrayList<SNode>(configurations.size());
      for (TemplateMappingConfiguration c : configurations) {
        step.add(c.getMappingNode().getNode());
      }
      result.add(step);
    }
    return result;
  }

  public static boolean generateModels(Project p,
                                       List<SModelDescriptor> inputModels,
                                       IOperationContext invocationContext,
                                       IGenerationHandler generationHandler,
                                       ProgressIndicator progress,
                                       IMessageHandler messages,
                                       GenerationOptions options) {
    return p.getComponent(GeneratorManager.class).
      generateModels(inputModels, invocationContext, generationHandler, progress, messages, options);
  }
}
