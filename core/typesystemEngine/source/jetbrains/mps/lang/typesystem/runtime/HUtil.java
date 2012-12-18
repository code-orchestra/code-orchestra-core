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
package jetbrains.mps.lang.typesystem.runtime;

import gnu.trove.THashMap;
import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.lang.pattern.ConceptMatchingPattern;
import jetbrains.mps.lang.pattern.IMatchingPattern;
import jetbrains.mps.smodel.BaseAdapter;
import jetbrains.mps.smodel.CopyUtil;
import jetbrains.mps.smodel.INodeAdapter;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.EquationInfo;
import jetbrains.mps.typesystem.inference.TypeCheckingContext;
import jetbrains.mps.util.Pair;

import java.util.List;

public class HUtil {

  //todo: this method can be called from inference rules - by calling behavior methods,
  // todo: in which there are no typechecking context(
  public static SNode copyIfNecessary(SNode node) {
    if (node != null && (node.getParent() != null || node.isRoot())) {
      // this copies all the atributes, because can be used in migration scripts
      SNode copy = CopyUtil.copy(node, new THashMap<SNode, SNode>(1), true);
      return copy;
    } else {
      return node;
    }
  }

  public static <T extends INodeAdapter> T copyIfNecessary(T adapter) {
    if (adapter == null) return adapter;
    SNode node = adapter.getNode();
    return (T) BaseAdapter.fromNode(copyIfNecessary(node));
  }

  public static SNode copyIfNecessary(SNode node, TypeCheckingContext typeCheckingContext) {
    if (node != null && (node.getParent() != null || node.isRoot())) {

      // this method is used only when quotations create a type
      // so it should not copy attributes, for instance generator macros of a certain type
      SNode copy = CopyUtil.copy(node, new THashMap<SNode, SNode>(1), false);

      if (typeCheckingContext != null) {
        if (isRuntimeTypeVariable(copy)) {
          typeCheckingContext.registerTypeVariable(copy);
        }
      }
      return copy;
    } else {
      return node;
    }
  }

  public static IMatchingPattern createMatchingPatternByConceptFQName(final String conceptFQName) {
    return new ConceptMatchingPattern(conceptFQName);
  }

  public static boolean isRuntimeTypeVariable(SNode node) {
    if (node == null) return false;
    String conceptFqName = node.getConceptFqName();
    return "jetbrains.mps.lang.typesystem.structure.RuntimeTypeVariable".equals(conceptFqName);
  }

  public static boolean isRuntimeListVariable(SNode node) {
    if (node == null) return false;
    String conceptFqName = node.getConceptFqName();
    return "jetbrains.mps.lang.typesystem.structure.RuntimeListVariable".equals(conceptFqName);
  }

  public static boolean hasVariablesInside(SNode node) {
    if (isRuntimeTypeVariable(node)) {
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

  @Deprecated
  public static boolean isRuntimeErrorType(SNode node) {
    if (node == null) return false;
    String conceptFqName = node.getConceptFqName();
    return "jetbrains.mps.lang.typesystem.structure.RuntimeErrorType".equals(conceptFqName);
  }

  public static boolean isRuntimeHoleType(SNode node) {
    if (node == null) return false;
    String conceptFqName = node.getConceptFqName();
    return "jetbrains.mps.lang.typesystem.structure.RuntimeHoleType".equals(conceptFqName);
  }

  @Deprecated
  public static String getErrorText(SNode node) {
    if (isRuntimeErrorType(node)) {
      return node.getProperty("errorText");
    } else {
      return null;
    }
  }

  public static void addAdditionalRuleIdsFromInfo(IErrorReporter errorReporter, EquationInfo equationInfo) {
    List<Pair<String, String>> list = equationInfo.getAdditionalRulesIds();
    for (Pair<String, String> additionalIds : list) {
      errorReporter.addAdditionalRuleId(additionalIds.o1, additionalIds.o2);
    }
    errorReporter.addAdditionalRuleId(equationInfo.getRuleModel(), equationInfo.getRuleId());
  }

}
