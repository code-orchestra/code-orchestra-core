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
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.Pair;

import java.util.List;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: Sep 15, 2010
 * Time: 5:56:54 PM
 */
public class WhenConcreteBlock extends Block {
  private final Runnable myRunnable;
  private final SNode myArgument;
  private final ConditionKind myConditionKind;
  private final boolean mySkipError;

  public WhenConcreteBlock(State state, Runnable runnable, String nodeModel, String nodeId, SNode argument, boolean isShallow, boolean skipError) {
    super(state, nodeModel, nodeId);
    myRunnable = runnable;
    myArgument = argument;
    myConditionKind = isShallow ? ConditionKind.SHALLOW : ConditionKind.CONCRETE;
    mySkipError = skipError;
  }

  public String toString() {
    return myArgument.toString();
  }

  public SNode getArgument() {
    return myArgument;
  }

  @Override
  public void performAction() {
    myRunnable.run();
  }

  @Override
  public Set<Pair<SNode, ConditionKind>> getInitialInputs() {
    Pair<SNode, ConditionKind> input = new Pair<SNode, ConditionKind>(myArgument, myConditionKind);
    return CollectionUtil.set(input);
  }

  public boolean isSkipError() {
    return mySkipError;
  }

  @Override
  public Set<SNode> getInputs() {
    return CollectionUtil.set(myArgument);
  }

  @Override
  public String getPresentation() {
    return "when concrete (" + myArgument + ") " + myConditionKind.getPresentation();
  }

  @Override
  public String getShortPresentation() {
    return myConditionKind.getPresentation() + myArgument;
  }

  @Override
  public List<SNode> getVariables(State state) {
    return TypesUtil.getVariables(myArgument, state);
  }

  @Override
  public BlockKind getBlockKind() {
    return BlockKind.WHEN_CONCRETE;
  }


}
