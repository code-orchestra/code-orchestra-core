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
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelDescriptor;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ModuleTestConfiguration extends BaseTestConfiguration {
  private ModuleReference myModuleRef;

  public ModuleTestConfiguration() {
  }

  public ModuleReference getModuleRef() {
    return myModuleRef;
  }

  public void setModuleRef(ModuleReference moduleRef) {
    myModuleRef = moduleRef;
  }

  public GenParameters getGenParams(Project project, boolean fullRegeneration) throws IllegalGeneratorConfigurationException {
    IModule module = MPSModuleRepository.getInstance().getModule(myModuleRef);

    if (module == null) {
      throw new IllegalGeneratorConfigurationException("Can't find module " + myModuleRef.getModuleFqName());
    }

    if (module instanceof Solution) {
      Solution solution = (Solution) module;

      List<SModelDescriptor> models = new ArrayList<SModelDescriptor>();
      for (SModelDescriptor sm : solution.getOwnModelDescriptors()) {
        if (!sm.isGeneratable()) continue;
        models.add(sm);
      }

      if(!fullRegeneration) {
        models = new ArrayList<SModelDescriptor>(GenerationFacade.getModifiedModels(models, ProjectOperationContext.get(project)));
      }

      return new GenParameters(models, solution);
    } else if (module instanceof Language) {
      Language lang = (Language) module;

      List<SModelDescriptor> inputModels = lang.getOwnModelDescriptors();

      Iterator<SModelDescriptor> it = inputModels.iterator();
      while (it.hasNext()) {
        SModelDescriptor model = it.next();
        if (!model.isGeneratable()) {
          it.remove();
        }
      }

      if(!fullRegeneration) {
        inputModels = new ArrayList<SModelDescriptor>(GenerationFacade.getModifiedModels(inputModels, ProjectOperationContext.get(project)));
      }

      return new GenParameters(inputModels, lang);
    }

    throw new IllegalGeneratorConfigurationException("Not applicable to non-language/solution module " + myModuleRef.getModuleFqName());
  }
}
