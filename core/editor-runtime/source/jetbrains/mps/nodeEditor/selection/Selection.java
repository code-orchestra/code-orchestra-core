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
package jetbrains.mps.nodeEditor.selection;

import jetbrains.mps.nodeEditor.CellActionType;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;

import java.awt.Graphics2D;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Alexander Shatalin
 * Date: 1/13/11
 * Time: 6:40 PM
 * To change this template use File | Settings | File Templates.
 */
public interface Selection {
  void activate();

  void deactivate();

  SelectionInfo getSelectionInfo() throws SelectionStoreException;

  boolean isSame(Selection another);

  // TODO: add canExecuteAction() method
  void executeAction(CellActionType type);

  /**
   * @return non-empty list of selected cells
   */
  @NotNull
  List<EditorCell> getSelectedCells();

  /**
   * @return non-empty list of selected nodes
   */
  @NotNull
  List<SNode> getSelectedNodes();

  void ensureVisible();

  void paintSelection(Graphics2D g);
}
