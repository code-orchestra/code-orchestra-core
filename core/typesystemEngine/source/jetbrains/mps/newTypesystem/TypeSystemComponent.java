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

import gnu.trove.THashMap;
import gnu.trove.THashSet;
import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.lang.typesystem.runtime.HUtil;
import jetbrains.mps.lang.typesystem.runtime.InferenceRule_Runtime;
import jetbrains.mps.lang.typesystem.runtime.IsApplicableStatus;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.*;
import jetbrains.mps.typesystem.inference.RulesManager;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.util.Pair;
import org.jetbrains.annotations.NotNull;

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: 1/31/11
 * Time: 4:58 PM
 */
class TypeSystemComponent extends CheckingComponent {
  private static final Logger LOG = Logger.getLogger(TypeSystemComponent.class);

  private boolean myInvalidationResult = false;

  private State myState;

  private Map<SNode, Set<SNode>> myNodesToDependentNodes_A = new THashMap<SNode, Set<SNode>>();
  private Map<SNode, Set<SNode>> myNodesToDependentNodes_B = new THashMap<SNode, Set<SNode>>();

  private Set<SNode> myJustInvalidatedNodes = new THashSet<SNode>();

  private Map<SNode, Set<Pair<String, String>>> myNodesToRules = new THashMap<SNode, Set<Pair<String, String>>>();
  private Set<SNode> myFullyCheckedNodes = new THashSet<SNode>(); //nodes which are checked with their children
  private Set<SNode> myPartlyCheckedNodes = new THashSet<SNode>(); // nodes which are checked themselves but not children
  private Set<SNode> myNodesDependentOnCaches = new THashSet<SNode>();
  private Stack<Set<SNode>> myCurrentFrontiers = new Stack<Set<SNode>>();
  private SNode myCurrentCheckedNode;
  private boolean myCurrentTypeAffected = false;

  public TypeSystemComponent(TypeChecker typeChecker, State state, NodeTypesComponent component) {
    myState = state;
    myTypeChecker = typeChecker;
    myNodeTypesComponent = component;
  }

  @Deprecated
  protected boolean loadTypesystemRules(SNode root) {
    SModel model = root.getModel();
    RulesManager rulesManager = myTypeChecker.getRulesManager();
    if (rulesManager.hasModelLoadedRules(model.getSModelReference())) {
      return true;
    }
    List<Language> languages = SModelOperations.getLanguages(model, GlobalScope.getInstance());
    boolean isLoadedAnyLanguage = false;
    for (Language language : languages) {
      boolean b = rulesManager.loadLanguage(language.getModuleFqName());
      isLoadedAnyLanguage = isLoadedAnyLanguage || b;
    }
    rulesManager.markModelHasLoadedRules(model.getSModelReference());
    if (!isLoadedAnyLanguage) return false;
    return true;
  }

  //returns true if something was invalidated
  protected boolean doInvalidate() {
    if (myInvalidationWasPerformed) {
      return myInvalidationResult;
    }
    boolean result;
    Set<SNode> invalidatedNodes_A = new THashSet<SNode>();
    Set<SNode> invalidatedNodes_B = new THashSet<SNode>();
    Set<SNode> newNodesToInvalidate_A = new THashSet<SNode>();
    Set<SNode> newNodesToInvalidate_B = new THashSet<SNode>();
    Set<SNode> currentNodesToInvalidate_A = myCurrentNodesToInvalidate;
    Set<SNode> currentNodesToInvalidate_B = new THashSet<SNode>();

    if (myCacheWasRebuilt) {
      currentNodesToInvalidate_A.addAll(myNodesDependentOnCaches);
    }

    //A means invalidated and type will be recalculated, B means invalidated but type not affected. A => B then.
    while (!currentNodesToInvalidate_A.isEmpty() || !currentNodesToInvalidate_B.isEmpty()) {
      for (SNode nodeToInvalidate : currentNodesToInvalidate_A) {
        if (invalidatedNodes_A.contains(nodeToInvalidate)) continue;
        invalidateNodeTypeSystem(nodeToInvalidate, true);
        invalidatedNodes_A.add(nodeToInvalidate);
        Set<SNode> nodes = myNodesToDependentNodes_A.get(nodeToInvalidate);
        if (nodes != null) {
          newNodesToInvalidate_A.addAll(nodes);
        }
        nodes = myNodesToDependentNodes_B.get(nodeToInvalidate);
        if (nodes != null) {
          newNodesToInvalidate_B.addAll(nodes);
        }
      }

      for (SNode nodeToInvalidate : currentNodesToInvalidate_B) {
        if (invalidatedNodes_A.contains(nodeToInvalidate)) continue;
        if (invalidatedNodes_B.contains(nodeToInvalidate)) continue;
        invalidateNodeTypeSystem(nodeToInvalidate, false);
        invalidatedNodes_B.add(nodeToInvalidate);
        Set<SNode> nodes = myNodesToDependentNodes_A.get(nodeToInvalidate);
        if (nodes != null) {
          newNodesToInvalidate_B.addAll(nodes);
        }
        nodes = myNodesToDependentNodes_B.get(nodeToInvalidate);
        if (nodes != null) {
          newNodesToInvalidate_B.addAll(nodes);
        }
      }
      currentNodesToInvalidate_A = newNodesToInvalidate_A;
      currentNodesToInvalidate_B = newNodesToInvalidate_B;
      newNodesToInvalidate_A = new THashSet<SNode>();
      newNodesToInvalidate_B = new THashSet<SNode>();
    }
    result = !invalidatedNodes_A.isEmpty() || !invalidatedNodes_B.isEmpty();
    myCurrentNodesToInvalidate.clear();
    myCacheWasRebuilt = false;
    myInvalidationWasPerformed = true;
    myInvalidationResult = result;
    return result;
  }

  private void invalidateNodeTypeSystem(SNode node, boolean typeWillBeRecalculated) {
    myPartlyCheckedNodes.remove(node);
    myFullyCheckedNodes.remove(node);
    myState.clearNode(node);
    if (typeWillBeRecalculated) {
      TypeChecker.getInstance().fireTypeWillBeRecalculatedForTerm(node);
    }
    myNodesToRules.remove(node);
  }

  public Map<SNode, List<IErrorReporter>> getNodesToErrorsMap() {
    return myState.getNodeMaps().getNodesToErrors();
  }

  public void clear() {
    myIsChecked = false;
    clearCaches();
    clearState();
    clearNodeTypes();
  }

  private void clearState() {
    myState.clear(true);
  }

  public void clearNodeTypes() {
    myCurrentNodesToInvalidate.clear();
  }

  public void typeOfNodeCalled(SNode node) {
    if (myCurrentCheckedNode == node) {
      myCurrentTypeAffected = true;
    }
  }

  public void addDependencyOnCurrent(SNode node) {
    addDependencyOnCurrent(node, true);
  }

  //"type affected" means that *type* of this node depends on current
  // used to decide whether call "type will be recalculated" if current invalidated
  public void addDependencyOnCurrent(SNode node, boolean typeAffected) {
    Set<SNode> hashSet = new THashSet<SNode>(1);
    hashSet.add(myCurrentCheckedNode);

    if (node == null) {
      LOG.error("Typesystem dependency not tracked. ");
      return;
    }

    addDependentNodesTypeSystem(node, hashSet, typeAffected);
  }

  public void addDependencyForCurrent(SNode node, SNode nonTSCurrent) {
    Set<SNode> hashSet = new THashSet<SNode>(1);
    hashSet.add(node);
    if (myCurrentCheckedNode == null) {
      myCurrentCheckedNode = nonTSCurrent;
    }
    if (myCurrentCheckedNode == null) {
      LOG.error("Typesystem dependency not tracked. ");
      return;
    }
    addDependentNodesTypeSystem(myCurrentCheckedNode, hashSet, true);
  }


  protected void computeTypes(SNode nodeToCheck, boolean refreshTypes, boolean forceChildrenCheck, List<SNode> additionalNodes, boolean finalExpansion, SNode initialNode) {
    try {
      if (!isIncrementalMode() || refreshTypes) {
        clear();
      } else {
        myState.clearStateObjects();
        doInvalidate();
        myPartlyCheckedNodes.addAll(myFullyCheckedNodes);
        myFullyCheckedNodes.clear();
      }
      //if (!loadTypesystemRules(nodeToCheck)) {
      //  return;
      //}
      computeTypesForNode(nodeToCheck, forceChildrenCheck, additionalNodes, initialNode);
      if (typeCalculated(initialNode) != null) return;
      solveInequalitiesAndExpandTypes(finalExpansion);
      performActionsAfterChecking();
    } finally {
      myInvalidationWasPerformed = false;
    }
  }

  public void clearCaches() {
    myNodesToDependentNodes_A.clear();
    myNodesToDependentNodes_B.clear();
    myNodesDependentOnCaches.clear();
    myFullyCheckedNodes.clear();
    myPartlyCheckedNodes.clear();
    myNodesToRules.clear();
  }

  protected SNode computeTypesForNode_special(SNode initialNode, List<SNode> givenAdditionalNodes) {
    SNode type = null;
    SNode prevNode = null;
    SNode node = initialNode;
    while (node != null) {
      List<SNode> additionalNodes = new ArrayList<SNode>(givenAdditionalNodes);
      if (prevNode != null) {
        additionalNodes.add(prevNode);
      }
      computeTypes(node, false, false, additionalNodes, false, initialNode);
      type = typeCalculated(initialNode);
      if (type == null) {
        if (node.isRoot()) {
          if (myState.getInequalitySystem() == null) {
            computeTypes(node, true, true, new ArrayList<SNode>(0), true, initialNode);
          }
          type = getType(initialNode);
          return type;
        }
        prevNode = node;
        node = node.getParent();
      } else {
        return type;
      }
    }
    return type;
  }

  public SNode getType(SNode node) {
    if (myFullyCheckedNodes.contains(node)) {
      return getRawTypeFromContext(node);
    }
    return null;
  }

  public SNode getRawTypeFromContext(SNode node) {
    return myNodeTypesComponent.getTypeCheckingContext().getTypeDontCheck(node);
  }

  public void markNodeAsAffectedByRule(SNode node, String ruleModel, String ruleId) {
    Set<Pair<String, String>> rulesWhichAffectNodesType = myNodesToRules.get(node);
    if (rulesWhichAffectNodesType == null) {
      rulesWhichAffectNodesType = new THashSet<Pair<String, String>>(1);
      myNodesToRules.put(node, rulesWhichAffectNodesType);
    }
    rulesWhichAffectNodesType.add(new Pair<String, String>(ruleModel, ruleId));
  }

  public Set<Pair<String, String>> getRulesWhichAffectNodeType(SNode node) {
    Set<Pair<String, String>> set = myNodesToRules.get(node);
    if (set == null) return null;
    return new THashSet<Pair<String, String>>(set);
  }

  private void computeTypesForNode(SNode node, boolean forceChildrenCheck, List<SNode> additionalNodes, SNode initialNode) {
    if (node == null) return;
    Set<SNode> frontier = new LinkedHashSet<SNode>();
    Set<SNode> newFrontier = new LinkedHashSet<SNode>();
    frontier.add(node);
    frontier.addAll(additionalNodes);
    MyEventsReadListener nodesReadListener = new MyEventsReadListener();
    while (!(frontier.isEmpty())) {
      myCurrentFrontiers.push(newFrontier);
      for (SNode sNode : frontier) {
        if (myFullyCheckedNodes.contains(sNode)) {
          continue;
        }
        Set<SNode> candidatesForFrontier = new LinkedHashSet<SNode>();
        if (myNodeTypesComponent.isSpecial()) {
          candidatesForFrontier.addAll(myTypeChecker.getRulesManager().getDependencies(sNode));
        }
        if (forceChildrenCheck) {
          candidatesForFrontier.addAll(sNode.getChildren());
        }
        for (SNode candidate : candidatesForFrontier) {
          newFrontier.add(candidate);
        }
        if (!myPartlyCheckedNodes.contains(sNode)) {
          MyLanguageCachesReadListener languageCachesReadListener = null;
          if (isIncrementalMode()) {
            languageCachesReadListener = new MyLanguageCachesReadListener();
            nodesReadListener.clear();
            NodeReadEventsCaster.setNodesReadListener(nodesReadListener);
            LanguageHierarchyCache.getInstance().setReadAccessListener(languageCachesReadListener);
          }
          boolean typeAffected = false;
          try {
            myJustInvalidatedNodes.add(sNode);
            typeAffected = applyRulesToNode(sNode);
          } finally {
            if (isIncrementalMode()) {
              NodeReadEventsCaster.removeNodesReadListener();
            }
          }
          if (isIncrementalMode()) {
            synchronized (ACCESS_LOCK) {
              nodesReadListener.setAccessReport(true);
              Set<SNode> accessedNodes = nodesReadListener.getAccessedNodes();
              addDependentNodesTypeSystem(sNode, accessedNodes, typeAffected);
              nodesReadListener.setAccessReport(false);
              if (languageCachesReadListener != null) { //redundant checking, in fact; but without this IDEA underlines the next line with red
                languageCachesReadListener.setAccessReport(true);
                if (languageCachesReadListener.myIsCacheAccessed) {
                  addCacheDependentNodesTypesystem(sNode);
                }
                languageCachesReadListener.setAccessReport(false);
              }
            }
            nodesReadListener.clear();
          }
          myPartlyCheckedNodes.add(sNode);
        }
        myFullyCheckedNodes.add(sNode);
        if (typeCalculated(initialNode) != null) return;
      }
      Set<SNode> newFrontierPopped = myCurrentFrontiers.pop();
      assert newFrontierPopped == newFrontier;
      frontier = newFrontier;
      newFrontier = new LinkedHashSet<SNode>();
    }
  }

  private SNode typeCalculated(SNode initialNode) {
    if (myState.getInequalitySystem()!=null) {
      SNode expectedType = myState.getInequalitySystem().getExpectedType();
      if (expectedType != null && !TypesUtil.hasVariablesInside(expectedType)) {
        return expectedType;
      }
    } else {
      if (initialNode== null) return null;
      SNode type = getType(initialNode);
      if (type!= null && !TypesUtil.hasVariablesInside(type)) return type;
    }
    return null;
  }

  //"type affected" means that *type* of this node depends on this set
  // used to decide whether call "type will be recalculated" if node from set invalidated
  private void addDependentNodesTypeSystem(@NotNull SNode sNode, Set<SNode> nodesToDependOn, boolean typesAffected) {
    Map<SNode, Set<SNode>> dependencies = typesAffected ? myNodesToDependentNodes_A : myNodesToDependentNodes_B;
    for (SNode nodeToDependOn : nodesToDependOn) {
      if (nodeToDependOn == null) continue;
      if (sNode == nodeToDependOn) continue;
      Set<SNode> dependentNodes = dependencies.get(nodeToDependOn);
      if (dependentNodes == null) {
        dependentNodes = new THashSet<SNode>(1);
        dependencies.put(nodeToDependOn, dependentNodes);
        myNodeTypesComponent.track(nodeToDependOn);
      }
      dependentNodes.add(sNode);
    }
  }

  public void solveInequalitiesAndExpandTypes(boolean finalExpansion) {
    myState.solveInequalities();
    myState.expandAll(myJustInvalidatedNodes, finalExpansion);
    myJustInvalidatedNodes.clear();
  }

  public void addError(SNode node, IErrorReporter reporter) {
    myState.addError(node, reporter, null);
  }

  public void markUnchecked(SNode node) {
    invalidateNodeTypeSystem(node, true);
  }

  public void computeTypes(boolean refreshTypes) {
    computeTypes(myNodeTypesComponent.getNode(), refreshTypes, true, new ArrayList<SNode>(0), true, null);
  }

  private void performActionsAfterChecking() {
    myState.performActionsAfterChecking();
    myNodeTypesComponent.getModelListenerManager().updateGCedNodes();
    TypeChecker.getInstance().addTypeRecalculatedListener(myNodeTypesComponent.getTypeRecalculatedListener());//method checks if already exists
    LanguageHierarchyCache.getInstance().addCacheChangeListener(myLanguageCacheListener);
  }

  protected boolean applyRulesToNode(SNode node) {
    List<Pair<InferenceRule_Runtime, IsApplicableStatus>> newRules = myTypeChecker.getRulesManager().getInferenceRules(node);
    boolean result = false;
    if (newRules != null) {
      myCurrentTypeAffected = false;
      SNode oldCheckedNode = myCurrentCheckedNode;
      myCurrentCheckedNode = node;
      for (Pair<InferenceRule_Runtime, IsApplicableStatus> rule : newRules) {
        myState.applyRuleToNode(node, rule.o1, rule.o2);
      }
      myCurrentCheckedNode = oldCheckedNode;
      result = myCurrentTypeAffected;
      myCurrentTypeAffected = false;
    }
    return result;
  }

  public void addNodeToFrontier(SNode node) {
    if (myPartlyCheckedNodes.contains(node)) {
      return;
    }
    if (!myCurrentFrontiers.isEmpty()) {
      myCurrentFrontiers.peek().add(node);
    }
  }

  private void addCacheDependentNodesTypesystem(SNode node) {
    myNodesDependentOnCaches.add(node);
  }
}
