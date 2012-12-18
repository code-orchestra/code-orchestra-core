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
package jetbrains.mps.smodel.persistence.def.v3;

import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.refactoring.StructureModificationHistory;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.SModel.ImportElement;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.smodel.persistence.def.*;
import org.jdom.Document;
import org.jdom.Element;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ModelWriter3 implements IModelWriter {
  protected IReferencePersister getReferencePersister() {
    return new ReferencePersister3();
  }

  protected int getModelPersistenceVersion() {
    return 3;
  }

  public Document saveModel(SModel sourceModel) {
    Element rootElement = new Element(ModelPersistence.MODEL);
    rootElement.setAttribute(ModelPersistence.MODEL_UID, sourceModel.getSModelReference().toString());
    Element persistenceElement = new Element(ModelPersistence.PERSISTENCE);
    persistenceElement.setAttribute(ModelPersistence.PERSISTENCE_VERSION, getModelPersistenceVersion() + "");
    rootElement.addContent(persistenceElement);

    //noinspection deprecation
    StructureModificationHistory history = sourceModel.getRefactoringHistory();
    rootElement.addContent(history.toElement());

    // languages
    Set<String> writtenAspects = new HashSet<String>();
    for (ModuleReference languageNamespace : sourceModel.importedLanguages()) {
      Element languageElem = new Element(ModelPersistence.LANGUAGE);
      languageElem.setAttribute(ModelPersistence.NAMESPACE, languageNamespace.toString());
      rootElement.addContent(languageElem);
    }
    for (ImportElement aspectElement : sourceModel.getAdditionalModelVersions()) {
      SModelReference modelReference = aspectElement.getModelReference();
      if (!writtenAspects.contains(modelReference.toString())) {
        writtenAspects.add(modelReference.toString());
        writeAspect(sourceModel, rootElement, modelReference);
      }
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
    Element maxRefID = new Element(ModelPersistence.MAX_IMPORT_INDEX);
    maxRefID.setAttribute(ModelPersistence.VALUE, "" + sourceModel.getMaxImportIndex());
    rootElement.addContent(maxRefID);

    for (ImportElement importElement : sourceModel.importedModels()) {
      Element importElem = new Element(ModelPersistence.IMPORT_ELEMENT);
      importElem.setAttribute(ModelPersistence.MODEL_IMPORT_INDEX, "" + importElement.getReferenceID());
      SModelReference modelReference = importElement.getModelReference();
      importElem.setAttribute(ModelPersistence.MODEL_UID, modelReference.toString());
      importElem.setAttribute(ModelPersistence.VERSION, "" + importElement.getUsedVersion());

      int version = -1;
      SModelDescriptor importedModelDescriptor = SModelRepository.getInstance().getModelDescriptor(modelReference);
      if (importedModelDescriptor instanceof EditableSModelDescriptor) {
        version = ((EditableSModelDescriptor) importedModelDescriptor).getVersion();
      }
      if (version > -1) {
        importElem.setAttribute(ModelPersistence.VERSION, version + "");
      }
      rootElement.addContent(importElem);
    }

    VisibleModelElements visibleModelElements = new DOMVisibleModelElements(rootElement);

    for (SNode root : sourceModel.roots()) {
      saveNode(rootElement, root, visibleModelElements);
    }

    Document document = new Document();
    document.setRootElement(rootElement);
    return document;
  }

  private void writeAspect(SModel sourceModel, Element parent, SModelReference aspectReference) {
    int modelVersion = SModelOperations.getLanguageAspectModelVersion(sourceModel, aspectReference);
    Element aspectModelElement = new Element(ModelPersistence.LANGUAGE_ASPECT);
    aspectModelElement.setAttribute(ModelPersistence.MODEL_UID, aspectReference.toString());
    aspectModelElement.setAttribute(ModelPersistence.VERSION, "" + modelVersion);
    parent.addContent(aspectModelElement);
  }

  public void saveNode(Element container, SNode node) {
    saveNode(container, null, node, true, null);
  }

  private void saveNode(Element parentElement, SNode node, VisibleModelElements visibleModelElements) {
    saveNode(parentElement, null, node, false, visibleModelElements);
  }

  private void saveNode(Element parentElement, String elementName, SNode node, boolean useUIDs, VisibleModelElements visibleModelElements) {
    String theElementName = elementName;
    if (theElementName == null) {
      theElementName = ModelPersistence.NODE;
    }
    Element element = new Element(theElementName);
    DocUtil.setNotNullAttribute(element, ModelPersistence.ROLE, node.getRole_());
    element.setAttribute(ModelPersistence.TYPE, node.getConceptFqName());
    element.setAttribute(ModelPersistence.ID, node.getId());

    // properties ...
    Map<String, String> properties = node.getProperties();
    Set<String> keys = properties.keySet();
    for (String propertyName : keys) {
      Element propertyElement = new Element(ModelPersistence.PROPERTY);
      element.addContent(propertyElement);
      propertyElement.setAttribute(ModelPersistence.NAME, propertyName);
      DocUtil.setNotNullAttribute(propertyElement, ModelPersistence.VALUE, node.getPersistentProperty(propertyName));
    }

    // references ...
    List<SReference> references = node.getReferences();
    IReferencePersister referencePersister = getReferencePersister();
    for (SReference reference : references) {
      referencePersister.saveReference(element, reference, useUIDs, visibleModelElements);
    }

    // children ...
    List<SNode> children = node.getChildren();
    for (SNode childNode : children) {
      saveNode(element, null, childNode, useUIDs, visibleModelElements);
    }

    parentElement.addContent(element);
  }
}
