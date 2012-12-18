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

import jetbrains.mps.newTypesystem.SubTypingManagerNew;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.newTypesystem.state.blocks.RelationBlock;
import jetbrains.mps.newTypesystem.state.blocks.RelationKind;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.EquationInfo;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: 3/11/11
 * Time: 6:44 PM
 */
public class ComparableRelation extends AbstractRelation {
  public boolean accept(RelationKind kind) {
    return kind.isComparable();
  }

  public boolean solve(SNode node, Set<SNode> leftTypes, Set<SNode> rightTypes, State state, Map<SNode, RelationBlock> typesToBlocks) {
    EquationInfo info;
    List<SNode> nodes = new LinkedList<SNode>();
    nodes.addAll(leftTypes);
    nodes.addAll(rightTypes);
    if (nodes.isEmpty()) {
      return false;
    }
    SubTypingManagerNew subTypingManager = (SubTypingManagerNew) state.getTypeCheckingContext().getTypeChecker().getSubtypingManager();
    nodes = subTypingManager.eliminateSuperTypes(nodes);
    List<SNode> types = new LinkedList<SNode>();
    SNode result = null;
    for (SNode type : nodes) {
      for (SNode toCompare : types) {
        if (!subTypingManager.isComparable(type, toCompare, true)) {
          result = type;
        }
      }
      types.add(type);
    }
    if (result == null) {
      result = subTypingManager.createMeet(nodes);
    }
    if (result != null) {
      RelationBlock block = typesToBlocks.get(result);
      info = (block != null) ? block.getEquationInfo() : typesToBlocks.get(nodes.iterator().next()).getEquationInfo();
      state.addEquation(node, result, info);
    }
    return result != null;
  }

}
