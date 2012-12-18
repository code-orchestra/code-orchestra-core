package codeOrchestra.actionscript.wizards.newproject.fromexternal.idea;

import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalImporterException;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalModule;
import org.w3c.dom.*;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilderFactory;
import java.io.*;
import java.util.Map;

/**
 * @author Anton.I.Neverov
 */
public class ASIdeaModule extends ASExternalModule {

  public ASIdeaModule(String path) throws ASExternalImporterException {

    modulePath = path.substring(0, path.lastIndexOf("/"));
    moduleName = path.substring(path.lastIndexOf("/") + 1, path.lastIndexOf("."));
    
    BufferedReader reader;
    try {
      reader = new BufferedReader(new FileReader(path));
    } catch (FileNotFoundException e) {
      // Unreachable
      throw new ASExternalImporterException("Cannot find module file " + path);
    }

    DocumentBuilderFactory fact = DocumentBuilderFactory.newInstance();
    Document doc;
    try {
      doc = fact.newDocumentBuilder().parse(new InputSource(reader));
    } catch (Exception e) {
      throw new ASExternalImporterException("Corrupted module file " + path);
    }

    Element el = doc.getDocumentElement();
    if (el == null) {
      throw new ASExternalImporterException("Corrupted module file " + path);
    }

    NodeList list = el.getChildNodes();
    Node moduleRootManager = null;
    Node configuration = null;

    for (int i = 0; i < list.getLength(); i++) {
      NamedNodeMap nodeMap = list.item(i).getAttributes();
      if (nodeMap != null && nodeMap.getNamedItem("name") != null) {
        if ("Flex.Build.Configuration".equals(nodeMap.getNamedItem("name").getNodeValue())) {
          configuration = list.item(i);
        }
        if ("NewModuleRootManager".equals(nodeMap.getNamedItem("name").getNodeValue())) {
          moduleRootManager = list.item(i);
        }
      }
    }

    if (moduleRootManager == null) {
      throw new ASExternalImporterException("Corrupted module file " + path);
    }

    NodeList moduleRootList = null;
    for (int i = 0; i < moduleRootManager.getChildNodes().getLength(); i++) {
      // Sources path
      if ("content".equals(moduleRootManager.getChildNodes().item(i).getNodeName())) {
        moduleRootList = moduleRootManager.getChildNodes().item(i).getChildNodes();
      }
      if ("orderEntry".equals(moduleRootManager.getChildNodes().item(i).getNodeName())) {
        NamedNodeMap nodeMap = moduleRootManager.getChildNodes().item(i).getAttributes();
        if (nodeMap != null && nodeMap.getNamedItem("type") != null) {
          // Module dependency
          if ("module".equals(nodeMap.getNamedItem("type").getNodeValue()) && nodeMap.getNamedItem("module-name") != null) {
            moduleDependencies.add(nodeMap.getNamedItem("module-name").getNodeValue());
          }
          // Library dependency
          if ("module-library".equals(nodeMap.getNamedItem("type").getNodeValue())) {
            addLibraryNames(moduleRootManager.getChildNodes().item(i));
          }
        }
      }
    }

    if (moduleRootList == null) {
      throw new ASExternalImporterException("Corrupted module file " + path);
    }

    for (int i = 0; i < moduleRootList.getLength(); i++) {
      NamedNodeMap nodeMap = moduleRootList.item(i).getAttributes();
      if (nodeMap != null && nodeMap.getNamedItem("url") != null) {
        sourcesPath = nodeMap.getNamedItem("url").getNodeValue().replace("file://", "").replace("$MODULE_DIR$", modulePath);
      }
    }

    if (configuration != null) {
      for (int i = 0; i < configuration.getChildNodes().getLength(); i++) {
        NamedNodeMap nodeMap = configuration.getChildNodes().item(i).getAttributes();
        if (nodeMap != null && nodeMap.getNamedItem("name") != null && nodeMap.getNamedItem("value") != null) {
          if (nodeMap.getNamedItem("name").getNodeValue() != null && nodeMap.getNamedItem("value").getNodeValue() != null) {
            if ("MAIN_CLASS".equals(nodeMap.getNamedItem("name").getNodeValue())) {
              mainClass = nodeMap.getNamedItem("value").getNodeValue();
            } else if ("TARGET_PLAYER_VERSION".equals(nodeMap.getNamedItem("name").getNodeValue())) {
              targetPlayerVersion = nodeMap.getNamedItem("value").getNodeValue();
            } else if ("ADDITIONAL_COMPILER_OPTIONS".equals(nodeMap.getNamedItem("name").getNodeValue())) {
              additionalCompilerArguments = nodeMap.getNamedItem("value").getNodeValue();
            } else if ("USE_LOCALE_SETTINGS".equals(nodeMap.getNamedItem("name").getNodeValue())) {
              useNonDefaultLocales = nodeMap.getNamedItem("value").getNodeValue().equals("true");
            } else if ("LOCALE".equals(nodeMap.getNamedItem("name").getNodeValue())) {
              nonDefaultLocales = nodeMap.getNamedItem("value").getNodeValue();
            } else if ("CUSTOM_CONFIG_FILE".equals(nodeMap.getNamedItem("name").getNodeValue())) {
              File customConfigFile = new File(nodeMap.getNamedItem("value").getNodeValue().replace("$MODULE_DIR$", modulePath));
              if (customConfigFile.exists()) {
                try {
                  customCompilerConfig = customConfigFile.getCanonicalPath();
                } catch (IOException e) {
                  // Ignore
                }
              }
            } else if ("USE_CUSTOM_CONFIG_FILE".equals(nodeMap.getNamedItem("name").getNodeValue())) {
              useCustomCompilerConfig = nodeMap.getNamedItem("value").getNodeValue().equals("true");
            } else if ("USE_DEFAULT_SDK_CONFIG_FILE".equals(nodeMap.getNamedItem("name").getNodeValue())) {
              useDefaultSDKConfig = nodeMap.getNamedItem("value").getNodeValue().equals("true");
            } else if ("OUTPUT_TYPE".equals(nodeMap.getNamedItem("name").getNodeValue())) {
              libraryModule = nodeMap.getNamedItem("value").getNodeValue().equals("Library");
            }
          }
        }
      }
    }
  }
  
  private void addLibraryNames(Node libraryNode) {
    NodeList tempNode = null;
    for (int i = 0; i < libraryNode.getChildNodes().getLength(); i++) {
      if ("library".equals(libraryNode.getChildNodes().item(i).getNodeName())) {
        tempNode = libraryNode.getChildNodes().item(i).getChildNodes();
        break;
      }
    }
    
    if (tempNode == null) {
      return;
    }

    for (int i = 0; i < tempNode.getLength(); i++) {
      if ("CLASSES".equals(tempNode.item(i).getNodeName())) {
        tempNode = tempNode.item(i).getChildNodes();
        break;
      }
    }

    if (tempNode == null) {
      return;
    }

    for (int i = 0; i < tempNode.getLength(); i++) {
      if ("root".equals(tempNode.item(i).getNodeName())) {
        NamedNodeMap nodeMap = tempNode.item(i).getAttributes();
        if (nodeMap != null && nodeMap.getNamedItem("url") != null) {
          libraryDependencies.add(nodeMap.getNamedItem("url").getNodeValue().replace("jar://", "").replace("$MODULE_DIR$", modulePath).replaceFirst("!/$", ""));
        }
      }
    }
  }

  public void resolveModuleDependencies(Map<String, String> namePathMap) {
    for (int i = 0; i < moduleDependencies.size(); i++) {
      if (namePathMap.containsKey(moduleDependencies.get(i))) {
        moduleDependencies.set(i, namePathMap.get(moduleDependencies.get(i)));
      }
    }
  }

}
