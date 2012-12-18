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
import jetbrains.mps.nodeEditor.cells.EditorCell_Component;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;

import java.util.Set;
import java.util.HashSet;
import java.util.Collections;

public class CellTracker {
  private Set<EditorCell> myCellsWithErrorState = new HashSet<EditorCell>();
  private Set<EditorCell_Component> myComponentCells = new HashSet<EditorCell_Component>();
  private Set<EditorCell_Collection> myFoldableCells = new HashSet<EditorCell_Collection>();

  public Set<EditorCell> getErrorCells() {
    return Collections.unmodifiableSet(myCellsWithErrorState);
  }

  public void addErrorCell(EditorCell cell) {
    myCellsWithErrorState.add(cell);
  }

  public void removeErrorCell(EditorCell cell) {
    myCellsWithErrorState.remove(cell);
  }

  public Set<EditorCell_Component> getComponentCells() {
    return Collections.unmodifiableSet(myComponentCells);
  }

  public void addComponentCell(EditorCell_Component cell) {
    myComponentCells.add(cell);
  }

  public void removeComponentCell(EditorCell_Component cell) {
    myComponentCells.remove(cell);
  }

  public Set<EditorCell_Collection> getFoldableCells() {
    return Collections.unmodifiableSet(myFoldableCells);
  }

  public void addFoldableCell(EditorCell_Collection cell) {
    myFoldableCells.add(cell);
  }

  public void removeFoldableCell(EditorCell_Collection cell) {
    myFoldableCells.remove(cell);
  }
}
