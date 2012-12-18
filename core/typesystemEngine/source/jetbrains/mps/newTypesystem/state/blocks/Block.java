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
package jetbrains.mps.newTypesystem.state.blocks;

import jetbrains.mps.newTypesystem.state.NodeMaps;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Pair;

import java.util.List;
import java.util.Set;

public abstract class Block {
  protected State myState;
  private String myNodeModel;
  private String myNodeId;

  public Block(State state, String nodeModel, String nodeId) {
    myState = state;
    myNodeModel = nodeModel;
    myNodeId = nodeId;
  }

  public SNode getResolvedInput(SNode input) {
    return myState.expand(input);
  }

  public String getNodeModel() {
    return myNodeModel;
  }

  public String getNodeId() {
    return myNodeId;
  }

  public String getExpandedPresentation(State state) {
    return getPresentation();
  }

  public String getVariablesNodes(State state) {
    StringBuilder sb = new StringBuilder();
    NodeMaps nodeMaps = state.getNodeMaps();
    for (SNode var : getVariables(state)) {
      sb.append(var);
      sb.append(" is a type of ");
      sb.append(nodeMaps.getNode(var));
      sb.append("\n");
    }
    return sb.toString();
  }

  public abstract List<SNode> getVariables(State state);

  public abstract BlockKind getBlockKind();

  public abstract String getPresentation();

  public abstract String getShortPresentation();

  public abstract void performAction();

  public abstract Set<SNode> getInputs();

  public abstract Set<Pair<SNode, ConditionKind>> getInitialInputs();
}
