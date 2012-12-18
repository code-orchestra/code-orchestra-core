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

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.language.ConceptRegistry;
import jetbrains.mps.smodel.runtime.*;
import jetbrains.mps.smodel.runtime.illegal.IllegalPropertyConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.illegal.IllegalReferenceConstraintsDescriptor;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class BaseConstraintsDescriptor implements ConstraintsDispatchable {
  private String fqName;

  private ConstraintsDescriptor canBeChildDescriptor;
  private ConstraintsDescriptor canBeRootDescriptor;
  private ConstraintsDescriptor canBeParentDescriptor;
  private ConstraintsDescriptor canBeAncestorDescriptor;

  private ConstraintsDescriptor defaultScopeProviderDescriptor;

  private final Map<String, PropertyConstraintsDescriptor> propertiesConstraints = new ConcurrentHashMap<String, PropertyConstraintsDescriptor>();
  private final Map<String, ReferenceConstraintsDescriptor> referencesConstraints = new ConcurrentHashMap<String, ReferenceConstraintsDescriptor>();

  public BaseConstraintsDescriptor(String fqName) {
    this.fqName = fqName;

    calcInheritance();
  }

  protected BaseConstraintsDescriptor() {
  }

  protected Map<String, PropertyConstraintsDescriptor> getNotDefaultProperties() {
    return Collections.emptyMap();
  }

  protected Map<String, ReferenceConstraintsDescriptor> getNotDefaultReferences() {
    return Collections.emptyMap();
  }

  protected void calcInheritance() {
    propertiesConstraints.putAll(getNotDefaultProperties());
    referencesConstraints.putAll(getNotDefaultReferences());

    if (hasOwnCanBeChildMethod()) {
      canBeChildDescriptor = this;
    } else {
      canBeChildDescriptor = getMethodUsingInheritance(getConceptFqName(), CAN_BE_CHILD_INHERITANCE_PARAMETERS);
    }

    if (hasOwnCanBeRootMethod()) {
      canBeRootDescriptor = this;
    } else {
      canBeRootDescriptor = getMethodUsingInheritance(getConceptFqName(), CAN_BE_ROOT_INHERITANCE_PARAMETERS);
    }

    if (hasOwnCanBeParentMethod()) {
      canBeParentDescriptor = this;
    } else {
      canBeParentDescriptor = getMethodUsingInheritance(getConceptFqName(), CAN_BE_PARENT_INHERITANCE_PARAMETERS);
    }

    if (hasOwnCanBeAncestorMethod()) {
      canBeAncestorDescriptor = this;
    } else {
      canBeAncestorDescriptor = getMethodUsingInheritance(getConceptFqName(), CAN_BE_ANCESTOR_INHERITANCE_PARAMETERS);
    }

    if (hasOwnDefaultScopeProvider()) {
      defaultScopeProviderDescriptor = this;
    } else {
      defaultScopeProviderDescriptor = getMethodUsingInheritance(getConceptFqName(), DEFAULT_SCOPE_PROVIDER_INHERITANCE_PARAMETERS);
    }
  }

  private ConstraintsDescriptor getMethodUsingInheritance(String conceptFqName, InheritanceCalculateParameters parameters) {
    for (String parent : ConceptRegistry.getInstance().getConceptDescriptor(conceptFqName).getParentsNames()) {
      ConstraintsDescriptor parentDescriptor = ConceptRegistry.getInstance().getConstraintsDescriptor(parent);

      ConstraintsDescriptor parentCalculated;

      if (parentDescriptor instanceof BaseConstraintsDescriptor) {
        parentCalculated = parameters.getParentCalculatedDescriptor((BaseConstraintsDescriptor) parentDescriptor);
      } else if (parentDescriptor instanceof ConstraintsDispatchable) {
        if (parameters.hasOwn((ConstraintsDispatchable) parentDescriptor)) {
          parentCalculated = parentDescriptor;
        } else {
          parentCalculated = getMethodUsingInheritance(conceptFqName, parameters);
        }
      } else {
        parentCalculated = parentDescriptor;
      }

      if (parentCalculated != null) {
        return parentCalculated;
      }
    }

    return null;
  }

  @Override
  public boolean hasOwnCanBeChildMethod() {
    return false;
  }

  @Override
  public boolean hasOwnCanBeRootMethod() {
    return false;
  }

  @Override
  public boolean hasOwnCanBeParentMethod() {
    return false;
  }

  @Override
  public boolean hasOwnCanBeAncestorMethod() {
    return false;
  }

  @Override
  public boolean hasOwnDefaultScopeProvider() {
    return false;
  }

  @Override
  public String getConceptFqName() {
    return fqName;
  }

  @Override
  public boolean canBeChild(IOperationContext operationContext, SNode parentNode, SNode link, SNode concept, @Nullable CheckingNodeContext checkingNodeContext) {
    return canBeChildDescriptor == null || canBeChildDescriptor.canBeChild(operationContext, parentNode, link, concept, checkingNodeContext);
  }

  @Override
  public boolean canBeRoot(IOperationContext operationContext, SModel model, @Nullable CheckingNodeContext checkingNodeContext) {
    return canBeRootDescriptor == null || canBeRootDescriptor.canBeRoot(operationContext, model, checkingNodeContext);
  }

  @Override
  public boolean canBeParent(IOperationContext operationContext, SNode node, SNode childConcept, SNode link, @Nullable CheckingNodeContext checkingNodeContext) {
    return canBeParentDescriptor == null || canBeParentDescriptor.canBeParent(operationContext, node, childConcept, link, checkingNodeContext);
  }

  @Override
  public boolean canBeAncestor(IOperationContext operationContext, SNode node, SNode childConcept, @Nullable CheckingNodeContext checkingNodeContext) {
    return canBeAncestorDescriptor == null || canBeAncestorDescriptor.canBeAncestor(operationContext, node, childConcept, checkingNodeContext);
  }

  @NotNull
  @Override
  public PropertyConstraintsDescriptor getProperty(String name) {
    if (propertiesConstraints.containsKey(name)) {
      return propertiesConstraints.get(name);
    }

    if (!ConceptRegistry.getInstance().getConceptDescriptor(getConceptFqName()).hasProperty(name)) {
      return new IllegalPropertyConstraintsDescriptor(name, this);
    }

    propertiesConstraints.put(name, new BasePropertyConstraintsDescriptor(name, this));

    return propertiesConstraints.get(name);
  }

  @NotNull
  @Override
  public ReferenceConstraintsDescriptor getReference(String refName) {
    if (referencesConstraints.containsKey(refName)) {
      return referencesConstraints.get(refName);
    }

    if (!ConceptRegistry.getInstance().getConceptDescriptor(getConceptFqName()).hasReference(refName)) {
      return new IllegalReferenceConstraintsDescriptor(refName, this);
    }

    referencesConstraints.put(refName, new BaseReferenceConstraintsDescriptor(refName, this));

    return referencesConstraints.get(refName);
  }

  @Override
  public ReferenceScopeProvider getDefaultScopeProvider() {
    return defaultScopeProviderDescriptor != null ? defaultScopeProviderDescriptor.getDefaultScopeProvider() : null;
  }

  @Override
  public String getAlternativeIcon(SNode node) {
    return null;
  }

  @Override
  public String getDefaultConcreteConceptFqName() {
    return getConceptFqName();
  }

  private static interface InheritanceCalculateParameters {
    ConstraintsDescriptor getParentCalculatedDescriptor(BaseConstraintsDescriptor parentDescriptor);

    boolean hasOwn(ConstraintsDispatchable parentDescriptor);
  }

  private static final InheritanceCalculateParameters CAN_BE_PARENT_INHERITANCE_PARAMETERS = new InheritanceCalculateParameters() {
    @Override
    public ConstraintsDescriptor getParentCalculatedDescriptor(BaseConstraintsDescriptor parentDescriptor) {
      return parentDescriptor.canBeParentDescriptor;
    }

    @Override
    public boolean hasOwn(ConstraintsDispatchable parentDescriptor) {
      return parentDescriptor.hasOwnCanBeParentMethod();
    }
  };
  private static final InheritanceCalculateParameters CAN_BE_CHILD_INHERITANCE_PARAMETERS = new InheritanceCalculateParameters() {
    @Override
    public ConstraintsDescriptor getParentCalculatedDescriptor(BaseConstraintsDescriptor parentDescriptor) {
      return parentDescriptor.canBeChildDescriptor;
    }

    @Override
    public boolean hasOwn(ConstraintsDispatchable parentDescriptor) {
      return parentDescriptor.hasOwnCanBeChildMethod();
    }
  };
  private static final InheritanceCalculateParameters CAN_BE_ROOT_INHERITANCE_PARAMETERS = new InheritanceCalculateParameters() {
    @Override
    public ConstraintsDescriptor getParentCalculatedDescriptor(BaseConstraintsDescriptor parentDescriptor) {
      return parentDescriptor.canBeRootDescriptor;
    }

    @Override
    public boolean hasOwn(ConstraintsDispatchable parentDescriptor) {
      return parentDescriptor.hasOwnCanBeRootMethod();
    }
  };
  private static final InheritanceCalculateParameters CAN_BE_ANCESTOR_INHERITANCE_PARAMETERS = new InheritanceCalculateParameters() {
    @Override
    public ConstraintsDescriptor getParentCalculatedDescriptor(BaseConstraintsDescriptor parentDescriptor) {
      return parentDescriptor.canBeAncestorDescriptor;
    }

    @Override
    public boolean hasOwn(ConstraintsDispatchable parentDescriptor) {
      return parentDescriptor.hasOwnCanBeAncestorMethod();
    }
  };
  private static final InheritanceCalculateParameters DEFAULT_SCOPE_PROVIDER_INHERITANCE_PARAMETERS = new InheritanceCalculateParameters() {
    @Override
    public ConstraintsDescriptor getParentCalculatedDescriptor(BaseConstraintsDescriptor parentDescriptor) {
      return parentDescriptor.defaultScopeProviderDescriptor;
    }

    @Override
    public boolean hasOwn(ConstraintsDispatchable parentDescriptor) {
      return parentDescriptor.hasOwnDefaultScopeProvider();
    }
  };
}
