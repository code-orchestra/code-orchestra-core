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

import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.refactoring.StructureModificationHistory;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.SModel.ImportElement;
import jetbrains.mps.smodel.persistence.def.*;
import org.jdom.Document;
import org.jdom.Element;
import org.jetbrains.annotations.Nullable;

import java.util.ArrayList;
import java.util.List;

public class ModelReader3 implements IModelReader {
  private static final Logger LOG = Logger.getLogger(ModelReader3.class);

  protected String getLegacyImportedModelUIDString(Element element) {
    return null;
  }

  protected Element getLegacyMaxImportIndexElement(Element rootElement) {
    return null;
  }

  protected String getLegacyModelName(String modelShortName, Element rootElement) {
    return null;
  }

  protected String processConceptFQName(String rawFQName) {
    return rawFQName;
  }

  protected IReferencePersister createReferencePersister() {
    return new ReferencePersister3();
  }

  protected String upgradeStereotype(String stereotype) {
    if (SModelStereotype.TEMPLATES.equals(stereotype)) {
      return SModelStereotype.GENERATOR;
    }
    return stereotype;
  }

  @Override
  public int getVersion() {
    return 3;
  }

  public SModel readModel(Document document, SModelHeader header) {
    Element rootElement = document.getRootElement();

    SModelReference modelReference = SModelReference.fromString(rootElement.getAttributeValue(ModelPersistence.MODEL_UID));
    SModel model = new SModel(modelReference);
    model.setPersistenceVersion(getVersion());
    model.getSModelHeader().updateDefaults(header);

    model.setLoading(true);
    try {
      Element maxImportIndex = rootElement.getChild(ModelPersistence.MAX_IMPORT_INDEX);
      if (maxImportIndex == null) {
        maxImportIndex = getLegacyMaxImportIndexElement(rootElement); // old manner
      }
      model.setMaxImportIndex(DocUtil.readIntAttributeValue(maxImportIndex, ModelPersistence.VALUE));
    } catch (Throwable e) {
      LOG.error(e);
    }

    // languages
    List languages = rootElement.getChildren(ModelPersistence.LANGUAGE);
    for (Object language : languages) {
      Element element = (Element) language;
      String languageNamespace = element.getAttributeValue(ModelPersistence.NAMESPACE);
      model.addLanguage(ModuleReference.fromString(languageNamespace));
      List<Element> aspectElements = element.getChildren(ModelPersistence.LANGUAGE_ASPECT);

      //aspect models versions
      readLanguageAspects(model, aspectElements);
    }
    //additional aspects
    List<Element> aspectElements = rootElement.getChildren(ModelPersistence.LANGUAGE_ASPECT);
    readLanguageAspects(model, aspectElements);

    // languages engaged on generation
    List languagesEOG = rootElement.getChildren(ModelPersistence.LANGUAGE_ENGAGED_ON_GENERATION);
    for (Object languageEOG : languagesEOG) {
      Element element = (Element) languageEOG;
      String languageNamespace = element.getAttributeValue(ModelPersistence.NAMESPACE);
      model.addEngagedOnGenerationLanguage(ModuleReference.fromString(languageNamespace));
    }

    //devkits
    List devkits = rootElement.getChildren(ModelPersistence.DEVKIT);
    for (Object devkit : devkits) {
      Element element = (Element) devkit;
      String devkitNamespace = element.getAttributeValue(ModelPersistence.NAMESPACE);
      model.addDevKit(ModuleReference.fromString(devkitNamespace));
    }

    // imports
    List imports = rootElement.getChildren(ModelPersistence.IMPORT_ELEMENT);
    for (Object anImport : imports) {
      Element element = (Element) anImport;

      String indexValue = element.getAttributeValue(ModelPersistence.MODEL_IMPORT_INDEX, element.getAttributeValue("referenceID"));
      int importIndex = Integer.parseInt(indexValue);

      String usedModelVersionString = element.getAttributeValue(ModelPersistence.VERSION);
      int usedModelVersion = -1;
      try {
        if (usedModelVersionString != null) {
          usedModelVersion = Integer.parseInt(usedModelVersionString);
        }
      } catch (Throwable t) {
        LOG.error(t);
      }

      String importedModelUIDString = element.getAttributeValue(ModelPersistence.MODEL_UID);

      if (importedModelUIDString == null) {
        // read in old manner...
        importedModelUIDString = getLegacyImportedModelUIDString(element);
      }

      if (importedModelUIDString == null) {
        LOG.error("Error loading import element for index " + importIndex + " in " + model.getSModelReference());
        continue;
      }
      if (importIndex > model.getMaxImportIndex()) {
        LOG.warning("Import element " + importIndex + ":" + importedModelUIDString + " greater then max import index (" + model.getMaxImportIndex() + ") in " + model.getSModelReference());
        model.setMaxImportIndex(importIndex);
      }

      SModelReference importedModelReference = SModelReference.fromString(importedModelUIDString);
      importedModelReference = upgradeModelUID(importedModelReference);
      model.addModelImport(new ImportElement(importedModelReference, importIndex, usedModelVersion));
    }

    ArrayList<IReferencePersister> referenceDescriptors = new ArrayList<IReferencePersister>();

    StructureModificationHistory history = new StructureModificationHistory();
    //noinspection deprecation
    model.setRefactoringHistory(history);
    history.fromElement(rootElement.getChild(StructureModificationHistory.REFACTORING_HISTORY));

    // nodes
    List children = rootElement.getChildren(ModelPersistence.NODE);
    for (Object child : children) {
      Element element = (Element) child;
      SNode snode = readNode(element, model, referenceDescriptors, false);
      if (snode != null) {
        model.addRoot(snode);
      }
    }

    VisibleModelElements visibleModelElements = new DOMVisibleModelElements(rootElement);
    for (IReferencePersister referencePersister : referenceDescriptors) {
      referencePersister.createReferenceInModel(model, visibleModelElements);
    }

    model.setLoading(false);
    return model;
  }

  public SModelReference upgradeModelUID(SModelReference modelReference) {
    return new SModelReference(new SModelFqName(modelReference.getLongName(), upgradeStereotype(modelReference.getStereotype())), modelReference.getSModelId());
  }

  protected void readLanguageAspects(SModel model, List<Element> aspectElements) {
    for (Element aspectElement : aspectElements) {
      String aspectModelUID = aspectElement.getAttributeValue(ModelPersistence.MODEL_UID);
      String versionString = aspectElement.getAttributeValue(ModelPersistence.VERSION);
      int version = -1;
      if (versionString != null) {
        try {
          version = Integer.parseInt(versionString);
        } catch (Throwable t) {
          LOG.error(t);
        }
      }
      if (aspectModelUID != null) {
        model.addAdditionalModelVersion(upgradeModelUID(SModelReference.fromString(aspectModelUID)), version);
      }
    }
  }

  public SNode readNode(Element nodeElement, SModel model) {
    return readNode(nodeElement, model, true, null);
  }

  @Nullable
  protected SNode readNode(
    Element nodeElement,
    SModel model,
    boolean useUIDs,
    VisibleModelElements visibleModelElements) {
    List<IReferencePersister> referenceDescriptors = new ArrayList<IReferencePersister>();
    SNode result = readNode(nodeElement, model, referenceDescriptors, useUIDs);
    for (IReferencePersister referencePersister : referenceDescriptors) {
      referencePersister.createReferenceInModel(model, visibleModelElements);
    }
    return result;
  }

  @Nullable
  protected SNode readNode(
    Element nodeElement,
    SModel model,
    List<IReferencePersister> referenceDescriptors,
    boolean useUIDs
  ) {
    String rawFQName = nodeElement.getAttributeValue(ModelPersistence.TYPE);
    String conceptFqName = processConceptFQName(rawFQName);
    SNode node = new SNode(model, conceptFqName);

    String idValue = nodeElement.getAttributeValue(ModelPersistence.ID);
    if (idValue != null) {
      node.setId(SNodeId.fromString(idValue));
    }

    List properties = nodeElement.getChildren(ModelPersistence.PROPERTY);
    for (Object property : properties) {
      Element propertyElement = (Element) property;
      String propertyName = propertyElement.getAttributeValue(ModelPersistence.NAME);
      String propertyValue = propertyElement.getAttributeValue(ModelPersistence.VALUE);
      if (propertyValue != null) {
        node.setProperty(propertyName, propertyValue);
      }
    }

    List links = nodeElement.getChildren(ModelPersistence.LINK);
    for (Object link : links) {
      Element linkElement = (Element) link;
      IReferencePersister referencePersister = createReferencePersister();
      referencePersister.fillFields(linkElement, node, useUIDs);
      referenceDescriptors.add(referencePersister);
    }

    List childNodes = nodeElement.getChildren(ModelPersistence.NODE);
    for (Object childNode1 : childNodes) {
      Element childNodeElement = (Element) childNode1;
      String role = childNodeElement.getAttributeValue(ModelPersistence.ROLE);
      SNode childNode = readNode(childNodeElement, model, referenceDescriptors, useUIDs);
      if (role == null || childNode == null) {
        LOG.errorWithTrace("Error reading child node in node " + node.getDebugText());
      } else {
        node.addChild(role, childNode);
      }
    }

    return node;
  }
}
