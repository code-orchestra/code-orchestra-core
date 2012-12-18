package codeOrchestra.javaScript.debugger.vm.wip;

import codeOrchestra.javaScript.debugger.vm.BackendBehavior;
import org.chromium.sdk.Breakpoint.Target;
import org.chromium.sdk.Breakpoint.Target.ScriptName;
import org.chromium.sdk.Script;

/**
 * @author Alexander Eliseyev
 */
public final class WIPBackendBehavior implements BackendBehavior {

  public static final BackendBehavior INSTANCE = new WIPBackendBehavior();

  private static final int DEFAULT_BREAKPOINT_COLUMN = 0;

  private WIPBackendBehavior() {
  }

  @Override
  public Target getBreakpointTarget(Script script) {
    return new ScriptName(script.getName());
  }

  @Override
  public int getDefaultBreakpointColumn() {
    return DEFAULT_BREAKPOINT_COLUMN;
  }

  @Override
  public boolean isAttachDelayRequired() {
    return false;
  }

  @Override
  public int getScriptRunDelayMillis() {
    return 1500;
  }

  @Override
  public boolean handleFirstNavigationEvent() {
    return false;
  }
}
