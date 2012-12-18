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
import jetbrains.mps.errors.SimpleErrorReporter;
import jetbrains.mps.lang.typesystem.runtime.ICheckingRule_Runtime;
import jetbrains.mps.lang.typesystem.runtime.IsApplicableStatus;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.event.*;
import jetbrains.mps.typesystem.inference.*;
import jetbrains.mps.util.Pair;
import org.jetbrains.annotations.NotNull;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class NodeTypesComponent {
  private SNode myRootNode;

  private List<SModelEvent> myEvents = new ArrayList<SModelEvent>();

  private MyTypeRecalculatedListener myTypeRecalculatedListener = new MyTypeRecalculatedListener();

  private MyModelListener myModelListener = new MyModelListener();
  private MyModelListenerManager myModelListenerManager = new MyModelListenerManager(myModelListener);

  private NonTypeSystemComponent myNonTypeSystemComponent;
  private TypeSystemComponent myTypeSystemComponent;
  private boolean myIsSpecial = false;

  private static final Logger LOG = Logger.getLogger(NodeTypesComponent.class);

  private boolean myIsNonTypeSystemCheckingInProgress = false;
  private TypeCheckingContext myTypeCheckingContext;

  public NodeTypesComponent(SNode rootNode, TypeChecker typeChecker, TypeCheckingContextNew typeCheckingContext) {
    myRootNode = rootNode;
    myTypeCheckingContext = typeCheckingContext;
    myTypeSystemComponent = new TypeSystemComponent(typeChecker, typeCheckingContext.getState(), this);
    myNonTypeSystemComponent = new NonTypeSystemComponent(typeChecker, this);
    myModelListenerManager.track(myRootNode);
  }

  public TypeCheckingContext getTypeCheckingContext() {
    return myTypeCheckingContext;
  }

  public void clear() {

    clearNodesTypes();
    myNonTypeSystemComponent.clear();
    myTypeSystemComponent.clear();
  }

  public SNode getNode() {
    return myRootNode;
  }

  public MyModelListenerManager getModelListenerManager() {
    return myModelListenerManager;
  }

  public MyTypeRecalculatedListener getTypeRecalculatedListener() {
    return myTypeRecalculatedListener;
  }

  private void clearNodesTypes() {
    myTypeSystemComponent.clearNodeTypes();
    myNonTypeSystemComponent.clearNodeTypes();
  }

  public void putError(SNode node, IErrorReporter reporter) {
    if (myIsSpecial) return;
    if (!ErrorReportUtil.shouldReportError(node)) return;
    if (myIsNonTypeSystemCheckingInProgress) {
      myNonTypeSystemComponent.putError(node, reporter);
    } else {
      myTypeSystemComponent.addError(node, reporter);
    }
  }

  public void reportTypeError(SNode nodeWithError, String errorString, String ruleModel, String ruleId) {
    if (nodeWithError != null) {
      SimpleErrorReporter errorReporter = new SimpleErrorReporter(nodeWithError, errorString, ruleModel, ruleId);
      putError(nodeWithError, errorReporter);
    }
  }

  public void reportTypeError(SNode nodeWithError, IErrorReporter errorReporter) {
    if (nodeWithError != null) {
      putError(nodeWithError, errorReporter);
    }
  }

  public SNode computeTypesForNodeDuringGeneration(SNode initialNode) {
    return computeTypesForNode_special(initialNode, new ArrayList<SNode>(0));
  }

  public SNode computeTypesForNodeDuringResolving(SNode initialNode) {
    return computeTypesForNode_special(initialNode, new ArrayList<SNode>(0));
  }

  public SNode computeTypesForNodeInferenceMode(SNode initialNode) {
    return computeTypesForNode_special(initialNode, new ArrayList<SNode>(0));
  }

  private SNode computeTypesForNode_special(SNode initialNode, List<SNode> givenAdditionalNodes) {
    myIsSpecial = true;
    SNode result = myTypeSystemComponent.computeTypesForNode_special(initialNode, givenAdditionalNodes);
    myIsSpecial = false;
    return result;
  }

  public void setNonTypeSystemCheckingInProgress(boolean inProgress) {
    myIsNonTypeSystemCheckingInProgress = inProgress;
  }

  public void applyRuleToNode(SNode node, ICheckingRule_Runtime rule, IsApplicableStatus status) {
    try {
      rule.applyRule(node, getTypeCheckingContext(), status);
    } catch (Throwable t) {
      LOG.error("an error occurred while applying rule to node " + node, t, node);
    }
  }

  public void dispose() {
    myModelListenerManager.dispose();
    TypeChecker.getInstance().removeTypeRecalculatedListener(myTypeRecalculatedListener);
    myTypeSystemComponent.dispose();
    myNonTypeSystemComponent.dispose();
  }

  public Map<SNode, SNode> getMainContext() {
    return null;
  }

  public InequalitySystem computeInequalitiesForHole(SNode hole, boolean holeIsAType) {
     List<SNode> additionalNodes = new ArrayList<SNode>();
     additionalNodes.add(hole);
     State state = myTypeCheckingContext.getState();
     if (state == null) return null;
     try {
       state.initHole(hole);
       computeTypesForNode_special(hole.getParent(), additionalNodes);
       state.getInequalitySystem().expandAll(state.getEquations());
      /* for (String s : state.getInequalitySystem().getPresentation()) {
         System.out.println(s);
       } */
       return state.getInequalitySystem();
     } finally {
       state.disposeHole();
     }
   }

  public void computeTypes(boolean refreshTypes) {
    myTypeSystemComponent.computeTypes(refreshTypes);
  }

  public void setCheckedNonTypesystem() {
    myNonTypeSystemComponent.setChecked();
  }

  public void typeOfNodeCalled(SNode node) {
    myTypeSystemComponent.typeOfNodeCalled(node);
  }

  public void addDependencyOnCurrent(SNode node, boolean typeAffected) {
    myTypeSystemComponent.addDependencyOnCurrent(node, typeAffected);
  }

  public void addDependencyForCurrent(SNode node) {
    SNode current = null;
    if (myIsNonTypeSystemCheckingInProgress) {
      current = myNonTypeSystemComponent.getCurrentCheckedNode();
    }
    myTypeSystemComponent.addDependencyForCurrent(node, current);
  }

  public void addDependencyOnCurrent(SNode node) {
    myTypeSystemComponent.addDependencyOnCurrent(node);
  }

  protected boolean applyRulesToNode(SNode node) {
    return myTypeSystemComponent.applyRulesToNode(node);
  }

  public void applyNonTypesystemRulesToRoot(IOperationContext context) {
    myNonTypeSystemComponent.applyNonTypeSystemRulesToRoot(context);
  }

  public void addNodeToFrontier(SNode node) {
    myTypeSystemComponent.addNodeToFrontier(node);
  }

  public SNode getType(SNode node) {
    return myTypeSystemComponent.getType(node);
  }

  public void markUnchecked(SNode node) {
    myTypeSystemComponent.markUnchecked(node);
  }

  public SNode getRawTypeFromContext(SNode node) {
    return myTypeSystemComponent.getRawTypeFromContext(node);
  }

  @NotNull
  public List<IErrorReporter> getErrors(SNode node) {
    Map<SNode, List<IErrorReporter>> nodesToErrorsMap = myTypeSystemComponent.getNodesToErrorsMap();
    Map<SNode, List<IErrorReporter>> nodesToErrorsMapNT = myNonTypeSystemComponent.getNodesToErrorsMap();

    List<IErrorReporter> result = new ArrayList<IErrorReporter>(4);
    List<IErrorReporter> iErrorReporters = nodesToErrorsMap.get(node);
    if (iErrorReporters != null) {
      result.addAll(iErrorReporters);
    }
    iErrorReporters = nodesToErrorsMapNT.get(node);
    if (iErrorReporters != null) {
      result.addAll(iErrorReporters);
    }
    return result;
  }

  public SNode[] getVariables(String varName) {
    return new SNode[0];
  }

  public void registerTypeVariable(SNode variable) {

  }

  //--------------------------------------------------
  public Set<Pair<SNode, List<IErrorReporter>>> getNodesWithErrors() {
    Map<SNode, List<IErrorReporter>> nodesToErrorsMap = myTypeSystemComponent.getNodesToErrorsMap();
    Map<SNode, List<IErrorReporter>> nodesToErrorsMapNT = myNonTypeSystemComponent.getNodesToErrorsMap();
    Set<Pair<SNode, List<IErrorReporter>>> result = new THashSet<Pair<SNode, List<IErrorReporter>>>(1);
    Set<SNode> keySet = new THashSet<SNode>(nodesToErrorsMap.keySet());
    keySet.addAll(nodesToErrorsMapNT.keySet());
    for (SNode key : keySet) {
      List<IErrorReporter> reporters = getErrors(key);
      if (!reporters.isEmpty()) {
        if (key.getContainingRoot() == null) {
        /*  LOG.warning("Type system reports error for node without containing root. Node: " + key);
          for (IErrorReporter reporter : reporters) {
            LOG.warning("This error was reported from: model: " + reporter.getRuleModel() + " id: " + reporter.getRuleId());
          }     */
          continue;
        }
        result.add(new Pair<SNode, List<IErrorReporter>>(key, reporters));
      }
    }
    return result;
  }



  public void markNodeAsAffectedByRule(SNode node, String ruleModel, String ruleId) {
    myTypeSystemComponent.markNodeAsAffectedByRule(node, ruleModel, ruleId);
  }

  public Set<Pair<String, String>> getRulesWhichAffectNodeType(SNode node) {
    return myTypeSystemComponent.getRulesWhichAffectNodeType(node);
  }

  public boolean isCheckedNonTypesystem() {
    return myNonTypeSystemComponent.isChecked();
  }

  public void setCheckedTypesystem() {
    myTypeSystemComponent.setChecked();
  }

  public boolean isChecked(boolean considerNonTypeSystemRules) {
    processPendingEvents();
    boolean typesChecked = myTypeSystemComponent.isChecked();
    if (considerNonTypeSystemRules) {
      return typesChecked && myNonTypeSystemComponent.isChecked();
    } else {
      return typesChecked;
    }
  }

  public boolean isSpecial() {
    return myIsSpecial;
  }

  private void processPendingEvents() {
    for (SModelEvent event : myEvents) {
      event.accept(new MySModelEventVisitorAdapter());
    }
    myEvents.clear();
  }

  public void track(SNode node) {
    myModelListenerManager.track(node);
  }

  private class MyModelListener extends SModelAdapter {
    public void eventFired(SModelEvent event) {
      myEvents.add(event);
    }
  }

  private class MySModelEventVisitorAdapter extends SModelEventVisitorAdapter {
    public void visitChildEvent(SModelChildEvent event) {
      markDependentNodesForInvalidation(event.getChild(), myTypeSystemComponent);
      markDependentNodesForInvalidation(event.getParent(), myTypeSystemComponent);

      markDependentNodesForInvalidation(event.getChild(), myNonTypeSystemComponent);
      markDependentNodesForInvalidation(event.getParent(), myNonTypeSystemComponent);

      List<SReference> references = new ArrayList<SReference>();
      SNode child = event.getChild();
      references.addAll(child.getReferences());
      for (SNode descendant : child.getDescendants()) {
        references.addAll(descendant.getReferences());
        if (event.isRemoved()) {
          //invalidate nodes which are removed
          markDependentNodesForInvalidation(descendant, myNonTypeSystemComponent);
          markDependentNodesForInvalidation(descendant, myTypeSystemComponent);
        }
      }
      for (SReference reference : references) {
        SNode targetNode = reference.getTargetNodeSilently();
        if (targetNode != null) {
          markDependentNodesForInvalidation(targetNode, myNonTypeSystemComponent);
        }
      }
    }

    public void visitReferenceEvent(SModelReferenceEvent event) {
      markDependentNodesForInvalidation(event.getReference().getSourceNode(), myTypeSystemComponent);
      markDependentNodesForInvalidation(event.getReference().getSourceNode(), myNonTypeSystemComponent);
      if (!event.isAdded()) return;
      markDependentNodesForInvalidation(event.getReference().getTargetNodeSilently(), myNonTypeSystemComponent);
    }

    public void visitPropertyEvent(SModelPropertyEvent event) {
      markDependentOnPropertyNodesForInvalidation(event.getNode(), event.getPropertyName());
    }

    private void markDependentNodesForInvalidation(SNode eventNode, CheckingComponent component) {
      component.addNodeToInvalidate(eventNode);
    }

    private void markDependentOnPropertyNodesForInvalidation(SNode eventNode, String propertyName) {
      myNonTypeSystemComponent.addPropertyToInvalidate(eventNode, propertyName);
      myTypeSystemComponent.addNodeToInvalidate(eventNode);
    }
  }

  private class MyTypeRecalculatedListener implements TypeRecalculatedListener {
    MyTypeRecalculatedListener() {
    }

    public void typeWillBeRecalculatedForTerm(SNode term) {
      myNonTypeSystemComponent.typeWillBeRecalculatedForTerm(term);
    }
  }

  class MyModelListenerManager {
    private ReferenceQueue<SNode> myReferenceQueue = new ReferenceQueue<SNode>();
    private Map<SModelDescriptor, Integer> myNodesCount = new THashMap<SModelDescriptor, Integer>();
    private Map<WeakReference, SModelDescriptor> myDescriptors = new THashMap<WeakReference, SModelDescriptor>();
    private SModelListener myListener;

    MyModelListenerManager(SModelListener listener) {
      myListener = listener;
    }

    /**
     * Warning: this method should be called only once for each node
     * We do not check for duplicated nodes
     */
    void track(SNode node) {
      SModelDescriptor sm = node.getModel().getModelDescriptor();

      if (sm == null) return;

      if (!myNodesCount.containsKey(sm)) {
        sm.addModelListener(myListener);
        myNodesCount.put(sm, 1);
      } else {
        Integer oldValue = myNodesCount.get(sm);
        myNodesCount.put(sm, oldValue + 1);
      }

      WeakReference<SNode> ref = new WeakReference<SNode>(node, myReferenceQueue);
      myDescriptors.put(ref, sm);
    }


    void updateGCedNodes() {
      while (true) {
        WeakReference<SNode> ref = (WeakReference<SNode>) myReferenceQueue.poll();
        if (ref == null) return;

        SModelDescriptor sm = myDescriptors.get(ref);
        Integer count = myNodesCount.get(sm);
        if (count == 1) {
          sm.removeModelListener(myListener);
          myNodesCount.remove(sm);
        } else {
          myNodesCount.put(sm, count - 1);
        }

        myDescriptors.remove(ref);
      }
    }

    void dispose() {
      for (SModelDescriptor sm : myNodesCount.keySet()) {
        sm.removeModelListener(myListener);
      }
    }
  }
}

