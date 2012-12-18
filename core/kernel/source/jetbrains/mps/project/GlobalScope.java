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

import com.intellij.openapi.application.ApplicationManager;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;

import java.util.Collections;
import java.util.List;

public class GlobalScope extends BaseScope {
  private static GlobalScope ourInstance;

  public static GlobalScope getInstance() {
    if (ourInstance == null) {
      if (ApplicationManager.getApplication() != null) {
        ourInstance = new GlobalScope();
      }
    }
    return ourInstance;
  }

  private MPSModuleRepository myMPSModuleRepository;
  private SModelRepository myModelRepository;

  protected GlobalScope() {
    myMPSModuleRepository = MPSModuleRepository.getInstance();
    myModelRepository = SModelRepository.getInstance();
  }

  public String toString() {
    return "global scope";
  }

  public Language getLanguage(ModuleReference moduleReference) {
    return myMPSModuleRepository.getLanguage(moduleReference);
  }

  public DevKit getDevKit(ModuleReference ref) {
    return myMPSModuleRepository.getDevKit(ref);
  }

  public List<Language> getVisibleLanguages() {
    return myMPSModuleRepository.getAllLanguages();
  }

  public List<DevKit> getVisibleDevkits() {
    return myMPSModuleRepository.getAllDevkits();
  }

  public List<Solution> getVisibleSolutions() {
    return myMPSModuleRepository.getAllSolutions();
  }

  public Iterable<IModule> getVisibleModules() {
    return Collections.unmodifiableList(myMPSModuleRepository.getAllModules());
  }

  public SModelDescriptor getModelDescriptor(SModelReference modelReference) {
    return myModelRepository.getModelDescriptor(modelReference);
  }

  public List<SModelDescriptor> getModelDescriptors(String modelName) {
    return myModelRepository.getModelDescriptorsByModelName(modelName);
  }

  public List<SModelDescriptor> getModelDescriptors() {
    return myModelRepository.getModelDescriptors();
  }
}
