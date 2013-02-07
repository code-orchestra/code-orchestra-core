package codeOrchestra.actionscript.wizards.newproject.fromexternal.flashbuilder;

import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalImporterException;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalModule;
import org.apache.commons.lang.StringUtils;
import org.w3c.dom.*;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilderFactory;
import java.io.*;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author Anton.I.Neverov
 */
public class ASFlashBuilderModule extends ASExternalModule {

  public ASFlashBuilderModule(String path) throws ASExternalImporterException {

    modulePath = path;
    parseProjectFile();
    parsePropertiesFile();
    parseFlashLibFile();

  }

  private void parseProjectFile() throws ASExternalImporterException {

    Element el = getTopLevelElement(".project");

    NodeList list = el.getChildNodes();

    for (int i = 0; i < list.getLength(); i++) {
      if (list.item(i).getNodeName().equals("name")) {
        moduleName = list.item(i).getTextContent();
        break;
      }
    }

    if (moduleName == null) {
      throw new ASExternalImporterException("Corrupted .project file " + modulePath + "/.project");
    }

  }

  private void parsePropertiesFile() throws ASExternalImporterException {

    Element el = getTopLevelElement(".actionScriptProperties");

    // Get main class
    NamedNodeMap rootNodeMap = el.getAttributes();
    if (rootNodeMap != null && rootNodeMap.getNamedItem("mainApplicationPath") != null) {
      mainClass = rootNodeMap.getNamedItem("mainApplicationPath").getNodeValue();
      mainClass = mainClass.replaceAll("/", ".");
      mainClass = mainClass.substring(0, mainClass.lastIndexOf("."));
    }

    NodeList list = el.getChildNodes();
    
    String rootPath = new File(modulePath).getParent();

    for (int i = 0; i < list.getLength(); i++) {
      if (list.item(i).getNodeName().equals("compiler")) {
        NamedNodeMap nodeMap = list.item(i).getAttributes();
        if (nodeMap != null) {
          if (nodeMap.getNamedItem("sourceFolderPath") != null) {
            sourcesPath = modulePath + "/" + nodeMap.getNamedItem("sourceFolderPath").getNodeValue();
          }
          if (nodeMap.getNamedItem("additionalCompilerArguments") != null) {
            additionalCompilerArguments = nodeMap.getNamedItem("additionalCompilerArguments").getNodeValue();

            // extract non-default locales
            Matcher m = Pattern.compile("-locale(\\s+[^-\\s]+)+").matcher(additionalCompilerArguments);
            if (m.lookingAt()) {
              String locales = m.group(1);
              additionalCompilerArguments = m.replaceFirst("");
              nonDefaultLocales = locales.trim().replaceAll("\\s+", ",");
              useNonDefaultLocales = true;
            }

            additionalCompilerArguments = additionalCompilerArguments.trim();

            // extract custom config file
            m = Pattern.compile("-load-config(\\s+|\\+=)([^\\s]+)").matcher(additionalCompilerArguments);
            if (m.lookingAt()) {
              customCompilerConfig = m.group(2);
              if (new File(customCompilerConfig).exists()) {
                useCustomCompilerConfig = true;
                additionalCompilerArguments = m.replaceFirst("");
              } else if (new File(modulePath + "/" + customCompilerConfig).exists()) {
                useCustomCompilerConfig = true;
                customCompilerConfig = modulePath + "/" + customCompilerConfig;
                additionalCompilerArguments = m.replaceFirst("");
              } else {
                customCompilerConfig = null;
              }
            }

            additionalCompilerArguments = additionalCompilerArguments.trim();

            if (StringUtils.isBlank(additionalCompilerArguments)) {
              additionalCompilerArguments = null;
            }

          }
          if (nodeMap.getNamedItem("targetPlayerVersion") != null) {
            targetPlayerVersion = nodeMap.getNamedItem("targetPlayerVersion").getNodeValue();
          }
        }

        NodeList cList = list.item(i).getChildNodes();
        for (int j = 0; j < cList.getLength(); j++) {
          if (cList.item(j).getNodeName().equals("libraryPath")) {

            NodeList libraryList = cList.item(j).getChildNodes();
            for (int k = 0; k < libraryList.getLength(); k++) {
              if (libraryList.item(k).getNodeName().equals("libraryPathEntry")) {
                NamedNodeMap attrs = libraryList.item(k).getAttributes();
                if (attrs != null && attrs.getNamedItem("path") != null && !attrs.getNamedItem("path").getNodeValue().isEmpty()) {
                  if (attrs.getNamedItem("kind") != null && !attrs.getNamedItem("kind").getNodeValue().isEmpty()) {
                    String libPath = attrs.getNamedItem("path").getNodeValue();
                    if (attrs.getNamedItem("kind").getNodeValue().equals("1")) {
                      // Add swc files from lib directory
                      if (!(new File(libPath).isAbsolute())) {
                        libPath = modulePath + "/" + libPath;
                      }
                      File libDir = new File(libPath);
                      if (libDir.isDirectory()) {
                        String[] libFiles = libDir.list(new FilenameFilter() {
                          @Override
                          public boolean accept(File dir, String name) {
                            return name.endsWith(".swc") || name.endsWith(".ane");
                          }
                        });
                        for (String lib : libFiles) {
                          libraryDependencies.add(libPath + "/" + lib);
                        }
                      }
                    } else if (attrs.getNamedItem("kind").getNodeValue().equals("3")) {
                      // Add single lib
                      if (!(new File(libPath).isAbsolute())) {
                        libPath = rootPath + libPath;
                      }
                      libraryDependencies.add(libPath);
                    }
                  }
                }
              }

            }

          }
        }
      }
    }

  }
  
  private void parseFlashLibFile() {
    if (new File(modulePath + "/.flexLibProperties").exists()) {
      libraryModule = true;
    }
  }

  private Element getTopLevelElement(String fileName) throws ASExternalImporterException {

    BufferedReader reader;
    try {
      reader = new BufferedReader(new FileReader(modulePath + "/" + fileName));
    } catch (FileNotFoundException e) {
      throw new ASExternalImporterException("Cannot find " + fileName + " file in path: " + modulePath);
    }

    DocumentBuilderFactory fact = DocumentBuilderFactory.newInstance();
    Document doc;
    try {
      doc = fact.newDocumentBuilder().parse(new InputSource(reader));
    } catch (Exception e) {
      throw new ASExternalImporterException("Corrupted file: " + modulePath + "/" + fileName);
    }

    Element el = doc.getDocumentElement();
    if (el == null) {
      throw new ASExternalImporterException("Corrupted file: " + modulePath + "/" + fileName);
    }

    return el;
  }

  public void resolveModuleDependencies(Map<String, String> namePathMap) {
    for (Entry<String, String> entry : namePathMap.entrySet()) {
      String name = entry.getKey();
      String path = entry.getValue();

      Iterator<String> it = libraryDependencies.iterator();
      while (it.hasNext()) {
        String libPath = it.next();
        if (libPath.endsWith(name + ".swc")) {
          String pathUnified = path.replaceAll("\\\\", "/");
          String libPathUnified = libPath.replaceAll("\\\\", "/");
          if (libPathUnified.startsWith(pathUnified)) {
            moduleDependencies.add(path);
            it.remove();
          }
        }
      }
    }
  }

}
