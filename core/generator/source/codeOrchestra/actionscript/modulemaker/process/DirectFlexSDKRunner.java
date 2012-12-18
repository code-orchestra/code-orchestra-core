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
import org.jetbrains.annotations.NotNull;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public abstract class DirectFlexSDKRunner extends AbstractFlexSDKRunner {

  private static Logger LOG = Logger.getLogger("FlexSDKRunner");

  private static final String COMPILE_OUTPUT_ENCODING = "CP1251";
  private static final String LOG_ENCODING = "UTF-8";

  private static final String COMPILE_ERRORS_LOG_FILE_NAME = "compile_errors.log";
  private static final String BIN_DIR = "bin";

  private static final String COMMAND_LINE_ERROR_TOKEN = "command line: ";

  protected DirectFlexSDKRunner(@NotNull File configFile, @NotNull CompilerSettings compilerSettings, @NotNull ASModuleMakeType moduleMakeType) {
    super(configFile, compilerSettings, moduleMakeType);
  }

  public final CompilationResult run() throws MakeException {
    // Locate the executable
    String executablePath = getExecutablePath();
    if (executablePath == null) {
      throw new MakeException("Flex SDK path not specified. To set the path go to File -> Settings -> Flex SDK");
    }

    // Construct the command + arguments
    List<String> command = new ArrayList<String>();
    command.add(executablePath);
    command.addAll(getCommandArguments());

    // Log the command
    logCommand(command);

    // Launch the process
    ProcessBuilder processBuilder = new ProcessBuilder(command);
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

  private String getExecutablePath() {
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
