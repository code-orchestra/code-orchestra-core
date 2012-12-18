package codeOrchestra.flex;

import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.modulemaker.messages.CompilerMessage;
import codeOrchestra.actionscript.modulemaker.messages.MessageType;
import codeOrchestra.flex.processors.Concept;
import jetbrains.mps.ide.smodel.WorkbenchModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.config.ConfigurationPathResolver;
import org.apache.flex.compiler.config.Configurator;
import org.apache.flex.compiler.config.ICompilerSettingsConstants;
import org.apache.flex.compiler.definitions.IDefinition;
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
import org.apache.flex.swc.io.ISWCWriter;
import org.apache.flex.swc.io.ISWFWriterFactory;
import org.apache.flex.swc.io.SWCWriter;
import org.apache.flex.swf.Header;
import org.apache.flex.swf.ISWF;
import org.apache.flex.swf.io.ISWFWriter;
import org.apache.flex.swf.io.SWFWriterAndSizeReporter;
import org.apache.flex.utils.FilenameNormalization;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class FalconProjectBuilder {

  private static FalconProjectBuilder INSTANCE = new FalconProjectBuilder();

  private static boolean sessionStarted;

  private List<ASCompilationUnit> myCompilationUnits = new ArrayList<ASCompilationUnit>();
  private Workspace workspace;
  private FlexProject project;
  private Configurator configurator;
  private SNode mainClass;
  private List<String> commandLineArgs;
  private boolean buildSWC;

  private FalconProjectBuilder() {
  }

  public void startNewBuildSession() {
    if (sessionStarted) {
      throw new RuntimeException("Trying to start build session before finishing existing");
    }

    sessionStarted = true;

    workspace = new Workspace();
    project = new FlexProject(workspace);
  }

  public void finishBuildSession() {
    if (!sessionStarted) {
      throw new RuntimeException("Trying to finish build session before starting it");
    }

    myCompilationUnits.clear();
    workspace = null;
    project = null;
    configurator = null;
    mainClass = null;

    sessionStarted = false;
  }

  public void addRoots(SModel model) {
    if (!sessionStarted) {
      throw new RuntimeException("Trying to add roots to falcon project outside of build session");
    }

    for (SNode root : model.roots()) {
      try {
        if (!(root.getConceptFqName().equals(Concept.AnnotationDeclaration.getName()))) {
          ASCompilationUnit asCompilationUnit = FalconCompilationUnitBuilder.getInstance().buildCompilationUnit(root, project);
          myCompilationUnits.add(asCompilationUnit);
        }
      } catch (FalconCompilationUnitBuilderException e) {
        throw new RuntimeException("Error while adding roots to falcon project", e);
      }
    }
  }

  public void setMainClass(SNode clazz) {
    if (!sessionStarted) {
      throw new RuntimeException("Trying to set main class of falcon project outside of build session");
    }

    this.mainClass = clazz;
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

    try {
      configureProject();
      doPostProcessing();
      if (buildSWC) {
        generateSWC();
      } else {
        generateSWF();
      }
    } catch (InterruptedException e) {
      throw new FalconProjectBuilderException("InterruptedException during build\n" + e.getMessage());
    } catch (IOException e) {
      throw new FalconProjectBuilderException("IOException during build\n" + e.getMessage());
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

  private void generateSWF() throws FalconProjectBuilderException, InterruptedException, IOException {
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

    String outputFileName = configurator.getConfiguration().getOutput();
    int bytes = writer.writeTo(new File(outputFileName));
    System.out.println(bytes + " bytes written to " + outputFileName);
  }

  private void generateSWC() throws FalconProjectBuilderException, InterruptedException, IOException {
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
    String outputFileName = configurator.getConfiguration().getOutput();
    ISWCWriter swcWriter = new SWCWriter(outputFileName, targetSettings.useCompression(), targetSettings.isDebugEnabled(),
      SWFWriterAndSizeReporter.getSWFWriterFactory(targetSettings.getSizeReport()));
    swcWriter.write(swc);
    File outputFile = new File(outputFileName);
    System.out.println(outputFile.length() + " bytes written to " + outputFileName);
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
          System.out.println("IGNORE:");
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

  public static FalconProjectBuilder getInstance() {
    return INSTANCE;
  }

  public boolean isSessionStarted() {
    return sessionStarted;
  }

}
