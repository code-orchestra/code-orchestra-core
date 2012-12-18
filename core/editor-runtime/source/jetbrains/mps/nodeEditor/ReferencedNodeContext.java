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
package jetbrains.mps.nodeEditor;

import jetbrains.mps.smodel.SNode;
import org.apache.commons.lang.ObjectUtils;

import java.util.Stack;

public class ReferencedNodeContext {
  private Stack<SNode> myContextRefererNodes = null;
  private SNode myNodePointer = null;
  private Stack<String> myContextRoles = null;
  private Stack<SNode> myAttributesStack = null;

  private ReferencedNodeContext(SNode node) {
    assert node != null;
    myNodePointer = node;
  }

  private ReferencedNodeContext(SNode node, ReferencedNodeContext prototype) {
    this(node);
    if (prototype.myContextRoles != null) {
      myContextRoles = new Stack<String>();
      myContextRoles.addAll(prototype.myContextRoles);
    }
    if (prototype.myContextRefererNodes != null) {
      myContextRefererNodes = new Stack<SNode>();
      myContextRefererNodes.addAll(prototype.myContextRefererNodes);
    }
  }

  public static ReferencedNodeContext createNodeContext(SNode node) {
    return new ReferencedNodeContext(node);
  }

  public ReferencedNodeContext sameContextButAnotherNode(SNode newNode) {
    return new ReferencedNodeContext(newNode, this);
  }

  public ReferencedNodeContext contextWithOneMoreReference(SNode node, SNode contextRefererNode, String contextRole) {
    ReferencedNodeContext result = new ReferencedNodeContext(node, this);
    result.addContextRole(contextRole);
    result.addContextRefererNode(contextRefererNode);
    return result;
  }

  public boolean hasRoles() {
    return myContextRoles != null;
  }

  public ReferencedNodeContext contextWithOneMoreAttribute(SNode attribute) {
    ReferencedNodeContext result = new ReferencedNodeContext(getNode(), this);
    result.addAttribute(attribute);
    return result;
  }

  public ReferencedNodeContext contextWihtNoAttributes() {
    return new ReferencedNodeContext(getNode());
  }

  public SNode getNode() {
    return myNodePointer;
  }

  private void addContextRole(String contextRole) {
    if (myContextRoles == null) {
      myContextRoles = new Stack<String>();
    }
    myContextRoles.push(contextRole);
  }

  private void addContextRefererNode(SNode contextRefererNode) {
    if (myContextRefererNodes == null) {
      myContextRefererNodes = new Stack<SNode>();
    }
    myContextRefererNodes.push(contextRefererNode);
  }

  private void addAttribute(SNode attribute) {
    if (myAttributesStack == null) {
      myAttributesStack = new Stack<SNode>();
    }
    myAttributesStack.push(attribute);
  }

  public int hashCode() {
    return ObjectUtils.hashCode(myNodePointer) +
      31 * (ObjectUtils.hashCode(myContextRefererNodes) +
        31 * (ObjectUtils.hashCode(myContextRoles) +
          31 * ObjectUtils.hashCode(myAttributesStack)));
  }

  public boolean equals(Object obj) {
    if (obj == this) return true;
    if (obj instanceof ReferencedNodeContext) {
      ReferencedNodeContext o = (ReferencedNodeContext) obj;
      return ObjectUtils.equals(myNodePointer, o.myNodePointer)
        && ObjectUtils.equals(myContextRoles, o.myContextRoles)
        && ObjectUtils.equals(myContextRefererNodes, o.myContextRefererNodes)
        && ObjectUtils.equals(myAttributesStack, o.myAttributesStack);
    } else {
      return false;
    }
  }
}
