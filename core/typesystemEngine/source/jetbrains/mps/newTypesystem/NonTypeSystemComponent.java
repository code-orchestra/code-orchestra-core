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
import jetbrains.mps.lang.typesystem.runtime.IsApplicableStatus;
import jetbrains.mps.lang.typesystem.runtime.NonTypesystemRule_Runtime;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.LanguageHierarchyCache;
import jetbrains.mps.smodel.NodeReadEventsCaster;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.typesystem.inference.TypeCheckingContext;
import jetbrains.mps.typesystem.inference.TypesReadListener;
import jetbrains.mps.util.Pair;

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: 1/31/11
 * Time: 4:40 PM
 */
class NonTypeSystemComponent extends CheckingComponent {

  private boolean myInvalidationResultNT = false;
  private Set<Pair<SNode, String>> myCurrentPropertiesToInvalidate = new HashSet<Pair<SNode, String>>();
  private Set<SNode> myCurrentTypedTermsToInvalidate = new HashSet<SNode>();
  private Set<Pair<SNode, NonTypesystemRule_Runtime>> myCheckedNodes
    = new HashSet<Pair<SNode, NonTypesystemRule_Runtime>>(); // nodes which are checked themselves but not children
  private Map<SNode, List<IErrorReporter>> myNodesToErrorsMap = new HashMap<SNode, List<IErrorReporter>>();

  // nodes to rules which depend on this nodes
  private Map<SNode, Map<NonTypesystemRule_Runtime, Set<SNode>>> myNodesToDependentNodesWithNTRules =
    new THashMap<SNode, Map<NonTypesystemRule_Runtime, Set<SNode>>>();

  // properties to rules which depend on this nodes' properties
  private Map<Pair<SNode, String>, Map<NonTypesystemRule_Runtime, Set<SNode>>> myPropertiesToDependentNodesWithNTRules =
    new THashMap<Pair<SNode, String>, Map<NonTypesystemRule_Runtime, Set<SNode>>>();

  // typed terms to rules which depend on this nodes
  private Map<SNode, Map<NonTypesystemRule_Runtime, Set<SNode>>> myTypedTermsToDependentNodesWithNTRules =
    new THashMap<SNode, Map<NonTypesystemRule_Runtime, Set<SNode>>>();

  private Map<SNode, Set<NonTypesystemRule_Runtime>> myNodesDependentOnCachesWithNTRules =
    new THashMap<SNode, Set<NonTypesystemRule_Runtime>>();

  //checked node & NT rule -> set of errors
  private Map<SNode, Map<NonTypesystemRule_Runtime, Set<IErrorReporter>>> myNodesAndNTRulesToErrors =
    new THashMap<SNode, Map<NonTypesystemRule_Runtime, Set<IErrorReporter>>>();

  private Pair<SNode, NonTypesystemRule_Runtime> myRuleAndNodeBeingChecked = null;
  private SNode myCurrentCheckedNode;

  public NonTypeSystemComponent(TypeChecker typeChecker, NodeTypesComponent nodeTypesComponent) {
    myTypeChecker = typeChecker;
    myNodeTypesComponent = nodeTypesComponent;
  }

  public void clear() {
    myIsChecked = false;
    clearCaches();
  }

  public void clearNodeTypes() {
    myCurrentNodesToInvalidate.clear();
    myCurrentPropertiesToInvalidate.clear();
    myCurrentTypedTermsToInvalidate.clear();
    myNodesToErrorsMap.clear();
  }

  void clearCaches() {
    myCheckedNodes.clear();
    myNodesAndNTRulesToErrors.clear();
    myNodesToDependentNodesWithNTRules.clear();
    myPropertiesToDependentNodesWithNTRules.clear();
    myTypedTermsToDependentNodesWithNTRules.clear();
    myNodesDependentOnCachesWithNTRules.clear();
  }

  public Map<SNode, List<IErrorReporter>> getNodesToErrorsMap() {
    return Collections.unmodifiableMap(myNodesToErrorsMap);
  }

  private void doInvalidate(Map<NonTypesystemRule_Runtime, Set<SNode>> nodesAndRules, Set<Pair<SNode, NonTypesystemRule_Runtime>> invalidatedNodesAndRules) {
    if (nodesAndRules != null) {
      for (NonTypesystemRule_Runtime ruleOfNode : nodesAndRules.keySet()) {
        Set<SNode> nodes = nodesAndRules.get(ruleOfNode);
        if (nodes != null) {
          for (SNode depNode : nodes) {
            invalidatedNodesAndRules.add(new Pair<SNode, NonTypesystemRule_Runtime>(depNode, ruleOfNode));
          }
        }
      }
    }
  }

  //returns true if something was invalidated
  protected boolean doInvalidate() {
    if (myInvalidationWasPerformed) {
      return myInvalidationResultNT;
    }
    Set<Pair<SNode, NonTypesystemRule_Runtime>> invalidatedNodesAndRules = new THashSet<Pair<SNode, NonTypesystemRule_Runtime>>(1);
    //nodes
    for (SNode node : myCurrentNodesToInvalidate) {
      doInvalidate(myNodesToDependentNodesWithNTRules.get(node), invalidatedNodesAndRules);
    }
    //properties
    for (Pair<SNode, String> pair : myCurrentPropertiesToInvalidate) {
      doInvalidate(myPropertiesToDependentNodesWithNTRules.get(pair), invalidatedNodesAndRules);
    }

    //typed terms
    for (SNode node : myCurrentTypedTermsToInvalidate) {
      doInvalidate(myTypedTermsToDependentNodesWithNTRules.get(node), invalidatedNodesAndRules);
      doInvalidate(myNodesToDependentNodesWithNTRules.get(node), invalidatedNodesAndRules);
    }

    //cache-dependent
    if (myCacheWasRebuilt) {
      for (SNode nodeOfRule : myNodesDependentOnCachesWithNTRules.keySet()) {
        Set<NonTypesystemRule_Runtime> rules = myNodesDependentOnCachesWithNTRules.get(nodeOfRule);
        if (rules != null) {
          for (NonTypesystemRule_Runtime rule : rules) {
            invalidatedNodesAndRules.add(new Pair<SNode, NonTypesystemRule_Runtime>(nodeOfRule, rule));
          }
        }
      }
    }

    boolean result = !invalidatedNodesAndRules.isEmpty();
    for (Pair<SNode, NonTypesystemRule_Runtime> nodeAndRule : invalidatedNodesAndRules) {
      myCheckedNodes.remove(nodeAndRule);
      Map<NonTypesystemRule_Runtime, Set<IErrorReporter>> rulesAndErrors = myNodesAndNTRulesToErrors.get(nodeAndRule.o1);
      if (rulesAndErrors != null) {
        Set<IErrorReporter> errors = rulesAndErrors.get(nodeAndRule.o2);
        if (errors != null) {
          for (IErrorReporter errorReporter : new HashSet<IErrorReporter>(errors)) {
            List<IErrorReporter> iErrorReporters = myNodesToErrorsMap.get(errorReporter.getSNode());
            if (iErrorReporters != null) {
              iErrorReporters.remove(errorReporter);
              errors.remove(errorReporter);
            }
          }
        }
      }
    }
    myCurrentNodesToInvalidate.clear();
    myCurrentPropertiesToInvalidate.clear();
    myCurrentTypedTermsToInvalidate.clear();
    myCacheWasRebuilt = false;
    myInvalidationWasPerformed = true;
    myInvalidationResultNT = result;
    return result;
  }

  public SNode getCurrentCheckedNode() {
    return myCurrentCheckedNode;
  }

  public void addPropertyToInvalidate(SNode eventNode, String propertyName) {
    myCurrentPropertiesToInvalidate.add(new Pair<SNode, String>(eventNode, propertyName));
    setInvalidationWasPerformed(false);
  }

  public void typeWillBeRecalculatedForTerm(SNode term) {
    myCurrentTypedTermsToInvalidate.add(term);
    setInvalidationWasPerformed(false);
  }


  void putError(SNode node, IErrorReporter errorReporter) {
    Map<SNode, List<IErrorReporter>> errorMap = myNodesToErrorsMap;

    List<IErrorReporter> iErrorReporters = errorMap.get(node);
    if (iErrorReporters == null) {
      iErrorReporters = new ArrayList<IErrorReporter>(1);
      errorMap.put(node, iErrorReporters);
    }
    iErrorReporters.add(errorReporter);

    Collections.sort(iErrorReporters, new Comparator<IErrorReporter>() {
      public int compare(IErrorReporter o1, IErrorReporter o2) {
        return o1.getMessageStatus().compareTo(o2.getMessageStatus());
      }
    });

    //dependencies
    if (myRuleAndNodeBeingChecked != null) {
      SNode currentNode = myRuleAndNodeBeingChecked.o1;
      NonTypesystemRule_Runtime currentRule = myRuleAndNodeBeingChecked.o2;
      Map<NonTypesystemRule_Runtime, Set<IErrorReporter>> rulesToErrorsMap = myNodesAndNTRulesToErrors.get(currentNode);
      if (rulesToErrorsMap == null) {
        rulesToErrorsMap = new THashMap<NonTypesystemRule_Runtime, Set<IErrorReporter>>(1);
        myNodesAndNTRulesToErrors.put(currentNode, rulesToErrorsMap);
      }
      Set<IErrorReporter> errorsSet = rulesToErrorsMap.get(currentRule);
      if (errorsSet == null) {
        errorsSet = new THashSet<IErrorReporter>(1);
        rulesToErrorsMap.put(currentRule, errorsSet);
      }
      errorsSet.add(errorReporter);
    }
  }

  private void addDependentTypeTerms(SNode sNode, NonTypesystemRule_Runtime rule, Set<SNode> typesToDependOn) {
    addDependentNodes(sNode, rule, typesToDependOn, true);
  }

  private void addDependentProperties(SNode sNode, NonTypesystemRule_Runtime rule, Set<Pair<SNode, String>> propertiesToDependOn) {
    Map<Pair<SNode, String>, Map<NonTypesystemRule_Runtime, Set<SNode>>> mapToNodesWithNTRules
      = myPropertiesToDependentNodesWithNTRules;
    for (Pair<SNode, String> propertyToDependOn : propertiesToDependOn) {
      if (propertyToDependOn == null) continue;
      Map<NonTypesystemRule_Runtime, Set<SNode>> dependentNodes = mapToNodesWithNTRules.get(propertyToDependOn);
      if (dependentNodes == null) {
        dependentNodes = new THashMap<NonTypesystemRule_Runtime, Set<SNode>>(1);
        mapToNodesWithNTRules.put(propertyToDependOn, dependentNodes);
      }
      Set<SNode> nodes = dependentNodes.get(rule);
      if (nodes == null) {
        nodes = new THashSet<SNode>(1);
        dependentNodes.put(rule, nodes);
      }
      nodes.add(sNode);
    }
  }

  private void addDependentNodes(SNode sNode, NonTypesystemRule_Runtime rule, Set<SNode> nodesToDependOn, boolean isTypedTerm) {
    Map<SNode, Map<NonTypesystemRule_Runtime, Set<SNode>>> mapToNodesWithNTRules =
      isTypedTerm ? myTypedTermsToDependentNodesWithNTRules : myNodesToDependentNodesWithNTRules;
    for (SNode nodeToDependOn : nodesToDependOn) {
      if (nodeToDependOn == null) continue;
      Map<NonTypesystemRule_Runtime, Set<SNode>> dependentNodes = mapToNodesWithNTRules.get(nodeToDependOn);
      if (dependentNodes == null) {
        dependentNodes = new THashMap<NonTypesystemRule_Runtime, Set<SNode>>(1);
        mapToNodesWithNTRules.put(nodeToDependOn, dependentNodes);
      }
      Set<SNode> nodes = dependentNodes.get(rule);
      if (nodes == null) {
        nodes = new THashSet<SNode>(1);
        dependentNodes.put(rule, nodes);
      }
      nodes.add(sNode);
    }
  }

  private void addCacheDependentNodesNonTypesystem(SNode node, NonTypesystemRule_Runtime rule) {
    Map<SNode, Set<NonTypesystemRule_Runtime>> dependentNodes = myNodesDependentOnCachesWithNTRules;
    Set<NonTypesystemRule_Runtime> rules = dependentNodes.get(node);
    if (rules == null) {
      rules = new THashSet<NonTypesystemRule_Runtime>(1);
      dependentNodes.put(node, rules);
    }
    rules.add(rule);
  }

  private void addDependentNodes(SNode sNode, NonTypesystemRule_Runtime rule, Set<SNode> nodesToDependOn) {
    addDependentNodes(sNode, rule, nodesToDependOn, false);
  }

  public void applyNonTypeSystemRulesToRoot(IOperationContext context) {
    SNode root = myNodeTypesComponent.getNode();
    if (root == null) return;
    doInvalidate();
    myNodeTypesComponent.setNonTypeSystemCheckingInProgress(true);
    getTypeCheckingContext().setOperationContext(context);
    try {
      Set<SNode> frontier = new LinkedHashSet<SNode>();
      Set<SNode> newFrontier = new LinkedHashSet<SNode>();
      frontier.add(root);
      while (!(frontier.isEmpty())) {
        for (SNode sNode : frontier) {
          newFrontier.addAll(sNode.getChildren());
          applyNonTypesystemRulesToNode(sNode);
        }
        frontier = newFrontier;
        newFrontier = new LinkedHashSet<SNode>();
      }
      //all error reporters must be simple reporters, no error expansion needed
    } finally {
      getTypeCheckingContext().setOperationContext(null);
      myNodeTypesComponent.setNonTypeSystemCheckingInProgress(false);
      myInvalidationWasPerformed = false;
    }
  }

  private TypeCheckingContext getTypeCheckingContext() {
    return myNodeTypesComponent.getTypeCheckingContext();
  }

  private void applyNonTypesystemRulesToNode(SNode node) {
    SNode oldCheckedNode = myCurrentCheckedNode;
    myCurrentCheckedNode = node;
    List<Pair<NonTypesystemRule_Runtime, IsApplicableStatus>> nonTypesystemRules = myTypeChecker.getRulesManager().getNonTypesystemRules(node);
    MyEventsReadListener nodesReadListener = new MyEventsReadListener();
    if (nonTypesystemRules == null) return;

    boolean incrementalMode = isIncrementalMode();
    for (Pair<NonTypesystemRule_Runtime, IsApplicableStatus> rule : nonTypesystemRules) {
      Pair<SNode, NonTypesystemRule_Runtime> nodeAndRule = new Pair<SNode, NonTypesystemRule_Runtime>(node, rule.o1);

      // RE-1488
      String ruleClassName = rule.o1.getClass().getCanonicalName();
      if (ruleClassName.equals("jetbrains.mps.lang.core.typesystem.check_ReferencesScope_NonTypesystemRule")) {
        if (jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations.isInstanceOf(node, "codeOrchestra.actionScript.structure.IReference")) {
          continue;
        }
      }
      // RE-1727
      if (ruleClassName.equals("jetbrains.mps.lang.core.typesystem.check_Cardinalities_NonTypesystemRule")) {
        continue;
      }
      // RE-1805
      if (ruleClassName.equals("jetbrains.mps.lang.core.typesystem.check_Export_NonTypesystemRule")) {
        continue;
      }
      if (ruleClassName.equals("jetbrains.mps.lang.core.typesystem.check_InstanceOfAbstract_NonTypesystemRule")) {
        continue;
      }

      MyTypesReadListener typesReadListener = new MyTypesReadListener();
      MyLanguageCachesReadListener languageCachesReadListener = new MyLanguageCachesReadListener();
      if (incrementalMode) {
        if (myCheckedNodes.contains(nodeAndRule)) continue;
        nodesReadListener.clear();
        NodeReadEventsCaster.setNodesReadListener(nodesReadListener);
        TypeChecker.getInstance().addTypesReadListener(typesReadListener);
        LanguageHierarchyCache.getInstance().setReadAccessListener(languageCachesReadListener);
        myRuleAndNodeBeingChecked = new Pair<SNode, NonTypesystemRule_Runtime>(node, rule.o1);
      }
      try {
        myNodeTypesComponent.applyRuleToNode(node, rule.o1, rule.o2);
      } finally {
        myRuleAndNodeBeingChecked = null;
        if (incrementalMode) {
          LanguageHierarchyCache.getInstance().removeReadAccessListener();
          TypeChecker.getInstance().removeTypesReadListener(typesReadListener);
          NodeReadEventsCaster.removeNodesReadListener();
        }
      }
      if (incrementalMode) {
        synchronized (ACCESS_LOCK) {
          nodesReadListener.setAccessReport(true);
          addDependentNodes(node, rule.o1, new THashSet<SNode>(nodesReadListener.getAccessedNodes()));
          addDependentProperties(node, rule.o1, new THashSet<Pair<SNode, String>>(nodesReadListener.myAccessedProperties));
          nodesReadListener.setAccessReport(false);

          languageCachesReadListener.setAccessReport(true);
          if (languageCachesReadListener.myIsCacheAccessed) {
            addCacheDependentNodesNonTypesystem(node, rule.o1);
          }
          languageCachesReadListener.setAccessReport(false);

          typesReadListener.setAccessReport(true);
          addDependentTypeTerms(node, rule.o1, new THashSet<SNode>(typesReadListener.myAccessedNodes));
          typesReadListener.setAccessReport(false);
        }
        nodesReadListener.clear();
      }
      myCheckedNodes.add(nodeAndRule);
    }
    myCurrentCheckedNode = oldCheckedNode;
  }

  private class MyTypesReadListener implements TypesReadListener {
    private Set<SNode> myAccessedNodes = new THashSet<SNode>(1);
    private boolean myIsSetAccessReport = false;

    public void setAccessReport(boolean accessReport) {
      myIsSetAccessReport = accessReport;
    }

    private void reportAccess() {
      if (myIsSetAccessReport) {
        new Throwable().printStackTrace();
      }
    }

    public void nodeTypeAccessed(SNode term) {
      synchronized (ACCESS_LOCK) {
        reportAccess();
        myAccessedNodes.add(term);
      }
    }
  }
}
