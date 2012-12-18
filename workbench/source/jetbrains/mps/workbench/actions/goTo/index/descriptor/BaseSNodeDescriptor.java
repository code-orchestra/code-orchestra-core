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
package jetbrains.mps.workbench.actions.goTo.index.descriptor;

import jetbrains.mps.smodel.*;
import jetbrains.mps.util.EqualUtil;
import jetbrains.mps.util.InternUtil;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

import java.util.UUID;

public abstract class BaseSNodeDescriptor {
  private String myNodeName;
  private long myMostSignificantBits;
  private long myLeastSignificantBits;
  private SNodeId myId;
  private SModelReference myModelReference;

  @CodeOrchestraPatch
  public BaseSNodeDescriptor(String nodeName, long mostSignificantBits, long leastSignificantBits, SNodeId id) {
    myNodeName = nodeName == null ? "(no name)" : (InternUtil.intern(nodeName.endsWith(".") ? nodeName : NameUtil.shortNameFromLongName(nodeName))); // RE-2450, RE-3949, RF-1208
    myMostSignificantBits = mostSignificantBits;
    myLeastSignificantBits = leastSignificantBits;
    myId = id;
  }

  public abstract String getConceptFqName();

  public String getNodeName() {
    return myNodeName;
  }

  @NotNull
  public final SModelReference getModelReference() {
    if (myModelReference == null) {
      myModelReference = calculateModelReference();
    }
    return myModelReference;
  }

  protected SModelReference calculateModelReference() {
    return new SModelReference(null, SModelId.regular(new UUID(myMostSignificantBits, myLeastSignificantBits))).update();
  }

  public SNodeId getId() {
    return myId;
  }

  public long getLeastSignificantBits() {
    return myLeastSignificantBits;
  }

  public long getMostSignificantBits() {
    return myMostSignificantBits;
  }

  public SNode getNode(SModel model) {
    if (getId() != null) {
      return model.getNodeById(getId());
    } else {
      return SModelOperations.getRootByName(model, getNodeName());
    }
  }

  public boolean equals(Object obj) {
    if (!(obj instanceof BaseSNodeDescriptor)) return false;
    BaseSNodeDescriptor sd = (BaseSNodeDescriptor) obj;
    return  EqualUtil.equals(sd.myNodeName, myNodeName) // RF-570
      && EqualUtil.equals(sd.myId, myId)
      && sd.getModelReference().equals(getModelReference());
  }

  public int hashCode() {
    return getNodeName().hashCode();
  }
}
