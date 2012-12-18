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
package jetbrains.mps.smodel.action;

import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;

/**
 * Igor Alshannikov
 * Jan 30, 2006
 */
public class NodeSubstituteActionWrapper implements INodeSubstituteAction {
  private INodeSubstituteAction mySubstituteAction;

  public NodeSubstituteActionWrapper(INodeSubstituteAction substituteAction) {
    mySubstituteAction = substituteAction;
  }

  public SNode getSourceNode() {
    return mySubstituteAction.getSourceNode();
  }

  public SNode getOutputConcept() {
    return mySubstituteAction.getOutputConcept();
  }

  public SNode getActionType(String pattern) {
    return mySubstituteAction.getActionType(pattern);
  }

  public Icon getIconFor(String pattern) {
    return mySubstituteAction.getIconFor(pattern);
  }

  public int getFontStyleFor(String pattern) {
    return mySubstituteAction.getFontStyleFor(pattern);
  }

  public String getMatchingText(String pattern) {
    return mySubstituteAction.getMatchingText(pattern);
  }

  public String getVisibleMatchingText(String pattern) {
    return mySubstituteAction.getVisibleMatchingText(pattern);
  }

  public String getDescriptionText(String pattern) {
    return mySubstituteAction.getDescriptionText(pattern);
  }

  public boolean canSubstituteStrictly(String pattern) {
    return mySubstituteAction.canSubstituteStrictly(pattern);
  }

  public boolean canSubstitute(String pattern) {
    return mySubstituteAction.canSubstitute(pattern);
  }

  public SNode substitute(@Nullable EditorContext context, String pattern) {
    return mySubstituteAction.substitute(context, pattern);
  }

  public int getSortPriority(String pattern) {
    return mySubstituteAction.getSortPriority(pattern);
  }

  public SNode getActionType(String pattern, EditorCell contextCell) {
    return mySubstituteAction.getActionType(pattern, contextCell);
  }

  public Object getParameterObject() {
    return mySubstituteAction.getParameterObject();
  }
}
