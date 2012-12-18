package jetbrains.mps.graphLayout.planarization;

/*Generated by MPS */

import jetbrains.mps.graphLayout.graph.Node;
import java.util.List;
import jetbrains.mps.graphLayout.graph.Edge;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;

public class NodeWithEdgeOrder {
  private Node myNode;
  private List<Edge> myOutEdgesOrder;
  private List<Edge> myInEdgesOrder;
  private boolean myIsReverseOrder;

  public NodeWithEdgeOrder(Node node) {
    myNode = node;
    myInEdgesOrder = ListSequence.fromList(new ArrayList<Edge>());
    myOutEdgesOrder = ListSequence.fromList(new ArrayList<Edge>());
    myIsReverseOrder = false;
  }

  public Node getNode() {
    return this.myNode;
  }

  public List<Edge> getInEdgesOrder() {
    if (myIsReverseOrder) {
      return ListSequence.fromList(myInEdgesOrder).reversedList();
    } else {
      return myInEdgesOrder;
    }
  }

  public List<Edge> getOutEdgesOrder() {
    if (myIsReverseOrder) {
      return ListSequence.fromList(myOutEdgesOrder).reversedList();
    } else {
      return myOutEdgesOrder;
    }
  }

  @Override
  public String toString() {
    return myNode.toString();
  }

  public void setInEdgesOrder(List<Edge> inEdgesOrder) {
    myInEdgesOrder = inEdgesOrder;
  }

  public void setOutEdgeOrder(List<Edge> outEdgeOrder) {
    myOutEdgesOrder = outEdgeOrder;
  }

  public void reverse() {
    myIsReverseOrder = !(myIsReverseOrder);
  }
}
