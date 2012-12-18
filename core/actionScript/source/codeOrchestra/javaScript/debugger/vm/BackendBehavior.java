package codeOrchestra.javaScript.debugger.vm;

import org.chromium.sdk.Breakpoint;
import org.chromium.sdk.Script;

/**
 * @author Alexander Eliseyev
 */
public interface BackendBehavior {

  Breakpoint.Target getBreakpointTarget(Script script);

  int getDefaultBreakpointColumn();

  boolean isAttachDelayRequired();

  int getScriptRunDelayMillis();

  boolean handleFirstNavigationEvent();

}
