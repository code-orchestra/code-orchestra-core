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
import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.errors.messageTargets.NodeMessageTarget;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptPropertyOperations;
import jetbrains.mps.lang.typesystem.runtime.ICheckingRule_Runtime;
import jetbrains.mps.lang.typesystem.runtime.IsApplicableStatus;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.newTypesystem.TypeCheckingContextNew;
import jetbrains.mps.newTypesystem.VariableIdentifier;
import jetbrains.mps.newTypesystem.operation.*;
import jetbrains.mps.newTypesystem.operation.block.AddBlockOperation;
import jetbrains.mps.newTypesystem.operation.block.AddDependencyOperation;
import jetbrains.mps.newTypesystem.operation.block.RemoveBlockOperation;
import jetbrains.mps.newTypesystem.operation.block.RemoveDependencyOperation;
import jetbrains.mps.newTypesystem.state.blocks.*;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.EquationInfo;
import jetbrains.mps.typesystem.inference.InequalitySystem;
import jetbrains.mps.typesystem.inference.TypeCheckingContext;
import jetbrains.mps.typesystemEngine.util.LatticeUtil;
import jetbrains.mps.util.ManyToManyMap;
import jetbrains.mps.util.Pair;

import java.util.*;
import java.util.Map.Entry;

public class State {
  private static final Logger LOG = Logger.getLogger(State.class);

  private final TypeCheckingContextNew myTypeCheckingContext;

  private final Equations myEquations;
  private final Inequalities myInequalities;
  private final NodeMaps myNodeMaps;
  private SNode myHole;

  private final VariableIdentifier myVariableIdentifier;

  private final Stack<AbstractOperation> myOperationStack;
  private AbstractOperation myOperation;
  private List<AbstractOperation> myOperationsAsList;
  private boolean myInsideStateChangeAction = false;

  private InequalitySystem myInequalitySystem = null;

  @StateObject
  private final Map<ConditionKind, ManyToManyMap<SNode, Block>> myBlocksAndInputs =
    new THashMap<ConditionKind, ManyToManyMap<SNode, Block>>();

  @StateObject
  private final Set<Block> myBlocks = new THashSet<Block>();

  public State(TypeCheckingContextNew tcc) {
    myTypeCheckingContext = tcc;
    myEquations = new Equations(this);
    myInequalities = new Inequalities(this);
    myNodeMaps = new NodeMaps(this);
    myVariableIdentifier = new VariableIdentifier();
    {
      myBlocksAndInputs.put(ConditionKind.SHALLOW, new ManyToManyMap<SNode, Block>());
      myBlocksAndInputs.put(ConditionKind.CONCRETE, new ManyToManyMap<SNode, Block>());
    }
    myOperationStack = new Stack<AbstractOperation>();
    myOperation = new CheckAllOperation();
    myOperationStack.push(myOperation);
  }

  public State(TypeCheckingContextNew tcc, AbstractOperation operation) {
    myTypeCheckingContext = tcc;
    myEquations = new Equations(this);
    myInequalities = new Inequalities(this);
    myNodeMaps = new NodeMaps(this);
    myVariableIdentifier = new VariableIdentifier();
    {
      myBlocksAndInputs.put(ConditionKind.SHALLOW, new ManyToManyMap<SNode, Block>());
      myBlocksAndInputs.put(ConditionKind.CONCRETE, new ManyToManyMap<SNode, Block>());
    }
    myOperationStack = new Stack<AbstractOperation>();
    myOperation = operation;
    myOperationStack.push(myOperation);
  }

  @StateMethod
  public void addDependency(Block dataFlowBlock, SNode var, ConditionKind condition) {
    assertIsInStateChangeAction();
    ManyToManyMap<SNode, Block> map = myBlocksAndInputs.get(condition);
    map.addLink(var, dataFlowBlock);
  }

  @StateMethod
  public void removeDependency(Block dataFlowBlock, SNode var, ConditionKind condition) {
    assertIsInStateChangeAction();
    ManyToManyMap<SNode, Block> map = myBlocksAndInputs.get(condition);
    map.removeLink(var, dataFlowBlock);
  }

  @StateMethod
  public void removeBlockNoVars(Block dataFlowBlock) {
    assertIsInStateChangeAction();
    for (ManyToManyMap<SNode, Block> map : myBlocksAndInputs.values()) {
      if (myInequalities.isSolvingInProcess()) {
        //we can remove blocks with vars while solving inequalities
        map.clearSecond(dataFlowBlock);
      } else {
        assert !map.containsSecond(dataFlowBlock);
      }
    }
    boolean removed = myBlocks.remove(dataFlowBlock);
    assert removed;
  }

  @StateMethod
  public void removeInequalityBlock(InequalityBlock block) {
    assertIsInStateChangeAction();
    boolean removed = myBlocks.remove(block);
    assert removed;
  }

  @StateMethod
  public void addBlockNoVars(Block dataFlowBlock) {
    assertIsInStateChangeAction();
    for (ManyToManyMap<SNode, Block> map : myBlocksAndInputs.values()) {
      assert !map.containsSecond(dataFlowBlock) || myInequalities.isSolvingInProcess();
    }
    boolean addedAnew = myBlocks.add(dataFlowBlock);
    assert addedAnew;
  }

  public void applyRuleToNode(SNode node, ICheckingRule_Runtime rule, IsApplicableStatus status) {
    if (myHole!=null && myHole == node) {
      return;
    }
    try {
      executeOperation(new ApplyRuleOperation(node, rule, status));
    } catch (Throwable t) {
      LOG.error("an error occurred while applying rule to node " + node, t, node);
    }
  }

  public void substitute(SNode oldVar, SNode type) {
    for (ConditionKind conditionKind : new THashSet<ConditionKind>(myBlocksAndInputs.keySet())) {
      ManyToManyMap<SNode, Block> map = myBlocksAndInputs.get(conditionKind);
      Set<Block> blocks = map.getByFirst(oldVar);
      if (blocks == null) {
        return;
      }
      List<SNode> unresolvedInputs = conditionKind.getUnresolvedInputs(type, this);
      for (Block block : new THashSet<Block>(blocks)) {
        for (SNode variable : unresolvedInputs) {
          addInputAndTrack(block, variable, conditionKind);
        }
        removeInputAndTrack(block, oldVar, conditionKind);
        testInputsResolved(block);
      }
    }
  }

  private void addInputAndTrack(Block block, SNode var, ConditionKind conditionKind) {
    executeOperation(new AddDependencyOperation(block, var, conditionKind));
  }

  private void removeInputAndTrack(Block block, SNode var, ConditionKind conditionKind) {
    executeOperation(new RemoveDependencyOperation(block, var, conditionKind));
  }

  private void becameConcrete(Block block) {
    executeOperation(new RemoveBlockOperation(block));
  }

  public void addBlock(Block block) {
    executeOperation(new AddBlockOperation(block));
  }

  public boolean clearNode(SNode node) {
    SNode type = myNodeMaps.getType(node);
    List<IErrorReporter> nodeErrors = myNodeMaps.getNodeErrors(node);
    if (type != null || (nodeErrors != null && !nodeErrors.isEmpty())) {
      executeOperation(new ClearNodeTypeOperation(node, type, nodeErrors));
      return true;
    }
    return false;
  }

  private void testInputsResolved(Block block) {
    boolean concrete = true;
    for (ManyToManyMap<SNode, Block> map : myBlocksAndInputs.values()) {
      concrete = concrete && map.getBySecond(block).isEmpty();
    }
    if (concrete) {
      becameConcrete(block);
    }
  }

  public void collectVarsExecuteIfNecessary(Block block) {
    Set<Pair<SNode, ConditionKind>> initialInputs = block.getInitialInputs();
    for (Pair<SNode, ConditionKind> input : initialInputs) {
      SNode type = input.o1;
      ConditionKind conditionKind = input.o2;
      for (SNode variable : conditionKind.getUnresolvedInputs(type, this)) {
        addInputAndTrack(block, variable, conditionKind);
      }
    }
    testInputsResolved(block);
  }


  //---------------------------------------------

  public Equations getEquations() {
    return myEquations;
  }

  public boolean addEquation(SNode left, SNode right, EquationInfo info) {
    if (myInequalitySystem != null) {
      if (myInequalitySystem.getHoleType()== left) {
        myInequalitySystem.addEquation(left);
        return true;
      }
      if (myEquations.getRepresentative(myInequalitySystem.getHoleType())== right) {
        myInequalitySystem.addEquation(right);
        return true;
      }
    }
    return myEquations.addEquation(left, right, info);
  }

  public void addEquation(SNode left, SNode right, EquationInfo info, boolean checkOnly) {
    if (!checkOnly) {
      addEquation(left, right, info);
    } else {
      addBlock(new CheckEquationBlock(this, left, right, RelationKind.CHECK_EQUATION, info));
    }
  }

  public void addInequality(SNode subType, SNode superType, boolean isWeak, boolean check, EquationInfo info, boolean lessThan) {
    if (myInequalitySystem != null) {
      if (myEquations.getRepresentative(myInequalitySystem.getHoleType())== subType) {
        myInequalitySystem.addSupertype(superType, isWeak);
        return;
      }
      if (myInequalitySystem.getHoleType()== superType) {
        myInequalitySystem.addSubtype(subType, isWeak);
        return;
      }
    }
    addBlock(new InequalityBlock(this, subType, superType, lessThan, RelationKind.fromFlags(isWeak, check, false), info));
  }

  public void addComparable(SNode left, SNode right, boolean isWeak, boolean inference, EquationInfo info) {
    addBlock(new ComparableBlock(this, left, right, RelationKind.fromFlags(isWeak, !inference, true), info));
  }

  public NodeMaps getNodeMaps() {
    return myNodeMaps;
  }

  public Inequalities getInequalities() {
    return myInequalities;
  }

  public TypeCheckingContextNew getTypeCheckingContext() {
    return myTypeCheckingContext;
  }

  public void executeStateChangeAction(Runnable action) {
    try {
      myInsideStateChangeAction = true;
      action.run();
    } finally {
      myInsideStateChangeAction = false;
    }
  }

  public void assertIsInStateChangeAction() {
    LOG.assertLog(myInsideStateChangeAction, "state change can be executed only inside state change action");
  }

  public void executeOperation(AbstractOperation operation) {
    if (operation == null) {
      return;
    }
    if (myTypeCheckingContext.isInTraceMode() || operation.hasEffect()) {
      if (!myOperationStack.empty()) {
        myOperationStack.peek().addConsequence(operation);
      }
      myOperationStack.push(operation);
      operation.execute(this);
      if (!myOperationStack.empty()) {
        myOperationStack.pop();
      } else {
        LOG.warning("Operation stack in type system state was empty");
      }
    } else {
      operation.execute(this);   //do not store unneeded operations
    }
  }

  private void visit(AbstractOperation operation, List<AbstractOperation> result) {
    result.add(operation);
    for (AbstractOperation child : operation.getConsequences()) {
      visit(child, result);
    }
  }

  public List<AbstractOperation> getOperationsAsList() {
    List<AbstractOperation> result = new ArrayList<AbstractOperation>();
    visit(myOperation, result);
    return result;
  }

  public void addError(SNode node, IErrorReporter error, EquationInfo info) {
    myNodeMaps.addNodeToError(node, error, info);
  }

  public SNode typeOf(SNode node, EquationInfo info) {
    return myNodeMaps.typeOf(node, info);
  }

  public void clear(boolean clearDiff) {
    myEquations.clear();
    myInequalities.clear();
    myNodeMaps.clear();
    myVariableIdentifier.clear();
    myBlocks.clear();
    for (ManyToManyMap map : myBlocksAndInputs.values()) {
      map.clear();
    }
    if (clearDiff) {
      clearOperations();
    }
    if (myInequalitySystem != null) {
      //reset hole
      SNode hole = myHole;
      disposeHole();
      initHole(hole);
    }
  }

  public void clearOperations() {
    myOperationStack.clear();
    myOperation = new CheckAllOperation();
    myOperationStack.push(myOperation);
  }


  public void clearStateObjects() {
    if (!myTypeCheckingContext.isInTraceMode() && myInequalitySystem == null) {
      for (Entry<ConditionKind, ManyToManyMap<SNode, Block>> map : myBlocksAndInputs.entrySet()) {
        map.getValue().clear();
      }
      myBlocks.clear();
      myEquations.clear();
      myNodeMaps.clearTypesToNodes();
    }
    clearOperations();
  }

  public void solveInequalities() {
    if (!myInequalities.getRelationsToSolve().isEmpty()) {
      executeOperation(new SolveInequalitiesOperation(new Runnable() {
        public void run() {
          myInequalities.solveRelations();
        }
      }));
    }
  }

  public void checkNonConcreteWhenConcretes() {
    for (Block block : myBlocks) {
      if (block.getBlockKind().equals(BlockKind.WHEN_CONCRETE)) {
        WhenConcreteBlock wCBlock = (WhenConcreteBlock) block;
        if (!wCBlock.isSkipError()) {
          SNode node = myNodeMaps.getNode(wCBlock.getArgument());
          if (node != null) {
            SNode concept = node.getConceptDeclarationNode();
            if (!SConceptPropertyOperations.getBoolean(concept, "abstract")) {
              myTypeCheckingContext.reportWarning(node, "argument of WHEN CONCRETE block is never concrete",
                wCBlock.getNodeModel(), wCBlock.getNodeId(), null, new NodeMessageTarget());
            }
          }
        }
      }
    }
  }

  public void performActionsAfterChecking() {
    //checkNonConcreteWhenConcretes(); // RE-2637
  }

  public SNode expand(SNode node) {
    return myEquations.expandNode(node, false);
  }

  public AbstractOperation getOperation() {
    return myOperation;
  }

  public void expandAll(final Set<SNode> nodes, final boolean finalExpansion) {
    if (nodes != null && !nodes.isEmpty()) {
      executeOperation(new AddRemarkOperation("Types Expansion", new Runnable() {
        public void run() {
          myNodeMaps.expandAll(nodes, finalExpansion);
        }
      }));
    }
  }

  public void expandAll(final boolean finalExpansion) {
    executeOperation(new AddRemarkOperation("Types Expansion", new Runnable() {
      public void run() {
        myNodeMaps.expandAll(finalExpansion);
      }
    }));
  }

  public boolean executeOperationsBeforeAnchor(AbstractOperation firstOp, Object anchor) {
    firstOp.redo(this);
    if (firstOp.equals(anchor)) {
      return true;
    }
    for (AbstractOperation child : firstOp.getConsequences()) {
      if (executeOperationsBeforeAnchor(child, anchor)) {
        return true;
      }
    }
    return false;
  }

  public SNode getRepresentative(SNode node) {
    return myEquations.getRepresentative(node);
  }

  public SNode createNewRuntimeTypesVariable() {
    SNode typeVar = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.RuntimeTypeVariable",
      myTypeCheckingContext.getRuntimeTypesModel(), GlobalScope.getInstance(), false);
    typeVar.setName(myVariableIdentifier.getNewVarName());
//  registerTypeVariable(typeVar);          todo ?
    return typeVar;
  }

  public Set<Block> getBlocks() {
    return myBlocks;
  }

  public Set<Block> getBlocks(BlockKind kind) {
    Set<Block> result = new THashSet<Block>();
    for (Block block : myBlocks) {
      if (block.getBlockKind() == kind) {
        result.add(block);
      }
    }
    return result;
  }

  public Set<Block> getCheckingInequalities() {
    Set<Block> result = new THashSet<Block>();
    Set<Block> blocks = getBlocks(BlockKind.INEQUALITY);
    for (Block block : blocks) {
      if (((RelationBlock) block).isCheckOnly() && !((RelationBlock) block).getRelationKind().isComparable()) {
        result.add(block);
      }
    }
    return result;
  }

  private void executeOperationsFromTo(int from, int to) {
    assert from < to;
    for (int i = from + 1; i <= to; i++) {
      myOperationsAsList.get(i).redo(this);
    }
  }

  private void revertOperationsFromTo(int from, int to) {
    assert from > to;
    for (int i = from; i > to; i--) {
      myOperationsAsList.get(i).undo(this);
    }
  }

  public void updateState(AbstractOperation from, AbstractOperation to) {
    if (myOperationsAsList == null) {
      myOperationsAsList = getOperationsAsList();
    }
    int fromIndex = myOperationsAsList.indexOf(from);
    int toIndex = myOperationsAsList.indexOf(to);
    if (fromIndex > toIndex) {
      revertOperationsFromTo(fromIndex, toIndex);
    } else if (fromIndex < toIndex) {
      executeOperationsFromTo(fromIndex, toIndex);
    }
  }

  public void initHole(SNode hole) {
    SNode holeVar = typeOf(hole, null);
    SNode holeType = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.RuntimeHoleType",
      myTypeCheckingContext.getRuntimeTypesModel(), GlobalScope.getInstance(), false);
    myNodeMaps.addNodeToType(hole, holeVar, null);
    myEquations.addEquation(holeVar, holeType, null);
    myHole = hole;
    myInequalitySystem = new InequalitySystem(holeType, this);
  }

  public InequalitySystem getInequalitySystem() {
    return myInequalitySystem;
  }

  public void disposeHole() {
    myInequalitySystem = null;
    myHole = null;
  }
}
