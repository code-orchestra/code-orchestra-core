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

import gnu.trove.THashSet;
import jetbrains.mps.lang.pattern.util.IMatchModifier;
import jetbrains.mps.lang.pattern.util.MatchingUtil;
import jetbrains.mps.lang.typesystem.runtime.HUtil;
import jetbrains.mps.newTypesystem.state.Equations;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.EquationInfo;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.typesystemEngine.util.LatticeUtil;
import jetbrains.mps.util.Pair;
import org.jetbrains.annotations.Nullable;

import java.util.LinkedList;
import java.util.List;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: Sep 24, 2010
 * Time: 12:42:45 PM
 */
public class TypesUtil {

  public static boolean isVariable(SNode node) {
    return HUtil.isRuntimeTypeVariable(node);
  }

  public static boolean canBeVariable(SNode node) {
    return isVariable(node) || LatticeUtil.isMeet(node) && hasVariablesInside(node);
  }

  public static boolean hasVariablesInside(SNode node) {
    if (isVariable(node)) {
      return true;
    }
    for (SNode child : node.getChildren()) {
      if (hasVariablesInside(child)) {
        return true;
      }
    }
    for (SNode referent : node.getReferents()) {
      if (referent != null && HUtil.isRuntimeTypeVariable(referent)) {
        return true;
      }
    }
    return false;
  }

  public static int depth(SNode sNode) {
    int childDepth = 0;
    for (SNode child : sNode.getChildrenIterable()) {
      int depth = depth(child);
      if (childDepth < depth) {
        childDepth = depth;
      }
    }
    if (sNode.getReference("concept") != null) {
      childDepth++;
    }
    return childDepth + 1;
  }


  public static List<SNode> getVariables(SNode node, State state) {
    List<SNode> result = new LinkedList<SNode>();
    getVariablesInside(node, result, state);
    return result;
  }

  private static void getVariablesInside(SNode node, List<SNode> result, State state) {
    if (node == null) {
      return;
    }
    if (state != null) {
      node = state.getRepresentative(node);
    }
    if (isVariable(node)) {
      result.add(node);
      return;
    }
    for (SNode child : node.getChildren()) {
      getVariablesInside(child, result, state);
    }
    for (SNode referent : node.getReferents()) {
      if (state!= null) {
        referent = state.getRepresentative(referent);
      }
      if (referent != null && isVariable(referent)) {
        result.add(referent);
      }
    }
  }

  public static boolean match(SNode left, SNode right) {
    return match(left, right, null, null);
  }

  public static boolean match(SNode left, SNode right, Equations equations, @Nullable EquationInfo info) {
    if (left == right) {
      return true;
    }
    if (left == null || right == null) {
      return false;
    }
    if (TypesUtil.isVariable(left) || TypesUtil.isVariable(right)) {
      if (equations != null) {
        equations.addEquation(left, right, info);
      }
      return true;
    }
    TypeMatchModifier typeMatchModifier = new TypeMatchModifier();
    boolean result = MatchingUtil.matchNodes(left, right, typeMatchModifier, false);
    if (result) {
      if (equations != null) {
        equations.addEquations(typeMatchModifier.getChildEqs(), info);
      }
    }
    return result;
  }

  private static class TypeMatchModifier implements IMatchModifier {
    final Set<Pair<SNode, SNode>> childEQs = new THashSet<Pair<SNode, SNode>>();

    public boolean accept(SNode node1, SNode node2) {
      return HUtil.isRuntimeTypeVariable(node1) || HUtil.isRuntimeTypeVariable(node2);
    }

    public boolean acceptList(List<SNode> nodes1, List<SNode> nodes2) {
      return false;
    }

    public void performAction(SNode node1, SNode node2) {
      childEQs.add(new Pair<SNode, SNode>(node1, node2));
    }

    public void performGroupAction(List<SNode> nodes1, List<SNode> nodes2) {
    }

    public Set<Pair<SNode, SNode>> getChildEqs() {
      return childEQs;
    }

    public void clear() {
      childEQs.clear();
    }
  }

  public static SNode createRuntimeErrorType() {
    return SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.RuntimeErrorType",
      TypeChecker.getInstance().getRuntimeTypesModel(), GlobalScope.getInstance(), false);
  }

}

