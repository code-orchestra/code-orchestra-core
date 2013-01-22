package codeOrchestra.flex;

import com.google.common.collect.Lists;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.modulemaker.messages.CompilerMessage;
import codeOrchestra.actionscript.modulemaker.messages.MessageType;
import codeOrchestra.flex.processors.Concept;
import jetbrains.mps.generator.TransientSModel;
import jetbrains.mps.ide.smodel.WorkbenchModelAccess;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.config.ConfigurationPathResolver;
import org.apache.flex.compiler.config.Configurator;
import org.apache.flex.compiler.config.ICompilerSettingsConstants;
import org.apache.flex.compiler.definitions.IDefinition;
import org.apache.flex.compiler.internal.as.codegen.CodeGeneratorManager;
import org.apache.flex.compiler.internal.caches.CacheStoreKeyBase;
import org.apache.flex.compiler.internal.caches.SWFCache;
import org.apache.flex.compiler.internal.projects.FlexProject;
import org.apache.flex.compiler.internal.units.ASCompilationUnit;
import org.apache.flex.compiler.internal.workspaces.Workspace;
import org.apache.flex.compiler.problems.CompilerProblemSeverity;
import org.apache.flex.compiler.problems.ICompilerProblem;
import org.apache.flex.compiler.problems.annotations.DefaultSeverity;
import org.apache.flex.compiler.targets.ISWCTarget;
import org.apache.flex.compiler.targets.ISWFTarget;
import org.apache.flex.compiler.targets.ITarget.TargetType;
import org.apache.flex.compiler.targets.ITargetSettings;
import org.apache.flex.compiler.units.requests.IFileScopeRequestResult;
import org.apache.flex.swc.ISWC;
import org.apache.flex.swc.SWCManager;
import org.apache.flex.swc.io.ISWCWriter;
import org.apache.flex.swc.io.ISWFWriterFactory;
import org.apache.flex.swc.io.SWCWriter;
import org.apache.flex.swf.Header;
import org.apache.flex.swf.ISWF;
import org.apache.flex.swf.ITagContainer;
import org.apache.flex.swf.io.ISWFWriter;
import org.apache.flex.swf.io.SWFWriterAndSizeReporter;
import org.apache.flex.utils.FilenameNormalization;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * @author Anton.I.Neverov
 */
public class FalconProjectBuilder {

  private static FalconProjectBuilder INSTANCE = new FalconProjectBuilder();

  private static boolean sessionStarted;

  private Map<Solution, Map<String, Map<String, SNode>>> solutionToRootsMap = new HashMap<Solution, Map<String, Map<String, SNode>>>();

  private ABCCache abcCache = new ABCCache();
  Map<CacheStoreKeyBase, ISWC> cachedSWCEntries = new HashMap<CacheStoreKeyBase, ISWC>();
  Map<CacheStoreKeyBase, ITagContainer> cachedSWFEntries = new HashMap<CacheStoreKeyBase, ITagContainer>();

  private List<SModel> newModels = new ArrayList<SModel>();
  private List<ASCompilationUnit> myCompilationUnits = new ArrayList<ASCompilationUnit>();
  private Workspace workspace;
  private FlexProject project;
  private Configurator configurator;
  private SNode mainClass;
  private List<String> commandLineArgs;
  private boolean buildSWC;
  private Solution mySolution;
  private String outputFileName;

  private FalconProjectBuilder() {
    CodeGeneratorManager.setFactory(CachingABCGenerator.getABCGeneratorFactory());
  }

  public void startNewBuildSession() {
    if (sessionStarted) {
      throw new RuntimeException("Trying to start build session before finishing existing");
    }

    sessionStarted = true;
  }

  public void finishBuildSession() {
    newModels.clear();
    myCompilationUnits.clear();
    workspace = null;
    project = null;
    configurator = null;
    mainClass = null;
    commandLineArgs = null;
    mySolution = null;
    buildSWC = false;
    outputFileName = null;

    sessionStarted = false;
  }

  public void addModel(SModel model) {
    if (!sessionStarted) {
      throw new RuntimeException("Trying to add model to falcon project outside of build session");
    }

    newModels.add(model);
  }

  public void setMainClass(SNode clazz) {
    if (!sessionStarted) {
      throw new RuntimeException("Trying to set main class of falcon project outside of build session");
    }

    mainClass = clazz;
  }

  public void setSolution(Solution solution) {
    if (!sessionStarted) {
      throw new RuntimeException("Trying to set solution to falcon project outside of build session");
    }

    mySolution = solution;
  }

  public void setCommandLineArguments(List<String> args) {
    if (!sessionStarted) {
      throw new RuntimeException("Trying to set command line arguments of falcon project outside of build session");
    }

    this.commandLineArgs = args;
  }

  public void build(boolean buildSWC) throws FalconProjectBuilderException {
    if (!sessionStarted) {
      throw new RuntimeException("Trying to build falcon project outside of build session");
    }

    this.buildSWC = buildSWC;

    if (mySolution == null) {
      throw new RuntimeException("Root solution is not set");
    }
    if (commandLineArgs == null) {
      throw new RuntimeException("Command line arguments are not set");
    }
    if (mainClass == null && !buildSWC) {
      throw new RuntimeException("Main class is not set");
    }

    workspace = new Workspace();
    project = new FlexProject(workspace);

    loadCachedSWCs();

    long time = System.currentTimeMillis();
    long startTime = time;
    prepareRoots();
    System.out.println("prepareRoots    :" + (System.currentTimeMillis() - time) + "ms");
    time = System.currentTimeMillis();
    configureProject();
    System.out.println("configureProject:" + (System.currentTimeMillis() - time) + "ms");
    time = System.currentTimeMillis();
    outputFileName = configurator.getConfiguration().getOutput();
    try {
      doPostProcessing();
      long length;
      if (buildSWC) {
        length = generateSWC();
      } else {
        length = generateSWF();
      }
      System.out.println("generate        :" + (System.currentTimeMillis() - time) + "ms");
      System.out.println(length + " bytes written to " + outputFileName + " in " + (System.currentTimeMillis() - startTime) + "ms");
    } catch (InterruptedException e) {
      throw new FalconProjectBuilderException("InterruptedException during build\n" + e.getMessage());
    } catch (IOException e) {
      throw new FalconProjectBuilderException("IOException during build\n" + e.getMessage());
    }
    saveCachedSWCs();
  }

  private void prepareRoots() {
    Map<String, Map<String, SNode>> modelMap = solutionToRootsMap.get(mySolution);
    if (modelMap == null) {
      modelMap = new HashMap<String, Map<String, SNode>>();
      solutionToRootsMap.put(mySolution, modelMap);
    }

    List<SNode> newRoots = new ArrayList<SNode>();

    for (SModel newModel : newModels) {
      String modelLongName = newModel.getLongName();
      Map<String, SNode> rootMap = modelMap.get(modelLongName);

      if (rootMap == null) {
        rootMap = new HashMap<String, SNode>();
        modelMap.put(modelLongName, rootMap);
      }

      for (SNode root : newModel.roots()) {
        String rootFQName = getRootFQName(root);
        rootMap.put(rootFQName, root);
        newRoots.add(root);
      }
    }

    for (Map<String, SNode> rootMap : modelMap.values()) {
      for (SNode root : rootMap.values()) {
        try {
          if (!(root.getConceptFqName().equals(Concept.AnnotationDeclaration.getName()))) {
            ASCompilationUnit asCompilationUnit = FalconCompilationUnitBuilder.getInstance().buildCompilationUnit(root, project);
            myCompilationUnits.add(asCompilationUnit);
            if (newRoots.contains(root)) {
              abcCache.remove(asCompilationUnit.getFileNode());
            }
          }
        } catch (FalconCompilationUnitBuilderException e) {
          throw new RuntimeException("Error while adding roots to falcon project", e);
        }
      }
    }
  }

  private void configureProject() {
    configurator = new Configurator();
    ConfigurationPathResolver resolver = new ConfigurationPathResolver(System.getProperty("user.dir"));
    configurator.setConfigurationPathResolver(resolver);
    configurator.setWarnOnFlexOnlyOptionUsage(false);

    String fqClassName = null;
    if (!buildSWC) {
      fqClassName = getRootFQName(mainClass);
      configurator.setMainDefinition(fqClassName);
    }
    configurator.setConfiguration(commandLineArgs.toArray(new String[commandLineArgs.size()]), ICompilerSettingsConstants.FILE_SPECS_VAR);
    configurator.applyToProject(project);
    if (!buildSWC) {
      configurator.getConfiguration().setTargetFile(FilenameNormalization.normalize(fqClassName + ".as"));
    }
  }

  private void doPostProcessing() throws FalconProjectBuilderException, InterruptedException {
    for (ASCompilationUnit unit : myCompilationUnits) {
      IFileScopeRequestResult requestResult = unit.getFileScopeRequest().get();
      ICompilerProblem[] problems = requestResult.getProblems();
      handleCompilerProblems(Arrays.<ICompilerProblem>asList(problems));
    }

    for (ASCompilationUnit unit : myCompilationUnits) {
      ArrayList<IDefinition> externallyVisibleDefinitions = new ArrayList<IDefinition>();
      unit.getFileNode().getFileScope().collectExternallyVisibleDefinitions(externallyVisibleDefinitions, false);
      for (IDefinition d : externallyVisibleDefinitions) {
        project.getScope().addDefinition(d);
      }
    }
  }

  private long generateSWF() throws FalconProjectBuilderException, InterruptedException, IOException {
    // Generate
    List<ICompilerProblem> compilerProblems = new ArrayList<ICompilerProblem>();
    ITargetSettings targetSettings = configurator.getTargetSettings(TargetType.SWF);
    ISWFTarget swfTarget = project.createSWFTarget(targetSettings, null);
    ISWF swf = swfTarget.build(compilerProblems);
    handleCompilerProblems(compilerProblems);

    // Write
    Header.Compression compression = Header.decideCompression(
      targetSettings.useCompression(),
      targetSettings.getSWFVersion(),
      targetSettings.isDebugEnabled());
    ISWFWriterFactory writerFactory = SWFWriterAndSizeReporter.getSWFWriterFactory(
      targetSettings.getSizeReport());
    ISWFWriter writer = writerFactory.createSWFWriter(swf, compression, targetSettings.isDebugEnabled());

    return writer.writeTo(new File(outputFileName));
  }

  private long generateSWC() throws FalconProjectBuilderException, InterruptedException, IOException {
    // Generate
    List<ICompilerProblem> compilerProblems = new ArrayList<ICompilerProblem>();
    ITargetSettings targetSettings = configurator.getTargetSettings(TargetType.SWC);
    ISWCTarget swcTarget = project.createSWCTarget(targetSettings, null);
    ISWC swc = swcTarget.build(compilerProblems);

    handleCompilerProblems(compilerProblems);

    // Write
    Header.Compression compression = Header.decideCompression(
      targetSettings.useCompression(),
      targetSettings.getSWFVersion(),
      targetSettings.isDebugEnabled());
    ISWCWriter swcWriter = new SWCWriter(outputFileName, targetSettings.useCompression(), targetSettings.isDebugEnabled(),
      SWFWriterAndSizeReporter.getSWFWriterFactory(targetSettings.getSizeReport()));
    swcWriter.write(swc);
    File outputFile = new File(outputFileName);

    return outputFile.length();
  }

  private void handleCompilerProblems(List<ICompilerProblem> compilerProblems) throws FalconProjectBuilderException {
    List<CompilerMessage> messages = new ArrayList<CompilerMessage>();
    if (!compilerProblems.isEmpty()) {
      boolean fatal = false;
      for (ICompilerProblem problem : compilerProblems) {
        DefaultSeverity severity = problem.getClass().getAnnotation(DefaultSeverity.class);
        if (severity == null || severity.value() == CompilerProblemSeverity.ERROR) {
          fatal = true;
          messages.add(new CompilerMessage(MessageType.ERROR, problem.toString()));
          System.out.println("ERROR:");
        } else if (severity.value() == CompilerProblemSeverity.WARNING) {
          messages.add(new CompilerMessage(MessageType.WARNING, problem.toString()));
          System.out.println("WARNING:");
        } else {
          //System.out.println("IGNORE:");
          continue;
        }
        System.out.println(problem.getClass());
        System.out.println(problem.toString());
        System.out.println();
      }
      if (fatal) {
        throw new FalconProjectBuilderException(messages);
      }
    }
  }

  private void saveCachedSWCs() {
    SWCManager swcManager = (SWCManager) workspace.getSWCManager();
    SWFCache swfCache = swcManager.getSWFCache();

    Map<CacheStoreKeyBase, ISWC> swcEntries = swcManager.getAllEntries();
    Map<CacheStoreKeyBase, ITagContainer> swfEntries = swfCache.getAllEntries();

    cachedSWCEntries.putAll(swcEntries);
    cachedSWFEntries.putAll(swfEntries);
  }

  private void loadCachedSWCs() {
    SWCManager swcManager = (SWCManager) workspace.getSWCManager();
    SWFCache swfCache = swcManager.getSWFCache();

    for (CacheStoreKeyBase key : cachedSWCEntries.keySet()) {
      swcManager.putEntry(key, cachedSWCEntries.get(key));
    }
    for (CacheStoreKeyBase key : cachedSWFEntries.keySet()) {
      swfCache.putEntry(key, cachedSWFEntries.get(key));
    }
  }

  public ABCCache getAbcCache() {
    return abcCache;
  }

  public static String getRootFQName(final SNode node) {
    // TODO: Check that node is a root
    return WorkbenchModelAccess.instance().runReadAction(new Computable<String>() {
      @Override
      public String compute() {
        String rootName = node.getName();
        String modelName = node.getModel().getLongName();
        if (rootName == null) {
          return null;
        }
        return modelName.isEmpty() ? rootName : modelName + "." + rootName;
      }
    });
  }

  public static FalconProjectBuilder getInstance() {
    return INSTANCE;
  }

  public boolean isSessionStarted() {
    return sessionStarted;
  }

}
