package codeOrchestra.actionscript.modulemaker.process;

import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.actionscript.modulemaker.CompilationResult;
import codeOrchestra.actionscript.modulemaker.MakeException;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import org.apache.commons.lang.StringUtils;
import org.apache.tools.ant.types.Commandline;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractFlexSDKRunner {

  private static final String DEFAULT_CONFIG_FILE_NAME = "flex-config.xml";
  private static final String DEFAULT_CONFIG_FILE_DIR = "frameworks";

  protected File configFile;
  protected ASModuleMakeType moduleMakeType;
  protected CompilerSettings compilerSettings;

  public AbstractFlexSDKRunner(@NotNull File configFile, @NotNull CompilerSettings compilerSettings, @NotNull ASModuleMakeType moduleMakeType) {
    this.configFile = configFile;
    this.compilerSettings = compilerSettings;
    this.moduleMakeType = moduleMakeType;
  }

  public abstract CompilationResult run() throws MakeException;

  public abstract String getErrorLogFilePath();

  protected abstract String getCommandName();

  protected List<String> getCommandArguments() {
    List<String> commandArguments = new ArrayList<String>();

    boolean firstConfigSet = false;

    // Default SDK configuration file
    if (compilerSettings.useDefaultSDKConfiguration) {
      String defaultConfigFileArg = "-load-config=" + getDefaultConfigurationFilePath();
      commandArguments.add(defaultConfigFileArg);

      firstConfigSet = true;
    }

    // Custom configuration file
    if (compilerSettings.useCustomSDKConfiguration) {
      String customConfigFileArg = "-load-config" + (firstConfigSet ? "+=" : "=") + compilerSettings.configurationFile;
      commandArguments.add(customConfigFileArg);
    } else {
      // Module configuration file
      String configFileArg = "-load-config" + (firstConfigSet ? "+=" : "=") + configFile.getPath();
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

  public static String protect(String result) {
    if (result.contains(" ")) {
      return "\"" + result + "\"";
    }
    return result;
  }

  private static String getDefaultConfigurationFilePath() {
    String flexSDKPath = FlexSDKSettings.getInstance().getFlexSDKPath();
    return flexSDKPath + File.separator + DEFAULT_CONFIG_FILE_DIR + File.separator + DEFAULT_CONFIG_FILE_NAME;
  }

}
