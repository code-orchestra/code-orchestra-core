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
import jetbrains.mps.generator.ModelDigestHelper;
import jetbrains.mps.generator.impl.GenerationFailureException;
import jetbrains.mps.generator.impl.GeneratorMappings;
import jetbrains.mps.generator.impl.cache.TransientModelWithMetainfo;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.Nullable;

import java.util.Map;

/**
 * Evgeny Gryaznov, 6/10/11
 */
public class NonIncrementalDependenciesBuilder implements DependenciesBuilder {

  private final String myModelHash;
  private final String myParametersHash;

  public NonIncrementalDependenciesBuilder(@Nullable Map<String, String> generationHashes, String parametersHash) {
    myParametersHash = parametersHash;
    myModelHash = generationHashes == null ? null : generationHashes.get(ModelDigestHelper.FILE);
  }

  @Override
  public GenerationDependencies getResult(IOperationContext operationContext, IncrementalGenerationStrategy incrementalStrategy) {
    return GenerationDependencies.fromNonIncremental(myModelHash, myParametersHash);
  }

  @Override
  public void scriptApplied(SModel newmodel) {
  }

  @Override
  public RootDependenciesBuilder getRootBuilder(SNode inputNode) {
    return null;
  }

  @Override
  public void registerRoot(SNode outputRoot, SNode inputNode) {
  }

  @Override
  public void rootReplaced(SNode oldOutputRoot, SNode newOutputRoot) {
  }

  @Override
  public SNode getOriginalForInput(SNode inputRoot) {
    return null;
  }

  @Override
  public SNode getOriginalForOutput(SNode outputRoot) {
    return null;
  }

  @Override
  public void updateModel(SModel newInputModel) {
  }

  @Override
  public void setOutputModel(SModel model, int majorStep, int minorStep) {
  }

  @Override
  public void dropModel() {
  }

  @Override
  public void reloadRequired(GeneratorMappings mappings) {
  }

  @Override
  public void updateUnchanged(TransientModelWithMetainfo model) throws GenerationFailureException {
  }

  @Override
  public boolean isStepRequired() {
    return false;
  }
}
