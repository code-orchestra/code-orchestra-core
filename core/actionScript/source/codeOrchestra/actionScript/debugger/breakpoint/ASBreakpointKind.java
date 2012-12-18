package codeOrchestra.actionScript.debugger.breakpoint;

import jetbrains.mps.debug.api.breakpoints.IBreakpointKind;
import org.jetbrains.annotations.NonNls;

/**
 * @author Alexander Eliseyev
 */
public enum ASBreakpointKind implements IBreakpointKind<ASBreakpoint> {

  LINE_BREAKPOINT("AS Line Breakpoint");

  private static final String LANGUAGE_PREFIX = "AS_";

  private final String myPresentation;

  ASBreakpointKind(String presentation) {
    myPresentation = presentation;
  }

  @Override
  public boolean supportsDisable() {
    return true;
  }

  @Override
  public String getName() {
    return LANGUAGE_PREFIX + toString(); // presentations should be unique
  }

  @Override
  @NonNls
  public String getPresentation() {
    return myPresentation;
  }
}
