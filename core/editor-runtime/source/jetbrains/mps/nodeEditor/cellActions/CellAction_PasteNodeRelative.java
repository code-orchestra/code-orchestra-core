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

import jetbrains.mps.nodeEditor.datatransfer.NodePaster;
import jetbrains.mps.nodeEditor.selection.SelectionManager;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SReference;
import jetbrains.mps.ide.datatransfer.CopyPasteUtil;
import jetbrains.mps.datatransfer.PasteNodeData;
import jetbrains.mps.datatransfer.PastePlaceHint;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.ide.resolve.Resolver;
import jetbrains.mps.nodeEditor.*;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.nodeEditor.cells.CellFinders;

import java.util.List;
import java.util.Set;


public class CellAction_PasteNodeRelative extends EditorCellAction {
  private static final Logger LOG = Logger.getLogger(CellAction_PasteNodeRelative.class);

  PastePlaceHint myPastePlaceHint;

  public CellAction_PasteNodeRelative(boolean pasteBefore) {
    myPastePlaceHint = pasteBefore ? PastePlaceHint.BEFORE_ANCHOR : PastePlaceHint.AFTER_ANCHOR;
  }

  public boolean canExecute(EditorContext context) {
    EditorCell selectedCell = context.getNodeEditorComponent().getSelectedCell();
    if (selectedCell == null) {
      return false;
    }
    SNode anchorNode = selectedCell.getSNode();
    if (anchorNode == null) {
      return false;
    }
    List<SNode> pasteNodes = CopyPasteUtil.getNodesFromClipboard(anchorNode.getModel());
    if (pasteNodes == null || pasteNodes.isEmpty()) {
      return CopyPasteUtil.isConversionAvailable(anchorNode.getModel(), anchorNode);
    }

    if (!new NodePaster(pasteNodes).canPasteRelative(anchorNode)) {
      LOG.debug("Couldn't paste node relative");
      return false;
    }
    return true;
  }

  public void execute(EditorContext context) {
    LOG.assertInCommand();
    EditorComponent editorComponent = context.getNodeEditorComponent();
    EditorCell selectedCell = editorComponent.getSelectedCell();
    SNode anchorNode = selectedCell.getSNode();

    PasteNodeData pasteNodeData = CopyPasteUtil.getPasteNodeDataFromClipboard(anchorNode.getModel());
    if (pasteNodeData == null || pasteNodeData.getNodes().isEmpty()) {
      pasteNodeData = CopyPasteUtil.getConvertedFromClipboard(anchorNode.getModel());
      if (pasteNodeData == null) return;
    }
    List<SNode> pasteNodes = pasteNodeData.getNodes();
    Set<SReference> requireResolveReferences = pasteNodeData.getRequireResolveReferences();

    new NodePaster(pasteNodes).pasteRelative(anchorNode, myPastePlaceHint);
    Resolver.resolveReferences(requireResolveReferences, context.getOperationContext());

    // set selection
    editorComponent.flushEvents();
    EditorCell nodeCell = editorComponent.findNodeCell(pasteNodes.get(0));
    if (nodeCell == null) return; // after 'set reference'?
    EditorCell_Label labelCell = nodeCell.findChild(CellFinders.byClass(EditorCell_Label.class, true));

    if (labelCell != null) {
      editorComponent.changeSelection(labelCell);
    }

    if (pasteNodes.size() == 1) {
      editorComponent.pushSelection(nodeCell);
    } else {
      SelectionManager selectionManager = editorComponent.getSelectionManager();
      selectionManager.pushSelection(selectionManager.createRangeSelection(pasteNodes.get(0), pasteNodes.get(pasteNodes.size() - 1)));
    }
  }
}
