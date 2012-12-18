package codeOrchestra.actionscript.wizards.newproject.fromexternal.idea;

import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalImporterException;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalModule;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalRunConfiguration;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.io.File;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class ASIdeaRunConfiguration extends ASExternalRunConfiguration {

  private Node configNode;

  public ASIdeaRunConfiguration(String path) throws ASExternalImporterException {
    configFile = new File(path);
    if (!configFile.exists()) {
      // TODO: configs in iws file!
      throw new ASExternalImporterException("Cannot find run configuration file " + path);
    }
    if (!path.endsWith(".xml")) {
      // Should not get here
      throw new ASExternalImporterException("Run configuration filename should end with '.xml'");
    }

    parseRunConfigurationFile();

  }

  public ASIdeaRunConfiguration(Node node) throws ASExternalImporterException {
    configNode = node;
    parseRunConfigurationNode();
  }

  private void parseRunConfigurationFile() throws ASExternalImporterException {
    Element el = getTopLevelElement();

    NodeList list = el.getChildNodes();

    for (int i = 0; i < list.getLength(); i++) {
      if (!list.item(i).getNodeName().equals("configuration")) {
        continue;
      }
      NamedNodeMap nodeMap = list.item(i).getAttributes();
      if (nodeMap != null) {
        if (nodeMap.getNamedItem("name") != null && nodeMap.getNamedItem("name").getNodeValue() != null) {
          name = nodeMap.getNamedItem("name").getNodeValue();
        }
        if (nodeMap.getNamedItem("main_class_name") != null && nodeMap.getNamedItem("main_class_name").getNodeValue() != null) {
          mainClass = nodeMap.getNamedItem("main_class_name").getNodeValue();
        }
        if (nodeMap.getNamedItem("module_name") != null && nodeMap.getNamedItem("module_name").getNodeValue() != null) {
          moduleName = nodeMap.getNamedItem("module_name").getNodeValue();
        }
      }
    }

  }

  private void parseRunConfigurationNode() throws ASExternalImporterException {

    NamedNodeMap nodeMap = configNode.getAttributes();
    if (nodeMap != null) {
      if (nodeMap.getNamedItem("name") != null && nodeMap.getNamedItem("name").getNodeValue() != null) {
        name = nodeMap.getNamedItem("name").getNodeValue();
      }
      if (nodeMap.getNamedItem("main_class_name") != null && nodeMap.getNamedItem("main_class_name").getNodeValue() != null) {
        mainClass = nodeMap.getNamedItem("main_class_name").getNodeValue();
      }
      if (nodeMap.getNamedItem("module_name") != null && nodeMap.getNamedItem("module_name").getNodeValue() != null) {
        moduleName = nodeMap.getNamedItem("module_name").getNodeValue();
      }
    }

  }
}
