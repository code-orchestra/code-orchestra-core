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
package jetbrains.mps.newTypesystem.relations;

import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.newTypesystem.state.blocks.RelationBlock;
import jetbrains.mps.newTypesystem.state.blocks.RelationKind;
import jetbrains.mps.smodel.SNode;

import java.util.Map;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: 3/11/11
 * Time: 6:44 PM
 */
public abstract class AbstractRelation {
  public abstract boolean accept(RelationKind kind);

  public abstract boolean solve(SNode node, Set<SNode> leftTypes, Set<SNode> rightTypes, State state, Map<SNode, RelationBlock> typesToBlocks);
}
