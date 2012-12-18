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

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cellMenu.CellContext;
import jetbrains.mps.nodeEditor.cellMenu.BasicCellContext;
import jetbrains.mps.nodeEditor.cells.EditorCell;

public abstract class AbstractCellProvider {
  private SNode myNode;

  public AbstractCellProvider(SNode node) {
    myNode = node;
  }

  public AbstractCellProvider() {

  }

  public void setSNode(SNode node) {
    myNode = node;
  }

  public SNode getSNode() {
    return myNode;
  }

  public CellContext getCellContext() {
    return new BasicCellContext(getSNode());
  }

  public abstract EditorCell createEditorCell(EditorContext editorContext);
}
