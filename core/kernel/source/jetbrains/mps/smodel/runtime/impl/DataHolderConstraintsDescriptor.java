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
package jetbrains.mps.smodel.runtime.impl;

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.constraints.CanBeAChildContext;
import jetbrains.mps.smodel.constraints.CanBeAParentContext;
import jetbrains.mps.smodel.constraints.CanBeARootContext;
import jetbrains.mps.smodel.constraints.CanBeAnAncestorContext;
import jetbrains.mps.smodel.runtime.*;
import jetbrains.mps.smodel.runtime.CheckingNodeContext;
import jetbrains.mps.smodel.runtime.base.BaseConstraintsDescriptor;
import jetbrains.mps.smodel.structure.CanBeASomethingMethod;
import jetbrains.mps.smodel.structure.ConstraintsDataHolder;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Deprecated
public class DataHolderConstraintsDescriptor extends BaseConstraintsDescriptor {
  private final ConstraintsDataHolder dataHolder;

  private ReferenceScopeProvider defaultScopeProvider = null;

  public DataHolderConstraintsDescriptor(final ConstraintsDataHolder dataHolder) {
    this.dataHolder = dataHolder;

    // default scope provider
    if (dataHolder.getNodeDefaultSearchScopeProvider() != null) {
      defaultScopeProvider = new INodeReferentSearchScopeProviderWrapper(dataHolder.getNodeDefaultSearchScopeProvider());
    }

    calcInheritance();
  }

  @Override
  protected Map<String, PropertyConstraintsDescriptor> getNotDefaultProperties() {
    Map<String, PropertyConstraintsDescriptor> properties = new HashMap<String, PropertyConstraintsDescriptor>();

    Set<String> overriddenProperties = new HashSet<String>();
    overriddenProperties.addAll(dataHolder.getNodePropertyGetters().keySet());
    overriddenProperties.addAll(dataHolder.getNodePropertySetters().keySet());
    overriddenProperties.addAll(dataHolder.getNodePropertyValidators().keySet());

    for (String propertyName : overriddenProperties) {
      // todo: is initialization order ok?
      properties.put(propertyName, PropertyWrapper.getProperty(propertyName, this,
        dataHolder.getNodePropertyGetters().get(propertyName),
        dataHolder.getNodePropertySetters().get(propertyName),
        dataHolder.getNodePropertyValidators().get(propertyName)));
    }

    return properties;
  }

  @Override
  protected Map<String, ReferenceConstraintsDescriptor> getNotDefaultReferences() {
    Map<String, ReferenceConstraintsDescriptor> references = new HashMap<String, ReferenceConstraintsDescriptor>();
    Set<String> overriddenReferences = new HashSet<String>();
    overriddenReferences.addAll(dataHolder.getNodeReferentSetEventHandlers().keySet());
    overriddenReferences.addAll(dataHolder.getNodeNonDefaultSearchScopeProviders().keySet());

    for (String role : overriddenReferences) {
      // todo: is initialization order ok?
      references.put(role, ReferenceWrapper.getReference(role, this,
        dataHolder.getNodeNonDefaultSearchScopeProviders().get(role),
        dataHolder.getNodeReferentSetEventHandlers().get(role)));
    }

    return references;
  }

  @Override
  public boolean hasOwnCanBeChildMethod() {
    return dataHolder.getCanBeAChildMethod() != null;
  }

  @Override
  public boolean hasOwnCanBeRootMethod() {
    return dataHolder.getCanBeARootMethod() != null;
  }

  @Override
  public boolean hasOwnCanBeParentMethod() {
    return dataHolder.getCanBeAParentMethod() != null;
  }

  @Override
  public boolean hasOwnCanBeAncestorMethod() {
    return dataHolder.getCanBeAnAncestorMethod() != null;
  }

  @Override
  public boolean hasOwnDefaultScopeProvider() {
    return dataHolder.getNodeDefaultSearchScopeProvider() != null;
  }

  @Override
  public String getConceptFqName() {
    return dataHolder.getConceptFqName();
  }

  private <T> boolean executeCanBeMethod(@NotNull CanBeASomethingMethod<T> method, IOperationContext operationContext, T context, @Nullable jetbrains.mps.smodel.runtime.CheckingNodeContext checkingNodeContext) {
    jetbrains.mps.smodel.structure.CheckingNodeContext _checkingNodeContext = null;
    if (checkingNodeContext != null) {
      _checkingNodeContext = new jetbrains.mps.smodel.structure.CheckingNodeContext();
      _checkingNodeContext.setBreakingNode(checkingNodeContext.getBreakingNode());
    }

    boolean result = method.canBe(operationContext, context, _checkingNodeContext);

    if (checkingNodeContext != null) {
      checkingNodeContext.setBreakingNode(_checkingNodeContext.getBreakingNode());
    }

    return result;
  }

  @Override
  public boolean canBeChild(IOperationContext operationContext, SNode parentNode, SNode link, SNode concept, @Nullable CheckingNodeContext checkingNodeContext) {
    if (dataHolder.getCanBeAChildMethod() != null) {
      return executeCanBeMethod(dataHolder.getCanBeAChildMethod(), operationContext, new CanBeAChildContext(parentNode, link, concept), checkingNodeContext);
    } else {
      return super.canBeChild(operationContext, parentNode, link, concept, checkingNodeContext);
    }
  }

  @Override
  public boolean canBeRoot(IOperationContext operationContext, SModel model, @Nullable CheckingNodeContext checkingNodeContext) {
    if (dataHolder.getCanBeARootMethod() != null) {
      return executeCanBeMethod(dataHolder.getCanBeARootMethod(), operationContext, new CanBeARootContext(model), checkingNodeContext);
    } else {
      return super.canBeRoot(operationContext, model, checkingNodeContext);
    }
  }

  @Override
  public boolean canBeParent(IOperationContext operationContext, SNode node, SNode childConcept, SNode link, @Nullable CheckingNodeContext checkingNodeContext) {
    if (dataHolder.getCanBeAParentMethod() != null) {
      return executeCanBeMethod(dataHolder.getCanBeAParentMethod(), operationContext, new CanBeAParentContext(node, childConcept, link), checkingNodeContext);
    } else {
      return super.canBeParent(operationContext, node, childConcept, link, checkingNodeContext);
    }
  }

  @Override
  public boolean canBeAncestor(IOperationContext operationContext, SNode node, SNode childConcept, @Nullable CheckingNodeContext checkingNodeContext) {
    if (dataHolder.getCanBeAnAncestorMethod() != null) {
      return executeCanBeMethod(dataHolder.getCanBeAnAncestorMethod(), operationContext, new CanBeAnAncestorContext(node, childConcept), checkingNodeContext);
    } else {
      return super.canBeAncestor(operationContext, node, childConcept, checkingNodeContext);
    }
  }

  @Override
  public ReferenceScopeProvider getDefaultScopeProvider() {
    if (defaultScopeProvider != null) {
      return defaultScopeProvider;
    } else {
      return super.getDefaultScopeProvider();
    }
  }

  @Override
  public String getAlternativeIcon(SNode node) {
    if (dataHolder.isAlternativeIcon()) {
      return dataHolder.getAlternativeIcon(node);
    } else {
      return super.getAlternativeIcon(node);
    }
  }

  @Override
  public String getDefaultConcreteConceptFqName() {
    return dataHolder.getDefaultConcreteConceptFqName();
  }
}
