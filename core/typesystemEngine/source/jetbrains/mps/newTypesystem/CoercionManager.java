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
import jetbrains.mps.lang.pattern.IMatchingPattern;
import jetbrains.mps.newTypesystem.state.State;
import jetbrains.mps.smodel.NodeReadAccessCasterInEditor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.typesystem.inference.util.SubtypingCache;
import jetbrains.mps.util.Pair;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Ilya.Lintsbakh
 * Date: Dec 13, 2010
 * Time: 1:43:09 PM
 */
public class CoercionManager {
  private TypeChecker myTypeChecker;
  private SubTypingManagerNew mySubTyping;

  public CoercionManager(TypeChecker typeChecker, SubTypingManagerNew subTyping) {
    myTypeChecker = typeChecker;
    mySubTyping = subTyping;
  }


  public SNode coerceSubTypingNew(final SNode subtype, final IMatchingPattern pattern, final boolean isWeak, final State state) {
    if (subtype == null) return null;
    if (pattern.match(subtype)) return subtype;
    if ("jetbrains.mps.lang.typesystem.structure.MeetType".equals(subtype.getConceptFqName())) {
      List<SNode> children = subtype.getChildren("argument");
      for (SNode child : children) {
        SNode result = coerceSubTypingNew(child, pattern, isWeak, state);
        if (result != null) return result;
      }
      return null;
    }
    final TypeCheckingContextNew typeCheckingContext = state == null ? null : state.getTypeCheckingContext();
    if ("jetbrains.mps.lang.typesystem.structure.JoinType".equals(subtype.getConceptFqName())) {
      List<SNode> children = subtype.getChildren("argument");

      SNode lcs = mySubTyping.createLCS(children, typeCheckingContext);
      return coerceSubTypingNew(lcs, pattern, isWeak, state);
    }

    //asking the cache
    return NodeReadAccessCasterInEditor.runReadTransparentAction(new Computable<SNode>() {
      public SNode compute() {

        SubtypingCache cache = myTypeChecker.getSubtypingCache();
        if (cache != null) {
          Pair<Boolean, SNode> nodePair = cache.getCoerced(subtype, pattern, isWeak);
          if (nodePair.o1) {
            return nodePair.o2;
          }
        }
        cache = myTypeChecker.getGlobalSubtypingCache();
        if (cache != null) {
          Pair<Boolean, SNode> nodePair = cache.getCoerced(subtype, pattern, isWeak);
          if (nodePair.o1) {
            return nodePair.o2;
          }
        }
        CoercionMatcher coercionMatcher = new CoercionMatcher(pattern);
        boolean success = mySubTyping.searchInSuperTypes(subtype, coercionMatcher, null, isWeak, null);
        SNode result;
        if (!success) {
          result = null;
        } else {
          result = coercionMatcher.getResult();
        }

        //writing to the cache
        SubtypingCache subtypingCache = myTypeChecker.getSubtypingCache();
        if (subtypingCache != null) {
          subtypingCache.addCacheEntry(subtype, pattern, result, isWeak);
        }
        subtypingCache = myTypeChecker.getGlobalSubtypingCache();
        if (subtypingCache != null) {
          subtypingCache.addCacheEntry(subtype, pattern, result, isWeak);
        }

        return result;
      }
    });
  }


  public SNode coerceSubTyping(SNode subtype, final IMatchingPattern pattern, State state) {
    return coerceSubTypingNew(subtype, pattern, true, state);
  }

  private static class CoercionMatcher implements INodeMatcher {
    private final IMatchingPattern myPattern;
    private SNode myResult;

    public CoercionMatcher(IMatchingPattern pattern) {
      myPattern = pattern;
    }

    public boolean matchesWith(SNode nodeToMatch) {
      boolean b = myPattern.match(nodeToMatch);
      if (b) {
        myResult = nodeToMatch;
      }
      return b;
    }

    public SNode getResult() {
      return myResult;
    }

    public IMatchingPattern getMatchingPattern() {
      return myPattern;
    }

    public String getConceptFQName() {
      return myPattern.getConceptFQName();
    }
  }

}
