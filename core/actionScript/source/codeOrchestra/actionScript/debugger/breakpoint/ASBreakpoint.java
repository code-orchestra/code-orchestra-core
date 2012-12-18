package codeOrchestra.actionScript.debugger.breakpoint;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionScript.debugger.request.ASRequestManager;
import codeOrchestra.debugger.DebuggerEventProcessor;
import codeOrchestra.debugger.breakpoint.BreakpointRequestProcessor;
import codeOrchestra.debugger.breakpoint.BreakpointRequestProcessorProvider;
import codeOrchestra.javaScript.debugger.request.JSRequestManager;
import jetbrains.mps.debug.runtime.requests.Requestor;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.NameUtil;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public abstract class ASBreakpoint extends jetbrains.mps.debug.api.breakpoints.AbstractBreakpoint implements Requestor {

  private boolean myLogMessage = false;
  
  protected SNodePointer sNodePointer;
  protected ASBreakpointLocation myLocation;

  protected ASBreakpoint(Project project, SNodePointer sNodePointer) {
    super(project);
    this.sNodePointer = sNodePointer;
    adjustLocation();
  }

  public SModelDescriptor getModelDescriptor() {
    if (sNodePointer == null) {
      return null;
    }
    return sNodePointer.getModel();
  }

  public boolean createRequest(DebuggerEventProcessor eventsProcessor) throws InvalidBreakpointException {
    if (!isValid()) {
      throw new InvalidBreakpointException();
    }

    BreakpointRequestProcessor requestProcessor =
      BreakpointRequestProcessorProvider.getInstance().getProcessor(eventsProcessor.getId(), getKind());
    return requestProcessor.create(eventsProcessor, this);
  }

  public void removeRequest(DebuggerEventProcessor eventsProcessor) {
    BreakpointRequestProcessor requestProcessor =
      BreakpointRequestProcessorProvider.getInstance().getProcessor(eventsProcessor.getId(), getKind());
    requestProcessor.remove(eventsProcessor, this);
  }

  protected abstract ASBreakpointLocation calculateLocation(SNodePointer sNodePointer);

  public final void adjustLocation() {
    this.myLocation = calculateLocation(sNodePointer);
  }

  public String getContainingRootFQName() {
    return ModelAccess.instance().runReadAction(new Computable<String>() {
      @Override
      public String compute() {
        SNode node = sNodePointer.getNode();
        if (node == null) {
          return null;
        }

        SNode containingRoot = node.getContainingRoot();
        if (containingRoot == null) {
          return null;
        }

        return NameUtil.longNameFromNamespaceAndShortName(containingRoot.getModel().getLongName(), containingRoot.getName());
      }
    });
  }
  
  // narrow return type
  @NotNull
  public abstract ASBreakpointKind getKind();

  @Override
  public void removeFromRunningSessions() {
    ASRequestManager.requestBreakPointRemove(this);
    JSRequestManager.requestBreakPointRemove(this);
  }

  @Override
  public void addToRunningSessions() {
    ASRequestManager.requestBreakPointAdd(this);
    JSRequestManager.requestBreakPointAdd(this);
  }

  public boolean isLogMessage() {
    return myLogMessage;
  }

  public void setLogMessage(boolean logMessage) {
    myLogMessage = logMessage;
  }

}
