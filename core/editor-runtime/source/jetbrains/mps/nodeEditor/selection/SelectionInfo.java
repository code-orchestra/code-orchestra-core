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
package jetbrains.mps.nodeEditor.selection;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.cells.CellInfo;
import jetbrains.mps.nodeEditor.cells.DefaultCellInfo;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.MPSModuleRepository;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 * Date: 1/28/11
 * Time: 6:10 PM
 * To change this template use File | Settings | File Templates.
 */
public class SelectionInfo {
  private static final Logger LOG = Logger.getLogger(SelectionInfo.class);

  private static final String CLASS_NAME_ATTRIBUTE = "className";
  private static final String MODULE_ID_ATTRIBUTE = "moduleID";
  private static final String CELL_INFO_ELEMENT_NAME = "cellInfo";
  private static final String PROPERTY_ELEMENT_NAME = "property";
  private static final String PROPERTY_NAME_ATTRIBUTE = "name";
  private static final String PROPERTY_VALUE_ATTRIBUTE = "value";


  private String mySelectionClassName;
  private String myModuleID;
  private Map<String, String> myProperties = new HashMap<String, String>();
  private DefaultCellInfo myCellInfo = null;

  public SelectionInfo(Element element) {
    mySelectionClassName = element.getAttributeValue(CLASS_NAME_ATTRIBUTE);
    myModuleID = element.getAttributeValue(MODULE_ID_ATTRIBUTE);
    for (Object childElement : element.getChildren(PROPERTY_ELEMENT_NAME)) {
      Element entry = (Element) childElement;
      String name = entry.getAttributeValue(PROPERTY_NAME_ATTRIBUTE);
      assert name != null;
      String value = entry.getAttributeValue(PROPERTY_VALUE_ATTRIBUTE);
      assert value != null;
      myProperties.put(name, value);
    }
    Element cellInfoElement = element.getChild(CELL_INFO_ELEMENT_NAME);
    if (cellInfoElement != null) {
      myCellInfo = DefaultCellInfo.loadFrom(cellInfoElement);
    }
  }

  public SelectionInfo(@NotNull String selectionClassName, String moduleID) {
    this(selectionClassName);
    myModuleID = moduleID;
  }

  public SelectionInfo(@NotNull String selectionClassName) {
    mySelectionClassName = selectionClassName;
  }

  public Map<String, String> getPropertiesMap() {
    return myProperties;
  }

  public void setCellInfo(CellInfo cellInfo) throws SelectionStoreException {
    if (!(cellInfo instanceof DefaultCellInfo)) {
      throw new SelectionStoreException("CellInfo is different from DefaultCellInfo: " + cellInfo);
    }
    myCellInfo = (DefaultCellInfo) cellInfo;
  }

  Selection createSelection(EditorComponent editorComponent) {
    try {
      Class<Selection> selectionClass;
      if (myModuleID != null) {
        IModule module = MPSModuleRepository.getInstance().getModuleByUID(myModuleID);
        if (module == null) {
          LOG.error("Specified selection class module was not found by ID: " + myModuleID);
          return null;
        }
        selectionClass = module.getClass(mySelectionClassName);
      } else {
        selectionClass = (Class<Selection>) getClass().getClassLoader().loadClass(mySelectionClassName);
      }
      if (!Selection.class.isAssignableFrom(selectionClass)) {
        LOG.error("Serialized selection class: " + mySelectionClassName + " is not a subclas of " + Selection.class.getName());
        return null;
      }
      Constructor<Selection> constructor = selectionClass.getConstructor(EditorComponent.class, Map.class, CellInfo.class);
      return constructor.newInstance(editorComponent, myProperties, myCellInfo);
    } catch (ClassNotFoundException e) {
      LOG.error(e);
      return null;
    } catch (NoSuchMethodException e) {
      LOG.error(e);
      return null;
    } catch (InvocationTargetException e) {
      if (e.getTargetException() instanceof SelectionRestoreException) {
        /**
         * Skipping this exception because it is indicating that selection was not restored due to some changes in
         * associated model(s).
         *
         * For example: element that was indicated as selected before is not in a model anymore (was deleter).
         */
        return null;
      }
      LOG.error(e);
      return null;
    } catch (InstantiationException e) {
      LOG.error(e);
      return null;
    } catch (IllegalAccessException e) {
      LOG.error(e);
      return null;
    }
  }

  public void persistToXML(Element element) {
    element.setAttribute(CLASS_NAME_ATTRIBUTE, mySelectionClassName);
    if (myModuleID != null) {
      element.setAttribute(MODULE_ID_ATTRIBUTE, myModuleID);
    }
    for (Entry<String, String> propertyEntry : myProperties.entrySet()) {
      Element propertyElement = new Element(PROPERTY_ELEMENT_NAME);
      propertyElement.setAttribute(PROPERTY_NAME_ATTRIBUTE, propertyEntry.getKey());
      propertyElement.setAttribute(PROPERTY_VALUE_ATTRIBUTE, propertyEntry.getValue());
      element.addContent(propertyElement);
    }
    if (myCellInfo != null) {
      Element cellInfoElement = new Element(CELL_INFO_ELEMENT_NAME);
      myCellInfo.saveTo(cellInfoElement);
      element.addContent(cellInfoElement);
    }
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    SelectionInfo that = (SelectionInfo) o;

    if (!mySelectionClassName.equals(that.mySelectionClassName)) return false;
    if (myCellInfo != null ? !myCellInfo.equals(that.myCellInfo) : that.myCellInfo != null) return false;
    if (!myProperties.equals(that.myProperties)) return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result = mySelectionClassName.hashCode();
    result = 31 * result + myProperties.hashCode();
    result = 31 * result + (myCellInfo != null ? myCellInfo.hashCode() : 0);
    return result;
  }

  public static class Util {
    public static int getIntProperty(Map<String, String> properties, String propertyName) throws SelectionStoreException {
      String propertyValue = properties.get(propertyName);
      if (propertyValue == null) {
        throw new SelectionStoreException("Cannot load int property - property value was not specified for propertyName = " + propertyName);
      }
      try {
        return Integer.parseInt(propertyValue);
      } catch (NumberFormatException e) {
        throw new SelectionStoreException("Unable to parse integer position value: " + propertyValue);
      }
    }

    public static boolean getBooleanProperty(Map<String, String> properties, String propertyName) throws SelectionStoreException {
      String propertyValue = properties.get(propertyName);
      if (propertyValue == null) {
        throw new SelectionStoreException("Cannot load boolean property - property value was not specified for propertyName = " + propertyName);
      }
      return Boolean.parseBoolean(propertyValue);
    }

    public static Enum getEnumProperty(Map<String, String> properties, String propertyName, Class<? extends Enum> enumClass, Enum defaultPropertyValue) throws SelectionStoreException {
      String propertyValue = properties.get(propertyName);
      if (propertyValue == null) {
        return defaultPropertyValue;
//        throw new SelectionStoreException("Cannot load enum property - property value was not specified for propertyName = " + propertyName);
      }
      try {
        return Enum.valueOf(enumClass, propertyValue);
      } catch (IllegalArgumentException ex) {
        throw new SelectionStoreException("Invalid enum literal name specified: " + propertyValue + " for enum: " + enumClass.getCanonicalName());
      }
    }
  }
}
