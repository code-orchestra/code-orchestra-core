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
package jetbrains.mps.generator.impl.cache;

import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.DynamicReference.DynamicReferenceOrigin;
import jetbrains.mps.util.InternUtil;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class NodesReader {
  protected static final SModelReference LOCAL = SModelReference.fromString("$LOCAL$");
  protected final SModelReference myModelReference;

  public NodesReader(@NotNull SModelReference modelReference) {
    myModelReference = modelReference;
  }

  public List<SNode> readNodes(SModel model, ModelInputStream is) throws IOException {
    int size = is.readInt();
    List<SNode> nodes = new ArrayList<SNode>(size);
    for (int i = 0; i < size; i++) {
      nodes.add(readNode(model, is));
    }
    return nodes;
  }

  protected SNode readNode(SModel model, ModelInputStream is) throws IOException {
    String conceptFqName = is.readString();
    SNodeId nodeId = is.readNodeId();
    String nodeRole = is.readString();
    if (is.readByte() != '{') {
      throw new IOException("bad stream, no '{'");
    }

    SNode node = new SNode(model, conceptFqName, true);
    node.setRoleInParent(nodeRole);
    node.setId(nodeId);

    readProperties(is, node);

    readReferences(is, node);

    readChildren(model, is, node);

    if (is.readByte() != '}') {
      throw new IOException("bad stream, no '}'");
    }
    return node;
  }

  protected void readChildren(SModel model, ModelInputStream is, SNode node) throws IOException {
    List<SNode> children = readNodes(model, is);
    for (SNode child : children) {
      String role = child.getRole_();
      assert role != null;
      node.addChild(role, child);
    }
  }

  protected void readReferences(ModelInputStream is, SNode node) throws IOException {
    int references = is.readInt();
    for (; references > 0; references--) {
      int kind = is.readInt();
      SNodeId targetNodeId = kind == 1 ? is.readNodeId() : null;
      DynamicReferenceOrigin origin = kind == 3 ? new DynamicReferenceOrigin(is.readNodePointer(), is.readNodePointer()) : null;
      String role = is.readString();
      SModelReference modelRef = is.readModelReference();
      if(modelRef != null && LOCAL.equals(modelRef)) {
        modelRef = myModelReference;
      }
      String resolveInfo = is.readString();
      if (kind == 1) {
        node.addReference(
          new StaticReference(
            role,
            node,
            modelRef,
            targetNodeId,
            resolveInfo));
      } else if (kind == 2 || kind == 3) {
        DynamicReference reference = new DynamicReference(
          role,
          node,
          modelRef,
          resolveInfo);
        if(origin != null) {
          reference.setOrigin(origin);
        }
        node.addReference(
          reference);
      } else {
        throw new IOException("unknown reference type");
      }
    }
  }

  protected void readProperties(ModelInputStream is, SNode node) throws IOException {
    int properties = is.readInt();
    for (; properties > 0; properties--) {
      String key = is.readString();
      String value = is.readString();
      node.setProperty(InternUtil.intern(key), InternUtil.intern(value), false);
    }
  }
}
