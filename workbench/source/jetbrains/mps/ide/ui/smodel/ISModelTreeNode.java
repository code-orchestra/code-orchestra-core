package jetbrains.mps.ide.ui.smodel;

import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public interface ISModelTreeNode {

  List<ISModelTreeNode> getSubfolderSModelTreeNodes();

}
