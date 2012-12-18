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
package jetbrains.mps.reloading;

import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.PathManager;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import sun.misc.Launcher;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class CommonPaths {
  private static final Logger LOG = Logger.getLogger(CommonPaths.class);

  //--------paths-----------

  public static String getBaseMPSPath() {
    String classesPath = PathManager.getHomePath() + File.separator + "classes";
    if (new File(classesPath).exists()) {
      return classesPath;
    }
    String mpsJarPath = PathManager.getHomePath() + File.separator + "lib" + File.separatorChar + "mps.jar";
    if (new File(mpsJarPath).exists()) {
      return mpsJarPath;
    }
    return null;
  }

  public static List<String> getMPSPaths() {
    return itemToPath(getMPSClassPath());
  }

  public static List<String> getTestbenchPaths() {
    return itemToPath(getTestbenchClassPath());
  }

  public static List<String> getJDKPath() {
    return itemToPath(getJDKClassPath());
  }


  //------classpaths : JDK--------

  private static List<String> getJDKJars() {
    List<String> result = new ArrayList<String>();

    if (!com.intellij.openapi.util.SystemInfo.isMac) {
      result.add("rt.jar");
    } else {
      result.add("classes.jar");
    }

    result.add("jsse.jar");
    result.add("jce.jar");
    result.add("charsets.jar");
    return result;
  }

  public static IClassPathItem getJDKClassPath() {
    CompositeClassPathItem composite = new CompositeClassPathItem();
    for (String s : getJDKJars()) {
      addJarForName(composite, s);
    }
    return composite;
  }

  private static void addJarForName(CompositeClassPathItem composite, String name) {
    RealClassPathItem rtJar = findBootstrapJarByName(name);
    if (rtJar != null) {
      composite.add(rtJar);
    } else {
      LOG.error("Can't find " + name + ". Make sure you are using JDK 5.0");
    }
  }

  private static RealClassPathItem findBootstrapJarByName(String name) {
    for (URL url : Launcher.getBootstrapClassPath().getURLs()) {
      try {
        File file = new File(url.toURI());
        if (!file.exists()) continue;

        if (file.getName().equals(name)) {
          return ClassPathFactory.getInstance().createFromPath(file.getCanonicalPath(), "Common paths");
        }
      } catch (URISyntaxException e) {
        LOG.error(e);
      } catch (Throwable e) {
        LOG.error(e);
      }
    }
    return null;
  }

  //------classpaths : MPS--------

  public static IClassPathItem getMPSClassPath() {
    CompositeClassPathItem result = new CompositeClassPathItem();
    addJars(result, new File(libPath()));
    addClasses(result, PathManager.getHomePath());
    return result;
  }

  @CodeOrchestraPatch
  private static void addJars(CompositeClassPathItem result, File dir) {
/*
    for (File child:dir.listFiles()){
      if (child.isDirectory()){
        addJars(result,child);
      } else if (child.getName().endsWith(".jar")){
        result.add(ClassPathFactory.getInstance().createFromPath(child.getAbsolutePath()));
      }
    }
*/
    addIfExists(result, "/lib/mps.jar");
    addIfExists(result, "/lib/platform-api.jar");
    addIfExists(result, "/lib/platform.jar");
    addIfExists(result, "/lib/annotations.jar");
    addIfExists(result, "/lib/execution-api.jar");
    addIfExists(result, "/lib/util.jar");
    addIfExists(result, "/lib/extensions.jar");
    addIfExists(result, "/lib/junit-4.8.2.jar");
    addIfExists(result, "/lib/log4j.jar");
    addIfExists(result, "/lib/commons-lang-2.4.jar");
    addIfExists(result, "/lib/picocontainer.jar");
    addIfExists(result, "/lib/jdom.jar");
    addIfExists(result, "/lib/ecj.jar");

    IClassPathItem actionScriptClassPath = getActionScriptClassPath();
    if (actionScriptClassPath != null) {
      result.add(actionScriptClassPath);
    }

    // CO-4812
    IClassPathItem falconScriptClassPath = getFalconClassPath();
    if (falconScriptClassPath != null) {
      result.add(falconScriptClassPath);
    }
    addIfExists(result,"/lib/falcon.jar");

    // RE-817
    addIfExists(result,"/lib/actionScript.jar");

    // RE-1524
    addIfExists(result, "/lib/css/batik-all-flex.jar");

    //RE-1463
    addIfExists(result, "/lib/canvas.jar");
    addIfExists(result, "/lib/rip.jar");
  }

  private static void addClasses(CompositeClassPathItem result, String homePath) {
    File acp = new File(homePath + File.separator + "build" + File.separator + "idea.additional.classpath.txt");
    if (!acp.exists()) return;

    try {
      Scanner sc;
      for (sc = new Scanner(acp, "UTF-8"); sc.hasNextLine(); ) {
        File dir = new File(homePath, sc.nextLine());
        if (!dir.exists()) continue;
        try {
          result.add(ClassPathFactory.getInstance().createFromPath(dir.getAbsolutePath(), "Common paths"));
        } catch (IOException e) {
          LOG.error(e);
        }
      }
      sc.close();
    } catch (FileNotFoundException ignore) {
    }
  }

  private static String libPath() {
    return PathManager.getHomePath() + File.separator + "lib"
      + File.separator;
  }

  //------classpaths : Testbench--------

  public static IClassPathItem getTestbenchClassPath() {
    CompositeClassPathItem result = new CompositeClassPathItem();

    addIfExists(result, "/testbench/classes");
    addIfExists(result, "/testbench/testclasses");

    return result;
  }

  private static void addIfExists(CompositeClassPathItem item, String path) {
    path = PathManager.getHomePath() + path.replace('/', File.separatorChar);
    File file = new File(path);
    if (!file.exists()) return;
    try {
      item.add(ClassPathFactory.getInstance().createFromPath(path, "Common paths"));
    } catch (Throwable e) {
      LOG.error(e);
    }
  }

  //--------utils-----------

  private static List<String> itemToPath(IClassPathItem cp) {
    List<String> result = new ArrayList<String>();
    for (IClassPathItem item : cp.flatten()) {
      if (item instanceof FileClassPathItem) {
        result.add(((FileClassPathItem) item).getPath());
      } else if (item instanceof JarFileClassPathItem) {
        result.add(((JarFileClassPathItem) item).getFile().getAbsolutePath());
      } else {
        throw new IllegalArgumentException(item.getClass().getName());
      }
    }

    return result;
  }

  @CodeOrchestraPatch
  private static IClassPathItem getActionScriptClassPath() {
    String supportClasses = PathManager.getHomePath() + File.separator + "core"
      + File.separator + "actionScript" + File.separator + "classes";

    try {
      if (new File(supportClasses).exists()) {
        return ClassPathFactory.getInstance().createFromPath(supportClasses, "Common paths");
      }
    } catch (IOException t) {
      LOG.error("Can't load ActionScript supporting libs", t);
    }

    return null;
  }

  @CodeOrchestraPatch
  private static IClassPathItem getFalconClassPath() {
    String supportClasses = PathManager.getHomePath() + File.separator + "falcon"
      + File.separator + "classes";

    try {
      if (new File(supportClasses).exists()) {
        return ClassPathFactory.getInstance().createFromPath(supportClasses, "Common paths");
      }
    } catch (IOException t) {
      LOG.error("Can't load Falcon supporting libs", t);
    }

    return null;
  }

}
