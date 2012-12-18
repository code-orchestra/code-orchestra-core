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

import gnu.trove.THashSet;
import jetbrains.mps.typesystem.inference.IVariableConverter_Runtime;
import jetbrains.mps.typesystem.inference.util.IDependency_Runtime;

import java.util.Collections;
import java.util.Set;

public class BaseHelginsDescriptor implements IHelginsDescriptor {
  protected Set<InferenceRule_Runtime> myInferenceRules = new THashSet<InferenceRule_Runtime>();
  protected Set<NonTypesystemRule_Runtime> myNonTypesystemRules = new THashSet<NonTypesystemRule_Runtime>();
  protected Set<AbstractDependentComputation_Runtime> myDependentComputations = new THashSet<AbstractDependentComputation_Runtime>();
  protected Set<SubtypingRule_Runtime> mySubtypingRules = new THashSet<SubtypingRule_Runtime>();
  protected Set<ComparisonRule_Runtime> myComparisonRules = new THashSet<ComparisonRule_Runtime>();
  protected Set<InequationReplacementRule_Runtime> myInequationReplacementRules = new THashSet<InequationReplacementRule_Runtime>();
  protected Set<IDependency_Runtime> myDependencies = new THashSet<IDependency_Runtime>();
  protected Set<IVariableConverter_Runtime> myVariableConverters = new THashSet<IVariableConverter_Runtime>();
  protected Set<IOverloadedOpsTypesProvider> myOverloadedOperationsTypesProviders = new THashSet<IOverloadedOpsTypesProvider>();

  public Set<InferenceRule_Runtime> getInferenceRules() {
    return Collections.unmodifiableSet(this.myInferenceRules);
  }

  public Set<NonTypesystemRule_Runtime> getNonTypesystemRules() {
    return Collections.unmodifiableSet(this.myNonTypesystemRules);
  }

  public Set<SubtypingRule_Runtime> getSubtypingRules() {
    return Collections.unmodifiableSet(this.mySubtypingRules);
  }

  public Set<ComparisonRule_Runtime> getComparisonRules() {
    return Collections.unmodifiableSet(this.myComparisonRules);
  }

  public Set<IDependency_Runtime> getDependencies() {
    return Collections.unmodifiableSet(this.myDependencies);
  }

  public Set<InequationReplacementRule_Runtime> getEliminationRules() {
    return Collections.unmodifiableSet(this.myInequationReplacementRules);
  }

  public Set<IVariableConverter_Runtime> getVariableConverters() {
    return Collections.unmodifiableSet(this.myVariableConverters);
  }

  public Set<IOverloadedOpsTypesProvider> getOverloadedOperationsTypesProviders() {
    return Collections.unmodifiableSet(this.myOverloadedOperationsTypesProviders);
  }

  public Set<AbstractDependentComputation_Runtime> getDependentComputations() {
    return Collections.unmodifiableSet(this.myDependentComputations);
  }
}
