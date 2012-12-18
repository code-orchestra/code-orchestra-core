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

import jetbrains.mps.generator.runtime.TemplateMappingConfiguration;
import jetbrains.mps.generator.runtime.TemplateMappingPriorityRule;
import jetbrains.mps.generator.runtime.TemplateModel;
import jetbrains.mps.generator.runtime.TemplateModule;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.modules.mappingpriorities.*;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.language.LanguageRegistry;
import jetbrains.mps.smodel.language.LanguageRuntime;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.Pair;

import java.util.*;

/**
 * Igor Alshannikov
 * Date: Mar 30, 2007
 */
public class GenerationPartitioningUtil {
  private static final Logger LOG = Logger.getLogger(GenerationPartitioningUtil.class);

  public static List<TemplateModule> getTemplateModules(SModel inputModel) {
    Queue<String> queue = new LinkedList<String>(ModelContentUtil.getUsedLanguageNamespaces(inputModel, false));
    Set<String> processed = new HashSet<String>(queue);
    List<TemplateModule> result = new ArrayList<TemplateModule>();

    while (!queue.isEmpty()) {
      String next = queue.remove();
      LanguageRuntime language = LanguageRegistry.getInstance().getLanguage(next);
      if(language == null) {
        LOG.error("couldn't find language for namespace `" + next + "'");
        continue;
      }

      Collection<TemplateModule> generators = language.getGenerators();
      if(generators == null) {
        continue;
      }

      for (TemplateModule generator : generators) {
        result.add(generator);

        // handle Used languages
        for (String used : generator.getUsedLanguages()) {
          if (!processed.contains(used)) {
            processed.add(used);
            queue.add(used);
          }
        }

        // handle Referenced generators
        Collection<String> referencedModules = generator.getReferencedModules();
        if (referencedModules != null) {
          for (String referenced : referencedModules) {
            int slash = referenced.indexOf('/');
            String sourceLanguage = referenced.substring(0, slash);
            if (!processed.contains(sourceLanguage)) {
              processed.add(sourceLanguage);
              queue.add(sourceLanguage);
            }
          }
        }
      }
    }

    return result;
  }

  public static List<String> toStrings(List<TemplateMappingConfiguration> mappings) {
    List<String> strings = new ArrayList<String>();

    // consolidate mappings
    Map<TemplateModel, Integer> numOfMappingsByModel = new HashMap<TemplateModel, Integer>();
    for (TemplateMappingConfiguration mappingConfig : mappings) {
      TemplateModel model = mappingConfig.getModel();
      if (!numOfMappingsByModel.containsKey(model)) {
        numOfMappingsByModel.put(model, 0);
      }
      numOfMappingsByModel.put(model, numOfMappingsByModel.get(model) + 1);
    }
    Iterator<TemplateModel> models = numOfMappingsByModel.keySet().iterator();
    while (models.hasNext()) {
      TemplateModel model = models.next();
      int totalMappings = model.getConfigurations().size();
      if (totalMappings <= 1 || numOfMappingsByModel.get(model) < totalMappings) {
        models.remove();
      } else {
        numOfMappingsByModel.put(model, 0);
      }
    }

    // output
    for (TemplateMappingConfiguration mappingConfig : mappings) {
      TemplateModel model = mappingConfig.getModel();
      if (numOfMappingsByModel.containsKey(model)) {
        if (numOfMappingsByModel.get(model) == 0) {
          strings.add(model.getLongName() + ".*");
          numOfMappingsByModel.put(model, 1);
        }
      } else {
        strings.add(model.getLongName() + "." + mappingConfig.getName());
      }
    }

    Collections.sort(strings);
    return strings;
  }

  public static List<Pair<MappingPriorityRule, String>> toStrings(Iterable<TemplateMappingPriorityRule> priorityRules, boolean moreDetails) {
    List<Pair<MappingPriorityRule, String>> list = new ArrayList<Pair<MappingPriorityRule, String>>();
    for (TemplateMappingPriorityRule rule : priorityRules) {
      String text = asString((MappingPriorityRule) rule, moreDetails);
      if (moreDetails) {
        //todo text = asString(rule.findParent(GeneratorDescriptor.class)) + ": " + text;
      } else {
        if (text.length() > 120) {
          text = text.substring(0, 120) + "...";
        }
      }
      list.add(new Pair(rule, text));
    }
    Collections.sort(list, new Comparator<Pair<MappingPriorityRule, String>>() {
      public int compare(Pair<MappingPriorityRule, String> o1, Pair<MappingPriorityRule, String> o2) {
        return o1.o2.compareTo(o2.o2);
      }
    });
    return list;
  }

  public static String asString(MappingPriorityRule rule, boolean moreDetails) {
    return asString(rule.getLeft(), moreDetails) + " " + rule.getType().getName() + " " + asString(rule.getRight(), moreDetails);
  }

  private static String asString(MappingConfig_AbstractRef mappingRef, boolean moreDetails) {
    if (mappingRef instanceof MappingConfig_RefAllLocal) {
      return "*";
    }
    if (mappingRef instanceof MappingConfig_RefAllGlobal) {
      return "[*:*]";

    }

    if (mappingRef instanceof MappingConfig_RefSet) {
      String s = "{";
      int count = ((MappingConfig_RefSet) mappingRef).getMappingConfigs().size();
      for (MappingConfig_AbstractRef mappingSimpleRef : ((MappingConfig_RefSet) mappingRef).getMappingConfigs()) {
        count--;
        s = s + asString(mappingSimpleRef, moreDetails);
        if (count > 0) s += ", ";
      }
      return s + "}";
    }

    if (mappingRef instanceof MappingConfig_SimpleRef) {
      String modelUID = ((MappingConfig_SimpleRef) mappingRef).getModelUID();
      String nodeID = ((MappingConfig_SimpleRef) mappingRef).getNodeID();
      String modelName = moreDetails ? SModelReference.fromString(modelUID).getLongName() : NameUtil.shortNameFromLongName(SModelReference.fromString(modelUID).getLongName());
      String s = modelName + ".";
      if (nodeID.equals("*")) {
        return s + "*";
      } else {
        GlobalScope scope = GlobalScope.getInstance();
        SModelDescriptor refModel = scope.getModelDescriptor(SModelReference.fromString(modelUID));
        if (refModel != null) {
          SNode mappingConfig = refModel.getSModel().getNodeById(nodeID);
          if (mappingConfig != null) {
            return s + mappingConfig.getName();
          }
        }
      }
      return s + nodeID + "!unresolved!";
    }

    if (mappingRef instanceof MappingConfig_ExternalRef) {
      ModuleReference generatorRef = ((MappingConfig_ExternalRef) mappingRef).getGenerator();
      MappingConfig_AbstractRef extMappingRef = ((MappingConfig_ExternalRef) mappingRef).getMappingConfig();
      return "[" + asString(generatorRef) + ":" + asString(extMappingRef, moreDetails) + "]";
    }

    return "???";
  }

  private static String asString(ModuleReference generatorRef) {
    Generator generator = (Generator) MPSModuleRepository.getInstance().getModule(generatorRef);
    return generator.getAlias();
  }
}
