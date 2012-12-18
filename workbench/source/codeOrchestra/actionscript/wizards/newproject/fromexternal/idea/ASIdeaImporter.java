package codeOrchestra.actionscript.wizards.newproject.fromexternal.idea;

import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalImporter;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalImporterException;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalModule;
import jetbrains.mps.util.misc.hash.HashMap;
import org.apache.commons.lang.StringUtils;
import org.w3c.dom.*;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilderFactory;
import java.io.*;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * @author Anton.I.Neverov
 */
public class ASIdeaImporter extends ASExternalImporter {

  private enum ProjectType {
    IDEA,
    IPR
  }

  private ProjectType projectType;
  private File iprFile;
  private File iwsFile;
  private File ideaDir;
  
  private void determineProjectType() throws ASExternalImporterException {
    File dir = new File(projectPath);
    
    File[] files = dir.listFiles(new FilenameFilter() {
      @Override
      public boolean accept(File dir, String name) {
        return name.endsWith(".ipr");
      }
    });
    if (files != null && files.length > 0) {
      iprFile = files[0];
      projectType = ProjectType.IPR;
      
      File iws = new File(projectPath, iprFile.getName().replaceFirst("\\.ipr$", ".iws"));
      if (!iws.exists()) {
        resetStateAndThrowException("Cannot find " + iws.getName() + " file in path " + projectPath);
      }
      iwsFile = iws;
      
      return;
    }
    
    files = dir.listFiles(new FilenameFilter() {
      @Override
      public boolean accept(File dir, String name) {
        return name.equals(".idea");
      }
    });
    if (files != null && files.length > 0) {
      ideaDir = files[0];
      projectType = ProjectType.IDEA;
      return;
    }
    
    // If neither *.ipr file, nor .idea directory is found
    resetStateAndThrowException("Cannot find neither *.ipr file, nor .idea directory in path " + projectPath);
  }
  
  protected void innerSetProject(String path) throws ASExternalImporterException {
    determineProjectType();
  }
  
  protected void determineProjectName() throws ASExternalImporterException {
    String exceptionMessage = null;
    
    if (projectType == ProjectType.IPR) {
      // We are sure that determineProjectType() didn't throw exception, so iprFile is not null and it represents *.ipr file
      projectName = iprFile.getName().replaceFirst("\\.ipr$", "");
    } else if (projectType == ProjectType.IDEA) {
      File nameFile = new File(ideaDir.getPath(), ".name");
      try {
        BufferedReader reader = new BufferedReader(new FileReader(nameFile));
        String name = reader.readLine();
        if (StringUtils.isWhitespace(name)) {
          exceptionMessage = ".name file in path " + nameFile.getPath() + " is empty";
        }
        projectName = name.trim();
      } catch (FileNotFoundException e) {
        exceptionMessage = "Cannot find .name file in path " + nameFile.getPath();
      } catch (IOException e) {
        exceptionMessage = "Cannot read .name file in path " + nameFile.getPath();
      }
    } else {
      // Actually unreachable (see setProject())
      exceptionMessage = "Project type was not determined";
    }
    
    if (exceptionMessage != null) {
      resetStateAndThrowException(exceptionMessage);
    }
  }

  public boolean projectIsFound() {
    return super.projectIsFound() && projectName != null &&
      (
        (projectType == ProjectType.IPR && iprFile != null && iwsFile != null)
          || (projectType == ProjectType.IDEA && ideaDir != null)
      );
  }

  protected void locateModules() throws ASExternalImporterException {
    modules.clear();

    File f;
    String fDescription;
    // Both .ipr and modules.xml files have the same structure
    if (projectType == ProjectType.IPR) {
      f = iprFile;
      fDescription = "project";
    } else if (projectType == ProjectType.IDEA) {
      f = new File(ideaDir.getPath() + File.separator + "modules.xml");
      fDescription = "modules";
    } else {
      // Unreachable
      throw new ASExternalImporterException("Project type was not determined");
    }

    BufferedReader reader;
    try {
      reader = new BufferedReader(new FileReader(f));
    } catch (FileNotFoundException e) {
      // Unreachable
      throw new ASExternalImporterException("Cannot find " + fDescription + " file " + f.getPath());
    }

    DocumentBuilderFactory fact = DocumentBuilderFactory.newInstance();
    Document doc;
    try {
      doc = fact.newDocumentBuilder().parse(new InputSource(reader));
    } catch (Exception e) {
      throw new ASExternalImporterException("Corrupted " + fDescription + " file " + f.getPath());
    }

    Element el = doc.getDocumentElement();
    if (el == null) {
      throw new ASExternalImporterException("Corrupted " + fDescription + " file " + f.getPath());
    }

    NodeList list = el.getChildNodes();
    Node moduleNode = null;

    for (int i = 0; i < list.getLength(); i++) {
      NamedNodeMap nodeMap = list.item(i).getAttributes();
      if (nodeMap != null && nodeMap.getNamedItem("name") != null) {
        if ("ProjectModuleManager".equals(nodeMap.getNamedItem("name").getNodeValue())) {
          moduleNode = list.item(i);
          break;
        }
      }
    }

    if (moduleNode == null) {
      throw new ASExternalImporterException("Corrupted " + fDescription + " file " + f.getPath());
    }

    NodeList moduleNodeList = null;
    for (int i = 0; i < moduleNode.getChildNodes().getLength(); i++) {
      if ("modules".equals(moduleNode.getChildNodes().item(i).getNodeName())) {
        moduleNodeList = moduleNode.getChildNodes().item(i).getChildNodes();
        break;
      }
    }

    if (moduleNodeList == null) {
      throw new ASExternalImporterException("Corrupted " + fDescription + " file " + f.getPath());
    }

    for (int i = 0; i < moduleNodeList.getLength(); i++) {
      NamedNodeMap nodeMap = moduleNodeList.item(i).getAttributes();
      if (nodeMap != null && nodeMap.getNamedItem("filepath") != null) {
        modules.add(new ASIdeaModule(nodeMap.getNamedItem("filepath").getNodeValue().replace("$PROJECT_DIR$", projectPath)));
      }
    }

    resolveModuleDependencies();
    
  }

  @Override
  protected void addRunConfigurations() {
    runConfigurations.clear();

    // Shared configurations

    if (projectType == ProjectType.IDEA) {
      File runConfigDir = new File(ideaDir.getPath() + "/runConfigurations");
      if (runConfigDir.isDirectory()) {

        String[] runConfigurationNames = runConfigDir.list(new FilenameFilter() {
          @Override
          public boolean accept(File dir, String name) {
            return name.endsWith(".xml");
          }
        });
        for (String s : runConfigurationNames) {
          try {
            runConfigurations.add(new ASIdeaRunConfiguration(runConfigDir.getPath() + "/" + s));
          } catch (ASExternalImporterException e) {
            // Ignore
          }
        }

      }

    } else if (projectType == ProjectType.IPR) {
      Element iprTop;
      try {
        iprTop = getTopLevelElement(iprFile);
      } catch (ASExternalImporterException e) {
        return;
      }
      addRunConfigurationFromXMLTree(iprTop, "ProjectRunConfigurationManager");
    }

    // Non-shared configurations

    Element workspaceTop;
    try {
      if (projectType == ProjectType.IDEA) {
        workspaceTop = getTopLevelElement(new File(ideaDir.getPath() + File.separator + "workspace.xml"));
      } else if (projectType == ProjectType.IPR) {
        workspaceTop = getTopLevelElement(iwsFile);
      } else {
        // O_o
        return;
      }
    } catch (ASExternalImporterException e) {
      return;
    }
    addRunConfigurationFromXMLTree(workspaceTop, "RunManager");
  }

  protected void resetSpecificFields() {
    projectType = null;
    iprFile = null;
    ideaDir = null;
    iwsFile = null;
  }


  private Element getTopLevelElement(File file) throws ASExternalImporterException {

    BufferedReader reader;
    try {
      reader = new BufferedReader(new FileReader(file));
    } catch (FileNotFoundException e) {
      throw new ASExternalImporterException("Cannot find " + file.getPath());
    }

    DocumentBuilderFactory fact = DocumentBuilderFactory.newInstance();
    Document doc;
    try {
      doc = fact.newDocumentBuilder().parse(new InputSource(reader));
    } catch (Exception e) {
      throw new ASExternalImporterException("Corrupted file: " + file.getPath());
    }

    Element el = doc.getDocumentElement();
    if (el == null) {
      throw new ASExternalImporterException("Corrupted file: " + file.getPath());
    }

    return el;
  }
  
  private void addRunConfigurationFromXMLTree(Element treeTop, String runManagerName) {
    NodeList list = treeTop.getChildNodes();

    for (int i = 0; i < list.getLength(); i++) {
      NamedNodeMap nodeMap = list.item(i).getAttributes();
      if (nodeMap != null && nodeMap.getNamedItem("name") != null) {
        if (!runManagerName.equals(nodeMap.getNamedItem("name").getNodeValue())) {
          continue;
        }
        NodeList configList = list.item(i).getChildNodes();
        for (int j = 0; j < configList.getLength(); j++) {
          NamedNodeMap configNodeMap = configList.item(j).getAttributes();
          if (configNodeMap != null &&
            configNodeMap.getNamedItem("default") != null &&
            configNodeMap.getNamedItem("default").getNodeValue() != null &&
            configNodeMap.getNamedItem("default").getNodeValue().equals("false")) {
            try {
              runConfigurations.add(new ASIdeaRunConfiguration(configList.item(j)));
            } catch (ASExternalImporterException e) {
              // Ignore
            }
          }
        }
      }
    }
  }
  
}
