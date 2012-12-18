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

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.action.INodeSubstituteAction;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteInfo;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.typesystem.inference.InequalitySystem;

import java.util.ArrayList;
import java.util.List;


public class NullSubstituteInfo implements NodeSubstituteInfo {
  public List<INodeSubstituteAction> getMatchingActions(String pattern, boolean strictMatching) {
    return new ArrayList<INodeSubstituteAction>();
  }

  public List<INodeSubstituteAction> getSmartMatchingActions(String pattern, boolean strictMatching, EditorCell contextCell) {
    return new ArrayList<INodeSubstituteAction>();
  }

  public void invalidateActions() {

  }

  public void setOriginalNode(SNode node) {

  }

  public SNode getOriginalNode() {
    return null;
  }

  public void setOriginalText(String text) {

  }

  public String getOriginalText() {
    return null;
  }


  public boolean hasExactlyNActions(String pattern, boolean strictMatching, int n) {
    if (n == 0) return true;
    return false;
  }

  public boolean hasNoActionsWithPrefix(String pattern) {
    return true;
  }

  public InequalitySystem getInequalitiesSystem(EditorCell contextCell) {
    return null;
  }
}
