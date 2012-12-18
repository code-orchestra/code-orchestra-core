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
import jetbrains.mps.smodel.SNodeUtil;
import jetbrains.mps.smodel.language.ConceptRegistry;
import jetbrains.mps.smodel.runtime.ConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.PropertyConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.PropertyConstraintsDispatchable;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.Nullable;

public class BasePropertyConstraintsDescriptor implements PropertyConstraintsDispatchable {
  private final String name;
  private final ConstraintsDescriptor container;

  private final PropertyConstraintsDescriptor getterDescriptor;
  private final PropertyConstraintsDescriptor setterDescriptor;
  private final PropertyConstraintsDescriptor validatorDescriptor;

  public BasePropertyConstraintsDescriptor(String propertyName, ConstraintsDescriptor container) {
    this.name = propertyName;
    this.container = container;

    if (!isBootstrapProperty(container.getConceptFqName(), propertyName)) {
      if (hasOwnGetter()) {
        getterDescriptor = this;
      } else {
        getterDescriptor = getSomethingUsingInheritance(getContainer().getConceptFqName(), getName(), GETTER_INHERITANCE_PARAMETERS);
      }

      if (hasOwnSetter()) {
        setterDescriptor = this;
      } else {
        setterDescriptor = getSomethingUsingInheritance(getContainer().getConceptFqName(), getName(), SETTER_INHERITANCE_PARAMETERS);
      }

    } else {
      getterDescriptor = null;
      setterDescriptor = null;
    }

    if (hasOwnValidator()) {
      validatorDescriptor = this;
    } else {
      validatorDescriptor = getSomethingUsingInheritance(getContainer().getConceptFqName(), getName(), VALIDATOR_INHERITANCE_PARAMETERS);
    }
  }

  private static boolean isBootstrapProperty(String fqName, String propertyName) {
    String namespace = NameUtil.namespaceFromConceptFQName(fqName);

    // 'bootstrap' properties
    if (namespace.equals("jetbrains.mps.lang.structure") && propertyName.equals(SNodeUtil.property_INamedConcept_name)
      && !fqName.equals("jetbrains.mps.lang.structure.structure.AnnotationLinkDeclaration")) {
      return true;
    }

    if (fqName.equals("jetbrains.mps.lang.typesystem.structure.RuntimeTypeVariable")) {
      // helgins ku-ku!
      return true;
    }

    return false;
  }

  @Nullable
  private static PropertyConstraintsDescriptor getSomethingUsingInheritance(String conceptFqName, String propertyName, InheritanceCalculateParameters parameters) {
    for (String parent : ConceptRegistry.getInstance().getConceptDescriptor(conceptFqName).getParentsNames()) {
      if (!ConceptRegistry.getInstance().getConceptDescriptor(parent).hasProperty(propertyName)) {
        continue;
      }

      ConstraintsDescriptor parentDescriptor = ConceptRegistry.getInstance().getConstraintsDescriptor(parent);
      PropertyConstraintsDescriptor parentPropertyDescriptor = parentDescriptor.getProperty(propertyName);

      PropertyConstraintsDescriptor parentCalculated;

      if (parentPropertyDescriptor instanceof BasePropertyConstraintsDescriptor) {
        parentCalculated = parameters.getParentCalculatedDescriptor((BasePropertyConstraintsDescriptor) parentPropertyDescriptor);
      } else if (parentPropertyDescriptor instanceof PropertyConstraintsDispatchable) {
        if (parameters.hasOwn((PropertyConstraintsDispatchable) parentPropertyDescriptor)) {
          parentCalculated = parentPropertyDescriptor;
        } else {
          parentCalculated = getSomethingUsingInheritance(parent, propertyName, parameters);
        }
      } else {
        parentCalculated = parentPropertyDescriptor;
      }

      if (parentCalculated != null) {
        return parentCalculated;
      }
    }

    return null;
  }

  public boolean isSetterDefault() {
    return setterDescriptor == null;
  }

  public boolean isGetterDefault() {
    return getterDescriptor == null;
  }

  public boolean isValidatorDefault() {
    return validatorDescriptor == null;
  }

  @Override
  public boolean hasOwnGetter() {
    return false;
  }

  @Override
  public boolean hasOwnSetter() {
    return false;
  }

  @Override
  public boolean hasOwnValidator() {
    return false;
  }

  @Override
  public String getName() {
    return name;
  }

  @Override
  public ConstraintsDescriptor getContainer() {
    return container;
  }

  @Override
  public Object getValue(SNode node, IScope scope) {
    return getterDescriptor != null ? getterDescriptor.getValue(node, scope) : node.getPersistentProperty(getName());
  }

  @Override
  public void setValue(SNode node, String value, IScope scope) {
    if (setterDescriptor != null) {
      setterDescriptor.setValue(node, value, scope);
    } else {
      node.setProperty(getName(), value, false);
    }
  }

  @Override
  public boolean validateValue(SNode node, String value, IScope scope) {
    return validatorDescriptor == null || validatorDescriptor.validateValue(node, value, scope);
  }

  @Override
  public boolean isReadOnly() {
    return !(isSetterDefault() && isGetterDefault());
  }

  private static interface InheritanceCalculateParameters {
    PropertyConstraintsDescriptor getParentCalculatedDescriptor(BasePropertyConstraintsDescriptor parentDescriptor);

    boolean hasOwn(PropertyConstraintsDispatchable parentDescriptor);
  }

  private static final InheritanceCalculateParameters GETTER_INHERITANCE_PARAMETERS = new InheritanceCalculateParameters() {
    @Override
    public PropertyConstraintsDescriptor getParentCalculatedDescriptor(BasePropertyConstraintsDescriptor parentDescriptor) {
      return parentDescriptor.getterDescriptor;
    }

    @Override
    public boolean hasOwn(PropertyConstraintsDispatchable parentDescriptor) {
      return parentDescriptor.hasOwnGetter();
    }
  };
  private static final InheritanceCalculateParameters SETTER_INHERITANCE_PARAMETERS = new InheritanceCalculateParameters() {
    @Override
    public PropertyConstraintsDescriptor getParentCalculatedDescriptor(BasePropertyConstraintsDescriptor parentDescriptor) {
      return parentDescriptor.setterDescriptor;
    }

    @Override
    public boolean hasOwn(PropertyConstraintsDispatchable parentDescriptor) {
      return parentDescriptor.hasOwnSetter();
    }
  };
  private static final InheritanceCalculateParameters VALIDATOR_INHERITANCE_PARAMETERS = new InheritanceCalculateParameters() {
    @Override
    public PropertyConstraintsDescriptor getParentCalculatedDescriptor(BasePropertyConstraintsDescriptor parentDescriptor) {
      return parentDescriptor.validatorDescriptor;
    }

    @Override
    public boolean hasOwn(PropertyConstraintsDispatchable parentDescriptor) {
      return parentDescriptor.hasOwnValidator();
    }
  };
}
