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
package jetbrains.mps.generator.impl.dependencies;

import jetbrains.mps.generator.IncrementalGenerationStrategy;
import jetbrains.mps.generator.impl.GenerationFailureException;
import jetbrains.mps.generator.impl.GeneratorMappings;
import jetbrains.mps.generator.impl.cache.TransientModelWithMetainfo;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;

/**
 * Evgeny Gryaznov, May 18, 2010
 */
public interface DependenciesBuilder {

  void scriptApplied(SModel newmodel);

  RootDependenciesBuilder getRootBuilder(SNode inputNode);

  void registerRoot(SNode outputRoot, SNode inputNode);

  void rootReplaced(SNode oldOutputRoot, SNode newOutputRoot);

  SNode getOriginalForInput(SNode inputRoot);

  SNode getOriginalForOutput(SNode outputRoot);

  void updateModel(SModel newInputModel);

  void setOutputModel(SModel model, int majorStep, int minorStep);

  void dropModel();

  GenerationDependencies getResult(IOperationContext operationContext, IncrementalGenerationStrategy incrementalStrategy);

  void reloadRequired(GeneratorMappings mappings) throws GenerationFailureException;

  void updateUnchanged(TransientModelWithMetainfo model) throws GenerationFailureException;

  boolean isStepRequired();

}
