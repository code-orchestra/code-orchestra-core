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
package jetbrains.mps.generator.generationTypes;

import jetbrains.mps.generator.GenerationCanceledException;
import jetbrains.mps.generator.GenerationStatus;
import jetbrains.mps.generator.IGeneratorLogger;
import jetbrains.mps.ide.progress.ITaskProgressHelper;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.util.Pair;

import java.io.IOException;
import java.util.List;

/**
 * Evgeny Gryaznov, Jan 20, 2010
 */
public interface IGenerationHandler {

  void startGeneration(IGeneratorLogger logger);

  void finishGeneration(ITaskProgressHelper progressHelper);

  boolean canHandle(SModelDescriptor inputModel);

  /**
   * Next module started.
   */
  void startModule(IModule module, List<SModelDescriptor> inputModels, IOperationContext operationContext, ITaskProgressHelper progressHelper);

  /**
   * Handle generation result of a model.
   */
  boolean handleOutput(IModule module, SModelDescriptor inputModel, GenerationStatus status, IOperationContext invocationContext, ITaskProgressHelper progressHelper);

  /**
   * Estimates execution time of compile() method in milliseconds.
   */
  long estimateCompilationMillis(List<Pair<IModule, List<SModelDescriptor>>> input);

  /**
   * Post-process generated output: compile, reload, etc. Once per generation cycle.
   */
  boolean compile(IOperationContext operationContext, List<Pair<IModule, List<SModelDescriptor>>> input, boolean generationOK, ITaskProgressHelper progressHelper) throws GenerationCanceledException, IOException;

  /**
   * This method is invoked outside of a model lock after generation
   */
  void generationCompleted();
}
