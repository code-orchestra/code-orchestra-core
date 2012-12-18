package jetbrains.mps.ide.ui.smodel;

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;

/**
 * @author Alexander Eliseyev
 */
public interface NodeEditor {

  void editNode(final SNode node, IOperationContext context, boolean focus);

}
