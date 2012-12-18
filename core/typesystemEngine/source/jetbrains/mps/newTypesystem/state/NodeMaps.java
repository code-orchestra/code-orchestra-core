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
import jetbrains.mps.errors.QuickFixProvider;
import jetbrains.mps.errors.SimpleErrorReporter;
import jetbrains.mps.errors.messageTargets.NodeMessageTarget;
import jetbrains.mps.newTypesystem.EquationErrorReporterNew;
import jetbrains.mps.newTypesystem.TypesUtil;
import jetbrains.mps.newTypesystem.operation.AddErrorOperation;
import jetbrains.mps.newTypesystem.operation.AssignTypeOperation;
import jetbrains.mps.newTypesystem.operation.ExpandTypeOperation;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.EquationInfo;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.*;

public class NodeMaps {
  @StateObject
  private final Map<SNode, SNode> myNodesToTypes = new THashMap<SNode, SNode>();
  @StateObject
  private final Map<SNode, SNode> myTypesToNodes = new THashMap<SNode, SNode>();
  @StateObject
  private final Map<SNode, List<IErrorReporter>> myNodesToErrors = new THashMap<SNode, List<IErrorReporter>>();
  private final State myState;

  public NodeMaps(State state) {
    myState = state;
  }

  public void addNodeToType(SNode node, SNode type, EquationInfo info) {
    myState.executeOperation(new AssignTypeOperation(node, type, info));
  }

  public void updateNodeToType(SNode node, SNode type, EquationInfo info) {
    SNode oldType = myNodesToTypes.get(node);
    if (oldType != null) {
      myState.executeOperation(new ExpandTypeOperation(node, type, info, oldType));
    }
  }

  @StateMethod
  public void assignNodeType(SNode node, SNode type) {
    myState.assertIsInStateChangeAction();
    myTypesToNodes.put(type, node);
    myNodesToTypes.put(node, type);
  }

  @StateMethod
  public void removeNodeType(SNode node) {
    myState.assertIsInStateChangeAction();
    SNode type = myNodesToTypes.remove(node);
    myTypesToNodes.remove(type);
  }

  @StateMethod
  public void removeNodeErrors(SNode node) {
    myState.assertIsInStateChangeAction();
    myNodesToErrors.remove(node);
  }

  @StateMethod
  public void addNodeErrors(SNode node, List<IErrorReporter> errors) {
    myState.assertIsInStateChangeAction();
    myNodesToErrors.put(node, errors);
  }

  @StateMethod
  public void assignNodeTypeDontChangeSource(SNode node, SNode type) {
    myState.assertIsInStateChangeAction();
    myNodesToTypes.put(node, type);
  }

  @StateMethod
  public void addError(SNode node, IErrorReporter errorReporter) {
    myState.assertIsInStateChangeAction();
    List<IErrorReporter> errors = myNodesToErrors.get(node);
    if (errors == null) {
      errors = new LinkedList<IErrorReporter>();
      myNodesToErrors.put(node, errors);
    }
    errors.add(errorReporter);
  }

  @StateMethod
  public void removeError(SNode node, IErrorReporter errorReporter) {
    myState.assertIsInStateChangeAction();
    List<IErrorReporter> errors = myNodesToErrors.get(node);
    errors.remove(errorReporter);
    if (errors.isEmpty()) {
      myNodesToErrors.remove(node);
    }
  }

  public SNode typeOf(SNode node, EquationInfo info) {
    SNode type = myNodesToTypes.get(node);
    if (type == null) {
      type = myState.createNewRuntimeTypesVariable();
      addNodeToType(node, type, info);
    }
    return myState.getRepresentative(type);
  }

  public void addNodeToError(SNode node, IErrorReporter error, EquationInfo info) {
    myState.executeOperation(new AddErrorOperation(node, error, info));
  }

  public List<IErrorReporter> getNodeErrors(SNode node) {
    List<IErrorReporter> result = myNodesToErrors.get(node);
    if (result == null) {
      result = new LinkedList<IErrorReporter>();
    }
    return result;
  }

  public void clear() {
    myNodesToErrors.clear();
    myNodesToTypes.clear();
    myTypesToNodes.clear();
  }

  public SNode getType(SNode node) {
    if (node == null) return null;
    SNode type = myNodesToTypes.get(node);
    return myState.getRepresentative(type);
  }

  public SNode getInitialType(SNode node) {
    return myNodesToTypes.get(node);
  }

  public List<String> getErrorListPresentation() {
    List<String> result = new LinkedList<String>();
    for (Map.Entry<SNode, List<IErrorReporter>> entry : myNodesToErrors.entrySet()) {
      for (IErrorReporter error : entry.getValue()) {
        result.add(entry.getKey() + " " + error.reportError());
      }
    }
    return result;
  }

  @CodeOrchestraPatch
  public void expandAll(Set<SNode> nodes, boolean finalExpansion) {
    Set<SNode> keySet = myNodesToTypes.keySet();
    for (SNode node : nodes) {
      if (!keySet.contains(node)) continue;
      SNode var = myNodesToTypes.get(node);
      SNode type = myState.getEquations().expandNode(var, finalExpansion);
      updateNodeToType(node, type, null);
      if (finalExpansion && (type == null || TypesUtil.isVariable(type))) {
        // RE-2572
        // myState.getTypeCheckingContext().reportWarning(node, "Type was not calculated", null, null, null, new NodeMessageTarget());
      }
    }
  }

  public void expandAll(boolean finalExpansion) {
    expandAll(new THashSet<SNode>(myNodesToTypes.keySet()), finalExpansion);
  }

  public SNode getNode(SNode type) {
    return myTypesToNodes.get(type);
  }

  public void clearTypesToNodes() {
    myTypesToNodes.clear();
  }

  public Set<SNode> getTypeKeySet() {
    return myNodesToTypes.keySet();
  }

  public void reportEquationBroken(EquationInfo info, SNode left, SNode right) {
    IErrorReporter errorReporter;
    SNode nodeWithError = null;
    List<QuickFixProvider> intentionProviders = new ArrayList<QuickFixProvider>();
    String errorString = null;
    String ruleModel = null;
    String ruleId = null;
    if (info != null) {
      nodeWithError = info.getNodeWithError();
      intentionProviders = info.getIntentionProviders();
      errorString = info.getErrorString();
      ruleModel = info.getRuleModel();
      ruleId = info.getRuleId();
    }
    if (errorString != null) {
      errorReporter = new SimpleErrorReporter(nodeWithError, errorString, ruleModel, ruleId);
    } else {
      errorReporter = new EquationErrorReporterNew(nodeWithError, myState, "incompatible types: ",
        right, " and ", left, "", ruleModel, ruleId);
    }
    for (QuickFixProvider quickFixProvider : intentionProviders) {
      errorReporter.setIntentionProvider(quickFixProvider);
    }
    if (info != null) {
      errorReporter.setAdditionalRulesIds(info.getAdditionalRulesIds());
    }
    // addNodeToError(nodeWithError, errorReporter, info);
    myState.getTypeCheckingContext().reportMessage(nodeWithError, errorReporter);
  }

  public void reportSubTypeError(SNode subType, SNode superType, EquationInfo equationInfo, boolean isWeak) {
    IErrorReporter errorReporter;
    String errorString = equationInfo.getErrorString();
    String ruleModel = equationInfo.getRuleModel();
    String ruleId = equationInfo.getRuleId();
    SNode nodeWithError = equationInfo.getNodeWithError();
    if (errorString == null) {
      String strongString = isWeak ? "" : " strong";
      errorReporter = new EquationErrorReporterNew(nodeWithError, myState, "type ", subType,
        " is not a" + strongString + " subtype of ", superType, "", ruleModel, ruleId);
    } else {
      errorReporter = new SimpleErrorReporter(nodeWithError, errorString, ruleModel, ruleId);
    }
    for (QuickFixProvider quickFixProvider : equationInfo.getIntentionProviders()) {
      errorReporter.setIntentionProvider(quickFixProvider);
    }
    errorReporter.setAdditionalRulesIds(equationInfo.getAdditionalRulesIds());
    myState.getTypeCheckingContext().reportMessage(nodeWithError, errorReporter);
  }

  public void reportComparableError(SNode subType, SNode superType, EquationInfo equationInfo, boolean isWeak) {
    IErrorReporter errorReporter;
    String errorString = equationInfo.getErrorString();
    String ruleModel = equationInfo.getRuleModel();
    String ruleId = equationInfo.getRuleId();
    SNode nodeWithError = equationInfo.getNodeWithError();
    if (errorString == null) {
      String strongString = isWeak ? "" : " strongly";
      errorReporter = new EquationErrorReporterNew(nodeWithError, myState, "type ", subType, " is not" + strongString + " comparable with ",
        superType, "", ruleModel, ruleId);
    } else {
      errorReporter = new SimpleErrorReporter(nodeWithError, errorString, ruleModel, ruleId);
    }
    for (QuickFixProvider provider : equationInfo.getIntentionProviders()) {
      errorReporter.addIntentionProvider(provider);
    }
    errorReporter.setAdditionalRulesIds(equationInfo.getAdditionalRulesIds());
    myState.getTypeCheckingContext().reportMessage(nodeWithError, errorReporter);
  }

  public Map<SNode, SNode> getNodesToTypes() {
    return Collections.unmodifiableMap(myNodesToTypes);
  }

  public Map<SNode, List<IErrorReporter>> getNodesToErrors() {
    return Collections.unmodifiableMap(myNodesToErrors);
  }
}
