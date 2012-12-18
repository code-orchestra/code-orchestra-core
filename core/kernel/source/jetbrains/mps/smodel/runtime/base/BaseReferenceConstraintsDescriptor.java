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
package jetbrains.mps.smodel.runtime.base;

import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.language.ConceptRegistry;
import jetbrains.mps.smodel.runtime.*;
import org.jetbrains.annotations.Nullable;

public class BaseReferenceConstraintsDescriptor implements ReferenceConstraintsDispatchable {
  private final String role;
  private final ConstraintsDescriptor container;

  private final ReferenceConstraintsDescriptor scopeProviderDescriptor;
  private final ReferenceConstraintsDescriptor onReferenceSetHandlerDescriptor;

  public BaseReferenceConstraintsDescriptor(String role, ConstraintsDescriptor container) {
    this.role = role;
    this.container = container;

    if (hasOwnScopeProvider()) {
      scopeProviderDescriptor = this;
    } else {
      scopeProviderDescriptor = getSomethingUsingInheritance(container.getConceptFqName(), role, SCOPE_INHERITANCE_PARAMETERS);
    }

    if (hasOwnOnReferenceSetHandler()) {
      onReferenceSetHandlerDescriptor = this;
    } else {
      onReferenceSetHandlerDescriptor = getSomethingUsingInheritance(container.getConceptFqName(), role, ON_SET_HANDLER_INHERITANCE_PARAMETERS);
    }
  }


  @Nullable
  private static ReferenceConstraintsDescriptor getSomethingUsingInheritance(String conceptFqName, String roleName, InheritanceCalculateParameters parameters) {
    for (String parent : ConceptRegistry.getInstance().getConceptDescriptor(conceptFqName).getParentsNames()) {
      if (!ConceptRegistry.getInstance().getConceptDescriptor(parent).hasReference(roleName)) {
        continue;
      }

      ConstraintsDescriptor parentDescriptor = ConceptRegistry.getInstance().getConstraintsDescriptor(parent);
      ReferenceConstraintsDescriptor parentReferenceDescriptor = parentDescriptor.getReference(roleName);

      ReferenceConstraintsDescriptor parentCalculated;

      if (parentReferenceDescriptor instanceof BaseReferenceConstraintsDescriptor) {
        parentCalculated = parameters.getParentCalculatedDescriptor((BaseReferenceConstraintsDescriptor) parentReferenceDescriptor);
      } else if (parentReferenceDescriptor instanceof PropertyConstraintsDispatchable) {
        if (parameters.hasOwn((ReferenceConstraintsDispatchable) parentReferenceDescriptor)) {
          parentCalculated = parentReferenceDescriptor;
        } else {
          parentCalculated = getSomethingUsingInheritance(parent, roleName, parameters);
        }
      } else {
        parentCalculated = parentReferenceDescriptor;
      }

      if (parentCalculated != null) {
        return parentCalculated;
      }
    }

    return null;
  }

  @Override
  public String getRole() {
    return role;
  }

  @Override
  public ConstraintsDescriptor getContainer() {
    return container;
  }

  @Nullable
  @Override
  public ReferenceScopeProvider getScopeProvider() {
    return scopeProviderDescriptor != null ? scopeProviderDescriptor.getScopeProvider() : null;
  }

  @Override
  public boolean validate(SNode referenceNode, SNode oldReferentNode, SNode newReferentNode, IScope scope) {
    return onReferenceSetHandlerDescriptor == null || onReferenceSetHandlerDescriptor.validate(referenceNode, oldReferentNode, newReferentNode, scope);
  }

  @Override
  public void onReferenceSet(SNode referenceNode, SNode oldReferentNode, SNode newReferentNode, IScope scope) {
    if (onReferenceSetHandlerDescriptor != null) {
      onReferenceSetHandlerDescriptor.onReferenceSet(referenceNode, oldReferentNode, newReferentNode, scope);
    }
  }

  @Override
  public boolean hasOwnScopeProvider() {
    return false;
  }

  @Override
  public boolean hasOwnOnReferenceSetHandler() {
    return false;
  }

  private static interface InheritanceCalculateParameters {
    ReferenceConstraintsDescriptor getParentCalculatedDescriptor(BaseReferenceConstraintsDescriptor parentDescriptor);

    boolean hasOwn(ReferenceConstraintsDispatchable parentDescriptor);
  }

  private static final InheritanceCalculateParameters SCOPE_INHERITANCE_PARAMETERS = new InheritanceCalculateParameters() {
    @Override
    public ReferenceConstraintsDescriptor getParentCalculatedDescriptor(BaseReferenceConstraintsDescriptor parentDescriptor) {
      return parentDescriptor.scopeProviderDescriptor;
    }

    @Override
    public boolean hasOwn(ReferenceConstraintsDispatchable parentDescriptor) {
      return parentDescriptor.hasOwnScopeProvider();
    }
  };
  private static final InheritanceCalculateParameters ON_SET_HANDLER_INHERITANCE_PARAMETERS = new InheritanceCalculateParameters() {
    @Override
    public ReferenceConstraintsDescriptor getParentCalculatedDescriptor(BaseReferenceConstraintsDescriptor parentDescriptor) {
      return parentDescriptor.onReferenceSetHandlerDescriptor;
    }

    @Override
    public boolean hasOwn(ReferenceConstraintsDispatchable parentDescriptor) {
      return parentDescriptor.hasOwnOnReferenceSetHandler();
    }
  };
}
