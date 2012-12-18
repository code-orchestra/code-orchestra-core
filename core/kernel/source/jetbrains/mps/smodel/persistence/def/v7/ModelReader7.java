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
package jetbrains.mps.smodel.persistence.def.v7;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.refactoring.ModelLinkMap;
import jetbrains.mps.refactoring.StructureModificationProcessor;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.nodeidmap.RegularNodeIdMap;
import jetbrains.mps.smodel.persistence.def.IModelReader;
import jetbrains.mps.smodel.persistence.def.ModelPersistence;
import jetbrains.mps.util.Pair;
import jetbrains.mps.xmlQuery.runtime.AttributeUtils;
import org.jdom.Document;
import org.jdom.Element;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.List;

public class ModelReader7 implements IModelReader {
  private static final Logger LOG = Logger.getLogger(ModelReader7.class);

  private ReadHelper myHelper;
  private ModelLinkMap myLinkMap;

  @Override
  public int getVersion() {
    return 7;
  }

  public SModel readModel(Document document, SModelHeader header) {
    Element rootElement = document.getRootElement();

    SModelReference modelReference = SModelReference.fromString(rootElement.getAttributeValue(ModelPersistence.MODEL_UID));
    SModel model = new SModel(modelReference,new RegularNodeIdMap());
    model.setPersistenceVersion(getVersion());
    model.getSModelHeader().updateDefaults(header);
    model.getSModelHeader().setVersion(AttributeUtils.integerWithDefault(rootElement.getAttributeValue(SModelHeader.VERSION), -1));
    model.getSModelHeader().setDoNotGenerate(AttributeUtils.booleanWithDefault(rootElement.getAttributeValue(SModelHeader.DO_NOT_GENERATE), false));
    myHelper = new ReadHelper(modelReference);
    myLinkMap = new ModelLinkMap(model);

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
      myHelper.addImportToModel(model, indexValue, importedModelUIDString, usedModelVersion, element.getAttributeValue(ModelPersistence.IMPLICIT) != null);
    }

    // roots
    Element roots = rootElement.getChild(ModelPersistence.ROOTS);
    for (Element element : (List<Element>) roots.getChildren(ModelPersistence.NODE)) {
      SNode node = readNode(element, model, true);
      if (node != null) {
        model.addRoot(node);
      }
    }
    // nodes
    for (Element root : (List<Element>) rootElement.getChildren(ModelPersistence.ROOT_CONTENT)) {
      SNode node = model.getNodeById(SNodeId.fromString(root.getAttributeValue(ModelPersistence.ID)));
      if (node == null) {
        LOG.errorWithTrace("Cannot find root for " + root.getAttributeValue(ModelPersistence.ID));
        continue;
      }
      readChildren(node, root);
    }

    new StructureModificationProcessor(myLinkMap, model).updateModelOnLoad();
    model.setLoading(false);
    return model;
  }

  @Nullable
  protected SNode readNode(Element nodeElement, SModel model, boolean isRootStub) {
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
    myLinkMap.addTypeLocation(myHelper.readLinkId(nodeElement.getAttributeValue(ModelPersistence.TYPE_ID)), node);

    for (Element element : (List<Element>) nodeElement.getChildren(ModelPersistence.PROPERTY)) {
      String propertyName = myHelper.readName(element.getAttributeValue(ModelPersistence.NAME));
      String propertyValue = element.getAttributeValue(ModelPersistence.VALUE);
      if (propertyValue != null) {
        node.setProperty(propertyName, propertyValue, false);
        myLinkMap.addNameLocation(myHelper.readLinkId(element.getAttributeValue(ModelPersistence.NAME_ID)), node, propertyName);
      }
    }

    for (Element link : (List<Element>) nodeElement.getChildren(ModelPersistence.LINK)) {
      String target = link.getAttributeValue(ModelPersistence.TARGET_NODE_ID);
      String resolveInfo = link.getAttributeValue(ModelPersistence.RESOLVE_INFO);
      String role = myHelper.readRole(link.getAttributeValue(ModelPersistence.ROLE));
      Pair<Boolean, SNodePointer> pptr = myHelper.readLink_internal(target);
      SNodePointer ptr = pptr.o2;
      if (ptr == null || ptr.getModelReference() == null) {
        LOG.error("couldn't create reference '" + role + "' : from " + target);
        continue;
      }
//      if (pptr.o1) {
//        DynamicReference ref = new DynamicReference(role, node, ptr.getModelReference(), resolveInfo);
//        myLinkMap.addDynamicReference(ptr.getModelReference(), ref);
//        node.addReference(ref);
//        myLinkMap.addRoleLocation(myHelper.readLinkId(link.getAttributeValue(ModelPersistence.ROLE_ID)), ref);
//      } else {
        StaticReference ref = new StaticReference(role, node, ptr.getModelReference(), ptr.getNodeId(), resolveInfo);
        myLinkMap.addTargetLocation(ptr, ref);
        node.addReference(ref);
        myLinkMap.addRoleLocation(myHelper.readLinkId(link.getAttributeValue(ModelPersistence.ROLE_ID)), ref);
//      }
    }

    if (!isRootStub)
      readChildren(node, nodeElement);

    return node;
  }

  protected void readChildren(@NotNull SNode node, @NotNull Element nodeElement) {
    for (Element child : (List<Element>) nodeElement.getChildren(ModelPersistence.NODE)) {
      SNode childNode = readNode(child, node.getModel(), false);
      String role = myHelper.readRole(child.getAttributeValue(ModelPersistence.ROLE));
      if (role == null || childNode == null) {
        LOG.errorWithTrace("Error reading child node in node " + node.getDebugText());
      } else {
        node.addChild(role, childNode);
        myLinkMap.addRoleLocation(myHelper.readLinkId(child.getAttributeValue(ModelPersistence.ROLE_ID)), childNode);
      }
    }
  }
}
