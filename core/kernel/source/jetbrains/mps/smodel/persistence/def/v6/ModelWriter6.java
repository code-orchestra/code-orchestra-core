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

import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.SModel.ImportElement;
import jetbrains.mps.smodel.persistence.def.DocUtil;
import jetbrains.mps.smodel.persistence.def.IModelWriter;
import jetbrains.mps.smodel.persistence.def.ModelPersistence;
import org.jdom.Document;
import org.jdom.Element;

public class ModelWriter6 implements IModelWriter {
  private VersionUtil myHelper;
  private SModel myModel;

  protected int getModelPersistenceVersion() {
    return 6;
  }

  public Document saveModel(SModel sourceModel) {
    myModel = sourceModel;
    myHelper = new VersionUtil(sourceModel);

    Element rootElement = new Element(ModelPersistence.MODEL);
    rootElement.setAttribute(ModelPersistence.MODEL_UID, sourceModel.getSModelReference().toString());
    Element persistenceElement = new Element(ModelPersistence.PERSISTENCE);
    persistenceElement.setAttribute(ModelPersistence.PERSISTENCE_VERSION, getModelPersistenceVersion() + "");
    rootElement.addContent(persistenceElement);

    // languages
    for (ModuleReference languageNamespace : sourceModel.importedLanguages()) {
      Element languageElem = new Element(ModelPersistence.LANGUAGE);
      languageElem.setAttribute(ModelPersistence.NAMESPACE, languageNamespace.toString());
      rootElement.addContent(languageElem);
    }

    // languages engaged on generation
    for (ModuleReference languageNamespace : sourceModel.engagedOnGenerationLanguages()) {
      Element languageElem = new Element(ModelPersistence.LANGUAGE_ENGAGED_ON_GENERATION);
      languageElem.setAttribute(ModelPersistence.NAMESPACE, languageNamespace.toString());
      rootElement.addContent(languageElem);
    }

    //devkits
    for (ModuleReference devkitNamespace : sourceModel.importedDevkits()) {
      Element devkitElem = new Element(ModelPersistence.DEVKIT);
      devkitElem.setAttribute(ModelPersistence.NAMESPACE, devkitNamespace.toString());
      rootElement.addContent(devkitElem);
    }

    // imports
    for (ImportElement importElement : sourceModel.importedModels()) {
      Element importElem = new Element(ModelPersistence.IMPORT_ELEMENT);
      importElem.setAttribute(ModelPersistence.MODEL_IMPORT_INDEX, "" + myHelper.genImportIndex(importElement));
      importElem.setAttribute(ModelPersistence.MODEL_UID, importElement.getModelReference().toString());
      importElem.setAttribute(ModelPersistence.VERSION, "" + importElement.getUsedVersion());
      rootElement.addContent(importElem);
    }
    for (ImportElement importElement : sourceModel.getAdditionalModelVersions()) {
      Element importElem = new Element(ModelPersistence.IMPORT_ELEMENT);
      importElem.setAttribute(ModelPersistence.MODEL_IMPORT_INDEX, "" + myHelper.genImportIndex(importElement));
      importElem.setAttribute(ModelPersistence.MODEL_UID, importElement.getModelReference().toString());
      importElem.setAttribute(ModelPersistence.VERSION, "" + importElement.getUsedVersion());
      importElem.setAttribute(ModelPersistence.IMPLICIT, "yes");
      rootElement.addContent(importElem);
    }

    // roots
    saveRootStubs(rootElement, sourceModel);   // only for quick roots access
    for (SNode root : sourceModel.roots()) {
      saveNode(rootElement, root, true);
    }

    return new Document(rootElement);
  }

  protected void saveRootStubs(Element parent, SModel model) {
    Element roots = new Element(ModelPersistence.ROOT_STUBS);
    for (SNode root : model.roots()) {
      saveNode(roots, root, false);
    }
    parent.addContent(roots);
  }

  protected void saveNode(Element parentElement, SNode node, boolean saveChildren) {
    Element element = new Element(ModelPersistence.NODE);

    DocUtil.setNotNullAttribute(element, ModelPersistence.ROLE, myHelper.genRole(node));
    //DocUtil.setNotNullAttribute(element, ModelPersistence.ROLE_ID, myHelper.genRoleId(node));
    element.setAttribute(ModelPersistence.TYPE, myHelper.genType(node));
    //DocUtil.setNotNullAttribute(element, ModelPersistence.TYPE_ID, myHelper.genTypeId(node));
    element.setAttribute(ModelPersistence.ID, node.getId());

    for (String propertyName : node.getProperties().keySet()) {
      Element propertyElement = new Element(ModelPersistence.PROPERTY);
      propertyElement.setAttribute(ModelPersistence.NAME, myHelper.genName(node, propertyName));
      //DocUtil.setNotNullAttribute(propertyElement, ModelPersistence.NAME_ID, myHelper.genNameId(node, propertyName));
      DocUtil.setNotNullAttribute(propertyElement, ModelPersistence.VALUE, node.getPersistentProperty(propertyName));
      element.addContent(propertyElement);
    }

    for (SReference reference : node.getReferencesIterable()) {
      Element linkElement = new Element(ModelPersistence.LINK);
      linkElement.setAttribute(ModelPersistence.ROLE, myHelper.genRole(reference));
      //DocUtil.setNotNullAttribute(linkElement, ModelPersistence.ROLE_ID, myHelper.genRoleId(reference));
      linkElement.setAttribute(ModelPersistence.TARGET_NODE_ID, myHelper.genTarget(reference));
      DocUtil.setNotNullAttribute(linkElement, ModelPersistence.RESOLVE_INFO, reference.getResolveInfo());
      element.addContent(linkElement);
    }

    if (saveChildren) {
      for (SNode childNode : node.getChildren()) {
        saveNode(element, childNode, true);
      }
    }

    parentElement.addContent(element);
  }
}
