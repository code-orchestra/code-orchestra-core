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
package jetbrains.mps.smodel.structure;

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.constraints.*;
import org.jetbrains.annotations.Nullable;

import java.util.Collections;
import java.util.Map;

public abstract class ConstraintsDataHolder {
  // all field about only direct concept constraints
  @Nullable
  public CanBeASomethingMethod<CanBeAChildContext> getCanBeAChildMethod() {
    return null;
  }

  @Nullable
  public CanBeASomethingMethod<CanBeARootContext> getCanBeARootMethod() {
    return null;
  }

  @Nullable
  public CanBeASomethingMethod<CanBeAParentContext> getCanBeAParentMethod() {
    return null;
  }

  @Nullable
  public CanBeASomethingMethod<CanBeAnAncestorContext> getCanBeAnAncestorMethod() {
    return null;
  }

  public abstract String getConceptFqName();

  public boolean isAlternativeIcon() {
    return false;
  }

  public String getAlternativeIcon(SNode node) {
    return null;
  }

  public String getDefaultConcreteConceptFqName() {
    return getConceptFqName();
  }

  public Map<String, INodePropertyGetter> getNodePropertyGetters() {
    return Collections.emptyMap();
  }

  public Map<String, INodePropertySetter> getNodePropertySetters() {
    return Collections.emptyMap();
  }

  public Map<String, INodePropertyValidator> getNodePropertyValidators() {
    return Collections.emptyMap();
  }

  public Map<String, INodeReferentSearchScopeProvider> getNodeNonDefaultSearchScopeProviders() {
    return Collections.emptyMap();
  }

  public Map<String, INodeReferentSetEventHandler> getNodeReferentSetEventHandlers() {
    return Collections.emptyMap();
  }

  public INodeReferentSearchScopeProvider getNodeDefaultSearchScopeProvider() {
    return null;
  }
}