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
package jetbrains.mps.library;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.JDOMUtil;
import jetbrains.mps.util.Macros;
import jetbrains.mps.util.MacrosFactory;
import jetbrains.mps.util.PathManager;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BuiltInLibrariesIO {
  private static final Logger LOG = Logger.getLogger(BuiltInLibrariesIO.class);
  public static final String CONFIG_FILE_NAME = "CustomBuiltInLibraries";
  private static final String CONFIG_FILE_WHOLE_NAME = CONFIG_FILE_NAME + ".xml";
  public static final String ROOT_TAG = "libraries";
  public static final String LIBRARY_TAG = "library";
  public static final String LIBRARY_NAME_TAG = "name";
  public static final String LIBRARY_PATH_TAG = "path";

  public static Map<String, Library> readBuiltInLibraries() {
    Map<String, Library> result = new HashMap<String, Library>();

    URL resource = BuiltInLibrariesIO.class.getResource(CONFIG_FILE_WHOLE_NAME);
    if (resource == null) return result;

    InputStream in = null;
    try {
      in = resource.openStream();
      Document document = JDOMUtil.loadDocument(in);
      Element element = document.getRootElement();
      List children = element.getChildren(LIBRARY_TAG);
      for (Object childObj : children) {
        Element child = (Element) childObj;
        String name = child.getAttribute(LIBRARY_NAME_TAG).getValue();
        String path = child.getAttribute(LIBRARY_PATH_TAG).getValue();
        final String realPath = MacrosFactory.mpsHomeMacros().expandPath(path, new File(PathManager.getHomePath()));

        Library predefinedLibrary = new Library(name) {
          @NotNull
          @Override
          public String getPath() {
            return realPath;
          }
        };
        result.put(name, predefinedLibrary);
      }
    } catch (JDOMException e) {
      LOG.error(e);
    } catch (IOException e) {
      LOG.error(e);
    } finally {
      if (in != null) {
        try {
          in.close();
        } catch (IOException e) {
          LOG.error(e);
        }
      }
    }
    return result;
  }

  public static void addLibraryToConfigurationFile(String name, String path, String sourceHome) {
    try {
      File sourceFile = new File(sourceHome + File.separator + BuiltInLibrariesIO.class.getName().replace(".", File.separator) + ".class");
      if (sourceFile.exists()) {
        File configFile = new File(sourceHome + File.separator + getModifiedConfigurationFile());
        configFile.createNewFile();
        write(configFile, name, path);
      }
    } catch (JDOMException e) {
      LOG.error(e);
    } catch (IOException e) {
      LOG.error(e);
    }
  }

  private static void write(File configFile, String name, String path) throws JDOMException, IOException {
    Document document;
    try {
      document = JDOMUtil.loadDocument(configFile);
    } catch (JDOMException e) {
      document = new Document();
      Element rootElement = new Element(ROOT_TAG);
      document.setRootElement(rootElement);
    }
    Element element = document.getRootElement();
    assert element.getName().equals(ROOT_TAG);
    write(element, name, path);
    JDOMUtil.writeDocument(document, configFile);
  }

  private static void write(Element element, String name, String path) {
    Element libraryElement = new Element(LIBRARY_TAG);
    libraryElement.setAttribute(LIBRARY_NAME_TAG, name);
    libraryElement.setAttribute(LIBRARY_PATH_TAG, path);
    element.addContent(libraryElement);
  }

  public static String getModifiedConfigurationFile() {
    return BuiltInLibrariesIO.class.getPackage().getName().replace(".", File.separator) + File.separator + CONFIG_FILE_WHOLE_NAME;
  }

  public static void main(String[] args) {
    String mpsHome = args[0];

    for (int i = 1; i < args.length; i++) {
      String param = args[i];
      String[] strings = param.split("=");

      String name = strings[0];
      String path = Macros.MPS_HOME + File.separator + strings[1];

      BuiltInLibrariesIO.addLibraryToConfigurationFile(name, path, mpsHome);
    }
  }
}
