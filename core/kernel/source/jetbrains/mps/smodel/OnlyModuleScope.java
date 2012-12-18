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
package jetbrains.mps.smodel;

import jetbrains.mps.project.DevKit;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;

import java.util.List;
import java.util.Set;

public class OnlyModuleScope extends BaseScope {
  private IModule myModule;

  public OnlyModuleScope(IModule module) {
    myModule = module;
  }

  public SModelDescriptor getModelDescriptor(SModelReference modelReference) {
    for (SModelDescriptor model : myModule.getOwnModelDescriptors()) {
      if (modelReference.equals(model.getSModelReference())) return model;
    }
    return null;
  }

  public List<SModelDescriptor> getModelDescriptors() {
    return myModule.getOwnModelDescriptors();
  }

  public Language getLanguage(ModuleReference moduleReference) {
    return null;
  }

  public DevKit getDevKit(ModuleReference ref) {
    return null;
  }

  public List<Language> getVisibleLanguages() {
    return null;
  }

  public List<DevKit> getVisibleDevkits() {
    return null;
  }

  public Set<IModule> getVisibleModules() {
    return null;
  }
}
