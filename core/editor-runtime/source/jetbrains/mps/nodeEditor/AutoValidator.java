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

import codeOrchestra.actionScript.Concepts;
import codeOrchestra.actionscript.view.utils.NodeUtils;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.nodeEditor.EditorManager.EditorCell_STHint;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.selection.Selection;
import jetbrains.mps.nodeEditor.selection.SelectionListener;
import jetbrains.mps.nodeEditor.selection.SingularSelection;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import javax.swing.SwingUtilities;
import java.util.List;

class AutoValidator {
  AutoValidator(EditorComponent editorComponent) {
    editorComponent.getSelectionManager().addSelectionListener(new MyCellSelectionListener());
  }

  private class MyCellSelectionListener implements SelectionListener {

    public static final int MINIMAL_VALIDATION_PERIOD = 1500;

    @Override
    @CodeOrchestraPatch
    public void selectionChanged(final EditorComponent editorComponent, Selection oldSelection, Selection newSelection) {
      if (!(oldSelection instanceof SingularSelection)) {
        return;
      }
      final EditorCell editorCell = ((SingularSelection) oldSelection).getEditorCell();

      if (editorComponent.isCellSwapInProgress()) {
        return;
      }
      if (!editorCell.isErrorState() && !(editorCell instanceof EditorCell_STHint)) {
        return;
      }

      if (newSelection instanceof SingularSelection) {
        // Do not perform any actions on moving within same EditorCell.
        if (((SingularSelection) newSelection).getEditorCell() == editorCell) {
          return;
        }
      }

      final SNode node = editorCell.getSNode();
      SwingUtilities.invokeLater(new Runnable() {
        public void run() {
          ModelAccess.instance().runWriteActionInCommand(new Runnable() {
            public void run() {
              if (editorCell.isErrorState()) {
                validate(editorCell, editorComponent);
              }

              if (editorCell instanceof EditorCell_STHint) {
                SNodeEditorUtil.removeRightTransformHint(node);
                SNodeEditorUtil.removeLeftTransformHint(node);
              }
            }
          });
        }
      });
    }

    private void validate(EditorCell cell, EditorComponent editorComponent) {
      if (cell != null) {
        if (wasRecentlyValidated(cell)) {
          return;
        }

        markAsRecentlyValidated(cell);

        Object memento = editorComponent.getEditorContext().createMemento();
        cell.validate(true, false);
        editorComponent.flushEvents();
        editorComponent.getEditorContext().setMemento(memento);
      }
    }

    private void markAsRecentlyValidated(EditorCell cell) {
      SNode sNode = cell.getSNode();
      if (sNode != null) {
        sNode = findAConsistentNodeToMark(sNode);
        sNode.putUserObject(NodeUtils.AUTO_VALIDATOR_TIMESTAMP, System.currentTimeMillis());
      }
    }

    private boolean wasRecentlyValidated(EditorCell cell) {
      SNode sNode = cell.getSNode();
      if (sNode == null) {
        return false;
      }

      sNode = findAConsistentNodeToMark(sNode);

      Object validationTimeObj = sNode.getUserObject(NodeUtils.AUTO_VALIDATOR_TIMESTAMP);
      if (validationTimeObj == null) {
        return false;
      }

      long timeSinceValidation = System.currentTimeMillis() - (Long) validationTimeObj;
      if (timeSinceValidation < MINIMAL_VALIDATION_PERIOD) {
        return true;
      }

      return false;
    }

    private SNode findAConsistentNodeToMark(SNode node) {
      List<SNode> ancestors = SNodeOperations.getAncestors(node, Concepts.STATEMENT, true);
      if (ancestors != null && !ancestors.isEmpty()) {
        return ancestors.get(0);
      }

      return node;
    }

  }
}
