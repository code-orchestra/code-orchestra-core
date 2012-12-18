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
package jetbrains.mps.newTypesystem.operation;

import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.EquationInfo;

public class ExpandTypeOperation extends AssignTypeOperation {
  private final SNode myOldType;

  public ExpandTypeOperation(SNode node, SNode type, EquationInfo info, SNode oldType) {
    super(node, type, info);
    myOldType = oldType;
  }

  public String getPresentationKind() {
    return PresentationKind.TYPE_EXPANDED;
  }

  public String getPresentation() {
    return "Type expanded: " + myNode + " ------> " + myType;
  }

  public void doRedo(State state) {
    state.getNodeMaps().assignNodeTypeDontChangeSource(myNode, myType);
  }

  public void doUndo(State state) {
    state.getNodeMaps().assignNodeTypeDontChangeSource(myNode, myOldType);
  }
}
