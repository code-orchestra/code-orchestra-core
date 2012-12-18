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

import jetbrains.mps.newTypesystem.TypesUtil;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.EquationInfo;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.Pair;

import java.util.List;
import java.util.Set;

public abstract class RelationBlock extends Block {
  protected RelationKind myRelationKind;
  protected SNode myLeftNode;
  protected SNode myRightNode;
  protected EquationInfo myEquationInfo;

  public RelationBlock(State state, SNode left, SNode right,
                       RelationKind kind, EquationInfo equationInfo) {
    super(state, equationInfo.getRuleModel(), equationInfo.getRuleId());
    myRelationKind = kind;
    myLeftNode = left;
    myRightNode = right;
    myEquationInfo = equationInfo;
  }

  public RelationKind getRelationKind() {
    return myRelationKind;
  }

  public SNode getLeftNode() {
    return myLeftNode;
  }

  public SNode getRightNode() {
    return myRightNode;
  }

  public EquationInfo getEquationInfo() {
    return myEquationInfo;
  }

  @Override
  public String getPresentation() {
    return getShortPresentation();
  }

  public boolean isCheckOnly() {
    return !myState.getTypeCheckingContext().isInferenceMode() && myRelationKind.isCheckOnly();
  }

  @Override
  public String getShortPresentation() {
    return getPresentationInternal(myLeftNode, myRightNode);
  }

  private String getPresentationInternal(SNode left, SNode right) {
    return left + myRelationKind.getRelationSign() + right;
  }

  @Override
  public String getExpandedPresentation(State state) {
    return getPresentationInternal(state.expand(myLeftNode), state.expand(myRightNode));
  }

  @Override
  public Set<SNode> getInputs() {
    return CollectionUtil.set(myLeftNode, myRightNode);
  }

  @Override
  public List<SNode> getVariables(State state) {
    List<SNode> variables = TypesUtil.getVariables(myLeftNode, state);
    variables.addAll(TypesUtil.getVariables(myRightNode, state));
    return variables;
  }

  public abstract List<Pair<SNode, SNode>> getInputsAndOutputs();
}
