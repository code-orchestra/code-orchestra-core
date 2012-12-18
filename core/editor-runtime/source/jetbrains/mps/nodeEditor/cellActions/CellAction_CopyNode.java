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
package jetbrains.mps.nodeEditor.cellActions;

import jetbrains.mps.baseLanguage.tuples.runtime.MultiTuple;
import jetbrains.mps.baseLanguage.tuples.runtime.Tuples._3;
import jetbrains.mps.ide.datatransfer.CopyPasteUtil;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorCellAction;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.selection.SelectionManager;
import jetbrains.mps.nodeEditor.text.TextBuilder;
import jetbrains.mps.nodeEditor.text.TextRenderUtil;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.Condition;

import java.util.*;


/**
 * Author: Sergey Dmitriev.
 * Time: Nov 26, 2003 2:06:41 PM
 */
public class CellAction_CopyNode extends EditorCellAction {
  private static final Logger LOG = Logger.getLogger(CellAction_CopyNode.class);

  public boolean canExecute(EditorContext context) {
    return context.getNodeEditorComponent().getSelectionManager().getSelection() != null;
  }

  public void execute(EditorContext context) {
    _3<List<SNode>, Map<SNode, Set<SNode>>, String> tuple = extractSelection(context);
    if (tuple == null) return;
    CopyPasteUtil.copyNodesAndTextToClipboard(tuple._0(), tuple._1(), tuple._2());
  }

  protected _3<List<SNode>, Map<SNode, Set<SNode>>, String> extractSelection (EditorContext context) {
    EditorComponent editorComponent = context.getNodeEditorComponent();
    TextBuilder textBuilder = TextRenderUtil.getTextBuilderForSelectedCellsOfEditor(editorComponent);

    SelectionManager selectionManager = editorComponent.getSelectionManager();
    List<EditorCell> selectedCells = selectionManager.getSelection().getSelectedCells();
    if (selectedCells.size() == 0) {
      return null;
    }
    if (selectedCells.size() > 1) {
      LOG.debug("Copy " + selectedCells.size() + " nodes : ");
      for (EditorCell aCell : selectedCells) {
        LOG.debug("    " + aCell.getSNode().getDebugText());
      }
    } else {
      LOG.debug("Copy node : " + selectedCells.get(0).getSNode().getDebugText());
    }

    List<SNode> copyNodeList = new ArrayList<SNode>();
    Map<SNode, Set<SNode>> nodesAndAttributes = new HashMap<SNode, Set<SNode>>();
    for (EditorCell selectedCell : selectedCells) {
      SNode node = selectedCell.getSNode();
      final SNode parent = node.getParent();
      if (parent != null && AttributeOperations.isAttribute(node)) {
        Condition<EditorCell> condition = new Condition<EditorCell>() {
          public boolean met(EditorCell object) {
            SNode selectedNode = object.getSNode();
            return selectedNode != null &&
                    selectedNode.getParent() == parent && AttributeOperations.isAttribute(selectedNode);
          }
        };

        Set<SNode> selectedAttributes = new HashSet<SNode>();
        if (selectedCell instanceof EditorCell_Collection) {
          EditorCell_Collection selectedCollection = (EditorCell_Collection) selectedCell;
          for (EditorCell cell : selectedCollection.dfsCells()) {
            if (condition.met(cell)) {
              selectedAttributes.add(cell.getSNode());
            }
          }
        } else {
          if (condition.met(selectedCell)) {
            selectedAttributes.add(selectedCell.getSNode());
          }
        }
        copyNodeList.add(parent);
        nodesAndAttributes.put(parent, selectedAttributes);
      } else {
        copyNodeList.add(node);
      }
    }
    return new MultiTuple._3<List<SNode>, Map<SNode, Set<SNode>>, String> (copyNodeList, nodesAndAttributes, textBuilder.getText()); 
  }
}
