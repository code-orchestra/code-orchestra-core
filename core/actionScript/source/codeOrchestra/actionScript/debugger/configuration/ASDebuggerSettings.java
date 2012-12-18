package codeOrchestra.actionScript.debugger.configuration;

import com.intellij.execution.ExecutionException;
import codeOrchestra.debugger.configuration.AbstractDebuggerSettings;
import codeOrchestra.run.CodeOrchestraRunConfiguration;
import jetbrains.mps.debug.api.IDebuggerSettings;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.MPSModuleRepository;

/**
 * @author Alexander Eliseyev
 */
public class ASDebuggerSettings extends AbstractDebuggerSettings implements IDebuggerSettings {

  private CodeOrchestraRunConfiguration codeOrchestraRunConfiguration;
  private String presentation;

  public ASDebuggerSettings(CodeOrchestraRunConfiguration asRunConfiguration) {
    this(asRunConfiguration, "(FDB)");
  }

  public ASDebuggerSettings(CodeOrchestraRunConfiguration asRunConfiguration, String presentation) {
    this.codeOrchestraRunConfiguration = asRunConfiguration;
    this.presentation = presentation;
  }

  public String getPresentation() {
    return presentation;
  }

  public CodeOrchestraRunConfiguration getRunConfiguration() {
    return codeOrchestraRunConfiguration;
  }

  @Override
  protected Solution getSolution() throws ExecutionException {
    Solution solution = MPSModuleRepository.getInstance().getSolution(codeOrchestraRunConfiguration.getModuleName());
    if (solution == null) {
      throw new ExecutionException("Can't find the "+ codeOrchestraRunConfiguration.getModuleName() + " module");
    }
    return solution;
  }

}
