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
package jetbrains.mps.typesystem.inference.util;

import jetbrains.mps.lang.pattern.util.MatchingUtil;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SReference;

import java.lang.ref.WeakReference;
import java.util.Map;

public class CacheNodeHandler {
  private WeakReference<SNode> myNodeRef;
  private int myHash;

  public CacheNodeHandler(SNode node) {
    myNodeRef = new WeakReference<SNode>(node);
    myHash = hash(node, false);
  }

  private int hash(SNode node, boolean useAttributes) {
    int result = node.getConceptFqName().hashCode();
    for (SReference reference : node.getReferences()) {
      SNode targetNode = reference.getTargetNode();
      if (targetNode != null) {
        result += reference.getRole().hashCode();
        result += targetNode.hashCode();
      }
    }
    Map<String, String> properties = node.getProperties();
    for (String propertyName : properties.keySet()) {
      result += propertyName.hashCode();
    }
    for (String propertyValue : properties.values()) {
      result += propertyValue.hashCode();
    }
    for (SNode child : node.getChildren(useAttributes)) {
      result += child.getRole_().hashCode();
      result += hash(child, useAttributes);
    }
    return result;
  }

  public int hashCode() {
    return myHash;
  }

  public boolean equals(Object obj) {
    if (obj instanceof CacheNodeHandler) {
      CacheNodeHandler anotherHandler = (CacheNodeHandler) obj;
      if (getNode() == null || anotherHandler.getNode() == null) {
        return false;
      }
      return MatchingUtil.matchNodes(this.getNode(), anotherHandler.getNode());
    } else {
      return false;
    }
  }

  public String toString() {
    return "handler " + String.valueOf(getNode());
  }

  protected SNode getNode() {
    SNode sn = myNodeRef.get();
    return sn != null && !(sn.shouldHaveBeenDisposed()) ? sn : null;
  }
}
