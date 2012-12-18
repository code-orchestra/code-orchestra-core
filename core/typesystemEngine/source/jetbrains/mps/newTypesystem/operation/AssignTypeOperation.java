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

import jetbrains.mps.newTypesystem.TypesUtil;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.EquationInfo;

import java.util.LinkedList;
import java.util.List;

public class AssignTypeOperation extends AbstractOperation {
  final SNode myNode;
  final SNode myType;

  public AssignTypeOperation(SNode node, SNode type, EquationInfo info) {
    myNode = node;
    myType = type;
    mySource = node;
    setRule(info);
  }

  public void doUndo(State state) {
    state.getNodeMaps().removeNodeType(myNode);
  }

  public void doRedo(State state) {
    state.getNodeMaps().assignNodeType(myNode, myType);
  }

  public String getPresentation() {
    return myNode + " : " + myType+ "   assigned";
  }

  public String getPresentationKind() {
    return PresentationKind.TYPE_ASSIGNED;
  }

  public List<SNode> getVariables() {
    LinkedList<SNode> nodes = new LinkedList<SNode>();
    if (TypesUtil.isVariable(myType)) {
      nodes.add(myType);
    }
    return nodes;
  }

  public SNode getNode() {
    return myNode;
  }

  public SNode getType() {
    return myType;
  }
}
