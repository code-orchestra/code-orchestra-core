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
package jetbrains.mps;

import com.intellij.ide.Bootstrap;
import com.intellij.ide.ClassloaderUtil;
import com.intellij.openapi.application.PathManager;

import java.io.File;
import java.io.FileNotFoundException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Launcher {
  public static void main(String[] args) throws URISyntaxException {
    String mpsInternal = System.getProperty("mps.internal");
    System.setProperty("idea.is.internal", mpsInternal != null ? mpsInternal : "false");
    System.setProperty("idea.no.jre.check", "true");
    System.setProperty("idea.load.plugins", "true");

    Bootstrap.main(args, "jetbrains.mps.MPSMainImpl", "start", getAdditionalMPSClasspath());
  }

  private static List<URL> getAdditionalMPSClasspath() {
    List<URL> result = new ArrayList<URL>();
    String homePath = PathManager.getHomePath();
    try {
      Class<Bootstrap> clazz = Bootstrap.class;
      String selfRoot = PathManager.getResourceRoot(clazz, "/" + clazz.getName().replace('.', '/') + ".class");
      URL selfRootUrl = new File(selfRoot).getAbsoluteFile().toURL();

      addMPSBootstrapJars(result, homePath, selfRootUrl);
      if (result.isEmpty()) {
        // we're probably running from the sources, let's add the class dirs to the classpath
        addMPSBootstrapClassFolders(result, homePath, selfRootUrl);
      }
    } catch (MalformedURLException e) {

    }
    return result;
  }

  private static void addMPSBootstrapJars(List<URL> classPath, String homePath, URL selfRootUrl) throws MalformedURLException {
    File ideaPatchJar = new File(homePath + File.separator + "lib" + File.separator + "idea-patch.jar");
    if (ideaPatchJar.exists()) {
      classPath.add(ideaPatchJar.toURI().toURL());
    }

    File mpsJar = new File(homePath + File.separator + "lib" + File.separator + "mps.jar");
    if (mpsJar.exists()) {
      classPath.add(mpsJar.toURI().toURL());
    }

    // WF?

    File baseLanguageFolder = new File(homePath + File.separator + "core" + File.separator + "baseLanguage");
    ClassloaderUtil.addLibraries(classPath, baseLanguageFolder, selfRootUrl);

    File languageDesignFolder = new File(homePath + File.separator + "core" + File.separator + "languageDesign");
    ClassloaderUtil.addLibraries(classPath, languageDesignFolder, selfRootUrl);
  }

  private static void addMPSBootstrapClassFolders(List<URL> classPath, String homePath, URL selfRootUrl) throws MalformedURLException {
    File acp = new File(homePath + File.separator + "build" + File.separator + "idea.additional.classpath.txt");
    if (acp.exists()) {
      try {
        Scanner sc;
        for (sc = new Scanner(acp, "UTF-8"); sc.hasNextLine();) {
          File dir = new File(homePath, sc.nextLine());
          if (dir.isDirectory()) {
            final URL url = dir.toURI().toURL();
            if (!selfRootUrl.equals(url)) {
              classPath.add(url);
            }
          }
        }
        sc.close();
      } catch (FileNotFoundException ignore) {
      }
    }
  }
}
