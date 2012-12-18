package jetbrains.mps.smodel.search;

/*Generated by MPS */

import java.util.LinkedHashSet;
import jetbrains.mps.smodel.SNode;
import java.util.List;
import java.util.Collection;
import jetbrains.mps.smodel.INodeAdapter;
import org.jetbrains.annotations.NotNull;
import jetbrains.mps.util.Condition;
import java.util.ArrayList;

public class SimpleSearchScope extends AbstractSearchScope {
  private LinkedHashSet<SNode> myNodes;

  public SimpleSearchScope(List<SNode> nodes) {
    this(((Collection) nodes));
  }

  public SimpleSearchScope(Collection nodes) {
    myNodes = new LinkedHashSet<SNode>();
    for (Object node : nodes) {
      if (node instanceof SNode) {
        myNodes.add((SNode) node);
      } else {
        myNodes.add(((INodeAdapter) node).getNode());
      }
    }
  }

  public SimpleSearchScope(SNode node) {
    myNodes = new LinkedHashSet<SNode>(1);
    if (node != null) {
      myNodes.add(node);
    }
  }

  @NotNull
  public List<SNode> getNodes(Condition<SNode> condition) {
    List<SNode> result = new ArrayList<SNode>(myNodes.size());
    for (SNode node : myNodes) {
      if (condition.met(node)) {
        result.add(node);
      }
    }
    return result;
  }
}
