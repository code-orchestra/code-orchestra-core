package codeOrchestra.javaScript.debugger.configuration;

import com.intellij.execution.ExecutionException;
import codeOrchestra.actionscript.jsRunConfiguration.JSRunConfiguration;
import codeOrchestra.debugger.configuration.AbstractDebuggerSettings;
import jetbrains.mps.debug.api.IDebuggerSettings;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.MPSModuleRepository;

/**
 * @author Alexander Eliseyev
 */
public class JSDebuggerSettings extends AbstractDebuggerSettings implements IDebuggerSettings {

  public static final int DEFAULT_DEBUG_PORT = 9222;
  public static final String DEFAULT_DEBUG_HOST = "localhost";

  private JSRunConfiguration jsRunConfiguration;
  private String presentation;

  public JSDebuggerSettings(JSRunConfiguration jsRunConfiguration) {
    this(jsRunConfiguration, "(Chrome)");
  }

  public JSDebuggerSettings(JSRunConfiguration jsRunConfiguration, String presentation) {
    this.jsRunConfiguration = jsRunConfiguration;
    this.presentation = presentation;
  }

  public int getPort() {
    return DEFAULT_DEBUG_PORT;
  }
  
  public String getHost() {
    return DEFAULT_DEBUG_HOST;
  }
  
  public String getPresentation() {
    return presentation;
  }

  public JSRunConfiguration getJsRunConfiguration() {
    return jsRunConfiguration;
  }

  @Override
  protected Solution getSolution() throws ExecutionException {
    Solution solution = MPSModuleRepository.getInstance().getSolution(jsRunConfiguration.getModuleName());
    if (solution == null) {
      throw new ExecutionException("Can't find the "+ jsRunConfiguration.getModuleName() + " module");
    }
    return solution;
  }
}
