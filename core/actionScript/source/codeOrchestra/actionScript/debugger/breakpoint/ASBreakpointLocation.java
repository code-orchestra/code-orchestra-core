package codeOrchestra.actionScript.debugger.breakpoint;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.debug.api.breakpoints.BreakpointLocation;
import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.traceInfo.DebugInfo;
import jetbrains.mps.traceInfo.TraceablePositionInfo;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class ASBreakpointLocation extends BreakpointLocation {

  public ASBreakpointLocation(@NotNull SNodePointer nodePointer) {
    super(nodePointer);
  }

  @Override
  public TraceablePositionInfo getTargetCodePosition() {
    TraceablePositionInfo statementPositionInfo = getTargetCodePosition(getNodePointer());
    if (statementPositionInfo != null) {
      return statementPositionInfo;
    }

    final SNode statement = getNodePointer().getNode();
    if (statement == null) {
      return null;
    }

    return ModelAccess.instance().tryRead(new Computable<TraceablePositionInfo>() {
      @Override
      public TraceablePositionInfo compute() {
        SNode statementList = statement.getParent();

        // Check if out statement is the first statement in the list
        if (statementList.getChildAt(0) == statement) {
          // Return target code position for the statement list
          return getTargetCodePosition(new SNodePointer(statementList));
        }

        return null;
      }
    });
  }

  private TraceablePositionInfo getTargetCodePosition(SNodePointer nodePointer) {
    SModelDescriptor model = nodePointer.getModel();
    if (model == null) return null;
    DebugInfo debugInfo = TraceInfoCache.getInstance().get(model);
    if (debugInfo == null) {
      return null;
    }

    // RE-2693
    TraceablePositionInfo positionForNode = debugInfo.getPositionForNode(nodePointer.getNodeId().toString());
    if (positionForNode != null) {
      return positionForNode;
    }

    TraceInfoCache.getInstance().clearCacheFor(model);
    debugInfo = TraceInfoCache.getInstance().get(model);
    if (debugInfo == null) {
      return null;
    }
    return debugInfo.getPositionForNode(nodePointer.getNodeId().toString());
  }

  @Override
  public int getLineIndexInFile() {
    return super.getLineIndexInFile() - 1;
  }


}
