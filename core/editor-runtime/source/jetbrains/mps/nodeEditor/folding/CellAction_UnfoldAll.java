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

import java.util.LinkedList;
import java.util.Queue;

public class CellAction_UnfoldAll extends EditorCellAction {


  public boolean canExecute(EditorContext context) {
    return context.getNodeEditorComponent().getRootCell() instanceof EditorCell_Collection;
  }

  public void execute(EditorContext context) {
    EditorComponent component = context.getNodeEditorComponent();
    Queue<EditorCell_Collection> cellsToProcess = new LinkedList<EditorCell_Collection>();
    cellsToProcess.add((EditorCell_Collection) component.getRootCell());
    while (!cellsToProcess.isEmpty()) {
      EditorCell_Collection nextCollection = cellsToProcess.poll();
      if (nextCollection.isFolded()) {
        nextCollection.unfold();
      }
      for (EditorCell childCell : nextCollection.getCells()) {
        if (childCell instanceof EditorCell_Collection) {
          cellsToProcess.add((EditorCell_Collection) childCell);
        }
      }
    }
  }

  @Override
  public boolean executeInCommand() {
    return true;
  }
}
