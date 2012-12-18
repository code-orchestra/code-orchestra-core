package codeOrchestra.javaScript.debugger.ui;

import com.intellij.openapi.util.Computable;
import codeOrchestra.debugger.breakpoint.ICodeOrchestraDebugLocation;
import codeOrchestra.debugger.ui.AbstractCodeOrchestraDebugLocation;
import codeOrchestra.javaScript.debugger.traceinfo.JSTraceInfoUtils;
import jetbrains.mps.debug.api.programState.ILocation;
import jetbrains.mps.generator.traceInfo.TraceInfoUtil;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.traceInfo.DebugInfo;
import jetbrains.mps.util.NameUtil;
import org.chromium.sdk.CallFrame;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class JSLocation extends AbstractCodeOrchestraDebugLocation implements ICodeOrchestraDebugLocation {

  private CallFrame callFrame;

  public JSLocation(CallFrame callFrame) {
    this.callFrame = callFrame;
  }

  @Override
  public String getFileName() {
    if (callFrame == null) {
      return "(unknown file)";
    }
    return new File(callFrame.getScript().getName()).getName(); // Not sure
  }

  @Override
  public String getUnitName() {
    if (callFrame == null) {
      return "(unknown unit)";
    }

    String scriptFilename = getFileName();
    DebugInfo debugInfo = JSTraceInfoUtils.getDebugInfoForScript(scriptFilename);
    if (debugInfo == null) {
      return "(unknown unit)";
    }

    SModelDescriptor modelDescriptor = JSTraceInfoUtils.getModelDescriptorForScript(scriptFilename);
    SModel sModel = modelDescriptor.getSModel();
    if (sModel != null) {
      final SNode nodeForLine = debugInfo.getNodeForLine(scriptFilename, getLineNumber(), sModel);
      if (nodeForLine != null) {
        return ModelAccess.instance().runReadAction(new Computable<String>() {
          public String compute() {
            return NameUtil.compactNodeFQName(nodeForLine.getTopmostAncestor());
          }
        });        
      }
    }

    return callFrame.getScript().getId().toString();
  }

  @Override
  public String getRoutineName() {
    if (callFrame == null) {
      return "(unknown function)";
    }
    return callFrame.getFunctionName();
  }

  @Override
  public int getLineNumber() {
    if (callFrame == null) {
      return -1;
    }
    return callFrame.getStatementStartPosition().getLine() + 1;
  }

}
