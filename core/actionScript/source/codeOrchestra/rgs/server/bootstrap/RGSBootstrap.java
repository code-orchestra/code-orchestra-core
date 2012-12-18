package codeOrchestra.rgs.server.bootstrap;

import com.intellij.ide.ClassloaderUtil;
import com.intellij.util.lang.UrlClassLoader;
import codeOrchestra.rgs.server.RGSParametersCLI;
import codeOrchestra.rgs.server.view.RGSConsole;
import jetbrains.mps.util.PathManager;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.net.URL;
import java.util.ArrayList;
import java.util.Properties;

/**
 * Based on AntBootstrap
 *
 * @author Alexander Eliseyev
 */
public class RGSBootstrap {

  private static final boolean START_UI = true;

  public static final String WORKER_CLASS = "codeOrchestra.rgs.server.bootstrap.RGSLoadWorker";
  public static final String RGS_PROPERTIES_FILE = "rgs.properties";
  public static final String BUILD_NUMBER_FILENAME = "build.number";

  public static void main(String[] args) {
    if (!(RGSParametersCLI.isHeadless())) {
      RGSConsole.init();
    }

    System.out.println("Starting Code Orchestra RGS...\n");

    // Load the RGS properties into System properties
    File rgsPropertiesFile = new File(new File(PathManager.getHomePath(), "bin"), RGS_PROPERTIES_FILE);
    if (!rgsPropertiesFile.exists()) {
      reportErrorAndExit("Can't locate the RGS properties under the path : " + rgsPropertiesFile.getPath());
    }
    Properties rgsProperties = null;
    try {
      rgsProperties = new Properties();
      rgsProperties.load(new FileInputStream(rgsPropertiesFile));
    } catch (IOException e) {
      reportErrorAndExit("Can't locate the RGS properties under the path : " + rgsPropertiesFile.getPath());
    }
    for (Object keyObject : rgsProperties.keySet()) {
      String propertyKey = (String) keyObject;
      String propertyValue = rgsProperties.getProperty(propertyKey);

      // Expand ~ macros
      if (propertyValue.contains("~")) {
        propertyValue = propertyValue.replace("~", System.getProperty("user.home"));
      }

      System.out.println(propertyKey + "=" + propertyValue);
      System.setProperty(propertyKey, propertyValue);
    }

    // Validate properties
    String homeProperty = System.getProperty(RGSParametersCLI.RGS_HOME_PATH);
    if (homeProperty == null) {
      reportErrorAndExit("RGS workspace dir property '" + RGSParametersCLI.RGS_HOME_PATH + "' is not set");
    }
    File homeDir = new File(homeProperty);

    // Copy the build.number file to the RGS
    File buildNumberFile = new File(PathManager.getHomePath(), BUILD_NUMBER_FILENAME);
    File targetBuildNumberFile = new File(homeDir, BUILD_NUMBER_FILENAME);

    if (homeDir.exists()) {
      // Check the build number of the home dir and clear it if it doesn't match the application build number
      String editorBN = getBuildNumber(buildNumberFile);
      String rgsBN = getBuildNumber(targetBuildNumberFile);

      if (editorBN == null && rgsBN == null) {
        System.out.println("No build.number can be determined");
      } else {
        // Have to do this w/o ObjectUtils.equals due to classpath issues
        if ((editorBN != null && !editorBN.equals(rgsBN)) || !rgsBN.equals(editorBN)) {
          try {
            FileUtils.cleanDirectory(homeDir);
          } catch (IOException e) {
            e.printStackTrace(System.err);
          }
        }
      }
    } else {
      // Create a home dir if it doesn't exist yet
      homeDir.mkdir();
    }

    if (buildNumberFile.exists() && !targetBuildNumberFile.exists()) {
      try {
        FileUtils.copyFile(buildNumberFile, targetBuildNumberFile);
      } catch (IOException e) {
        e.printStackTrace(System.err);
      }
    }

    // Additional properties
    System.setProperty("mps.vfs.useIoFile", "true");
    System.setProperty("idea.system.path", homeProperty);

    System.out.println();

    // Load the worker class
    UrlClassLoader newClassLoader = ClassloaderUtil.initClassloader(new ArrayList<URL>());
    try {
      Class clazz = newClassLoader.loadClass(WORKER_CLASS);

      Method mainMethod = clazz.getDeclaredMethod("main", String[].class);
      mainMethod.setAccessible(true);
      String[] passedArgs = new String[]{};
      mainMethod.invoke(null, (Object) passedArgs);
    } catch (Exception e) {
      e.printStackTrace(System.err);
    }
    System.exit(1);
  }

  private static String getBuildNumber(File buildNumberFile) {
    Properties properties = new Properties();
    try {
      properties.load(new FileInputStream(buildNumberFile));
    } catch (IOException e) {
      return null;
    }
    Object buildNumberObject = properties.get("build.number");
    if (buildNumberObject != null) {
      return buildNumberObject.toString();
    }
    return null;
  }

  private static void reportErrorAndExit(String message) {
    System.out.println(message);
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      // ignore
    }
    System.exit(0);
  }

}
