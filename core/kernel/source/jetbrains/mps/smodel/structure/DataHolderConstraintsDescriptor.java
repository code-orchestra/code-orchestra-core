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

import com.intellij.util.Function;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.constraints.*;
import jetbrains.mps.util.SmallMap;
import jetbrains.mps.util.misc.hash.HashMap;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DataHolderConstraintsDescriptor extends ConstraintsDescriptor {
  private static final Function<ConstraintsDescriptor, Map<String, INodePropertyGetter>> PROPERTY_GETTERS_FUNCTION = new Function<ConstraintsDescriptor, Map<String, INodePropertyGetter>>() {
    @Override
    public Map<String, INodePropertyGetter> fun(ConstraintsDescriptor descriptor) {
      return descriptor.getNodePropertyGetters();
    }
  };
  private static final Function<ConstraintsDescriptor, Map<String, INodePropertySetter>> PROPERTY_SETTERS_FUNCTION = new Function<ConstraintsDescriptor, Map<String, INodePropertySetter>>() {
    @Override
    public Map<String, INodePropertySetter> fun(ConstraintsDescriptor descriptor) {
      return descriptor.getNodePropertySetters();
    }
  };
  private static final Function<ConstraintsDescriptor, Map<String, INodePropertyValidator>> PROPERTY_VALIDATORS_FUNCTION = new Function<ConstraintsDescriptor, Map<String, INodePropertyValidator>>() {
    @Override
    public Map<String, INodePropertyValidator> fun(ConstraintsDescriptor descriptor) {
      return descriptor.getNodePropertyValidators();
    }
  };
  private static final Function<ConstraintsDescriptor, Map<String, INodeReferentSearchScopeProvider>> NON_DEFAULT_SEARCH_SCOPE_FUNCTION = new Function<ConstraintsDescriptor, Map<String, INodeReferentSearchScopeProvider>>() {
    @Override
    public Map<String, INodeReferentSearchScopeProvider> fun(ConstraintsDescriptor descriptor) {
      return descriptor.getNodeNonDefaultSearchScopeProviders();
    }
  };
  private static final Function<ConstraintsDescriptor, Map<String, INodeReferentSetEventHandler>> REFERENCE_SET_HANDLER_FUNCTION = new Function<ConstraintsDescriptor, Map<String, INodeReferentSetEventHandler>>() {
    @Override
    public Map<String, INodeReferentSetEventHandler> fun(ConstraintsDescriptor descriptor) {
      return descriptor.getNodeReferentSetEventHandlers();
    }
  };

  private final String fqName;
  private final ConstraintsDataHolder dataHolder;

  // fields with hierarchy support computed in constructor
  private final CanBeASomethingMethod<CanBeAChildContext> canBeAChildMethod;
  private final CanBeASomethingMethod<CanBeAParentContext> canBeAParentMethod;
  private final CanBeASomethingMethod<CanBeARootContext> canBeARootMethod;
  private final CanBeASomethingMethod<CanBeAnAncestorContext> canBeAnAncestorMethod;

  private final String defaultConcreteConceptFqName;

  private final Map<String, INodePropertyGetter> propertyGetter;
  private final Map<String, INodePropertySetter> propertySetter;
  private final Map<String, INodePropertyValidator> propertyValidator;

  private final INodeReferentSearchScopeProvider nodeDefaultReferentSearchScopeProvider;

  private final Map<String, INodeReferentSearchScopeProvider> nodeNonDefaultSearchScopeProvider;
  private final Map<String, INodeReferentSetEventHandler> nodeReferentSetEventHandlers;

  public DataHolderConstraintsDescriptor(ConstraintsDataHolder dataHolder) {
    this.dataHolder = dataHolder;

    this.fqName = dataHolder.getConceptFqName();

    List<ConstraintsDescriptor> parentDescriptors = getParentDescriptors();

    canBeAChildMethod = getMethodUsingInheritance(parentDescriptors, dataHolder.getCanBeAChildMethod(), CanBeRoles.CHILD);
    canBeAnAncestorMethod = getMethodUsingInheritance(parentDescriptors, dataHolder.getCanBeAnAncestorMethod(), CanBeRoles.ANCESTOR);
    canBeAParentMethod = getMethodUsingInheritance(parentDescriptors, dataHolder.getCanBeAParentMethod(), CanBeRoles.PARENT);
    canBeARootMethod = getMethodUsingInheritance(parentDescriptors, dataHolder.getCanBeARootMethod(), CanBeRoles.ROOT);

    defaultConcreteConceptFqName = dataHolder.getDefaultConcreteConceptFqName();

    propertyGetter = calculate(parentDescriptors, dataHolder.getNodePropertyGetters(), PROPERTY_GETTERS_FUNCTION);
    propertySetter = calculate(parentDescriptors, dataHolder.getNodePropertySetters(), PROPERTY_SETTERS_FUNCTION);
    propertyValidator = calculate(parentDescriptors, dataHolder.getNodePropertyValidators(), PROPERTY_VALIDATORS_FUNCTION);

    nodeNonDefaultSearchScopeProvider = calculate(parentDescriptors, dataHolder.getNodeNonDefaultSearchScopeProviders(), NON_DEFAULT_SEARCH_SCOPE_FUNCTION);
    nodeReferentSetEventHandlers = calculate(parentDescriptors, dataHolder.getNodeReferentSetEventHandlers(), REFERENCE_SET_HANDLER_FUNCTION);

    nodeDefaultReferentSearchScopeProvider = _getNodeDefaultSearchScopeProvider(parentDescriptors, dataHolder.getNodeDefaultSearchScopeProvider());
  }

  private static <T> Map<String, T> calculate(List<ConstraintsDescriptor> parentConstraints, Map<String, T> direct, Function<ConstraintsDescriptor, Map<String, T>> childMapFunction) {
    HashMap<String, T> result = new HashMap<String, T>();
    result.putAll(direct);

    for (ConstraintsDescriptor parent : parentConstraints) {
      Map<String, T> childMap = childMapFunction.fun(parent);
      for (String childProperty : childMap.keySet()) {
        if (!result.containsKey(childProperty)) {
          result.put(childProperty, childMap.get(childProperty));
        }
      }
    }

    return SmallMap.of(result);
  }

  private List<ConstraintsDescriptor> getParentDescriptors() {
    List<ConstraintsDescriptor> descriptors = new ArrayList<ConstraintsDescriptor>();

    // class only for compilation
//    ConceptRegistry conceptRegistry = ConceptRegistry.getInstance();
//    for (String parentName : conceptRegistry.getConceptDescriptor(fqName).getParentsNames()) {
//      ConstraintsDescriptor childDescriptor = conceptRegistry.getConstraintsDescriptor(parentName);
//      if (childDescriptor != null) {
//        // todo: else?
//        descriptors.add(childDescriptor);
//      }
//    }

    return descriptors;
  }

  private static INodeReferentSearchScopeProvider _getNodeDefaultSearchScopeProvider(List<ConstraintsDescriptor> parentDescriptors, INodeReferentSearchScopeProvider direct) {
    if (direct != null) {
      return direct;
    } else {
      for (ConstraintsDescriptor descriptor : parentDescriptors) {
        if (descriptor.getNodeDefaultSearchScopeProvider() != null) {
          return descriptor.getNodeDefaultSearchScopeProvider();
        }
      }
    }
    return null;
  }

  private static <T> CanBeASomethingMethod<T> getMethodUsingInheritance(List<ConstraintsDescriptor> parentDescriptors, CanBeASomethingMethod<T> direct, CanBeRoles role) {
    if (direct != null) {
      return direct;
    } else {
      for (ConstraintsDescriptor parentDescriptor : parentDescriptors) {
        CanBeASomethingMethod<?> superMethod = parentDescriptor.getCanBeASomethingMethod(role);
        if (superMethod != null) {
          return (CanBeASomethingMethod<T>) superMethod;
        }
      }
    }

    return null;
  }


  @Override
  public CanBeASomethingMethod<CanBeAChildContext> getCanBeAChildMethod() {
    return canBeAChildMethod;
  }

  @Override
  public CanBeASomethingMethod<CanBeARootContext> getCanBeARootMethod() {
    return canBeARootMethod;
  }

  @Override
  public CanBeASomethingMethod<CanBeAParentContext> getCanBeAParentMethod() {
    return canBeAParentMethod;
  }

  @Override
  public CanBeASomethingMethod<CanBeAnAncestorContext> getCanBeAnAncestorMethod() {
    return canBeAnAncestorMethod;
  }

  @Override
  public Map<String, INodePropertyGetter> getNodePropertyGetters() {
    return propertyGetter;
  }

  @Override
  public Map<String, INodePropertySetter> getNodePropertySetters() {
    return propertySetter;
  }

  @Override
  public Map<String, INodePropertyValidator> getNodePropertyValidators() {
    return propertyValidator;
  }

  @Override
  public Map<String, INodeReferentSearchScopeProvider> getNodeNonDefaultSearchScopeProviders() {
    return nodeNonDefaultSearchScopeProvider;
  }

  @Override
  public INodeReferentSearchScopeProvider getNodeDefaultSearchScopeProvider() {
    return nodeDefaultReferentSearchScopeProvider;
  }

  @Override
  public Map<String, INodeReferentSetEventHandler> getNodeReferentSetEventHandlers() {
    return nodeReferentSetEventHandlers;
  }

  @Override
  public boolean isAlternativeIcon() {
    return dataHolder.isAlternativeIcon();
  }

  @Override
  public String getAlternativeIcon(SNode node) {
    return dataHolder.getAlternativeIcon(node);
  }

  @Override
  public String getDefaultConcreteConceptFqName() {
    return defaultConcreteConceptFqName;
  }
}
