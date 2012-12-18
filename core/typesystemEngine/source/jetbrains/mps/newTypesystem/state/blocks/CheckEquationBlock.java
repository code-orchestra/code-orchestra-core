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

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: 4/12/11
 * Time: 2:12 PM
 */
public class CheckEquationBlock extends RelationBlock {
  public CheckEquationBlock(State state, SNode left, SNode right, RelationKind kind, EquationInfo equationInfo) {
    super(state, left, right, kind, equationInfo);
  }

  @Override
  public BlockKind getBlockKind() {
    return BlockKind.CHECK_EQUATION;
  }

  @Override
  public void performAction() {
    SNode left = getResolvedInput(myLeftNode);
    SNode right = getResolvedInput(myRightNode);
    if (!TypesUtil.match(left, right)) {
      myState.getNodeMaps().reportEquationBroken(myEquationInfo, left, right);
    }
  }

  @Override
  public Set<Pair<SNode, ConditionKind>> getInitialInputs() {
    return CollectionUtil.set(new Pair<SNode, ConditionKind>(myLeftNode, ConditionKind.CONCRETE),
      new Pair<SNode, ConditionKind>(myRightNode, ConditionKind.CONCRETE));
  }

  @Override
  public List<Pair<SNode, SNode>> getInputsAndOutputs() {
    return null;
  }
}
