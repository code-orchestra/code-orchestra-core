package codeOrchestra.actionscript.modulemaker.process;

import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.actionscript.modulemaker.CompilationResult;
import codeOrchestra.actionscript.modulemaker.CompilerOutput;
import codeOrchestra.actionscript.modulemaker.MakeException;
import codeOrchestra.actionscript.modulemaker.messages.CompilerMessage;
import codeOrchestra.actionscript.modulemaker.messages.CompilerMessagesWrapper;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import codeOrchestra.actionscript.view.ASMessageMarker;
import jetbrains.mps.logging.Logger;
import org.apache.commons.lang.StringUtils;
import org.apache.tools.ant.types.Commandline;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public abstract class FlexSDKRunner {

  private static Logger LOG = Logger.getLogger(FlexSDKRunner.class.getSimpleName());

  private static final String COMPILE_OUTPUT_ENCODING = "CP1251";
  private static final String LOG_ENCODING = "UTF-8";

  private static final String DEFAULT_CONFIG_FILE_NAME = "flex-config.xml";
  private static final String DEFAULT_CONFIG_FILE_DIR = "frameworks";
  private static final String COMPILE_ERRORS_LOG_FILE_NAME = "compile_errors.log";
  private static final String BIN_DIR = "bin";

  private static final String COMMAND_LINE_ERROR_TOKEN = "command line: ";

  protected File configFile;
  protected ASModuleMakeType moduleMakeType;
  protected CompilerSettings compilerSettings;

  protected abstract String getCommandName();

  protected abstract String getCommandDescription();

  public FlexSDKRunner(File configFile, CompilerSettings compilerSettings, ASModuleMakeType moduleMakeType) {
    assert configFile != null;
    this.configFile = configFile;
    assert compilerSettings != null;
    this.compilerSettings = compilerSettings;
    assert moduleMakeType != null;
    this.moduleMakeType = moduleMakeType;
  }

  public final CompilationResult run() throws MakeException {
    List<String> commandArguments = new ArrayList<String>();

    String command = getCommand();
    if (command == null) {
      throw new MakeException("Flex SDK path not specified. To set the path go to File -> Settings -> Flex SDK");
    }
    commandArguments.add(command);

    boolean firstConfigSet = false;

    // Default SDK configuration file
    if (compilerSettings.useDefaultSDKConfiguration) {
      String defaultConfigFileArg = "-load-config=" + getDefaultConfigurationFilePath();
      commandArguments.add(defaultConfigFileArg);

      firstConfigSet = true;
    }

    // Module configuration file
    String configFileArg = "-load-config" + (firstConfigSet ? "+=" : "=") + configFile.getPath();
    commandArguments.add(configFileArg);

    // Custom configuration file
    if (compilerSettings.useCustomSDKConfiguration) {
      String customConfigFileArg = "-load-config+=" + compilerSettings.configurationFile;
      commandArguments.add(customConfigFileArg);
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

    // Log command
    logCommand(commandArguments);

    // Launch the process
    ProcessBuilder processBuilder = new ProcessBuilder(commandArguments);
    try {
      CompilerOutput compileOutputWrapper = startProcess(processBuilder);
      String compileProcessOutput = compileOutputWrapper.getOutput();

      // RE-658: Command line error handling
      if (compileProcessOutput.startsWith(COMMAND_LINE_ERROR_TOKEN)) {
        LOG.errorWithMarker(compileProcessOutput, ASMessageMarker.MARKER);
        return new CompilationResult(1, 0, false);
      }

      CompilerMessagesWrapper messagesWrapper = CompilerMessage.extract(compileProcessOutput);

      // Report compiler messages
      for (CompilerMessage compilerMessage : messagesWrapper.getMessages()) {
        String messageString = new String(compilerMessage.getSourcePath()) + " : " + compilerMessage.getContent();
        switch (compilerMessage.getType()) {
          case ERROR:
            LOG.errorWithMarker(messageString + " (line: " + compilerMessage.getLineNumber() + ")", compilerMessage.getHintObject(), ASMessageMarker.MARKER);
            break;
          case WARNING:
            LOG.warningWithMarker(messageString + " (line: " + compilerMessage.getLineNumber() + ")", compilerMessage.getHintObject(), ASMessageMarker.MARKER);
            break;
        }
      }

      return new CompilationResult(messagesWrapper);
    } catch (IOException e) {
      throw new MakeException("Can't start " + getCommandName() + " process, check your Flex SDK settings and permissions: " + e.getMessage(), e);
    }
  }

  public CompilerOutput startProcess(ProcessBuilder processBuilder) throws IOException {
    Process process = processBuilder.start();

    InputStream in = process.getErrorStream();
    InputStreamReader inr = new InputStreamReader(in, COMPILE_OUTPUT_ENCODING);
    OutputStream fout = new FileOutputStream(getErrorLogFilePath());
    OutputStreamWriter out = new OutputStreamWriter(fout, LOG_ENCODING);

    StringBuilder sb = new StringBuilder();

    char[] cbuf = new char[1024];
    int len;
    while ((len = inr.read(cbuf)) > 0) {
      sb.append(cbuf, 0, len);
      out.write(cbuf, 0, len);
    }
    in.close();
    out.close();
    
    try {
      int processExitValue = process.waitFor();
      return new CompilerOutput(processExitValue, sb.toString());
    } catch (InterruptedException e) {
      throw new RuntimeException("Abnormal process termination");
    }
  }
  
  private static void logCommand(List<String> command) {
    LOG.infoWithMarker(StringUtils.join(command.iterator(), " "), ASMessageMarker.MARKER);
  }

  public String getErrorLogFilePath() {
    return configFile.getParent() + File.separator + COMPILE_ERRORS_LOG_FILE_NAME;
  }

  private static String getDefaultConfigurationFilePath() {
    String flexSDKPath = FlexSDKSettings.getInstance().getFlexSDKPath();
    return flexSDKPath + File.separator + DEFAULT_CONFIG_FILE_DIR + File.separator + DEFAULT_CONFIG_FILE_NAME;
  }

  private String getCommand() {
    String flexSDKPath = FlexSDKSettings.getInstance().getFlexSDKPath();
    if (StringUtils.isEmpty(flexSDKPath)) {
      return null;
    }

    String result = flexSDKPath + File.separator + BIN_DIR + File.separator;
    String osName = System.getProperty("os.name");
    if (osName.startsWith("Mac OS")) {
      return result + getCommandName();
    } else if (osName.startsWith("Windows")) {
      return result + getCommandName() + ".exe";
    } else {
      return result + getCommandName();
    }
  }


}
