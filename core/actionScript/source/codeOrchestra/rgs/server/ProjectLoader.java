package codeOrchestra.rgs.server;

import com.intellij.idea.IdeaTestApplication;
import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ex.ProjectManagerEx;
import com.intellij.openapi.util.InvalidDataException;
import com.intellij.openapi.vfs.newvfs.persistent.FSRecords;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.make.ModuleMaker;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import org.apache.commons.lang.StringUtils;
import org.jdom.JDOMException;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashSet;

/**
 * Based on TestMain
 *
 * @author Alexander Eliseyev
 */
public class ProjectLoader {

  private static boolean cachesInvalidated = false;

  // TODO: take a look at this
  private static final String[] DEFAULT_ENABLED_PLUGINS = new String[]{"jetbrains.mps.vcs", "jetbrains.mps.ide.make"};

  public static void load(File projectFile) {
    //configureMPS();

    System.out.println("loading project " + projectFile + "...");
    if (!projectFile.exists()) {
      throw new RuntimeException("Can't find a project in file " + projectFile.getAbsolutePath());
    }

    loadProject(projectFile);
  }

  @NotNull
  public static MPSProject loadProject(File projectFile) {
    if (!projectFile.exists()) {
      throw new RuntimeException("Can't find project file " + projectFile.getAbsolutePath());
    }

    final ProjectManagerEx projectManager = ProjectManagerEx.getInstanceEx();

    final String filePath = projectFile.getAbsolutePath();

    //this is a workaround for MPS-8840
    final Project[] project = new Project[1];
    final Throwable[] throwable = new Throwable[1];

    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      public void run() {
        try {
          project[0] = projectManager.loadAndOpenProject(filePath, false);
        } catch (Throwable e) {
          System.out.println("ERROR WHILE LOADING PROJECT:");
          e.printStackTrace();
          throwable[0] = e;
        }
      }
    });

    if (project[0] == null) {
      // this actually happens
      if (throwable[0] != null) {
        throw new RuntimeException("ProjectManager could not load project from " + projectFile.getAbsolutePath(), throwable[0]);
      } else {
        throw new RuntimeException("ProjectManager could not load project from " + projectFile.getAbsolutePath());
      }
    }

    /*
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        new ModuleMaker().make(
          new LinkedHashSet<IModule>(MPSModuleRepository.getInstance().getAllModules()),
          new EmptyProgressIndicator());
      }
    });
    */

    projectManager.openProject(project[0]);
    return project[0].getComponent(MPSProject.class);
  }


  public static void configureMPS() {
    configureMPS(DEFAULT_ENABLED_PLUGINS);
  }

  public static void configureMPS(String... plugins) {
    String mpsInternal = System.getProperty("mps.internal");
    System.setProperty("idea.is.internal", mpsInternal == null ? "false" : mpsInternal);
    System.setProperty("idea.no.jre.check", "true");
    // Not necessary to set this property for loading listed plugins - see PluginManager.loadDescriptors()
    System.setProperty("idea.load.plugins", "false");
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
    if(!cachesInvalidated) {
      FSRecords.invalidateCaches();
      cachesInvalidated = true;
    }
    try {
      IdeaTestApplication.getInstance(null);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }

  }

}
