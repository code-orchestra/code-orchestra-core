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
import jetbrains.mps.errors.SimpleErrorReporter;
import jetbrains.mps.newTypesystem.TypesUtil;
import jetbrains.mps.newTypesystem.operation.AddErrorOperation;
import jetbrains.mps.newTypesystem.operation.TraceWarningOperation;
import jetbrains.mps.newTypesystem.operation.equation.AddEquationOperation;
import jetbrains.mps.newTypesystem.operation.equation.SubstituteEquationOperation;
import jetbrains.mps.smodel.CopyUtil;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SReference;
import jetbrains.mps.typesystem.inference.EquationInfo;
import jetbrains.mps.typesystem.inference.IVariableConverter_Runtime;
import jetbrains.mps.util.Pair;

import java.util.*;
import java.util.Map.Entry;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbah
 * Date: Sep 10, 2010
 * Time: 4:33:42 PM
 */
public class Equations {
  @StateObject
  private final Map<SNode, SNode> myRepresentatives = new THashMap<SNode, SNode>();

  private final Map<String, SNode> myNamesToNodes = new HashMap<String, SNode>();
  private final State myState;

  public Equations(State state) {
    myState = state;
  }

  @StateMethod
  public void remove(SNode elem) {
    myState.assertIsInStateChangeAction();
    myRepresentatives.remove(getNameRepresentative(elem));
  }

  @StateMethod
  public void add(SNode child, SNode parent) {
    myState.assertIsInStateChangeAction();
    myRepresentatives.put(getNameRepresentative(child), getNameRepresentative(parent));
  }

  private SNode getNameRepresentative(SNode node) {
    if (!TypesUtil.isVariable(node)) {
      return node;
    }
    String name = node.getName();
    SNode result = myNamesToNodes.get(name);
    if (result == null) {
      myNamesToNodes.put(name, node);
      return node;
    }
    return result;
  }

  public SNode getRepresentative(final SNode node) {
    return getRepresentative(node,true);
  }

  private SNode getRepresentative(final SNode node, final boolean shortenPaths) {
    if (node == null || !TypesUtil.isVariable(node)) {
      return node;
    }
    SNode nameRepresentative = getNameRepresentative(node);
    SNode parent = myRepresentatives.get(nameRepresentative);
    SNode current = nameRepresentative;
    if (parent != null) {
      List<SNode> path = new LinkedList<SNode>();
      while (parent != null) {
        if (current != nameRepresentative) {
          path.add(current);
        }
        current = parent;
        parent = myRepresentatives.get(parent);
      }
      if (path.size() > 1 && shortenPaths) {
        for (SNode elem : path) {
          substituteRepresentative(elem, current);
        }
      }
    }
    assert getNameRepresentative(current) == current;
    return current;
  }

  private void substituteRepresentative(SNode elem, SNode current) {
    if (myRepresentatives.get(elem) == current) {
      return;
    }
    SNode source = myState.getNodeMaps().getNode(elem);
    myState.executeOperation(new SubstituteEquationOperation(elem, myRepresentatives.get(elem), current, source));
  }

  public boolean addEquation(SNode left, SNode right, EquationInfo info) {
    SNode lRepresentative = getRepresentative(left);
    SNode rRepresentative = getRepresentative(right);
    if (lRepresentative == null || rRepresentative == null) {
      myState.executeOperation(new TraceWarningOperation("Equation was not added: " + lRepresentative + " = " + rRepresentative, info));
      return false;
    }
    if (lRepresentative.equals(rRepresentative)) {
      return true;
    }
    if (TypesUtil.isVariable(lRepresentative)) {
      return processEquation(lRepresentative, rRepresentative, info);
    }
    if (TypesUtil.isVariable(rRepresentative)) {
      return processEquation(rRepresentative, lRepresentative, info);
    }
    if (!compareTypes(lRepresentative, rRepresentative, info)) {
      myState.getNodeMaps().reportEquationBroken(info, lRepresentative, rRepresentative);
    }
    return true;
  }

  private boolean compareTypes(SNode left, SNode right, EquationInfo info) {
    if (left == right) {
      return true;
    }
    if (left == null || right == null) {
      return false;
    }
    return TypesUtil.match(left, right, this, info);
  }

  private boolean processEquation(SNode var, SNode type, EquationInfo info) {
    SNode source = myState.getNodeMaps().getNode(var);
    for (SNode innerVar : TypesUtil.getVariables(type, myState)) {
      if (getRepresentative(innerVar, false).equals(var)){
        reportRecursiveType(source, info);
        return false;
      }
    }
    myState.executeOperation(new AddEquationOperation(var, type, source, info));

    return true;
  }

  public SNode expandNode(final SNode node, boolean finalExpansion) {
    return expandNode(node, new THashSet<SNode>(), finalExpansion, true);
  }

  private SNode expandNode(final SNode node, Set<SNode> variablesMet, boolean finalExpansion, boolean copy) {
    if (node == null) {
      return null;
    }
    SNode type = getRepresentative(node);
    if (type != node) {
      SNode result = expandNode(type, variablesMet, finalExpansion, copy);
      variablesMet.remove(type);
      return result;
    } else {
      SNode result = copy ? CopyUtil.copy(node) : node;
      replaceChildren(result, variablesMet, finalExpansion, copy);
      replaceReferences(result, variablesMet, finalExpansion);
      return result;
    }
  }

  private void replaceChildren(SNode node, Set<SNode> variablesMet, boolean finalExpansion, boolean copy) {
    Map<SNode, SNode> childrenReplacement = new THashMap<SNode, SNode>();
    for (SNode child : node.getChildren()) {
      SNode newChild = expandNode(child, variablesMet, finalExpansion, copy);
      if (newChild != child) {
        childrenReplacement.put(child, newChild);
      }
    }
    for (SNode child : childrenReplacement.keySet()) {
      SNode parent = child.getParent();
      assert parent != null;
      SNode childReplacement = CopyUtil.copy(childrenReplacement.get(child));
      parent.replaceChild(child, childReplacement);
    }
  }

  private void replaceReferences(SNode node, Set<SNode> variablesMet, boolean finalExpansion) {
    List<SReference> references = new ArrayList<SReference>(node.getReferences());
    for (SReference reference : references) {
      SNode oldNode = reference.getTargetNode();
      if (TypesUtil.isVariable(oldNode)) {
        SNode newNode = expandNode(oldNode, variablesMet, finalExpansion, false);
        if (finalExpansion && TypesUtil.isVariable(newNode)) {
          newNode = convertReferentVariable(node, reference.getRole(), newNode);
        }
        if (newNode != oldNode) {
          String role = reference.getRole();
          node.removeReference(reference);
          node.setReferent(role, newNode);
        }
      }
    }
  }

  private SNode convertReferentVariable(SNode sourceNode, String role, SNode variable) {
    IVariableConverter_Runtime converter = myState.getTypeCheckingContext().getTypeChecker().getRulesManager().getVariableConverter(sourceNode, role, variable, false);
    if (converter == null) return variable;
    return converter.convert(sourceNode, role, variable, false);
  }

  void reportRecursiveType(SNode node, EquationInfo info) {  //todo
    SimpleErrorReporter errorReporter = new SimpleErrorReporter(node, "Recursive types not allowed",
                info == null? null:info.getRuleModel(), info == null? null:info.getRuleId());
    myState.getTypeCheckingContext().reportMessage(node, errorReporter);
  }

  public void addEquations(Set<Pair<SNode, SNode>> childEqs, EquationInfo errorInfo) {
    for (Pair<SNode, SNode> eq : childEqs) {
      addEquation(eq.o2, eq.o1, errorInfo);
    }
  }

  public void clear() {
    myRepresentatives.clear();
    myNamesToNodes.clear();
  }

  public Set<Entry<SNode, Set<SNode>>> getEquationGroups() {
    Set<SNode> all = new THashSet<SNode>();
    List<String> result = new LinkedList<String>();
    Map<SNode, Set<SNode>> map = new THashMap<SNode, Set<SNode>>();
    all.addAll(myRepresentatives.keySet());
    for (SNode node : all) {
      SNode representative = getRepresentative(node);
      Set<SNode> value = map.get(representative);
      if (value == null) {
        value = new THashSet<SNode>();
        map.put(representative, value);
      }
      if (node != representative) {
        value.add(node);
      }
    }
    return map.entrySet();
  }

  public Map<SNode, SNode> getRepresentatives() {
    return Collections.unmodifiableMap(myRepresentatives);
  }

}
