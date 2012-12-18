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
package jetbrains.mps.ide.devkit.generator;

import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.ArrayWrapper;

import java.util.ArrayList;
import java.util.List;

/**
 * Igor Alshannikov
 * Jan 17, 2008
 */
public class TracerNode {
  public enum Kind {
    INPUT("input"),
    OUTPUT("output"),
    TEMPLATE("template"),
    MACRO("macro"),
    RULE("rule"),
    RULE_CONSEQUENCE("rule consequence"),
    SWITCH("switch"),
    COPY_OPERATION("copy"),
    MAPPING_SCRIPT("mapping script"),
    APPROXIMATE_OUTPUT("approximate output"),
    APPROXIMATE_INPUT("approximate input");

    private String myText;

    Kind(String text) {
      myText = text;
    }

    public String toString() {
      return myText;
    }
  }

  /**
   * When you save transient models, TracerNodes can take up a lot of memory, so
   * instead of using ArrayList, we use ArrayWrappers here
   */
  private static TracerNode[] EMPTY_ARRAY = new TracerNode[0];

  private Kind myKind;
  private SNodePointer myNodePointer;
  private TracerNode myParent;
  private TracerNode[] myChildren = EMPTY_ARRAY;

  public TracerNode(Kind kind, SNodePointer nodePointer) {
    myKind = kind;
    myNodePointer = nodePointer;
  }

  public Kind getKind() {
    return myKind;
  }

  public SNodePointer getNodePointer() {
    return myNodePointer;
  }

  public TracerNode getParent() {
    return myParent;
  }

  private void setParent(TracerNode tracerNode) {
    myParent = tracerNode;
  }

  private List<TracerNode> _children() {
    return new ArrayWrapper<TracerNode>() {
      protected TracerNode[] getArray() {
        return myChildren;
      }

      protected void setArray(TracerNode[] newArray) {
        myChildren = newArray;
      }

      protected TracerNode[] newArray(int size) {
        return new TracerNode[size];
      }
    };
  }

  public void addChild(TracerNode tracerNode) {
    _children().add(tracerNode);
    tracerNode.setParent(this);
  }

  public void removeChild(TracerNode tracerNode) {
    assert _children().contains(tracerNode) : "no such child";
    _children().remove(tracerNode);
    tracerNode.setParent(null);
  }

  public List<TracerNode> getChildren() {
    return _children();
  }

  public boolean isThis(Kind kind, SNodePointer nodePointer) {
    return myKind == kind && myNodePointer.equals(nodePointer);
  }

  /*package*/ TracerNode find(SNode node) {
    if (myNodePointer.getNode() == node) return this;
    if (getDepth() > 1000) return null;
    for (TracerNode child : myChildren) {
      TracerNode tracerNode = child.find(node);
      if (tracerNode != null) {
        return tracerNode;
      }
    }
    return null;
  }


  /*package*/ TracerNode find(Kind kind, SNodePointer node) {
    if (isThis(kind, node)) return this;
    if (getDepth() > 1000) return null;
    for (TracerNode child : myChildren) {
      TracerNode tracerNode = child.find(kind, node);
      if (tracerNode != null) {
        return tracerNode;
      }
    }
    return null;
  }

  /*package*/ void findAllTopmost(Kind kind, SNodePointer node, List<TracerNode> result) {
    if (isThis(kind, node)) {
      result.add(this);
      return;
    }
    if (getDepth() > 1000) return;
    for (TracerNode child : myChildren) {
      child.findAllTopmost(kind, node, result);
    }
  }

  /*package*/ void findAll(Kind kind, List<TracerNode> result) {
    if (this.myKind == kind) {
      result.add(this);
    }
    if (getDepth() > 1000) return;
    for (TracerNode child : myChildren) {
      child.findAll(kind, result);
    }
  }

  public int getDepth() {
    int depth = 0;
    TracerNode parent = getParent();
    while (parent != null) {
      depth++;
      if (depth == Integer.MAX_VALUE) {
        throw new RuntimeException("infinite depth " + depth);
      }
      parent = parent.getParent();
    }
    return depth;
  }

  public List<TracerNode> getChildrenCopy() {
    List<TracerNode> result = new ArrayList<TracerNode>();
    for (TracerNode child : myChildren) {
      TracerNode childCopy = new TracerNode(child.getKind(), child.getNodePointer());
      List<TracerNode> children2 = child.getChildrenCopy();
      for (TracerNode child2 : children2) {
        childCopy.addChild(child2);
      }
      result.add(childCopy);
    }
    return result;
  }
}
