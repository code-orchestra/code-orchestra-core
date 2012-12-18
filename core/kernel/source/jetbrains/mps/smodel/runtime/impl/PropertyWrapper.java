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

import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.constraints.INodePropertyGetter;
import jetbrains.mps.smodel.constraints.INodePropertySetter;
import jetbrains.mps.smodel.constraints.INodePropertyValidator;
import jetbrains.mps.smodel.runtime.ConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.PropertyConstraintsDescriptor;
import jetbrains.mps.smodel.runtime.base.BasePropertyConstraintsDescriptor;
import org.jetbrains.annotations.Nullable;

public class PropertyWrapper {
  private PropertyWrapper() {
  }

  public static PropertyConstraintsDescriptor getProperty(final String propertyName, final ConstraintsDescriptor container,
                                                          @Nullable final INodePropertyGetter getter,
                                                          @Nullable final INodePropertySetter setter,
                                                          @Nullable final INodePropertyValidator validator) {
    return new BasePropertyConstraintsDescriptor(propertyName, container) {
      @Override
      public boolean hasOwnGetter() {
        return getter != null;
      }

      @Override
      public boolean hasOwnSetter() {
        return setter != null;
      }

      @Override
      public boolean hasOwnValidator() {
        return validator != null;
      }

      @Override
      public Object getValue(SNode node, IScope scope) {
        if (getter != null) {
          return getter.execPropertyGet(node, propertyName, scope);
        } else {
          return super.getValue(node, scope);
        }
      }

      @Override
      public void setValue(SNode node, String value, IScope scope) {
        if (setter != null) {
          setter.execPropertySet(node, propertyName, value, scope);
        } else {
          super.setValue(node, value, scope);
        }
      }

      @Override
      public boolean validateValue(SNode node, String value, IScope scope) {
        if (validator != null) {
          return validator.checkPropertyValue(node, propertyName, value, scope);
        } else {
          return super.validateValue(node, value, scope);
        }
      }
    };
  }
}
