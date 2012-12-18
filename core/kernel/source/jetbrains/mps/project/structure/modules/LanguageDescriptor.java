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

import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.ArrayList;
import java.util.List;

public class LanguageDescriptor extends ModuleDescriptor {
  private String myGenPath;

  private List<SModelReference> myAccessoryModels;
  private List<GeneratorDescriptor> myGenerators;
  private List<ModuleReference> myExtendedLanguages;
  private List<ModuleReference> myRuntimeModules;
  private List<ModelRoot> myRuntimeStubModels;
  private List<StubSolution> myStubSolutions;
  private boolean myDoNotGenerateAdapters = false;

  @CodeOrchestraPatch
  private boolean engageOnImport = false;
  @CodeOrchestraPatch
  private boolean globalEngage = false;

  public LanguageDescriptor() {
    super();
    myAccessoryModels = new ArrayList<SModelReference>();
    myGenerators = new ArrayList<GeneratorDescriptor>();
    myExtendedLanguages = new ArrayList<ModuleReference>();
    myRuntimeModules = new ArrayList<ModuleReference>();
    myRuntimeStubModels = new ArrayList<ModelRoot>();
    myStubSolutions = new ArrayList<StubSolution>();
  }

  public String getGenPath() {
    return myGenPath;
  }

  public void setGenPath(String genPath) {
    myGenPath = genPath;
  }

  public List<SModelReference> getAccessoryModels() {
    return myAccessoryModels;
  }

  public List<GeneratorDescriptor> getGenerators() {
    return myGenerators;
  }

  public List<ModuleReference> getExtendedLanguages() {
    return myExtendedLanguages;
  }

  public List<ModuleReference> getRuntimeModules() {
    return myRuntimeModules;
  }

  public List<ModelRoot> getRuntimeStubModels() {
    return myRuntimeStubModels;
  }

  public List<StubSolution> getStubSolutions() {
    return myStubSolutions;
  }

  public boolean isDoNotGenerateAdapters() {
    return myDoNotGenerateAdapters;
  }

  public void setDoNotGenerateAdapters(boolean doNotGenerateAdapters) {
    myDoNotGenerateAdapters = doNotGenerateAdapters;
  }

  @CodeOrchestraPatch
  public boolean isEngageOnImport() {
    return engageOnImport;
  }

  @CodeOrchestraPatch
  public void setEngageOnImport(boolean engageOnImport) {
    this.engageOnImport = engageOnImport;
  }

  @Override
  public boolean updateModelRefs() {
    return RefUpdateUtil.composeUpdates(
      super.updateModelRefs(),
      RefUpdateUtil.updateModelRefs(myAccessoryModels)
    );
  }

  @Override
  public boolean updateModuleRefs() {
    return RefUpdateUtil.composeUpdates(
      super.updateModuleRefs(),
      RefUpdateUtil.updateModuleRefs(myRuntimeModules),
      RefUpdateUtil.updateModuleRefs(myExtendedLanguages)
    );
  }

  @CodeOrchestraPatch
  public boolean isGlobalEngage() {
    return globalEngage;
  }

  @CodeOrchestraPatch
  public void setGlobalEngage(boolean globalEngage) {
    this.globalEngage = globalEngage;
  }
}
