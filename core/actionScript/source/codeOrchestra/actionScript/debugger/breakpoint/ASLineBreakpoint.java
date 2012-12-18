package codeOrchestra.actionScript.debugger.breakpoint;

import com.intellij.openapi.project.Project;
import jetbrains.mps.debug.api.breakpoints.BreakpointLocation;
import jetbrains.mps.debug.api.breakpoints.ILocationBreakpoint;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class ASLineBreakpoint extends ASBreakpoint implements ILocationBreakpoint {

  private static final Logger LOG = Logger.getLogger(ASLineBreakpoint.class);

  public ASLineBreakpoint(@NotNull SNodePointer nodePointer, Project project) {
    super(project, nodePointer);
  }

  public ASLineBreakpoint(@NotNull SNode node, Project project) {
    this(new SNodePointer(node), project);
  }

  @Override
  protected ASBreakpointLocation calculateLocation(SNodePointer sNodePointer) {
    return new ASBreakpointLocation(sNodePointer);
  }

  @NotNull
  @Override
  public ASBreakpointKind getKind() {
    return ASBreakpointKind.LINE_BREAKPOINT;
  }

  @Override
  public boolean isValid() {
    return myLocation.isValid();
  }

  @Override
  public String getPresentation() {
    if (!isValid()) {
      return "(unknown location)";
    }
    return myLocation.getPresentation();
  }

  @NotNull
  @Override
  public BreakpointLocation getLocation() {
    return myLocation;
  }

}
