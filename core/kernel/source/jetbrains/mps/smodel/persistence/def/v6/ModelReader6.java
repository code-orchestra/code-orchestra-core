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
package jetbrains.mps.smodel.persistence.def.v6;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.persistence.def.*;
import org.jdom.Document;
import org.jdom.Element;
import org.jetbrains.annotations.Nullable;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Michael.Vlassiev
 * Date: Oct 12, 2010
 * Time: 3:08:42 PM
 * To change this template use File | Settings | File Templates.
 */
public class ModelReader6 implements IModelReader {
  private static final Logger LOG = Logger.getLogger(ModelReader6.class);

  private VersionUtil myHelper;

  @Override
  public int getVersion() {
    return 6;
  }

  public SModel readModel(Document document, SModelHeader header) {
    Element rootElement = document.getRootElement();

    SModelReference modelReference = SModelReference.fromString(rootElement.getAttributeValue(ModelPersistence.MODEL_UID));
    SModel model = new SModel(modelReference);
    model.setPersistenceVersion(getVersion());
    model.getSModelHeader().updateDefaults(header);
    myHelper = new VersionUtil(modelReference);

    model.setLoading(true);

    // languages
    for (Element element : (List<Element>) rootElement.getChildren(ModelPersistence.LANGUAGE)) {
      String languageNamespace = element.getAttributeValue(ModelPersistence.NAMESPACE);
      model.addLanguage(ModuleReference.fromString(languageNamespace));
    }

    // languages engaged on generation
    for (Element element : (List<Element>) rootElement.getChildren(ModelPersistence.LANGUAGE_ENGAGED_ON_GENERATION)) {
      String languageNamespace = element.getAttributeValue(ModelPersistence.NAMESPACE);
      model.addEngagedOnGenerationLanguage(ModuleReference.fromString(languageNamespace));
    }

    //devkits
    for (Element element : (List<Element>) rootElement.getChildren(ModelPersistence.DEVKIT)) {
      String devkitNamespace = element.getAttributeValue(ModelPersistence.NAMESPACE);
      model.addDevKit(ModuleReference.fromString(devkitNamespace));
    }

    // imports
    for (Element element : (List<Element>) rootElement.getChildren(ModelPersistence.IMPORT_ELEMENT)) {
      String indexValue = element.getAttributeValue(ModelPersistence.MODEL_IMPORT_INDEX);
      int usedModelVersion = Integer.parseInt(element.getAttributeValue(ModelPersistence.VERSION, "-1"));
      String importedModelUIDString = element.getAttributeValue(ModelPersistence.MODEL_UID);
      myHelper.addImport(model, indexValue, importedModelUIDString, usedModelVersion, element.getAttributeValue(ModelPersistence.IMPLICIT) != null);
    }

    // nodes
    for (Element child : (List<Element>) rootElement.getChildren(ModelPersistence.NODE)) {
      SNode snode = readNode(child, model);
      if (snode != null) {
        model.addRoot(snode);
      }
    }

    model.setLoading(false);
    return model;
  }

  @Nullable
  protected SNode readNode(Element nodeElement, SModel model) {
    String conceptFqName = myHelper.readType(nodeElement.getAttributeValue(ModelPersistence.TYPE));
    SNode node = new SNode(model, conceptFqName);

    String idValue = nodeElement.getAttributeValue(ModelPersistence.ID);
    if (idValue != null) {
      SNodeId id = SNodeId.fromString(idValue);
      if (id == null) {
        LOG.error("invalid id string");
        return null;
      }
      node.setId(id);
    }

    for (Element element : (List<Element>) nodeElement.getChildren(ModelPersistence.PROPERTY)) {
      String propertyName = myHelper.readName(element.getAttributeValue(ModelPersistence.NAME));
      String propertyValue = element.getAttributeValue(ModelPersistence.VALUE);
      if (propertyValue != null) {
        node.setProperty(propertyName, propertyValue);
      }
    }

    for (Element link : (List<Element>) nodeElement.getChildren(ModelPersistence.LINK)) {
      String role = link.getAttributeValue(ModelPersistence.ROLE);
      String target = link.getAttributeValue(ModelPersistence.TARGET_NODE_ID);
      String resolveInfo = link.getAttributeValue(ModelPersistence.RESOLVE_INFO);
      SReference reference = myHelper.readLink(node, role, target, resolveInfo);
      if (reference != null) node.addReference(reference);
    }

    for (Element child : (List<Element>) nodeElement.getChildren(ModelPersistence.NODE)) {
      String role = myHelper.readRole(child.getAttributeValue(ModelPersistence.ROLE));
      SNode childNode = readNode(child, model);
      if (role == null || childNode == null) {
        LOG.errorWithTrace("Error reading child node in node " + node.getDebugText());
      } else {
        node.addChild(role, childNode);
      }
    }

    return node;
  }
}
