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

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.behaviour.BehaviorConstants;
import jetbrains.mps.smodel.constraints.*;
import org.jetbrains.annotations.Nullable;

import java.util.Map;

public abstract class ConstraintsDescriptor {
  public enum CanBeRoles {
    CHILD("canBeChild", BehaviorConstants.CAN_BE_A_CHILD_METHOD_NAME, IOperationContext.class, CanBeAChildContext.class),
    PARENT("canBeParent", BehaviorConstants.CAN_BE_A_PARENT_METHOD_NAME, IOperationContext.class, CanBeAParentContext.class),
    ROOT("canBeRoot", BehaviorConstants.CAN_BE_A_ROOT_METHOD_NAME, IOperationContext.class, CanBeARootContext.class),
    ANCESTOR("canBeAncestor", BehaviorConstants.CAN_BE_AN_ANCESTOR_METHOD_NAME, IOperationContext.class, CanBeAnAncestorContext.class);

    public final String roleNameInConstraints;
    public final String methodName;
    public final Class[] parameterTypes;

    CanBeRoles(String roleNameInConstraints, String methodName, Class... parameterTypes) {
      this.roleNameInConstraints = roleNameInConstraints;
      this.methodName = methodName;
      this.parameterTypes = parameterTypes;
    }
  }

  @Nullable
  public abstract CanBeASomethingMethod<CanBeAChildContext> getCanBeAChildMethod();

  @Nullable
  public abstract CanBeASomethingMethod<CanBeARootContext> getCanBeARootMethod();

  @Nullable
  public abstract CanBeASomethingMethod<CanBeAParentContext> getCanBeAParentMethod();

  @Nullable
  public abstract CanBeASomethingMethod<CanBeAnAncestorContext> getCanBeAnAncestorMethod();

  @Nullable
  public CanBeASomethingMethod<?> getCanBeASomethingMethod(CanBeRoles role) {
    switch (role) {
      case ANCESTOR:
        return getCanBeAnAncestorMethod();
      case PARENT:
        return getCanBeAParentMethod();
      case CHILD:
        return getCanBeAChildMethod();
      case ROOT:
        return getCanBeARootMethod();
    }

    // not possible
    return null;
  }

  // property
  public abstract Map<String, INodePropertyGetter> getNodePropertyGetters();

  public INodePropertyGetter getNodePropertyGetter(String name) {
    return getNodePropertyGetters().get(name);
  }

  public abstract Map<String, INodePropertySetter> getNodePropertySetters();

  public INodePropertySetter getNodePropertySetter(String propertyName) {
    return getNodePropertySetters().get(propertyName);
  }

  public abstract Map<String, INodePropertyValidator> getNodePropertyValidators();

  public INodePropertyValidator getNodePropertyValidator(String propertyName) {
    return getNodePropertyValidators().get(propertyName);
  }

  //  search scope
  public abstract Map<String, INodeReferentSearchScopeProvider> getNodeNonDefaultSearchScopeProviders();

  public INodeReferentSearchScopeProvider getNodeNonDefaultSearchScopeProvider(String referentRole) {
    return getNodeNonDefaultSearchScopeProviders().get(referentRole);
  }

  // referent node set event handler
  public abstract Map<String, INodeReferentSetEventHandler> getNodeReferentSetEventHandlers();

  public INodeReferentSetEventHandler getNodeReferentSetEventHandler(String referentRole) {
    return getNodeReferentSetEventHandlers().get(referentRole);
  }

  public abstract INodeReferentSearchScopeProvider getNodeDefaultSearchScopeProvider();

  // todo: remove/move this methods
  public abstract boolean isAlternativeIcon();

  public abstract String getAlternativeIcon(SNode node);

  public abstract String getDefaultConcreteConceptFqName();
}
