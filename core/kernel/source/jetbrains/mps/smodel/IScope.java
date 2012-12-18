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

/**
 * DO NOT implement this interface directly. Always use BaseScope class
 */
public interface IScope {
  SModelDescriptor getModelDescriptor(SModelReference modelReference);

  Language getLanguage(ModuleReference moduleReference);

  DevKit getDevKit(ModuleReference ref);

  Iterable<SModelDescriptor> getModelDescriptors();

  Iterable<SModelDescriptor> getOwnModelDescriptors();

  Iterable<Language> getVisibleLanguages();

  Iterable<DevKit> getVisibleDevkits();

  Iterable<IModule> getVisibleModules();

  //-----------deprecated------------

  @Deprecated
  SModelDescriptor getModelDescriptor(SModelFqName fqName);

  @Deprecated
  Language getLanguage(String fqName);
}
