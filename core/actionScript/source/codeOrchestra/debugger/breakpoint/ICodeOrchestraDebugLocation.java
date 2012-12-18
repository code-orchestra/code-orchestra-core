package codeOrchestra.debugger.breakpoint;

import jetbrains.mps.debug.api.programState.ILocation;
import jetbrains.mps.smodel.SNode;

/**
 * @author Alexander Eliseyev
 */
public interface ICodeOrchestraDebugLocation extends ILocation {

  SNode getNode();

}
