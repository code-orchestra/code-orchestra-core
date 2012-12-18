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
package jetbrains.mps.build.ant;

import com.intellij.ide.IdeEventQueue;
import com.intellij.idea.IdeaTestApplication;
import com.intellij.openapi.application.PathMacros;
import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.openapi.project.ProjectManager;
import com.intellij.openapi.util.Computable;
import com.intellij.util.PathUtil;
import jetbrains.mps.generator.GeneratorManager;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.library.BaseLibraryManager.MyState;
import jetbrains.mps.library.Library;
import jetbrains.mps.library.LibraryInitializer;
import jetbrains.mps.library.LibraryManager;
import jetbrains.mps.library.ModulesMiner;
import jetbrains.mps.logging.ILoggingHandler;
import jetbrains.mps.logging.LogEntry;
import jetbrains.mps.make.MPSCompilationResult;
import jetbrains.mps.make.ModuleMaker;
import jetbrains.mps.plugins.PluginUtil;
import jetbrains.mps.plugins.PluginUtil.ApplicationPluginCreator;
import jetbrains.mps.plugins.applicationplugins.BaseApplicationPlugin;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.structure.project.ProjectDescriptor;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.persistence.DefaultModelRootManager;
import jetbrains.mps.smodel.persistence.def.DescriptorLoadResult;
import jetbrains.mps.smodel.persistence.def.ModelFileReadException;
import jetbrains.mps.smodel.persistence.def.ModelPersistence;
import jetbrains.mps.smodel.persistence.def.PersistenceVersionNotFoundException;
import jetbrains.mps.util.FileUtil;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.ConsoleAppender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectComponent;
import org.jetbrains.annotations.NotNull;

import javax.swing.SwingUtilities;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.util.*;

public abstract class MpsWorker {

  private static Logger LOG = Logger.getLogger(MpsWorker.class);

  protected final List<String> myErrors = new ArrayList<String>();
  protected final List<String> myWarnings = new ArrayList<String>();
  protected final WhatToDo myWhatToDo;
  private final AntLogger myLogger;
  private MpsWorker.MyMessageHandlerAppender myMessageHandler = new MyMessageHandlerAppender();
  private final List<BaseApplicationPlugin> myPlugins = new ArrayList<BaseApplicationPlugin>();

  private MpsWorker() {
    this(null, (AntLogger) null);
  }

  public MpsWorker(WhatToDo whatToDo) {
    this(whatToDo, new LogLogger());
  }

  public MpsWorker(WhatToDo whatToDo, ProjectComponent component) {
    this(whatToDo, new ProjectComponentLogger(component));
  }

  public MpsWorker(WhatToDo whatToDo, AntLogger logger) {
    myWhatToDo = whatToDo;
    myLogger = logger;
  }

  public void workFromMain() {
    try {
      work();
      System.exit(0);
    } catch (Throwable e) {
      log(e);
      System.exit(1);
    }
  }

  public void work() {
    setupEnvironment();

    final MPSProject project = createDummyProject();

    ObjectsToProcess go = new ObjectsToProcess();
    collectModelsToGenerate(go);

    if (go.hasAnythingToGenerate()) {
      reload();
      if (go.getProjects().isEmpty()) {loadPlugins();}
      executeTask(project, go);
      if (go.getProjects().isEmpty()) {disposePlugins();}
    } else {
//      error("Could not find anything to generate.");
    }

    disposeProjects(go.getProjects());
    dispose();

    showStatistic();
  }

  protected MPSProject createDummyProject() {
    com.intellij.openapi.project.Project ideaProject = ProjectManager.getInstance().getDefaultProject();

    File projectFile = FileUtil.createTmpFile();
    final MPSProject project = new MPSProject(ideaProject);
    project.init(projectFile, new ProjectDescriptor());

    projectFile.deleteOnExit();

    return project;
  }

  protected void dispose() {
    disposePlugins();
    for (int i = 0; i < 3; i++) {
      try {
        SwingUtilities.invokeAndWait(new Runnable() {
          public void run() {

          }
        });
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    jetbrains.mps.logging.Logger.removeLoggingHandler(myMessageHandler);
  }

  protected void disposeProject(final MPSProject p) {
    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      public void run() {
        p.dispose(false);

        IdeEventQueue.getInstance().flushQueue();
        System.gc();
      }
    });
  }

  protected void setupEnvironment() {
    BasicConfigurator.configure(new ConsoleAppender());
    Logger.getRootLogger().setLevel(getLog4jLevel());
    jetbrains.mps.logging.Logger.addLoggingHandler(myMessageHandler);

    IdeMain.setTestMode(TestMode.CORE_TEST);
    try {
      configureMPS("jetbrains.mps.vcs", "jetbrains.mps.ide.editor", "jetbrains.mps.ide.make");
    } catch (Exception ex) {
      throw new RuntimeException(ex);
    }

    setMacro();
    loadLibraries();
    make();
    reload();
  }

  public static void configureMPS(String... plugins) {
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

  protected void make() {
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        EmptyProgressIndicator indicator = new EmptyProgressIndicator();

        ClassLoaderManager.getInstance().updateClassPath();

        ModuleMaker maker = new ModuleMaker();
        maker.make(new LinkedHashSet<IModule>(MPSModuleRepository.getInstance().getAllModules()), indicator);
      }
    });
  }

  protected void reload() {
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        EmptyProgressIndicator indicator = new EmptyProgressIndicator();
        ClassLoaderManager.getInstance().reloadAll(indicator);
      }
    });
  }

  protected void loadPlugins() {
    Set<IModule> modules = new HashSet<IModule>();
    modules.add(MPSModuleRepository.getInstance().getLanguage("jetbrains.mps.make.facet"));

    myPlugins.addAll(PluginUtil.createPlugins(modules, new ApplicationPluginCreator()));

    for (BaseApplicationPlugin plugin : myPlugins) {
      try {
        plugin.createCustomParts();
      } catch (Throwable t1) {
        log("Plugin " + plugin + " threw an exception during initialization ", t1);
      }
    }
  }

  protected void disposePlugins() {
    Collections.reverse(myPlugins);
    for (BaseApplicationPlugin plugin : myPlugins) {
      try {
        plugin.dispose();
      } catch (Throwable t) {
        log("Plugin " + plugin + " threw an exception during disposing ", t);
      }
    }
    myPlugins.clear();
  }

  protected void startMake(Set<Library> compiledLibraries, Set<IModule> toCompile) {
    info("Starting compilation:");
    StringBuffer sb = new StringBuffer();
    for (IModule m : toCompile) {
      sb.append("    ");
      sb.append(m.getModuleFqName());
      sb.append("\n");
    }
    info(sb.toString());
  }

  protected void finishMake(Set<Library> compiledLibraries, @NotNull MPSCompilationResult result) {
    if (!result.isOk()) {
      error(result.toString());
      throw new RuntimeException(result.toString());
    } else {
      info(result.toString());
    }
  }

  protected abstract void executeTask(MPSProject project, ObjectsToProcess go);

  protected abstract void showStatistic();

  protected StringBuffer formatErrorsReport(String taskName) {
    StringBuffer sb = new StringBuffer();
    sb.append(StringUtils.repeat("*", 100));
    sb.append("\n");
    sb.append(myErrors.size());
    sb.append(" errors during " + taskName + ":\n");
    for (String error : myErrors) {
      sb.append(error);
      sb.append("\n");
    }
    sb.append(StringUtils.repeat("*", 100));
    return sb;
  }

  protected void failBuild(String name) {
    if (!(myErrors.isEmpty()) && myWhatToDo.getFailOnError()) {
      throw new BuildException(this.formatErrorsReport(name).toString());
    }
  }

  protected void disposeProjects(Set<MPSProject> projects) {
    ModelAccess.instance().flushEventQueue();
    for (final MPSProject project : projects) {
      disposeProject(project);
    }
  }

  private Level getLog4jLevel() {
    switch (myWhatToDo.getLogLevel()) {
      case Project.MSG_ERR:
        return Level.ERROR;
      case Project.MSG_WARN:
        return Level.WARN;
      case Project.MSG_INFO:
        return Level.WARN; // still warn, info only for messages from this task
      case Project.MSG_VERBOSE:
        return Level.INFO; // now we have info
      case Project.MSG_DEBUG:
        return Level.DEBUG;
      default:
        return null;
    }
  }

  private void setMacro() {
    Map<String, String> macro = myWhatToDo.getMacro();
    for (String macroName : macro.keySet()) {
      String canonicalPath = PathUtil.getCanonicalPath(macro.get(macroName));
      File file = new File(canonicalPath);
      if (file.exists() && file.isDirectory()) {
        PathMacros.getInstance().setMacro(macroName, canonicalPath);
      }
    }
  }

  private void loadLibraries() {
    MyState state = LibraryManager.getInstance().getState();
    Map<String, Library> libraries = state.getLibraries();

    for (String libName : myWhatToDo.getLibraries().keySet()) {
      Library library = new Library();
      library.setName(libName);
      library.setPath(myWhatToDo.getLibraries().get(libName).getAbsolutePath());
      libraries.put(libName, library);
    }

    LibraryManager.getInstance().loadState(state);
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        LibraryInitializer.getInstance().update();
      }
    });
  }

  public void collectModelsToGenerate(ObjectsToProcess go) {
    collectFromProjects(go.getProjects());
    collectFromModuleFiles(go.getModules());
    collectFromModelFiles(go.getModels());
  }

  private void collectFromProjects(Set<MPSProject> projects) {
    for (File projectFile : myWhatToDo.getMPSProjectFiles().keySet()) {
      if (projectFile.getAbsolutePath().endsWith(MPSExtentions.DOT_MPS_PROJECT)) {
        MPSProject project;
        try {
          Class<?> cls = Class.forName("jetbrains.mps.TestMain");
          Method meth = cls.getMethod("loadProject", File.class);
          project = (MPSProject) meth.invoke(null, projectFile);
        } catch (Exception ex) {
          throw new RuntimeException(ex);
        }

        info("Loaded project " + project);
        projects.add(project);
      }
    }
  }

  protected void extractModels(Set<SModelDescriptor> modelDescriptors, MPSProject project) {
    List<SModelDescriptor> models = project.getProjectModels();
    for (Language language : project.getProjectModules(Language.class)) {
      models.addAll(language.getOwnModelDescriptors());
      for (jetbrains.mps.smodel.Generator gen : language.getGenerators()) {
        models.addAll(gen.getOwnModelDescriptors());
      }
    }
    for (SModelDescriptor modelDescriptor : models) {
      if (includeModel(modelDescriptor)) {
        modelDescriptors.add(modelDescriptor);
      }
    }
  }

  private boolean includeModel(SModelDescriptor modelDescriptor) {
    return SModelStereotype.isUserModel(modelDescriptor) &&
      !(GeneratorManager.isDoNotGenerate(modelDescriptor));
  }

  protected void extractModels(Collection<SModelDescriptor> modelsList, IModule m) {
    List<SModelDescriptor> ownedModels = m.getOwnModelDescriptors();
    for (SModelDescriptor d : ownedModels) {
      if (includeModel(d)) {
        modelsList.add(d);
      }
    }
  }

  protected void collectFromModuleFiles(Set<IModule> modules) {
    for (File moduleFile : myWhatToDo.getModules()) {
      processModuleFile(moduleFile, modules);
    }
  }

  private void processModuleFile(final File moduleFile, final Set<IModule> modules) {
    String path = moduleFile.getAbsolutePath();
    if (!path.endsWith(MPSExtentions.DOT_LANGUAGE) && !path.endsWith(MPSExtentions.DOT_SOLUTION) && !path.endsWith(MPSExtentions.DOT_DEVKIT))
      return;
    List<IModule> tmpmodules;
    IModule moduleByFile = ModelAccess.instance().runReadAction(new Computable<IModule>() {
      public IModule compute() {
        return MPSModuleRepository.getInstance().getModuleByFile(FileSystem.getInstance().getFileByPath(moduleFile.getAbsolutePath()));
      }
    });
    if (moduleByFile != null) {
      tmpmodules = Collections.singletonList(moduleByFile);
    } else {
      tmpmodules = ModelAccess.instance().runWriteAction(new Computable<List<IModule>>() {
        public List<IModule> compute() {
          IFile file = FileSystem.getInstance().getFileByPath(moduleFile.getPath());
          return ModulesMiner.getInstance().readModuleDescriptors(file.isDirectory() ? file : file.getParent(), new MPSModuleOwner() {
          });
        }
      });
    }

    modules.addAll(tmpmodules);
    for (IModule module : tmpmodules) {
      info("Loaded module " + module);

      if (module.isPackaged()) continue;

      if (module instanceof Language) {
        Language language = (Language) module;
        for (Generator gen : language.getGenerators()) {
          modules.add(gen);
        }
      }
    }
  }

  protected void collectFromModelFiles(Set<SModelDescriptor> modelDescriptor) {
    for (File f : myWhatToDo.getModels()) {
      if (f.getPath().endsWith(MPSExtentions.DOT_MODEL)) {
        processModelFile(modelDescriptor, f);
      }
    }
  }

  private void processModelFile(Set<SModelDescriptor> modelDescriptors, File f) {
    final IFile ifile = FileSystem.getInstance().getFileByPath(f.getAbsolutePath());

    // try to find if model is loaded
    SModelDescriptor model = SModelRepository.getInstance().findModel(ifile);
    if (model != null) {
      modelDescriptors.add(model);
      info("Found model " + model);
      return;
    }

    // if model is not loaded, read it
    try {
      DescriptorLoadResult dr = ModelPersistence.loadDescriptor(ifile);
      SModelReference modelReference;
      if (dr.getUID() != null) {
        modelReference = SModelReference.fromString(dr.getUID());
      } else {
        modelReference = SModelReference.fromPath(ifile.getPath());
      }

      info("Read model " + modelReference);
      SModelDescriptor smodelDescriptor = new DefaultSModelDescriptor(new DefaultModelRootManager(), ifile, modelReference);
      if (smodelDescriptor.getModule() == null) {
        error("Module for " + ifile.getPath() + " was not found. Use \"library\" tag to load required modules.");
      } else {
        modelDescriptors.add(smodelDescriptor);
      }
    } catch (ModelFileReadException e) {
      log(e);
    } catch (PersistenceVersionNotFoundException e) {
      log(e);
    }
  }

  private void log(String text, int level) {
    if (level <= myWhatToDo.getLogLevel()) myLogger.log(text, level);
  }

  public void info(String text) {
    log(text, Project.MSG_INFO);
  }

  public void verbose(String text) {
    log(text, Project.MSG_VERBOSE);
  }

  public void warning(String text) {
    log(text, Project.MSG_WARN);
    myWarnings.add(text);
  }

  public void debug(String text) {
    log(text, Project.MSG_DEBUG);
  }

  public void error(String text) {
    log(text, Project.MSG_ERR);
    myErrors.add(text);
  }

  public void log(Throwable e) {
    StringBuffer sb = extractStackTrace(e);
    error(sb.toString());
  }

  public void log(String text, Throwable e) {
    StringBuffer sb = extractStackTrace(e);
    error(text + "\n" + sb.toString());
  }

  public static StringBuffer extractStackTrace(Throwable e) {
    StringWriter writer = new StringWriter();
    e.printStackTrace(new PrintWriter(writer));
    return writer.getBuffer();
  }

  public class MyMessageHandlerAppender implements ILoggingHandler {

    public void info(LogEntry e) {
      MpsWorker.this.verbose(e.getMessage());
    }

    public void warning(LogEntry e) {
      MpsWorker.this.warning(e.getMessage());
    }

    public void debug(LogEntry e) {
      MpsWorker.this.debug(e.getMessage());
    }

    public void error(LogEntry e) {
      if (e.getThrowable() != null) {
        MpsWorker.this.log(e.getThrowable());
      } else {
        MpsWorker.this.error(e.getMessage());
      }
    }

    public void fatal(LogEntry e) {
      if (e.getThrowable() != null) {
        MpsWorker.this.log(e.getThrowable());
      } else {
        MpsWorker.this.error(e.getMessage());
      }
    }
  }

  protected static interface AntLogger {

    void log(String text, int level);
  }

  private static class ProjectComponentLogger implements AntLogger {
    private final ProjectComponent myProjectComponent;

    public ProjectComponentLogger(ProjectComponent projectComponent) {
      myProjectComponent = projectComponent;
    }

    public void log(String text, int level) {
      myProjectComponent.log(text, level);
    }
  }

  public static class SystemOutLogger implements AntLogger {

    public void log(String text, int level) {
      if (level == Project.MSG_ERR) {
        System.err.println(text);
      } else {
        System.out.println(text);
      }
    }
  }

  public static class LogLogger implements AntLogger {

    public void log(String text, int level) {
      switch (level) {
        case Project.MSG_ERR:
          LOG.error(text);
          break;
        case Project.MSG_WARN:
          LOG.warn(text);
          break;
        case Project.MSG_INFO:
          LOG.info(text);
          break;
        case Project.MSG_DEBUG:
        case Project.MSG_VERBOSE:
          LOG.debug(text);
          break;
        default:
          LOG.fatal("[unknown level " + level + "] " + text);
          break;
      }
    }
  }

  protected class ObjectsToProcess {
    private final Set<MPSProject> myProjects = new LinkedHashSet<MPSProject>();
    private final Set<IModule> myModules = new LinkedHashSet<IModule>();
    private final Set<SModelDescriptor> myModels = new LinkedHashSet<SModelDescriptor>();

    public ObjectsToProcess() {
    }

    public ObjectsToProcess(Set<MPSProject> mpsProjects, Set<IModule> modules, Set<SModelDescriptor> models) {
      myProjects.addAll(mpsProjects);
      myModules.addAll(modules);
      myModels.addAll(models);
    }

    public Set<MPSProject> getProjects() {
      return myProjects;
    }

    public Set<IModule> getModules() {
      return myModules;
    }

    public Set<SModelDescriptor> getModels() {
      return myModels;
    }

    public boolean hasAnythingToGenerate() {
      return !myModels.isEmpty() || !myProjects.isEmpty() || !myModules.isEmpty();
    }
  }
}
