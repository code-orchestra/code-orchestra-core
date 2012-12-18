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
package jetbrains.mps.project.structure.modules.mappingpriorities;

import jetbrains.mps.smodel.SModelReference;

public class MappingConfig_SimpleRef extends MappingConfig_AbstractRef {
  private String myModelUID;
  private String myNodeID;

  public String getModelUID() {
    return myModelUID;
  }

  public void setModelUID(String modelUID) {
    myModelUID = modelUID;
  }

  public String getNodeID() {
    return myNodeID;
  }

  public void setNodeID(String nodeID) {
    myNodeID = nodeID;
  }

  public MappingConfig_SimpleRef getCopy() {
    MappingConfig_SimpleRef result = new MappingConfig_SimpleRef();
    result.myModelUID = myModelUID;
    result.myNodeID = myNodeID;
    return result;
  }

  @Override
  public boolean isIncomplete() {
    if (myModelUID == null) return true;
    if (myModelUID.equals("*")) return false;
    if (myNodeID == null) return true;
    return false;
  }

  @Override
  public boolean removeModelReference(SModelReference ref, boolean[] mappingsChanged) {
    if (myModelUID != null && myModelUID.equals(ref.toString())) {
      mappingsChanged[0] = true;
      return true;
    }
    return false;
  }

  @Override
  public boolean updateReferences() {
    if (myModelUID.equals("*")) {
      return false;
    }
    SModelReference ref = SModelReference.fromString(myModelUID);
    SModelReference newRef = ref.update();
    if (ref.differs(newRef)) {
      myModelUID = newRef.toString();
      return true;
    }
    return false;
  }
}
