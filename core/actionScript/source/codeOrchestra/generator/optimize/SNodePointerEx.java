package codeOrchestra.generator.optimize;

import jetbrains.mps.smodel.*;

/**
 * @author Alexander Eliseyev
 */
public class SNodePointerEx extends SNodePointer {

  private String nodeName;

  public SNodePointerEx(SNode node) {
    super(node);
    this.nodeName = node.getName();
  }

  public String getNodeName() {
    return nodeName;
  }
}
