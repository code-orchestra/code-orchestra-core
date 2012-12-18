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
package jetbrains.mps.nodeEditor.messageTargets;

import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.cells.*;
import jetbrains.mps.nodeEditor.inspector.InspectorEditorComponent;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Condition;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Set;

/**
 * @author Evgeny Gerashchenko
 * @since 23 November 10
 */
public class CellFinder {
  @Nullable
  private static EditorCell getRawCell(@Nullable EditorComponent editorComponent, @Nullable final SNode node) {
    if (editorComponent == null || node == null) {
      return null;
    }
    return editorComponent.getBigValidCellForNode(node);
  }

  @Nullable
  public static EditorCell getCellForReference(@Nullable EditorComponent editorComponent, @Nullable final SNode node, final String role) {
    EditorCell rawCell = getRawCell(editorComponent, node);
    if (rawCell == null) { return null; }
    EditorCell child = rawCell.findChild(CellFinders.byCondition(new Condition<EditorCell>() {
      public boolean met(EditorCell cell) {
        return cell.isReferenceCell() && role.equals(cell.getRole()) && node == cell.getSNode();
      }
    }, true), true);
    if (child != null) {
      return child;
    } else {
      return rawCell;
    }
  }

  @Nullable
  public static EditorCell getCellForProperty(@Nullable EditorComponent editorComponent, @Nullable final SNode node, final String name) {
    EditorCell rawCell = getRawCell(editorComponent, node);
    if (rawCell == null) { return null; }
    EditorCell child = rawCell.findChild(CellFinders.byCondition(new Condition<EditorCell>() {
      public boolean met(EditorCell cell) {
        if (!(cell instanceof EditorCell_Property)) return false;
        EditorCell_Property propertyCell = (EditorCell_Property) cell;
        ModelAccessor modelAccessor = propertyCell.getModelAccessor();
        return modelAccessor instanceof PropertyAccessor && node == propertyCell.getSNode()
          && name.equals(((PropertyAccessor) modelAccessor).getPropertyName());
      }
    }, true), true);
    if (child != null) {
      return child;
    } else {
      return rawCell;
    }
  }

  @Nullable
  public static EditorCell getCellForChild(@Nullable EditorComponent editorComponent, @Nullable final SNode node, final String role) {
    EditorCell rawCell = getRawCell(editorComponent, node);
    if (rawCell == null) {
      return null;
    }
    EditorCell child = rawCell.findChild(CellFinders.byCondition(new Condition<EditorCell>() {
      @Override
      public boolean met(EditorCell cell) {
        return role.equals(cell.getRole()) &&
          (node == cell.getSNode() || node == cell.getSNode().getParent() && cell.isBigCell());
      }
    }, true), true);
    if (child != null) {
      return child;
    }
    if (editorComponent instanceof InspectorEditorComponent && rawCell.getParent() == null) {
      rawCell = null;
    }
    return rawCell;
  }
}
