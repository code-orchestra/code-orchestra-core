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
package jetbrains.mps.newTypesystem.state;

import gnu.trove.THashMap;
import gnu.trove.THashSet;
import jetbrains.mps.newTypesystem.TypesUtil;
import jetbrains.mps.newTypesystem.operation.block.RemoveBlockOperation;
import jetbrains.mps.newTypesystem.relations.AbstractRelation;
import jetbrains.mps.newTypesystem.relations.ComparableRelation;
import jetbrains.mps.newTypesystem.relations.SubTypingRelation;
import jetbrains.mps.newTypesystem.state.blocks.*;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystemEngine.util.LatticeUtil;
import jetbrains.mps.util.ManyToManyMap;
import jetbrains.mps.util.Pair;

import javax.management.relation.Relation;
import java.util.*;

public class Inequalities {
  private final State myState;
  private ManyToManyMap<SNode, SNode> myInputsToOutputsInc = new ManyToManyMap<SNode, SNode>();
  private ManyToManyMap<SNode, RelationBlock> myNodesToBlocksInc = new ManyToManyMap<SNode, RelationBlock>();
  private Set<SNode> myNodesInc = new THashSet<SNode>();
  private Set<SNode> mySolvableLeft = new THashSet<SNode>();
  private Set<SNode> mySolvableRight = new THashSet<SNode>();

  private static final ComparableRelation comparableRelation = new ComparableRelation();
  private static final SubTypingRelation subTypingRelation = new SubTypingRelation();

  private boolean solvingInProcess = false;

  public void setSolvingInProcess(boolean solvingInProcess) {
    this.solvingInProcess = solvingInProcess;
  }

  public boolean isSolvingInProcess() {
    return solvingInProcess;
  }

  public Inequalities(State state) {
    myState = state;
  }

  public void printAll() {
    System.out.println("Relations");
    for (Block node : getRelationsToSolve()) {
      System.out.println(node.getExpandedPresentation(myState));
    }
  }

  private void printMMMap(ManyToManyMap<SNode, SNode> map) {
    for (SNode node :map.getFirst()) {
      System.out.print(node + " <- " );
      for (SNode second : map.getByFirst(node)) {
        System.out.print(" "+ second);
      }
      System.out.println();
    }
  }

  private SNode getNodeWithNoInput(Set<SNode> unsorted, Set<SNode> used) {
    for (SNode node : unsorted) {
      if (used.containsAll(myInputsToOutputsInc.getBySecond(node))) {
  //    if (inputsToOutputs.getBySecond(node).isEmpty()) {
        return node;
      }
    }
    return unsorted.iterator().next();
  }

  public List<RelationBlock> getRelationsToSolve() {
    List<RelationBlock> result = new LinkedList<RelationBlock>();
    for (Block block : myState.getBlocks()) {
      if (block.getBlockKind() != BlockKind.WHEN_CONCRETE) {
        RelationBlock relationBlock = (RelationBlock) block;
        if (!relationBlock.isCheckOnly()) {
          result.add(relationBlock);
        }
      }
    }
    return result;
  }

  public void solveRelations() {
    solvingInProcess = true;
    List<RelationBlock> inequalities = getRelationsToSolve();
    initializeMapsInc(inequalities);
    while (iteration(inequalities)) {
      inequalities = getRelationsToSolve();
    }
    solvingInProcess = false;
  }

  private void addVariablesLinkInc(SNode input, SNode output) {
     if (!TypesUtil.isVariable(input)) return;
     if (!TypesUtil.isVariable(output)) return;
     if (input == output) return;
     myInputsToOutputsInc.addLink(input, output);
   }

  private void initializeMapsInc(List<RelationBlock> inequalities) {
    myInputsToOutputsInc.clear();
    myNodesToBlocksInc.clear();
    myNodesInc.clear();
    mySolvableLeft.clear();
    mySolvableRight.clear();
    for (RelationBlock inequality : inequalities) {
      onInequalityAdded(inequality);
    }
  }

  private void substituteVarInSet(SNode oldVar, SNode newVar, Set<SNode> varSet) {
    varSet.remove(oldVar);
    if (TypesUtil.isVariable(newVar)) {
      myNodesInc.add(newVar);
    }
  }

  public void onEquationAdded(SNode child, SNode parent) {
    if (!solvingInProcess) return;
    for (RelationBlock block : new ArrayList<RelationBlock>(myNodesToBlocksInc.getByFirst(child))) {
      myNodesToBlocksInc.removeLink(child, block);
      if (TypesUtil.isVariable(parent)) {
        myNodesToBlocksInc.addLink(parent, block);
      }
    }
    substituteVarInSet(child, parent, myNodesInc);
    substituteVarInSet(child, parent, mySolvableLeft);
    substituteVarInSet(child, parent, mySolvableRight);
    List<SNode> variables = TypesUtil.getVariables(parent, myState);
    for (SNode outputVar : new ArrayList<SNode>(myInputsToOutputsInc.getByFirst(child))) {
      for (SNode inputVar : variables) {
        addVariablesLinkInc(inputVar, outputVar);
      }
      myInputsToOutputsInc.removeLink(child, outputVar);
    }
    for (SNode inputVar : new ArrayList<SNode>(myInputsToOutputsInc.getBySecond(child))) {
      for (SNode outputVar : variables) {
        addVariablesLinkInc(inputVar, outputVar);
      }
      myInputsToOutputsInc.removeLink(inputVar, child);
    }
  }

  public void onInequalityAdded(RelationBlock inequality) {
    if (!solvingInProcess) return;
    if (inequality.isCheckOnly()) { return; }
    for (Pair<SNode, SNode> pair : inequality.getInputsAndOutputs()) {
      SNode input = myState.getRepresentative(pair.o1);
      SNode output = myState.getRepresentative(pair.o2);
      if (input == null || output == null) continue;
      if (TypesUtil.isVariable(input)) {
        myNodesInc.add(input);
        myNodesToBlocksInc.addLink(input, inequality);
      }
      if (TypesUtil.isVariable(output)) {
        myNodesInc.add(output);
        myNodesToBlocksInc.addLink(output, inequality);
      }
      if (input != output) {
        for (SNode inputVar : TypesUtil.getVariables(input, myState)) {
          for (SNode outputVar : TypesUtil.getVariables(output, myState)) {
            addVariablesLinkInc(myState.getRepresentative(inputVar), myState.getRepresentative(outputVar));
          }
        }
      }
    }
    SNode left = myState.getRepresentative(inequality.getLeftNode());
    SNode right = myState.getRepresentative(inequality.getRightNode());
    if (TypesUtil.isVariable(left)) {
      mySolvableLeft.add(left);
    }
    if (TypesUtil.isVariable(right)) {
      mySolvableRight.add(right);
    }
  }

  private boolean chooseVarAndSolve(Set<SNode> nodes) {
    //Solves relation for an independent node
    //first tries to solve for when concrete waiting node
    if (nodes.isEmpty()) return false;
    for (Block block : myState.getBlocks(BlockKind.WHEN_CONCRETE)) {
      SNode node = myState.getRepresentative(((WhenConcreteBlock) block).getArgument());
      if (nodes.contains(node) && myInputsToOutputsInc.getBySecond(node).isEmpty()) {
        if (solveRelationsForNode(node)) {
          return true;
        }
      }
    }
    Set<SNode> usedNodes = new HashSet<SNode>();
    Set<SNode> tempNodes = new HashSet<SNode>(nodes);
    while (tempNodes.size() > 0) {
      SNode current = getNodeWithNoInput(tempNodes, usedNodes);
      if (solveRelationsForNode(current)) {
        return true;
      }
      tempNodes.remove(current);
      usedNodes.add(current);
    }
    return false;
  }

  private boolean iteration(List<RelationBlock> inequalities) {
    if (myNodesInc.size() == 0) {
      return false;
    }
    if (chooseVarAndSolve(mySolvableRight)) return true;
    if (chooseVarAndSolve(mySolvableLeft)) return true;
    if (lastChance(inequalities)) return true;
    return false;
  }

  private boolean lastChance(List<RelationBlock> inequalities) {
    for (RelationBlock inequality : inequalities) {
      if (!(TypesUtil.isVariable(inequality.getLeftNode()) && TypesUtil.isVariable(inequality.getRightNode())) && myState.getBlocks().contains(inequality)) {
        myState.executeOperation(new RemoveBlockOperation(inequality));
        return true;
      }
    }
    return false;
  }

  private void collectNodesTransitive(SNode node, Set<SNode> collected, boolean isLeft, Map<SNode, RelationBlock> typesToBlocks, AbstractRelation relation, Set<SNode> alreadyPassed) {
    Set<RelationBlock> blocks = myNodesToBlocksInc.getByFirst(node);
    alreadyPassed.add(node);
    blocks = getRelationBlocks(blocks, relation);
    for (RelationBlock block : blocks) {
      if (block.isCheckOnly()) {
        continue;
      }
      SNode left = myState.getRepresentative(block.getLeftNode());
      SNode right = myState.getRepresentative(block.getRightNode());
      if (right == left) {
        continue;
      }
      SNode cur = isLeft ? left : right;
      SNode other = isLeft ? right : left;
      if (cur == node) {
        if (!TypesUtil.isVariable(other)) {
          SNode type = myState.expand(other);
          collected.add(type);
          typesToBlocks.put(type, block);
        } else {
          if (!alreadyPassed.contains(other)){
            collectNodesTransitive(other, collected, isLeft, typesToBlocks, relation, alreadyPassed);
          }
        }
      }
    }
  }

  private boolean solveRelationsForNode(SNode node) {
    return solveRelationForNode(node, subTypingRelation) || solveRelationForNode(node, comparableRelation);
  }

  private Set<RelationBlock> getRelationBlocks(Set<RelationBlock> blocks, AbstractRelation relation) {
    Set<RelationBlock> result = new THashSet<RelationBlock>();
    for (RelationBlock block : blocks) {
      if (relation.accept(block.getRelationKind())) {
        result.add(block);
      }
    }
    return result;
  }

  private boolean solveRelationForNode(SNode node, AbstractRelation relation) {
    Map<SNode, RelationBlock> typesToBlocks = new THashMap<SNode, RelationBlock>();
    assert TypesUtil.isVariable(node);
    Set<SNode> rightTypes = new LinkedHashSet<SNode>();
    Set<SNode> leftTypes = new LinkedHashSet<SNode>();

    //collectNodesInRelation(node, leftTypes, rightTypes, blocks, typesToBlocks);
    collectNodesTransitive(node, leftTypes, false, typesToBlocks, relation, new HashSet<SNode>());
    collectNodesTransitive(node, rightTypes, true, typesToBlocks, relation, new HashSet<SNode>());
    return relation.solve(node, leftTypes, rightTypes, myState, typesToBlocks);
  }

  public Map<Set<SNode>, Set<InequalityBlock>> getInequalityGroups(Set<Block> inequalities) {
    Map<SNode, Set<SNode>> components = new HashMap<SNode, Set<SNode>>(1);
    Map<Set<SNode>, Set<InequalityBlock>> groupsToInequalities = new HashMap<Set<SNode>, Set<InequalityBlock>>();
    Set<SNode> emptySet = new HashSet<SNode>(1);
    for (Block block : inequalities) {
      InequalityBlock inequality = (InequalityBlock) block;

      List<SNode> variables = TypesUtil.getVariables(inequality.getRightNode(), myState);
      variables.addAll(TypesUtil.getVariables(inequality.getLeftNode(), myState));
      if (variables.size() == 0) {
        Set<InequalityBlock> emptyBlocks = groupsToInequalities.get(emptySet);
        if (emptyBlocks == null) {
          emptyBlocks = new HashSet<InequalityBlock>(1);
          groupsToInequalities.put(emptySet, emptyBlocks);
        }
        emptyBlocks.add(inequality);
        continue;
      }
      Set<SNode> currentResult = new HashSet<SNode>();

      Set<InequalityBlock> currentInequalities = new HashSet<InequalityBlock>();
      currentInequalities.add(inequality);
      for (SNode var : variables) {
        var = myState.getRepresentative(var);
        currentResult.add(var);
        Set<SNode> varGroup = components.remove(var);
        if (varGroup != null) {
          currentResult.addAll(varGroup);
          for (SNode var2 : varGroup) {
            if (!variables.contains(var2)) {
              components.put(var2, currentResult);
            }
          }
        }
        components.put(var, currentResult);
        Set<InequalityBlock> remove = groupsToInequalities.remove(varGroup);
        if (remove != null) {
          currentInequalities.addAll(remove);
        }
      }
      groupsToInequalities.put(currentResult, currentInequalities);
    }
    return groupsToInequalities;
  }

  public void clear() {

  }
}
