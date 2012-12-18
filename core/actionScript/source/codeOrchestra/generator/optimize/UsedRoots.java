package codeOrchestra.generator.optimize;

import codeOrchestra.actionscript.util.*;
import jetbrains.mps.generator.fileGenerator.FileGenerationUtil;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.transform.TransformerException;
import java.io.File;
import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public class UsedRoots {

  public static final String USED_ROOTS_ELEMENT = "usedRoots";
  public static final String MODEL_ELEMENT = "model";
  public static final String MODEL_REF_ATTRIBUTE = "ref";
  public static final String NODE_ID_ELEMENT = "nodeId";
  public static final String USED_ROOT_FILENAME = "usedRoot.xml";
  public static final String NODE_NAME_ATTRIBUTE = "nodeName";
  private Map<SModelReference, Set<SNodePointer>> usedRoots = new HashMap<SModelReference, Set<SNodePointer>>();

  public void addUsedRoot(SNodePointer nodePointer) {
    Set<SNodePointer> modelRoots = usedRoots.get(nodePointer.getModelReference());
    if (modelRoots == null) {
      modelRoots = new HashSet<SNodePointer>();
      usedRoots.put(nodePointer.getModelReference(), modelRoots);
    }

    modelRoots.add(nodePointer);
  }

  public boolean isRootUsed(SNodePointer nodePointer) {
    Set<SNodePointer> modelRoots = usedRoots.get(nodePointer.getModelReference());
    if (modelRoots == null || modelRoots.isEmpty()) {
      return false;
    }

    return modelRoots.contains(nodePointer);
  }

  public boolean isModelUsed(SModelReference modelReference) {
    Set<SNodePointer> modelRoots = usedRoots.get(modelReference);
    return modelRoots != null && !modelRoots.isEmpty();
  }

  public Set<SModelReference> getUsedModels() {
    Set<SModelReference> result = new HashSet<SModelReference>(usedRoots.keySet());

    Iterator<SModelReference> iterator = result.iterator();
    while (iterator.hasNext()) {
      SModelReference modelReference = iterator.next();
      Set<SNodePointer> roots = usedRoots.get(modelReference);
      if (roots == null && roots.isEmpty()) {
        iterator.remove();
      }
    }

    return result;
  }

  public List<SModelReference> getModelsWithNewRootsSince(UsedRoots previousUsedRoots) {
    if (previousUsedRoots == null) {
      return new ArrayList<SModelReference>(getUsedModels());
    }

    List<SModelReference> result = new ArrayList<SModelReference>();

    for (SModelReference modelReference : getUsedModels()) {
      Set<SNodePointer> roots = usedRoots.get(modelReference);
      if (roots == null) {
        continue;
      }

      Set<SNodePointer> previousRoots = previousUsedRoots.usedRoots.get(modelReference);
      if (previousRoots == null) {
        result.add(modelReference);
        continue;
      }

      boolean hasNewRoots = false;
      for (SNodePointer root : roots) {
        if (!previousRoots.contains(root)) {
          hasNewRoots = true;
          break;
        }
      }
      if (hasNewRoots) {
        result.add(modelReference);
      }
    }

    return result;
  }

  public void write(IModule module) {
    File cachesDir = new File(FileGenerationUtil.getCachesDir(FileSystem.getInstance().getFileByPath(module.getGeneratorOutputPath())).getPath());
    if (!cachesDir.exists()) {
      cachesDir.mkdir();
    }

    File fileToSave = new File(cachesDir.getPath(), "usedRoot.xml");
    try {
      XMLUtils.saveToFile(fileToSave.getPath(), toDocument());
    } catch (TransformerException e) {
      throw new RuntimeException("Can't write the used roots cache file", e);
    }
  }

  public static UsedRoots fromModule(IModule module) {
    IFile cachesDir = FileGenerationUtil.getCachesDir(FileSystem.getInstance().getFileByPath(module.getGeneratorOutputPath()));
    File fileToSave = new File(cachesDir.getPath(), USED_ROOT_FILENAME);

    return fromXML(fileToSave.getPath());
  }

  public static UsedRoots fromXML(String xmlPath) {
    UsedRoots usedRoots = new UsedRoots();

    File file = new File(xmlPath);
    if (!file.exists()) {
      return null;
    }

    Document document = XMLUtils.fileToDOM(file);
    NodeList modelElements = document.getDocumentElement().getElementsByTagName(MODEL_ELEMENT);
    for (int i = 0; i < modelElements.getLength(); i++) {
      Element modelElement = (Element) modelElements.item(i);
      SModelReference modelReference = SModelReference.fromString(modelElement.getAttribute(MODEL_REF_ATTRIBUTE));

      NodeList nodeIdElements = modelElement.getElementsByTagName(NODE_ID_ELEMENT);
      for (int j = 0; j < nodeIdElements.getLength(); j++) {
        Element nodeIdElement = (Element) nodeIdElements.item(j);
        String nodeIdStr = nodeIdElement.getTextContent();
        usedRoots.addUsedRoot(new SNodePointer(modelReference, SNodeId.fromString(nodeIdStr)));
      }
    }

    return usedRoots;
  }

  public Document toDocument() {
    Document document = XMLUtils.createDocument();
    Element rootElement = document.createElement(USED_ROOTS_ELEMENT);
    document.appendChild(rootElement);

    for (SModelReference modelReference : usedRoots.keySet()) {
      Element modelElement = document.createElement(MODEL_ELEMENT);
      modelElement.setAttribute(MODEL_REF_ATTRIBUTE, modelReference.toString());

      for (SNodePointer sNodePointer : usedRoots.get(modelReference)) {
        Element nodeIdElement = document.createElement(NODE_ID_ELEMENT);
        if (sNodePointer instanceof SNodePointerEx) {
          nodeIdElement.setAttribute(NODE_NAME_ATTRIBUTE, ((SNodePointerEx) sNodePointer).getNodeName());
        }
        nodeIdElement.setTextContent(sNodePointer.getNodeId().toString());
        modelElement.appendChild(nodeIdElement);
      }

      rootElement.appendChild(modelElement);
    }
    return document;
  }
}
