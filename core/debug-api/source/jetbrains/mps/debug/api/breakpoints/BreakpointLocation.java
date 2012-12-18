/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.debug.api.breakpoints;

import com.intellij.openapi.util.Computable;
import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.*;
import jetbrains.mps.traceInfo.DebugInfo;
import jetbrains.mps.traceInfo.PositionInfo;
import jetbrains.mps.traceInfo.TraceablePositionInfo;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class BreakpointLocation {
  private static final Logger LOG = Logger.getLogger(BreakpointLocation.class);
  private final SNodePointer myNodePointer;

  public BreakpointLocation(@NotNull SNodePointer nodePointer) {
    myNodePointer = nodePointer;
    LOG.assertLog(nodePointer.getModelReference() != null && nodePointer.getNodeId() != null);
  }

  public BreakpointLocation(@NotNull SNode node) {
    myNodePointer = new SNodePointer(node);
  }

  public SNodePointer getNodePointer() {
    return myNodePointer;
  }

  @Nullable
  public SNode getSNode() {
    return myNodePointer.getNode();
  }

  @Nullable
  public TraceablePositionInfo getTargetCodePosition() {
    SModelDescriptor model = myNodePointer.getModel();
    if (model == null) return null;
    DebugInfo debugInfo = TraceInfoCache.getInstance().get(model);
    if (debugInfo == null) {
      return null;
    }

    // RE-2693
    TraceablePositionInfo positionForNode = debugInfo.getPositionForNode(myNodePointer.getNodeId().toString());
    if (positionForNode == null) {
      // Let's try clearing the cache and retrieving the debug info again
      TraceInfoCache.getInstance().clearCacheFor(model);
      debugInfo = TraceInfoCache.getInstance().get(model);
      if (debugInfo == null) {
        return null;
      }

      positionForNode = debugInfo.getPositionForNode(myNodePointer.getNodeId().toString());
    }

    return positionForNode;
  }

  public String getTargetUnitName() {
    DebugInfo debugInfo = TraceInfoCache.getInstance().get(myNodePointer.getModel());
    if (debugInfo == null) {
      return null;
    }
    return debugInfo.getUnitNameForLine(getFileName(), getLineIndexInFile());
  }

  public boolean isValid() {
    return getTargetCodePosition() != null;
  }

  public int getLineIndexInFile() {
    PositionInfo position = getTargetCodePosition();
    if (position == null) return -1;
    return position.getStartLine() + 1;
  }

  public String getFileName() {
    PositionInfo positionInfo = getTargetCodePosition();
    if (positionInfo == null) return null;
    return positionInfo.getFileName();
  }

  public String getPresentation() {
    return ModelAccess.instance().runReadAction(new Computable<String>() {
      @Override
      public String compute() {
        SNode node = myNodePointer.getNode();
        if (node != null) {
          SNode root = node.getContainingRoot();
          return node + " in " + root + " (" + myNodePointer.getModel().getSModelReference().getSModelFqName() + ")";
        } else {
          return myNodePointer.getNodeId() + " (" + myNodePointer.getModel().getSModelReference().getSModelFqName() + ")";
        }
      }
    });
  }

  public SModelReference getModelReference() {
    return myNodePointer.getModelReference();
  }
}
