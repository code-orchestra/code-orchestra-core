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
package jetbrains.mps.smodel.persistence.def;

import jetbrains.mps.smodel.SModelReference;
import org.jdom.Element;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Igor Alshannikov
 * Oct 9, 2007
 */
public class DOMVisibleModelElements implements VisibleModelElements {
  private Map<Integer, SModelReference> myVisibleModelElements = new HashMap<Integer, SModelReference>();
  private int myMaxVisibleModelIndex = 1;
  private Element myModelElement;

  public DOMVisibleModelElements(Element modelElement) {
    myModelElement = modelElement;
    parseVisibleElements();
  }

  private void parseVisibleElements() {
    List visibles = myModelElement.getChildren(ModelPersistence.VISIBLE_ELEMENT);
    for (Object aVisible : visibles) {
      Element element = (Element) aVisible;
      String indexValue = element.getAttributeValue(ModelPersistence.MODEL_IMPORT_INDEX);
      int index = Integer.parseInt(indexValue);
      String visibleModelUIDString = element.getAttributeValue(ModelPersistence.MODEL_UID);
      myVisibleModelElements.put(index, SModelReference.fromString(visibleModelUIDString));
      myMaxVisibleModelIndex = Math.max(index, myMaxVisibleModelIndex);
    }
  }

  public int getVisibleModelIndex(SModelReference modelReference) {
    for (Map.Entry<Integer, SModelReference> entry : myVisibleModelElements.entrySet()) {
      if (modelReference.equals(entry.getValue())) {
        return entry.getKey();
      }
    }
    return addModel(modelReference);
  }

  private int addModel(SModelReference modelReference) {
    myMaxVisibleModelIndex++;
    myVisibleModelElements.put(myMaxVisibleModelIndex, modelReference);
    Element visibleElement = new Element(ModelPersistence.VISIBLE_ELEMENT);
    visibleElement.setAttribute(ModelPersistence.MODEL_IMPORT_INDEX, myMaxVisibleModelIndex + "");
    visibleElement.setAttribute(ModelPersistence.MODEL_UID, modelReference.toString());
    myModelElement.addContent(visibleElement);
    return myMaxVisibleModelIndex;
  }

  public SModelReference getModelUID(int index) {
    return myVisibleModelElements.get(index);
  }
}
