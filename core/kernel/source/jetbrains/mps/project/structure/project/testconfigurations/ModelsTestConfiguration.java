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
package jetbrains.mps.project.structure.project.testconfigurations;

import com.intellij.openapi.project.Project;
import jetbrains.mps.generator.GenParameters;
import jetbrains.mps.generator.GenerationFacade;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.project.ProjectScope;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;

import java.util.*;

public class ModelsTestConfiguration extends BaseTestConfiguration {
  private List<SModelReference> myModels = new ArrayList<SModelReference>();

  public ModelsTestConfiguration() {
  }

  public ModelsTestConfiguration(List<SModelReference> models) {
    myModels = models;
  }

  public List<SModelReference> getModels() {
    return Collections.unmodifiableList(myModels);
  }

  public void addModel(SModelReference m) {
    myModels.add(m);
  }

  public GenParameters getGenParams(Project project, boolean fullRegeneration) throws IllegalGeneratorConfigurationException {
    Set<SModelDescriptor> modelDescriptors = new LinkedHashSet<SModelDescriptor>();

    for (SModelReference m : getModels()) {
      modelDescriptors.add(project.getComponent(ProjectScope.class).getModelDescriptor(m));
    }

    if (modelDescriptors.isEmpty()) {
      throw new IllegalGeneratorConfigurationException("can't execute test configuration " + getName());
    }

    IModule module = null;
    for (IModule m : MPSModuleRepository.getInstance().getAllModules()) {
      if (m.getOwnModelDescriptors().containsAll(modelDescriptors)) {
        module = m;
        break;
      }
    }

    if (module == null) {
      throw new IllegalGeneratorConfigurationException("there is no module that can be used to generate models " + modelDescriptors);
    }

    List<SModelDescriptor> models = new ArrayList<SModelDescriptor>();
    if(fullRegeneration) {
      models.addAll(modelDescriptors);
    } else {
      models.addAll(GenerationFacade.getModifiedModels(modelDescriptors, ProjectOperationContext.get(project)));
    }
    return new GenParameters(models, module);
  }
}
