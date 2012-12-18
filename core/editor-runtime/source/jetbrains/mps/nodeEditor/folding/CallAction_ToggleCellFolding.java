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
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.util.Condition;

/**
 * User: Alexander Shatalin
 * Date: 05.10.2010
 */
public class CallAction_ToggleCellFolding extends EditorCellAction {
  @Override
  public boolean canExecute(EditorContext context) {
    return findCell(context.getNodeEditorComponent().getSelectedCell()) != null;
  }

  @Override
  public boolean executeInCommand() {
    return false;
  }

  @Override
  public void execute(EditorContext context) {
    EditorCell_Collection targetCell = findCell(context.getNodeEditorComponent().getSelectedCell());
    if (targetCell.isFolded()) {
      targetCell.unfold();
    } else {
      targetCell.fold();
    }
  }

  private static EditorCell_Collection findCell(EditorCell editorCell) {
    if (editorCell == null) {
      return null;
    }
    return editorCell.findParent(new Condition<EditorCell_Collection>() {
      public boolean met(EditorCell_Collection object) {
        return object.isFolded() || object.canBePossiblyFolded();
      }
    });
  }
}
