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
package jetbrains.mps.smodel;

import org.apache.commons.lang.ObjectUtils;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.Map;

/**
 * Igor Alshannikov
 * Sep 21, 2007
 */
public class SNodePointer {
  private static SModelRepository ourSModelRepository = null;

  private SModelReference myModelReference;
  private SNodeId myNodeId;
  private int myTimestamp;

  public SNodePointer(String modelUID, String nodeId) {
    this(SModelReference.fromString(modelUID), SNodeId.fromString(nodeId));
  }

  public SNodePointer(@NotNull INodeAdapter node) {
    this(node.getModel().getSModelReference(), node.getNode().getSNodeId());
  }

  public SNodePointer(SNode node) {
    if (node == null) return;
    myModelReference = node.getModel().getSModelReference();
    myNodeId = node.getSNodeId();
    myTimestamp = createPointerTimestamp();
  }

  public SNodePointer(SModelReference modelReference, SNodeId nodeId) {
    myModelReference = modelReference;
    myNodeId = nodeId;
    myTimestamp = createPointerTimestamp();
  }

  public SNode getNode() {
    if (myNodeId == null) return null;
    SModelDescriptor model = getModel();
    if (model != null) {
      SNode node = model.getSModel().getNodeById(myNodeId);
      if (node != null) {
        return node;
      }
    }

    UnregisteredNodes unregisteredNodes = UnregisteredNodes.instance();
    if (unregisteredNodes != null) {
      return unregisteredNodes.get(myModelReference, myNodeId);
    }
    return null;
  }

  public SModelDescriptor getModel() {
    SModelReference modelReference = getCurrentSModelReference(myModelReference, myTimestamp);
    if (modelReference == null) return null;
    return getSModelRepository().getModelDescriptor(modelReference);
  }

  public SModelReference getModelReference() {
    return getCurrentSModelReference(myModelReference, myTimestamp);
  }

  public SNodeId getNodeId() {
    return myNodeId;
  }

  public String toString() {
    if (getNode() == null) {
      return "[bad pointer] model=" + getCurrentSModelReference(myModelReference, myTimestamp) + " node id=" + myNodeId;
    }
    return getNode().toString();
  }

  public String getDebugText() {
    if (getNode() == null) {
      return "<unknown node> model=" + getCurrentSModelReference(myModelReference, myTimestamp) + " node id=" + myNodeId;
    }
    return getNode().getDebugText();
  }

  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || !(o instanceof SNodePointer)) return false;

    SNodePointer np = (SNodePointer) o;
    return ObjectUtils.equals(myModelReference, np.myModelReference) && ObjectUtils.equals(myNodeId, np.myNodeId);
  }

  public int hashCode() {
    int sum = 0;
    if (myModelReference != null) {
      sum += myModelReference.hashCode();
    }
    if (myNodeId != null) {
      sum += 11 * myNodeId.hashCode();
    }
    return sum;
  }


  //----------------------
  // model rename support
  //----------------------
  private static int ourPointersTimestamp = 0;
  private static int ourModelsTimestamp = 0;
  private static final Map<Integer, Map<SModelReference, SModelReference>> ourRenamedModelUIDsByTimestamp = new HashMap<Integer, Map<SModelReference, SModelReference>>();


  /*package*/

  public static void changeSModelReference(SModelReference oldModelReference, SModelReference newModelReference) {
    if (!ourRenamedModelUIDsByTimestamp.containsKey(ourPointersTimestamp)) {
      ourRenamedModelUIDsByTimestamp.put(ourPointersTimestamp, new HashMap<SModelReference, SModelReference>());
      ourModelsTimestamp++;
    }

    ourRenamedModelUIDsByTimestamp.get(ourPointersTimestamp).put(oldModelReference, newModelReference);
  }

  private static SModelReference getCurrentSModelReference(SModelReference modelReference, int pointerTimestamp) {
    if (modelReference == null) return null;
    if (pointerTimestamp == ourModelsTimestamp) return modelReference;
    SModelReference renamedModelReference = ourRenamedModelUIDsByTimestamp.get(pointerTimestamp).get(modelReference);
    if (renamedModelReference != null) return renamedModelReference;
    return modelReference;
  }

  private static int createPointerTimestamp() {
    if (ourPointersTimestamp < ourModelsTimestamp) {
      ourPointersTimestamp = ourModelsTimestamp;
    }
    return ourPointersTimestamp;
  }

  private static SModelRepository getSModelRepository() {
    if (ourSModelRepository == null) {
      ourSModelRepository = SModelRepository.getInstance();
    }
    return ourSModelRepository;
  }
}
