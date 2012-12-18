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
package jetbrains.mps.project;

import jetbrains.mps.generator.TransientModelsModule;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SModelRepository;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.ConditionalIterable;

import java.util.*;

public class GlobalScopeMinusTransient extends GlobalScope {
  private static GlobalScopeMinusTransient ourInstance;

  public static GlobalScopeMinusTransient getInstance() {
    if (ourInstance == null) {
      ourInstance = new GlobalScopeMinusTransient();
    }
    return ourInstance;
  }

  protected GlobalScopeMinusTransient() {

  }

  public Iterable<IModule> getVisibleModules() {
    return new ConditionalIterable<IModule>(MPSModuleRepository.getInstance().getAllModules(), new NonTransientModuleCondition());
  }

  public SModelDescriptor getModelDescriptor(SModelReference modelReference) {
    SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(modelReference);
    if (modelIsTransient(modelDescriptor)) return null;
    return modelDescriptor;
  }

  public List<SModelDescriptor> getModelDescriptors(String modelName) {
    return filterOutTransient(SModelRepository.getInstance().getModelDescriptorsByModelName(modelName));
  }

  public List<SModelDescriptor> getModelDescriptors() {
    return filterOutTransient(SModelRepository.getInstance().getModelDescriptors());
  }

  private List<SModelDescriptor> filterOutTransient(List<SModelDescriptor> models) {
    List<SModelDescriptor> result = new ArrayList<SModelDescriptor>();

    for (SModelDescriptor model : models) {
      if (!modelIsTransient(model)) {
        result.add(model);
      }
    }

    return result;
  }

  private boolean modelIsTransient(SModelDescriptor modelDescriptor) {
    if (modelDescriptor != null) {
      if (modelDescriptor.getModule() instanceof TransientModelsModule) {
        return true;
      }
    }

    return false;
  }

  private static class NonTransientModuleCondition implements Condition<IModule> {
    public boolean met(IModule module) {
      return !(module instanceof TransientModelsModule);
    }
  }
}
