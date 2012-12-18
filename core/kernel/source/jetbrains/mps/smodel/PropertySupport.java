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
package jetbrains.mps.smodel;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.language.ConceptRegistry;
import jetbrains.mps.smodel.runtime.PropertyConstraintsDescriptor;
import jetbrains.mps.util.JavaNameUtil;
import org.jetbrains.annotations.NotNull;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

public abstract class PropertySupport {
  private static final Logger LOG = Logger.getLogger(PropertySupport.class);

  protected static final String PROPERTY_SUPPORT = "propertySupport";

  /**
   * new validation method
   */
  public boolean canSetValue(SNode node, String propertyName, String value, IScope scope, boolean nullsAlwaysAllowed) {
    if (value == null && nullsAlwaysAllowed) return true;  // can always remove property
    if (value == null) value = "";
    if (!canSetValue(value)) return false;
    PropertyConstraintsDescriptor descriptor = ConceptRegistry.getInstance().getConstraintsDescriptor(node.getConceptFqName()).getProperty(propertyName);
    return canSetValue(descriptor, node, propertyName, value, scope);
  }

  public boolean canSetValue(PropertyConstraintsDescriptor descriptor, SNode node, String propertyName, String value, IScope scope) {
    if (value == null) value = "";
    return descriptor.validateValue(node, value, scope);
  }

  public boolean canSetValue(SNode node, String propertyName, String value, IScope scope) {
    return canSetValue(node, propertyName, value, scope, true);
  }

  /**
   * old validation method - keep it for compatibility
   */
  protected abstract boolean canSetValue(String value);

  public String toInternalValue(String value) {
    return value;
  }

  public String fromInternalValue(String value) {
    return value;
  }

  public static PropertySupport getPropertySupport(@NotNull final SNode propertyDeclaration) {
    return NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<PropertySupport>() {
      public PropertySupport compute() {
        SNode dataType = SNodeUtil.getPropertyDeclaration_DataType(propertyDeclaration);
        if (dataType != null) {
          PropertySupport propertySupport = (PropertySupport) dataType.getUserObject(PROPERTY_SUPPORT);
          if (propertySupport != null) {
            return propertySupport;
          }
          if (SNodeUtil.isInstanceOfPrimitiveDataTypeDeclaration(dataType)) {
            String dataTypeName = dataType.getName();
            if (Primitives.STRING_TYPE.equals(dataTypeName)) {
              propertySupport = new DefaultPropertySupport();
            } else if (Primitives.INTEGER_TYPE.equals(dataTypeName)) {
              propertySupport = new IntegerPropertySupport();
            } else if (Primitives.BOOLEAN_TYPE.equals(dataTypeName)) {
              propertySupport = new BooleanPropertySupport();
            } else {
              throw new RuntimeException("Unknown primitive type: " + dataTypeName);
            }
          } else {
            propertySupport = loadPropertySupport(propertyDeclaration);
          }

          if (propertySupport == null) {
            propertySupport = new DefaultPropertySupport();
          }
          dataType.putUserObject(PROPERTY_SUPPORT, propertySupport);
          return propertySupport;
        }
        return new DefaultPropertySupport();
      }
    });
  }

  private static String getClassName(SNode propertyDataType) {
    return propertyDataType.getName() + "_PropertySupport";
  }

  private static PropertySupport loadPropertySupport(SNode propertyDeclaration) {
    SNode propertyDataType = SNodeUtil.getPropertyDeclaration_DataType(propertyDeclaration);

    SNode cd = propertyDeclaration.getParent();
    Language l = SModelUtil.getDeclaringLanguage(cd);

    String propertySupportClassName = JavaNameUtil.fqClassName(propertyDataType.getModel(), getClassName(propertyDataType));
    PropertySupport propertySupport = null;
    try {
      Class propertySupportClass = l.getClass(propertySupportClassName);
      if (propertySupportClass != null) {
        Constructor constructor = propertySupportClass.getConstructor();
        propertySupport = (PropertySupport) constructor.newInstance();
      } else {
        LOG.error("Can't find a class " + propertySupportClassName);
      }
    } catch (NoSuchMethodException e) {
      LOG.error(e);
    } catch (InstantiationException e) {
      LOG.error(e);
    } catch (IllegalAccessException e) {
      LOG.error(e);
    } catch (InvocationTargetException e) {
      LOG.error(e);
    }
    return propertySupport;
  }

  private static class DefaultPropertySupport extends PropertySupport {
    public boolean canSetValue(String value) {
      return true;
    }
  }

  private static class IntegerPropertySupport extends PropertySupport {
    public boolean canSetValue(String value) {
      try {
        Integer.parseInt(value);
        return true;
      } catch (NumberFormatException e) {
        // it is OK
      }
      return false;
    }
  }

  private static class BooleanPropertySupport extends PropertySupport {
    public boolean canSetValue(String value) {
      return String.valueOf(value).equals("true") || String.valueOf(value).equals("false");
    }

    public String fromInternalValue(String value) {
      if ("true".equals(value)) {
        return value;
      }
      return "false";
    }

    public String toInternalValue(String value) {
      if ("true".equals(value)) {
        return value;
      }
      return null;
    }
  }
}
