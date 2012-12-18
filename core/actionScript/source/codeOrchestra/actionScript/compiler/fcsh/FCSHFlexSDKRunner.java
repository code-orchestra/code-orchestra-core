package codeOrchestra.actionScript.compiler.fcsh;

import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.actionscript.modulemaker.CompilationResult;
import codeOrchestra.actionscript.modulemaker.MakeException;
import codeOrchestra.actionscript.modulemaker.process.AbstractFlexSDKRunner;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.util.FileUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.tools.ant.types.Commandline;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class FCSHFlexSDKRunner extends AbstractFlexSDKRunner {

  private static final String COMPILE_ERRORS_LOG_FILE_NAME = "compile_errors.log";

  private FSCHCompilerKind compilerKind;
  private Project project;

  public FCSHFlexSDKRunner(@NotNull File configFile,
                           @NotNull CompilerSettings compilerSettings,
                           @NotNull ASModuleMakeType moduleMakeType,
                           @NotNull FSCHCompilerKind compilerKind,
                           @NotNull Project project) {
    super(configFile, compilerSettings, moduleMakeType);
    this.compilerKind = compilerKind;
    this.project = project;
  }

  @Override
  public CompilationResult run() throws MakeException {
    FCSHManager fcshManager = project.getComponent(FCSHManager.class);

    try {
      switch (compilerKind) {
        case MXMLC:
          return fcshManager.mxmlc(getCommandArguments());
        case COMPC:
          return fcshManager.compc(getCommandArguments());
      }
    } catch (FCSHException e) {
      throw new MakeException("Error while executing in compiler shell", e);
    }

    throw new IllegalStateException("Illegal compiler kind: " + compilerKind);
  }

  @Override
  protected List<String> getCommandArguments() {
    List<String> commandArguments = new ArrayList<String>();

    // Copy the file to the temp dir

    // Custom configuration file
    if (compilerSettings.useCustomSDKConfiguration) {
      String customConfigFileArg = "-load-config+=" + copyConfigToTempDir(compilerSettings.configurationFile);
      commandArguments.add(customConfigFileArg);
    } else {
      // Module configuration file
      String configFileArg = "-load-config+=" + copyConfigToTempDir(configFile.getPath());
      commandArguments.add(configFileArg);
    }

    // Additional compiler options
    if (!StringUtils.isEmpty(compilerSettings.compilerOptions)) {
      String[] additionalArgs = new Commandline("commandtoken " + compilerSettings.compilerOptions).getArguments();
      for (String additionalArgument : additionalArgs) {
        commandArguments.add(additionalArgument);
      }

      for (String moduleMakeTypeArgument : moduleMakeType.getAdditionalCompilerArgs()) {
        commandArguments.add(moduleMakeTypeArgument);
      }
    }

    return commandArguments;
  }

  private String copyConfigToTempDir(String configPath) {
    File tempConfigDir = new File(FileUtil.getTempDir(), "flexConfigs");

    File configFile = new File(configPath);
    if (!configFile.exists()) {
      throw new RuntimeException("Config file doesn't exist: " + configPath);
    }

    File configFileTarget = new File(tempConfigDir, configFile.getName());

    try {
      FileUtil.copyFileChecked(configFile, configFileTarget, true);
    } catch (IOException e) {
      throw new RuntimeException("Can't copy config to " + configFileTarget);
    }
    return configFileTarget.getPath();
  }

  @Override
  public String getErrorLogFilePath() {
    CodeOrchestraGenerationContext sharedContext = CodeOrchestraGenerateManager.getSharedContext();
    IModule rootModule = MPSModuleRepository.getInstance().getModule(sharedContext.getRootModule());

    String moduleDir = rootModule.getDescriptorFile().getParent().getPath();
    return moduleDir + File.separator + COMPILE_ERRORS_LOG_FILE_NAME;
  }

  @Override
  protected String getCommandName() {
    return "fcsh";
  }

}
