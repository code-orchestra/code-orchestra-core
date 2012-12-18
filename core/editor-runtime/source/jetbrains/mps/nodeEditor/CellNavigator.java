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
package jetbrains.mps.nodeEditor;

import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.util.IterableUtil;

import java.util.Iterator;

abstract class CellNavigator {
  private EditorComponent myEditor;
  private EditorCell mySelectedCell;

  protected CellNavigator(EditorComponent editor) {
    myEditor = editor;
    mySelectedCell = editor.getSelectedCell();
    assert mySelectedCell != null;
  }

  abstract boolean isSuitableCell(EditorCell cell);

  void goToNextCell(boolean backwards) {
    EditorCell current = mySelectedCell;
    EditorCell_Collection parent = mySelectedCell.getParent();
    if (parent == null) {
      if (mySelectedCell instanceof EditorCell_Collection) {
        parent = (EditorCell_Collection) mySelectedCell;
        current = null;
      } else {
        return;
      }
    }
    while (parent != null) {
      EditorCell result = findNextCellWithCondition(parent, current, backwards);
      if (result != null) {
        myEditor.changeSelection(result);
        return;
      }
      current = parent;
      parent = parent.getParent();
    }
  }

  private EditorCell findNextCellWithCondition(
    EditorCell_Collection parent,
    EditorCell current,
    boolean backwards) {

    boolean currentMet = current == null;
    Iterator<EditorCell> iterator = backwards ? parent.reverseCellIterator() : parent.iterator();
    for (EditorCell cell : IterableUtil.asIterable(iterator)) {
      if (currentMet) {
        if (isSuitableCell(cell)) {
          return cell;
        }
        if (cell instanceof EditorCell_Collection) {
          EditorCell cellFromCollection = findNextCellWithCondition((EditorCell_Collection) cell, null, backwards);
          if (cellFromCollection != null) {
            return cellFromCollection;
          }
        }
      } else {
        if (cell == current) {
          currentMet = true;
        }
      }
    }
    return null;
  }
}
