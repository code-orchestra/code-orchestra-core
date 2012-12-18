package codeOrchestra.rgs.server.bootstrap;

import com.intellij.idea.IdeaTestApplication;
import codeOrchestra.rgs.server.RGSParametersCLI;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;

/**
 * Based on MpsWorker
 *
 * @author Alexander Eliseyev
 */
public class RGSLoadWorker {

  public static void main(String[] args) {
    start();
  }

  public static void start() {
    setupEnvironment();

    while (true) {
      try {
        Thread.sleep(1000);
      } catch (InterruptedException e) {
        // ignore
      }
    }
  }

  private static void setupEnvironment() {
    boolean headless = System.getProperty("rgs.headless") != null;

    if (headless) {
      try {
        System.setOut(new PrintStream(new File(System.getProperty(RGSParametersCLI.RGS_HOME_PATH) + File.separator + "rgs.out")));
        System.setErr(new PrintStream(new File(System.getProperty(RGSParametersCLI.RGS_HOME_PATH) + File.separator + "rgs.err.out")));
      } catch (FileNotFoundException e) {
      }
    }

    AsyncAppender ca = new AsyncAppender();
    BasicConfigurator.configure(ca);

    /*
    if (headless) {
      Logger.getRootLogger().setLevel(Level.OFF);
      System.setProperty("org.slf4j.simpleLogger.defaultLogLevel", "error");
      System.setProperty("org.slf4j.simpleLogger.log.org.apache.sshd.common.util.SecurityUtils", "error");
    } else {
      Logger.getRootLogger().setLevel(Level.INFO);
    }
    */

    // IdeMain.setTestMode(TestMode.CORE_TEST);
    try {
      configureMPS("jetbrains.mps.vcs", "jetbrains.mps.ide.editor", "jetbrains.mps.ide.make");
    } catch (Exception ex) {
      throw new RuntimeException(ex);
    }
  }

  private static void configureMPS(String... plugins) {
    String mpsInternal = System.getProperty("mps.internal");
    System.setProperty("idea.is.internal", mpsInternal == null ? "false" : mpsInternal);
    System.setProperty("idea.no.jre.check", "true");
    if (plugins.length == 0) {
      System.setProperty("idea.load.plugins", "false");
    }
    System.setProperty("idea.platform.prefix", "Idea");

    StringBuffer pluginPath = new StringBuffer();
    File pluginDir = new File(com.intellij.openapi.application.PathManager.getPreinstalledPluginsPath());
    for (File pluginFolder : pluginDir.listFiles()) {
      if (pluginPath.length() > 0) {
        pluginPath.append(File.pathSeparator);
      }
      pluginPath.append(pluginFolder.getPath());
    }
    System.setProperty("plugin.path", pluginPath.toString());
    // Value of this property is comma-separated list of plugin IDs intended to load by platform
    System.setProperty("idea.load.plugins.id", StringUtils.join(plugins, ","));

    try {
      IdeaTestApplication.getInstance(null);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }

  }

}
