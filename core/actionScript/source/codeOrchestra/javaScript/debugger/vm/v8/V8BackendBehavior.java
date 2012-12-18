package codeOrchestra.javaScript.debugger.vm.v8;

import codeOrchestra.javaScript.debugger.vm.BackendBehavior;
import org.chromium.sdk.Breakpoint;
import org.chromium.sdk.Breakpoint.Target;
import org.chromium.sdk.Breakpoint.Target.ScriptId;
import org.chromium.sdk.Script;

/**
 * @author Alexander Eliseyev
 */
public final class V8BackendBehavior implements BackendBehavior {

  public static final BackendBehavior INSTANCE = new V8BackendBehavior();

  private V8BackendBehavior() {
  }

  @Override
  public Target getBreakpointTarget(Script script) {
    return new ScriptId(script.getId());
  }

  @Override
  public int getDefaultBreakpointColumn() {
    return Breakpoint.EMPTY_VALUE;
  }

  @Override
  public boolean isAttachDelayRequired() {
    return true;
  }

  @Override
  public int getScriptRunDelayMillis() {
    return 1500;
  }

  @Override
  public boolean handleFirstNavigationEvent() {
    return true;
  }
}
