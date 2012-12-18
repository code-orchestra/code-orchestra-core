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
package jetbrains.mps.ide.components;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.*;
import org.jdom.Element;

/**
 * @author Kostik
 */
public class ComponentsUtil {
  private static final Logger LOG = Logger.getLogger(ComponentsUtil.class);

  public static final String NODE = "node";
  public static final String MODEL = "model";
  public static final String MODULE = "module"; // old
  public static final String ID = "id";
  public static final String NUMBER = "number";

  public static Element nodeToElement(SNode node) {
    Element nodeElement = new Element(NODE);
    SModel model = node.getModel();
    nodeElement.setAttribute(MODEL, model.getSModelReference().toString());
    nodeElement.setAttribute(ID, node.getId());
    return nodeElement;
  }

  public static SNode nodeFromElement(Element nodeElement) {
    return nodeFromElement(nodeElement, GlobalScope.getInstance());
  }

  //do not remove it. we need it for cell info

  public static SNode nodeFromElement(Element nodeElement, IScope scope) {
    String modelUID = nodeElement.getAttributeValue(MODEL);
    String id = nodeElement.getAttributeValue(ID);
    SModelDescriptor modelDescriptor = scope.getModelDescriptor(SModelReference.fromString(modelUID));
    if (modelDescriptor == null) return null;
    return modelDescriptor.getSModel().getNodeById(id);
  }

  public static SNodePointer nodePointerFromElement(Element nodeElement) {
    String modelUID = nodeElement.getAttributeValue(MODEL);
    String id = nodeElement.getAttributeValue(ID);
    return new SNodePointer(modelUID, id);
  }
}
