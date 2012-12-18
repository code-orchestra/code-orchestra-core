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
package jetbrains.mps.util;

import jetbrains.mps.smodel.SNode;

import java.util.*;

public class NodesParetoFrontier {

  public static class NodeBox implements Iterable<NodeBox> {
    private SNode myNode;
    private NodeBox myNext;
    private int myNumber;

    public NodeBox(SNode node) {
      myNode = node;
    }

    public NodeBox(SNode node, int number) {
      myNode = node;
      myNumber = number;
    }

    public void setNext(NodeBox next) {
      myNext = next;
    }

    public NodeBox getNext() {
      return myNext;
    }

    public SNode getNode() {
      return myNode;
    }

    public int getNumber() {
      return myNumber;
    }

    public NodeBox last() {
      NodeBox last = this;
      while (last.getNext() != null) last = last.getNext();
      return last;
    }

    public Iterator<NodeBox> iterator() {
      return new Iterator<NodeBox>() {
        private NodeBox myCurrent = NodeBox.this;

        public boolean hasNext() {
          return myCurrent != null;
        }

        public NodeBox next() {
          if (!hasNext()) throw new NoSuchElementException();
          NodeBox result = myCurrent;
          myCurrent = myCurrent.getNext();
          return result;
        }

        public void remove() {
          throw new UnsupportedOperationException();
        }
      };
    }

    public boolean equals(Object obj) {
      if (obj instanceof SNode) return myNode.equals(obj);
      if (obj instanceof NodeBox) return myNode.equals(((NodeBox) obj).myNode);
      return false;
    }

    public int hashCode() {
      return myNode.hashCode();
    }
  }

  // splits nodes into groups having a maximum, each group is an descending-ordered chain of NodeBoxes
  // where the partial order is the following:
  // nodeBox1 > nodeBox2 <=> nodeBox1.getNode() is ancestor of nodeBox2.getEditedNode() in an aggregation tree
  // i.e. the first element in a chain is an ancestor of the others
  //
  // order of groups in the result list
  // respects the order of groups' first elements in the source list.
  public static List<NodeBox> findParetoFrontier(List<SNode> nodes) {
    //init
    Map<SNode, NodeBox> initialMap = new HashMap<SNode, NodeBox>();
    for (SNode node : nodes) {
      initialMap.put(node, new NodeBox(node));
    }

    //loop
    for (SNode node : nodes) {
      if (!initialMap.containsKey(node)) continue;
      NodeBox nodeBox = initialMap.get(node);
      SNode parent = node.getParent();
      NodeBox currentNodeBox = nodeBox;
      while (parent != null) {
        if (initialMap.containsKey(parent)) {
          NodeBox newNodeBox = initialMap.get(parent);
          newNodeBox.last().setNext(currentNodeBox);
          initialMap.remove(currentNodeBox.getNode());
          currentNodeBox = newNodeBox;
        }
        parent = parent.getParent();
      }
    }

    List<NodeBox> result = new ArrayList<NodeBox>();
    for (SNode node : nodes) {
      if (initialMap.containsKey(node)) {
        result.add(initialMap.get(node));
      }
    }

    return result;
  }

}
