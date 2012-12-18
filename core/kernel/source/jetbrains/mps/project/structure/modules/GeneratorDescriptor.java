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
package jetbrains.mps.project.structure.modules;

import jetbrains.mps.project.structure.modules.mappingpriorities.MappingPriorityRule;

import java.util.ArrayList;
import java.util.List;

public class GeneratorDescriptor extends ModuleDescriptor {
  private String myGeneratorUID;

  private List<ModuleReference> myDepGenerators;
  private List<MappingPriorityRule> myPriorityRules;

  private boolean myGenerateTemplates = false;

  public GeneratorDescriptor() {
    super();
    myDepGenerators = new ArrayList<ModuleReference>();
    myPriorityRules = new ArrayList<MappingPriorityRule>();
  }

  public String getGeneratorUID() {
    return myGeneratorUID;
  }

  public void setGeneratorUID(String generatorUID) {
    myGeneratorUID = generatorUID;
  }

  public List<ModuleReference> getDepGenerators() {
    return myDepGenerators;
  }

  public List<MappingPriorityRule> getPriorityRules() {
    return myPriorityRules;
  }

  public boolean isGenerateTemplates() {
    return myGenerateTemplates;
  }

  public void setGenerateTemplates(boolean generateTemplates) {
    myGenerateTemplates = generateTemplates;
  }

  @Override
  public boolean updateModuleRefs() {
    return RefUpdateUtil.composeUpdates(
      super.updateModuleRefs(),
      RefUpdateUtil.updateModuleRefs(myDepGenerators),
      RefUpdateUtil.updateMappingPriorityRules(myPriorityRules));
  }
}
