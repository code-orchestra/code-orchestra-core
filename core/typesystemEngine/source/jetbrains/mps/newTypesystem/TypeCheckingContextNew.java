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
package jetbrains.mps.newTypesystem;

import com.intellij.openapi.util.Computable;
import gnu.trove.THashSet;
import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.errors.MessageStatus;
import jetbrains.mps.errors.QuickFixProvider;
import jetbrains.mps.errors.SimpleErrorReporter;
import jetbrains.mps.errors.messageTargets.MessageTarget;
import jetbrains.mps.newTypesystem.operation.AbstractOperation;
import jetbrains.mps.newTypesystem.operation.TraceMessageOperation;
import jetbrains.mps.newTypesystem.operation.TraceWarningOperation;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.newTypesystem.state.blocks.WhenConcreteBlock;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.EquationInfo;
import jetbrains.mps.typesystem.inference.SubtypingManager;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.typesystem.inference.TypeCheckingContext;
import jetbrains.mps.util.Pair;

import java.util.*;

public class TypeCheckingContextNew extends TypeCheckingContext {

  public final Object TYPECHECKING_LOCK = new Object();
  private State myState;
  private SNode myRootNode;
  private TypeChecker myTypeChecker;
  private NodeTypesComponent myNodeTypesComponent;
  private boolean myIsNonTypesystemComputation = false;
  private boolean myIsResolving = false;
  private boolean myIsTraceMode = false;
  private boolean myIsInferenceMode = false;
  private IOperationContext myOperationContext;

  public TypeCheckingContextNew(SNode rootNode, TypeChecker typeChecker) {
    myState = new State(this);
    myRootNode = rootNode;
    myNodeTypesComponent = new NodeTypesComponent(myRootNode, typeChecker, this);
    myTypeChecker = typeChecker;
  }

  public TypeCheckingContextNew(SNode rootNode, TypeChecker typeChecker, boolean resolving) {
    myState = new State(this);
    myRootNode = rootNode;
    myNodeTypesComponent = new NodeTypesComponent(myRootNode, typeChecker, this);
    myTypeChecker = typeChecker;
    myIsResolving = resolving;
  }

  @Override
  public void checkRoot() {
    checkRoot(false);
  }

  public void checkRootInTraceMode(final boolean refreshTypes) {
    myIsTraceMode = true;
    checkRoot(refreshTypes);
    myIsTraceMode = false;
  }

  public boolean isInTraceMode() {
    return myIsTraceMode;
  }

  @Override
  public void checkRoot(final boolean refreshTypes) {
    synchronized (TYPECHECKING_LOCK) {
      myNodeTypesComponent.computeTypes(refreshTypes);
      myNodeTypesComponent.setCheckedTypesystem();
    }
  }

  @Override
  public void createEquation(SNode node1, SNode node2, SNode nodeToCheck, String errorString, String ruleModel, String ruleId, QuickFixProvider intentionProvider) {
    myState.addEquation(node1, node2, new EquationInfo(nodeToCheck, errorString, ruleModel, ruleId, 0, intentionProvider));
  }

  @Override
  public void createLessThanInequation(SNode node1, SNode node2, boolean checkOnly, EquationInfo equationInfo) {
    myState.addInequality(node1, node2, true, checkOnly, equationInfo, true);
  }

  @Override
  public void createLessThanInequationStrong(SNode node1, SNode node2, boolean checkOnly, EquationInfo equationInfo) {
    myState.addInequality(node1, node2, false, checkOnly, equationInfo, true);
  }

  @Override
  public void createGreaterThanInequation(SNode node1, SNode node2, boolean checkOnly, EquationInfo equationInfo) {
    myState.addInequality(node2, node1, true, checkOnly, equationInfo, false);
  }

  @Override
  public void createGreaterThanInequationStrong(SNode node1, SNode node2, boolean checkOnly, EquationInfo equationInfo) {
    myState.addInequality(node2, node1, false, checkOnly, equationInfo, false);
  }

  @Override
  public void createEquation(SNode node1, SNode node2, boolean checkOnly, EquationInfo equationInfo) {
    myState.addEquation(node1, node2, equationInfo, checkOnly);
  }

  @Override
  public void createLessThanInequationStrong(SNode node1, SNode node2, SNode nodeToCheck, String errorString, String ruleModel, String ruleId, boolean checkOnly,
                                             int inequationPriority, QuickFixProvider intentionProvider) {
    myState.addInequality(node1, node2, false, checkOnly, new EquationInfo(nodeToCheck, errorString, ruleModel,
      ruleId, inequationPriority, intentionProvider), true);
  }

  @Override
  public void createGreaterThanInequation(SNode node1, SNode node2, SNode nodeToCheck, String errorString, String ruleModel, String ruleId, boolean checkOnly, int inequationPriority, QuickFixProvider intentionProvider) {
    myState.addInequality(node2, node1, false, checkOnly, new EquationInfo(nodeToCheck, errorString, ruleModel,
      ruleId, inequationPriority, intentionProvider), false);
  }

  @Override
  public void createComparableEquation(SNode node1, SNode node2, SNode nodeToCheck, String errorString, String ruleModel, String ruleId, QuickFixProvider intentionProvider) {
    createComparableEquation(node1, node2, new EquationInfo(nodeToCheck, errorString, ruleModel, ruleId, 0, intentionProvider));
  }

  @Override
  public SNode typeOf(SNode node, String ruleModel, String ruleId, boolean addDependency) {
    EquationInfo info = new EquationInfo(node, "typeOf", ruleModel, ruleId);
    if (node == null) return null;
    NodeTypesComponent currentTypesComponent = getNodeTypesComponent();   //first, in current component
    if (currentTypesComponent != null) {
      //--- for incremental algorithm:
      currentTypesComponent.addNodeToFrontier(node);
      currentTypesComponent.typeOfNodeCalled(node);
      if (addDependency) {
        currentTypesComponent.addDependencyOnCurrent(node);
      }
      if (ruleModel != null && ruleId != null) {
        currentTypesComponent.markNodeAsAffectedByRule(node, ruleModel, ruleId);
        //todo wrap into "if (addDependency) {}" when sure that typeof works fine
      }
    }
    return myState.typeOf(node, info);
  }

  @Override
  public Set<Pair<SNode, List<IErrorReporter>>> getNodesWithErrors() {
    return myNodeTypesComponent.getNodesWithErrors();
  }

  @Override
  public SNode getRepresentative(SNode node) {
    return myState.getRepresentative(node);
  }

  @Override
  public List<IErrorReporter> getTypeMessagesDontCheck(SNode node) {
    return getBaseNodeTypesComponent().getErrors(node);
  }

  @Override
  public void reportMessage(SNode nodeWithError, IErrorReporter errorReporter) {
    if (nodeWithError == null) {
      myState.executeOperation(new TraceWarningOperation("Error was not added: " + errorReporter.reportError()));
      return;//todo
    }
    getNodeTypesComponent().reportTypeError(nodeWithError, errorReporter);
    getNodeTypesComponent().addDependencyOnCurrent(nodeWithError, false);
  }

  @Override
  public SNode getTypeDontCheck(SNode node) {
    synchronized (TYPECHECKING_LOCK) {
      return myState.getNodeMaps().getType(node);
    }
  }

  @Override
  public void whenConcrete(SNode argument, Runnable r, String nodeModel, String nodeId) {
    myState.addBlock(new WhenConcreteBlock(myState, r, nodeModel, nodeId, argument, false, false));
  }

  @Override
  public void printToTrace(String message) {
    myState.executeOperation(new TraceMessageOperation(message));
  }

  @Override
  public void whenConcrete(SNode argument, Runnable r, String nodeModel, String nodeId, boolean isShallow, boolean skipError) {
    myState.addBlock(new WhenConcreteBlock(myState, r, nodeModel, nodeId, argument, isShallow, skipError));
  }

  public State getState() {
    return myState;
  }

  public TypeChecker getTypeChecker() {
    return myTypeChecker;
  }

  public SubTypingManagerNew getSubTyping() {
    return (SubTypingManagerNew) myTypeChecker.getSubtypingManager();
  }

  public AbstractOperation getOperation() {
    return myState.getOperation();
  }

  @Override
  public SNode createNewRuntimeTypesVariable() {
    return myState.createNewRuntimeTypesVariable();
  }

  public SNode computeTypeInferenceMode(SNode node) {
    synchronized (TYPECHECKING_LOCK) {
      myIsInferenceMode = true;
      try {
        return myNodeTypesComponent.computeTypesForNodeInferenceMode(node);
      } finally {
        myIsInferenceMode = false;
      }
    }
  }

  @Override
  public void clear() {
    myNodeTypesComponent.clear();
  }

  public boolean isInferenceMode() {
    return myIsInferenceMode;
  }

  @Override
  public NodeTypesComponent getNodeTypesComponent() {
    return myNodeTypesComponent;
  }

  @Override
  public SNode getOverloadedOperationType(SNode operation, SNode leftOperandType, SNode rightOperandType) {
    SNode left = myState.expand(leftOperandType);
    SNode right = myState.expand(rightOperandType);
    return myTypeChecker.getRulesManager().getOperationType(operation, left, right);
  }

  @Override
  public void createComparableEquation(SNode node1, SNode node2, EquationInfo equationInfo) {
    myState.addComparable(node1, node2, true, false, equationInfo);
  }

  @Override
  public void createComparableEquation(SNode node1, SNode node2, boolean inference, EquationInfo equationInfo) {
    myState.addComparable(node1, node2, true, inference, equationInfo);
  }

  @Override
  public void createComparableEquationStrong(SNode node1, SNode node2, EquationInfo equationInfo) {
    myState.addComparable(node1, node2, false, false, equationInfo);
  }

  @Override
  public void createLessThanInequality(SNode node1, SNode node2, boolean checkOnly, boolean isWeak, boolean lessThen, EquationInfo equationInfo) {
    myState.addInequality(node1, node2, isWeak, checkOnly, equationInfo, lessThen);
  }

  @Override
  public void createGreaterThanInequality(SNode node1, SNode node2, boolean checkOnly, boolean isWeak, boolean lessThen, EquationInfo equationInfo) {
    myState.addInequality(node2, node1, isWeak, checkOnly, equationInfo, lessThen);
  }

  @Override
  public NodeTypesComponent getBaseNodeTypesComponent() {
    return myNodeTypesComponent;
  }

  @Override
  public SNode typeOf(SNode node) {
    return typeOf(node, null, null, true);
  }

  @Override
  public void addDependencyForCurrent(SNode node) {
    getNodeTypesComponent().addDependencyForCurrent(node);
  }

  @Override
  protected SNode getTypeOf_generationMode(SNode node) {
    try {
      return myNodeTypesComponent.computeTypesForNodeDuringGeneration(node);
    } finally {
      myNodeTypesComponent.dispose();
    }
  }

  @Override
  protected SNode getTypeOf_resolveMode(SNode node, TypeChecker typeChecker) {
    Pair<SNode, Boolean> pair = typeChecker.getTypeComputedForCompletion(node);
    if (pair.o2) {
      return pair.o1;
    }
    SNode resultType = myNodeTypesComponent.computeTypesForNodeDuringResolving(node);
    typeChecker.putTypeComputedForCompletion(node, resultType);
    return resultType;
  }

  @Override
  public SubtypingManager getSubtypingManager() {
    return myTypeChecker.getSubtypingManager();
  }

  @Override
  public void dispose() {
    myRootNode = null;
    myNodeTypesComponent.dispose();
    myState.clear(true);
  }

  @Override
  protected SNode getTypeOf_normalMode(SNode node) {
    if (!checkIfNotChecked(node, false)) return null;
    return getTypeDontCheck(node);
  }

  public boolean isCheckedRoot(boolean considerNonTypesystemRules) {
    return myNodeTypesComponent.isChecked(considerNonTypesystemRules);
  }

  //--------

  @Override
  public SModel getRuntimeTypesModel() {
    return myTypeChecker.getRuntimeTypesModel();
  }

  @Override
  public Map<SNode, SNode> getMainContext() {
    return getNodeTypesComponent().getMainContext();
  }

  @Override
  public boolean isIncrementalMode() {
    return !isInEditorQueries() && myTypeChecker.isGlobalIncrementalMode();
  }

  @Override
  public boolean isInEditorQueries() {
    return myIsResolving;
  }

  @Override
  public void setIsNonTypesystemComputation() {
    myIsNonTypesystemComputation = true;
  }

  @Override
  public void resetIsNonTypesystemComputation() {
    myIsNonTypesystemComputation = false;
  }

  @Override
  public boolean isNonTypesystemComputation() {
    return myIsNonTypesystemComputation;
  }

  @Override
  public IErrorReporter reportTypeError(SNode nodeWithError, String errorString, String ruleModel, String ruleId, QuickFixProvider intentionProvider, MessageTarget errorTarget) {
    SimpleErrorReporter reporter = new SimpleErrorReporter(nodeWithError, errorString, ruleModel, ruleId, MessageStatus.ERROR, errorTarget);
    reporter.setIntentionProvider(intentionProvider);
    reportMessage(nodeWithError, reporter);
    return reporter;
  }

  @Override
  public IErrorReporter reportWarning(SNode nodeWithError, String errorString, String ruleModel, String ruleId, QuickFixProvider intentionProvider, MessageTarget errorTarget) {
    SimpleErrorReporter reporter = new SimpleErrorReporter(nodeWithError, errorString, ruleModel, ruleId, MessageStatus.WARNING, errorTarget);
    reporter.setIntentionProvider(intentionProvider);
    reportMessage(nodeWithError, reporter);
    return reporter;
  }

  @Override
  public IErrorReporter reportInfo(SNode nodeWithInfo, String message, String ruleModel, String ruleId, QuickFixProvider intentionProvider, MessageTarget errorTarget) {
    SimpleErrorReporter reporter = new SimpleErrorReporter(nodeWithInfo, message, ruleModel, ruleId, MessageStatus.OK, errorTarget);
    reporter.setIntentionProvider(intentionProvider);
    reportMessage(nodeWithInfo, reporter);
    return reporter;
  }

  @Override
  public void registerTypeVariable(SNode variable) {
    getNodeTypesComponent().registerTypeVariable(variable);
  }

  @Override
  public SNode[] getRegisteredTypeVariables(String varName) {
    return getNodeTypesComponent().getVariables(varName);
  }

  @Override
  public void whenConcrete(SNode argument, Runnable r, String nodeModel, String nodeId, boolean isShallow) {
    //todo
  }

  @Override
  public void whenConcrete(List<NodeInfo> arguments, Runnable r) {
    //todo
  }

  @Override
  public SNode getNode() {
    return myRootNode;
  }

  @Override
  public void setOperationContext(IOperationContext context) {
    myOperationContext = context;
  }

  @Override
  public IOperationContext getOperationContext() {
    return myOperationContext;
  }

  @Override
  public void runTypeCheckingAction(Runnable r) {
    synchronized (TYPECHECKING_LOCK) {
      r.run();
    }
  }

  @Override
  public <T> T runTypeCheckingAction(Computable<T> c) {
    synchronized (TYPECHECKING_LOCK) {
      return c.compute();
    }
  }

  @Override
  public SNode getTypeOf(SNode node, TypeChecker typeChecker) {
    if (node == null) return null;
    synchronized (TYPECHECKING_LOCK) {
      if (this.isInEditorQueries()) {
        return getTypeOf_resolveMode(node, typeChecker);
      } else if (typeChecker.isGenerationMode()) {
        return getTypeOf_generationMode(node);
      } else {
        return getTypeOf_normalMode(node);
      }
    }
  }

  @Override
  public SNode getTypeInGenerationMode(SNode node) {
    myIsTraceMode = true;
    SNode type = getTypeOf_generationMode(node);
    myIsTraceMode = false;
    return type;
  }

  @Override
  public boolean checkIfNotChecked(SNode node, boolean useNonTypesystemRules) {
    synchronized (TYPECHECKING_LOCK) {
      if (!isCheckedRoot(useNonTypesystemRules)) {
        checkRoot();
        if (useNonTypesystemRules) {
          myNodeTypesComponent.applyNonTypesystemRulesToRoot(null);
        }
      }
      return true;
    }
  }

  @Override
  public Set<Pair<SNode, List<IErrorReporter>>> checkRootAndGetErrors(boolean refreshTypes) {
    synchronized (TYPECHECKING_LOCK) {
      checkRoot(refreshTypes);
      //non-typesystem checks
      getBaseNodeTypesComponent().applyNonTypesystemRulesToRoot(getOperationContext());

      return new THashSet<Pair<SNode, List<IErrorReporter>>>(myNodeTypesComponent.getNodesWithErrors());
    }
  }

  @Override
  public IErrorReporter getTypeMessageDontCheck(SNode node) {
    List<IErrorReporter> messages = getTypeMessagesDontCheck(node);
    if (messages.isEmpty()) {
      return null;
    }
    Collections.sort(messages, new Comparator<IErrorReporter>() {
      public int compare(IErrorReporter o1, IErrorReporter o2) {
        return o2.getMessageStatus().compareTo(o1.getMessageStatus());
      }
    });
    return messages.get(0);
  }
}
