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

import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.event.SModelCommandListener;
import jetbrains.mps.smodel.event.SModelListener;
import jetbrains.mps.smodel.persistence.IModelRootManager;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

import java.util.Set;

/**
 * This is a common descriptor used for all models - stub, transient, caches, regular MPS models
 */
public interface SModelDescriptor {
  /**
   * After model loading call SModelRepostiory.fireModelRepositoryChanged
   */
  SModel getSModel();

  IModule getModule();

  boolean isGeneratable();

  String getModelHash();

  //------

  IModelRootManager getModelRootManager();

  SModelReference getSModelReference();

  String getLongName();

  String getStereotype();

  //------

  ModelLoadingState getLoadingState();

  void dispose();

  void refresh();

  //------

  boolean isEmpty();

  void rename(SModelFqName newModelFqName, boolean changeFile);

  SModelDescriptor resolveModel(SModelReference reference);

  //--------------model listeners--------------------

  void addModelListener(@NotNull SModelListener listener);

  void removeModelListener(@NotNull SModelListener listener);

  //--------------model command listeners-------------

  void addModelCommandListener(@NotNull SModelCommandListener listener);

  void removeModelCommandListener(@NotNull SModelCommandListener listener);

  @CodeOrchestraPatch
  Set<IModule> getModules();

  @CodeOrchestraPatch
  void markAsRequiringGeneration(boolean required);

  @CodeOrchestraPatch
  boolean isGenerationRequired();

}
