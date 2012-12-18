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

public interface INodeSubstituteAction {
  SNode getSourceNode();

  SNode getOutputConcept();

  SNode getActionType(String pattern);

  SNode getActionType(String pattern, EditorCell contextCell);

  String getMatchingText(String pattern);

  String getVisibleMatchingText(String pattern);

  String getDescriptionText(String pattern);

  Icon getIconFor(String pattern);

  int getFontStyleFor(String pattern);

  int getSortPriority(String pattern);

  boolean canSubstituteStrictly(String pattern);

  boolean canSubstitute(String pattern);

  public Object getParameterObject();

  SNode substitute(@Nullable EditorContext context, String pattern);
}
