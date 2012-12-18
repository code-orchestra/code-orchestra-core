package codeOrchestra.javaScript.debugger;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionScript.debugger.breakpoint.ASBreakpointsProvider;
import codeOrchestra.debugger.breakpoint.BreakpointRequestProcessorProvider;
import codeOrchestra.javaScript.debugger.request.JSLineBreakpointRequestProcessor;
import codeOrchestra.javaScript.debugger.session.JSDebugSessionCreator;
import codeOrchestra.javaScript.debugger.vm.TabConnectorProvider;
import codeOrchestra.javaScript.debugger.vm.v8.V8TabConnectorProvider;
import codeOrchestra.javaScript.debugger.vm.wip.WIPTabConnectorProvider;
import jetbrains.mps.debug.api.AbstractDebugSessionCreator;
import jetbrains.mps.debug.api.AbstractDebugger;
import jetbrains.mps.debug.api.Debuggers;
import jetbrains.mps.debug.api.breakpoints.BreakpointProvidersManager;
import jetbrains.mps.debug.api.breakpoints.IBreakpointsProvider;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class JSDebugger extends AbstractDebugger implements ApplicationComponent {

  private static JSDebugger instance = null;

  public static JSDebugger getInstance() {
    if (instance == null) {
      instance = ApplicationManager.getApplication().getComponent(JSDebugger.class);
    }
    return instance;
  }

  private final IBreakpointsProvider breakpointsProvider = ASBreakpointsProvider.getInstance();
  //private final TabConnectorProvider tabConnectorProvider = V8TabConnectorProvider.INSTANCE;
  private final TabConnectorProvider tabConnectorProvider = WIPTabConnectorProvider.INSTANCE;

  public JSDebugger(Debuggers debuggers, BreakpointProvidersManager breakpointsProviderManager) {
    super("JS", debuggers, breakpointsProviderManager);
  }

  @NotNull
  @Override
  public AbstractDebugSessionCreator createDebugSessionCreator(@NotNull Project project) {
    return new JSDebugSessionCreator(project, tabConnectorProvider);
  }

  @NotNull
  public TabConnectorProvider getTabConnectorProvider() {
    return tabConnectorProvider;
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
    BreakpointRequestProcessorProvider.getInstance().registerProcessor(new JSLineBreakpointRequestProcessor());
  }

  @Override
  public void disposeComponent() {
    dispose();
  }
}
