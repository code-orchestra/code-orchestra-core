package codeOrchestra.logging;

import jetbrains.mps.smodel.SNodePointer;

import java.io.Serializable;

/**
 * @author Alexander Eliseyev
 */
public class SNodeWithStackTrace implements Serializable {

  private SNodePointer nodePointer;
  private String stackTrace;

  public SNodeWithStackTrace(SNodePointer nodePointer, String stackTrace) {
    this.nodePointer = nodePointer;
    this.stackTrace = stackTrace;
  }

  public SNodePointer getNodePointer() {
    return nodePointer;
  }

  public void setNodePointer(SNodePointer nodePointer) {
    this.nodePointer = nodePointer;
  }

  public String getStackTrace() {
    return stackTrace;
  }

  public void setStackTrace(String stackTrace) {
    this.stackTrace = stackTrace;
  }
}
