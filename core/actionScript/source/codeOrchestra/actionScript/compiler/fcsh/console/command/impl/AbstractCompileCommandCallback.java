package codeOrchestra.actionScript.compiler.fcsh.console.command.impl;

import codeOrchestra.actionScript.compiler.fcsh.FCSHException;
import codeOrchestra.actionScript.compiler.fcsh.console.command.AbstractCommandCallback;
import codeOrchestra.actionScript.compiler.fcsh.console.command.CommandOutput;
import codeOrchestra.actionscript.modulemaker.CompilationResult;
import codeOrchestra.actionscript.modulemaker.messages.CompilerMessage;
import codeOrchestra.actionscript.modulemaker.messages.CompilerMessagesWrapper;
import codeOrchestra.actionscript.view.ASMessageMarker;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.util.FileUtil;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractCompileCommandCallback extends AbstractCommandCallback {

  private static final String COMMAND_LINE_ERROR_TOKEN = "command line: ";
  private static final String COMPILE_ERRORS_LOG_FILE_NAME = "compile_errors.log";

  public static final CompilationResult OK_COMPILATION_RESULT = new CompilationResult(0, 0, false);

  protected abstract CompilationResult compile(CommandOutput response);

  private CompilationResult compilationResult;
  protected Logger log = Logger.getLogger(getExecutableName());

  @Override
  public final void done(CommandOutput response) {
    this.compilationResult = compile(response);
  }

  public CompilationResult getCompileResult() throws FCSHException {
    if (hasFailed()) {
      throw new FCSHException(getFailCause());
    }
    return compilationResult;
  }

  protected abstract String getExecutableName();

  protected CompilationResult getCompilationResult(CommandOutput response) {
    // Parse/save the compiler output (errors/warnings)
    String errorOutput = response.getErrorOutput();
    if (errorOutput == null) {
      return OK_COMPILATION_RESULT;
    }
    FileUtil.write(new File(getErrorLogFilePath()), errorOutput);

    // RE-658: Command line error handling
    if (errorOutput.startsWith(COMMAND_LINE_ERROR_TOKEN)) {
      log.errorWithMarker(errorOutput, ASMessageMarker.MARKER);
      return new CompilationResult(1, 0, false);
    }

    // Report compiler messages
    CompilerMessagesWrapper messagesWrapper = CompilerMessage.extract(errorOutput);
    for (CompilerMessage compilerMessage : messagesWrapper.getMessages()) {
      String reportMessage = compilerMessage.getReportMessage();
      switch (compilerMessage.getType()) {
        case ERROR:
          getLogger().errorWithMarker(reportMessage, compilerMessage.getHintObject(), ASMessageMarker.MARKER);
          break;
        case WARNING:
          getLogger().warningWithMarker(reportMessage, compilerMessage.getHintObject(), ASMessageMarker.MARKER);
          break;
      }
    }

    // Double-check
    if (messagesWrapper.isEmpty()) {
      String trimmedErrorOutput = errorOutput.trim();
      if (trimmedErrorOutput.contains("Error:")) {
        getLogger().errorWithMarker(errorOutput, ASMessageMarker.MARKER);
        return new CompilationResult(1, 0, false);
      }
    }

    return new CompilationResult(messagesWrapper);
  }

  private String getErrorLogFilePath() {
    CodeOrchestraGenerationContext sharedContext = CodeOrchestraGenerateManager.getSharedContext();
    IModule rootModule = MPSModuleRepository.getInstance().getModule(sharedContext.getRootModule());

    String moduleDir = rootModule.getDescriptorFile().getParent().getPath();
    return moduleDir + File.separator + COMPILE_ERRORS_LOG_FILE_NAME;
  }

  @Override
  public boolean isSynchronous() {
    return true;
  }

  public Logger getLogger() {
    return log;
  }

}
