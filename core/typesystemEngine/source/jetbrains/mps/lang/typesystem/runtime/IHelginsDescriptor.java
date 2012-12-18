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
package jetbrains.mps.lang.typesystem.runtime;

import jetbrains.mps.typesystem.inference.IVariableConverter_Runtime;
import jetbrains.mps.typesystem.inference.util.IDependency_Runtime;

import java.util.Set;

public interface IHelginsDescriptor {
  public Set<InferenceRule_Runtime> getInferenceRules();

  public Set<NonTypesystemRule_Runtime> getNonTypesystemRules();

  public Set<SubtypingRule_Runtime> getSubtypingRules();

  public Set<ComparisonRule_Runtime> getComparisonRules();

  public Set<InequationReplacementRule_Runtime> getEliminationRules();

  public Set<IDependency_Runtime> getDependencies();

  public Set<IVariableConverter_Runtime> getVariableConverters();

  public Set<IOverloadedOpsTypesProvider> getOverloadedOperationsTypesProviders();

  public Set<AbstractDependentComputation_Runtime> getDependentComputations();
}
