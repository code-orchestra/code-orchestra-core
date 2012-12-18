package codeOrchestra.actionScript.debugger;

import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpointsProvider;
import codeOrchestra.actionScript.debugger.request.ASLineBreakpointRequestProcessor;
import codeOrchestra.actionScript.debugger.session.ASDebugSessionCreator;
import codeOrchestra.debugger.breakpoint.BreakpointRequestProcessorProvider;
import jetbrains.mps.debug.api.AbstractDebugSessionCreator;
import jetbrains.mps.debug.api.AbstractDebugger;
import jetbrains.mps.debug.api.Debuggers;
import jetbrains.mps.debug.api.breakpoints.BreakpointProvidersManager;
import jetbrains.mps.debug.api.breakpoints.IBreakpointsProvider;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class ASDebugger extends AbstractDebugger implements ApplicationComponent {

  private final IBreakpointsProvider breakpointsProvider = ASBreakpointsProvider.getInstance();

  public ASDebugger(Debuggers debuggers, BreakpointProvidersManager breakpointsProviderManager) {
    super("AS", debuggers, breakpointsProviderManager);
  }

  @NotNull
  @Override
  public AbstractDebugSessionCreator createDebugSessionCreator(@NotNull Project project) {
    return new ASDebugSessionCreator(project);
  }

  @NotNull
  @Override
  public IBreakpointsProvider getBreakpointsProvider() {
    return breakpointsProvider;
  }

  @NotNull
  @Override
  public String getComponentName() {
    return getName() + " Debugger";
  }

  @Override
  public void initComponent() {
    init();

    // Add request event processors
    BreakpointRequestProcessorProvider.getInstance().registerProcessor(new ASLineBreakpointRequestProcessor());
  }

  @Override
  public void disposeComponent() {
    dispose();
  }
}
