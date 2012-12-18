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

import java.util.Collections;
import java.util.Map;

public class EmptyConstraintsDataHolder extends ConstraintsDataHolder {
  private final String fqName;

  public EmptyConstraintsDataHolder(String fqName) {
    this.fqName = fqName;
  }

  @Override
  public String getConceptFqName() {
    return fqName;
  }

  @Override
  public boolean isAlternativeIcon() {
    return false;
  }

  @Override
  public String getAlternativeIcon(SNode node) {
    return null;
  }

  @Override
  public String getDefaultConcreteConceptFqName() {
    return fqName;
  }

  @Override
  public Map<String, INodePropertyGetter> getNodePropertyGetters() {
    return Collections.emptyMap();
  }

  @Override
  public Map<String, INodePropertySetter> getNodePropertySetters() {
    return Collections.emptyMap();
  }

  @Override
  public Map<String, INodePropertyValidator> getNodePropertyValidators() {
    return Collections.emptyMap();
  }

  @Override
  public Map<String, INodeReferentSearchScopeProvider> getNodeNonDefaultSearchScopeProviders() {
    return Collections.emptyMap();
  }

  @Override
  public Map<String, INodeReferentSetEventHandler> getNodeReferentSetEventHandlers() {
    return Collections.emptyMap();
  }
}
