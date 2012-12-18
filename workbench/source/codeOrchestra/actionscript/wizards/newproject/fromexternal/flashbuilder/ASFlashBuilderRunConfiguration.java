package codeOrchestra.actionscript.wizards.newproject.fromexternal.flashbuilder;

import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalImporterException;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalModule;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalRunConfiguration;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilderFactory;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class ASFlashBuilderRunConfiguration extends ASExternalRunConfiguration {

  private List<ASExternalModule> modules;
  
  public ASFlashBuilderRunConfiguration(String path, List<ASExternalModule> modules) throws ASExternalImporterException {
    configFile = new File(path);
    this.modules = modules;
    if (!configFile.exists()) {
      // Should not get here
      throw new ASExternalImporterException("Cannot find run configuration file " + path);
    }
    if (!path.endsWith(".launch")) {
      // Should not get here
      throw new ASExternalImporterException("Run configuration filename should end with '.launch'");
    }

    // name of configuration is simply the name of the file
    name = configFile.getName().substring(0, configFile.getName().lastIndexOf("."));
    
    parseRunConfigurationFile();
    fixMainClass();
  }
  
  private void parseRunConfigurationFile() throws ASExternalImporterException {
    Element el = getTopLevelElement();

    NodeList list = el.getChildNodes();

    for (int i = 0; i < list.getLength(); i++) {
      if (list.item(i).getNodeName().equals("stringAttribute")) {
        NamedNodeMap nodeMap = list.item(i).getAttributes();
        if (nodeMap != null && nodeMap.getNamedItem("key") != null) {
          if (nodeMap.getNamedItem("value") != null && !nodeMap.getNamedItem("value").getNodeValue().isEmpty()) {
            if (nodeMap.getNamedItem("key").getNodeValue().equals("com.adobe.flexbuilder.debug.ATTR_APPLICATION")) {
              mainClass = nodeMap.getNamedItem("value").getNodeValue();
            } else if (nodeMap.getNamedItem("key").getNodeValue().equals("com.adobe.flexbuilder.debug.ATTR_PROJECT")) {
              moduleName = nodeMap.getNamedItem("value").getNodeValue();
            }
          }
        }
      }
    }

  }
  
  private void fixMainClass() throws ASExternalImporterException {
    if (mainClass == null) {
      throw new ASExternalImporterException("Cannot find main class in run configuration file " + configFile.getPath());
    }
    if (moduleName == null) {
      throw new ASExternalImporterException("Cannot find module name in configuration file " + configFile.getPath());
    }
    boolean fixed = false;
    for (ASExternalModule mod : modules) {
      if (mod.getModuleName().equals(moduleName)) {
        String sourcesPath = mod.getSourcesPath();
        String modulePath = mod.getModulePath();
        if (!sourcesPath.startsWith(modulePath)) {
          throw new ASExternalImporterException("Impossible to determine sources directory relative path");
        }
        String relativeSourcesPath = sourcesPath.substring(modulePath.length());
        while (relativeSourcesPath.startsWith("/")) {
          relativeSourcesPath = relativeSourcesPath.substring(1);
        }
        if (!mainClass.startsWith(relativeSourcesPath)) {
          throw new ASExternalImporterException("Impossible to determine sources directory relative path");
        }
        mainClass = mainClass.substring(relativeSourcesPath.length());
        while (mainClass.startsWith("/")) {
          mainClass = mainClass.substring(1);
        }
        mainClass = mainClass.replaceAll("/", ".");
        mainClass = mainClass.substring(0, mainClass.lastIndexOf("."));
        fixed = true;
        break;
      }
    }
    if (!fixed) {
      throw new ASExternalImporterException("Cannot find module " + moduleName + " in project ");
    }
  }

}
