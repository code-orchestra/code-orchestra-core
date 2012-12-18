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
package jetbrains.mps.nodeEditor.cellMenu;

import com.intellij.openapi.util.Computable;
import codeOrchestra.actionScript.typeSystem.TypeUtils;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.action.INodeSubstituteAction;
import jetbrains.mps.typesystem.inference.InequalitySystem;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.util.Pair;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.*;

/**
 * Author: Sergey Dmitriev.
 * Time: Oct 29, 2003 2:17:38 PM
 */
public abstract class AbstractNodeSubstituteInfo implements NodeSubstituteInfo {
  private List<INodeSubstituteAction> myCachedActionList;
  private Map<String, List<INodeSubstituteAction>> myPatternsToActionListsCache = new HashMap<String, List<INodeSubstituteAction>>();
  private Map<String, List<INodeSubstituteAction>> myStrictPatternsToActionListsCache = new HashMap<String, List<INodeSubstituteAction>>();
  private SNode myOriginalNode;
  private String myOriginalText;
  private EditorContext myEditorContext;

  public AbstractNodeSubstituteInfo(EditorContext editorContext) {
    myEditorContext = editorContext;
  }

  public EditorContext getEditorContext() {
    return myEditorContext;
  }

  public IOperationContext getOperationContext() {
    return myEditorContext.getOperationContext();
  }

  public void setOriginalNode(SNode node) {
    myOriginalNode = node;
  }

  public SNode getOriginalNode() {
    return myOriginalNode;
  }

  public void setOriginalText(String text) {
    myOriginalText = text;
  }

  public String getOriginalText() {
    return myOriginalText;
  }

  protected abstract List<INodeSubstituteAction> createActions();

  public void invalidateActions() {
    myCachedActionList = null;
    myPatternsToActionListsCache.clear();
    myStrictPatternsToActionListsCache.clear();
  }

  public boolean hasNoActionsWithPrefix(String pattern) {
    return getMatchingActions(pattern, false).isEmpty();
  }

  public boolean hasExactlyNActions(final String pattern, final boolean strictMatching, final int n) {
    return ModelAccess.instance().runReadAction(new Computable<Boolean>() {
      public Boolean compute() {
        Pair<String, List<INodeSubstituteAction>> pair = getPatternAndActions(pattern, strictMatching);
        List<INodeSubstituteAction> result = pair.o2;

        int count = 0;
        for (INodeSubstituteAction action : result) {
          if (strictMatching) {
            if (action.canSubstituteStrictly(pattern)) {
              count++;
            }
          } else {
            if (action.canSubstitute(pattern)) {
              count++;
            }
          }

          if (count > n) return false;
        }

        return n == count;
      }
    });
  }

  public InequalitySystem getInequalitiesSystem(EditorCell contextCell) {
    return null;
  }

  @CodeOrchestraPatch
  public List<INodeSubstituteAction> getSmartMatchingActions(String pattern, boolean strictMatching, EditorCell contextCell) {
    InequalitySystem inequalitiesSystem = getInequalitiesSystem(contextCell);

    List<INodeSubstituteAction> substituteActionList = getMatchingActions(pattern, strictMatching);
    if (inequalitiesSystem == null) return substituteActionList;

    List<INodeSubstituteAction> result = new ArrayList<INodeSubstituteAction>();
    TypeChecker.getInstance().enableTypesComputingForCompletion();
    for (INodeSubstituteAction nodeSubstituteAction : substituteActionList) {
      SNode type = nodeSubstituteAction.getActionType(pattern, contextCell);

      // RE-4637
      if (type != null && !TypeUtils.isATypeToHideFromSmartComplete(type) && inequalitiesSystem.satisfies(type)) {
        result.add(nodeSubstituteAction);
      }
    }
    TypeChecker.getInstance().clearTypesComputedForCompletion();
    return result;
  }

  public List<INodeSubstituteAction> getMatchingActions(final String pattern, final boolean strictMatching) {
    return ModelAccess.instance().runReadAction(new Computable<List<INodeSubstituteAction>>() {
      public List<INodeSubstituteAction> compute() {
        Pair<String, List<INodeSubstituteAction>> pair = getPatternAndActions(pattern, strictMatching);

        List<INodeSubstituteAction> result = new ArrayList<INodeSubstituteAction>();
        for (INodeSubstituteAction item : pair.o2) {
          if (strictMatching) {
            if (item.canSubstituteStrictly(pattern)) {
              result.add(item);
            }
          } else {
            if (item.canSubstitute(pattern)) {
              result.add(item);
            }
          }
        }

        if (strictMatching) {
          myStrictPatternsToActionListsCache.put(pattern, new ArrayList<INodeSubstituteAction>(result));
        } else {
          myPatternsToActionListsCache.put(pattern, new ArrayList<INodeSubstituteAction>(result));
        }

        return (List)result;
      }
    });
  }

  private List<INodeSubstituteAction> getActions() {
    if (myCachedActionList == null) {
      ModelAccess.instance().runReadAction(new Runnable() {
        public void run() {
          myCachedActionList = (List) createActions();
        }
      });
    }
    return Collections.unmodifiableList(myCachedActionList);
  }

  private Pair<String, List<INodeSubstituteAction>> getPatternAndActions(String pattern, boolean strictMatching) {
    String smallPattern = pattern;
    List<INodeSubstituteAction> result = null;
    if (!strictMatching) {
      if (smallPattern != null) {
        while (smallPattern.length() > 0) {
          if (myPatternsToActionListsCache.containsKey(smallPattern)) {
            result = new ArrayList<INodeSubstituteAction>();
            result.addAll(myPatternsToActionListsCache.get(smallPattern));
            break;
          } else {
            smallPattern = smallPattern.substring(0, smallPattern.length() - 1);
          }
        }
      }
    } else {
      if (myStrictPatternsToActionListsCache.containsKey(smallPattern)) {
        result = new ArrayList<INodeSubstituteAction>();
        result.addAll(myStrictPatternsToActionListsCache.get(smallPattern));
      } else if (myPatternsToActionListsCache.containsKey(smallPattern)) {
        result = new ArrayList<INodeSubstituteAction>();
        result.addAll(myPatternsToActionListsCache.get(smallPattern));
      }
    }
    if (result == null) {
      result = new ArrayList<INodeSubstituteAction>(getActions());
    }
    return new Pair<String, List<INodeSubstituteAction>>(smallPattern, result);
  }
}