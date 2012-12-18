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
package jetbrains.mps.nodeEditor.folding;

import jetbrains.mps.nodeEditor.EditorCellAction;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.util.Condition;

public class CellAction_FoldCell extends EditorCellAction {

  public boolean canExecute(EditorContext context) {
    EditorCell editorCell = context.getNodeEditorComponent().getSelectedCell();
    if (editorCell == null) return false;
    return findCell(editorCell) != null;
  }

  @Override
  public boolean executeInCommand() {
    return false;
  }

  public void execute(EditorContext context) {
    EditorComponent component = context.getNodeEditorComponent();
    EditorCell editorCell = component.getSelectedCell();
    EditorCell_Collection targetCell = findCell(editorCell);
    targetCell.fold();
  }

  private static EditorCell_Collection findCell(EditorCell editorCell) {
    return editorCell.findParent(new Condition<EditorCell_Collection>() {
      public boolean met(EditorCell_Collection object) {
        return object.canBePossiblyFolded() && !object.isFolded();
      }
    });
  }
}
