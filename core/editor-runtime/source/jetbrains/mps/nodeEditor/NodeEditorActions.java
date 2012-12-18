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

import codeOrchestra.actionScript.editor.BlockListHelper;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteInfo;
import jetbrains.mps.nodeEditor.cells.*;
import jetbrains.mps.nodeEditor.selection.*;
import jetbrains.mps.nodeEditor.selection.SingularSelection.SideSelectDirection;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.awt.*;
import java.util.List;


public class NodeEditorActions {
  public abstract static class NavigationAction extends EditorCellAction {
    @Override
    public boolean executeInCommand() {
      return false;
    }
  }

  public static class MoveLocal extends NavigationAction {
    private boolean myHome;

    public MoveLocal(boolean home) {
      myHome = home;
    }

    public boolean canExecute(EditorContext context) {
      return findTarget(context.getNodeEditorComponent().getSelectionManager()) != null;
    }

    public void execute(EditorContext context) {
      SelectionManager selectionManager = context.getNodeEditorComponent().getSelectionManager();
      EditorCell cell = findTarget(selectionManager);
      selectionManager.setSelection(cell);
      if (cell.isPunctuationLayout() && (cell instanceof EditorCell_Label) && ((EditorCell_Label) cell).isCaretPositionAllowed(1)) {
        ((EditorCell_Label) cell).setCaretPosition(1);
      } else {
        cell.home();
      }
    }

    private EditorCell findTarget(SelectionManager selectionManager) {
      Selection selection = selectionManager.getSelection();
      if (selection == null) {
        return null;
      }
      List<EditorCell> selectedCells = selection.getSelectedCells();
      EditorCell cell = myHome ? selectedCells.get(0) : selectedCells.get(selectedCells.size() - 1);
      EditorCell leaf = myHome ? cell.getLeafToLeft(CellConditions.SELECTABLE) : cell.getLeafToRight(CellConditions.SELECTABLE);
      if (leaf != null) {
        return leaf;
      }
      return myHome ? cell.getPrevLeaf(CellConditions.SELECTABLE) : cell.getNextLeaf(CellConditions.SELECTABLE);
    }
  }

  public static class MoveLeft extends NavigationAction {
    public boolean canExecute(EditorContext context) {
      EditorCell selection = getDeepestSelectedCell(context);
      return selection != null && findTarget(selection) != null;
    }

    public void execute(EditorContext context) {
      EditorCell selection = getDeepestSelectedCell(context);
      EditorCell target = findTarget(selection);
      context.getNodeEditorComponent().changeSelection(target);
      if (target instanceof EditorCell_Label) {
        EditorCell_Label label = (EditorCell_Label) target;
        label.end();
      }
    }

    private EditorCell getDeepestSelectedCell(EditorContext context) {
      Selection deepestSelection = context.getNodeEditorComponent().getSelectionManager().getDeepestSelection();
      if (deepestSelection instanceof SingularSelection) {
        return ((SingularSelection) deepestSelection).getEditorCell();
      } else if (deepestSelection instanceof NodeRangeSelection) {
        return ((NodeRangeSelection) deepestSelection).getFirstCell();
      }
      return null;
    }

    private EditorCell findTarget(EditorCell cell) {
      EditorCell toLeft = cell.getLeafToLeft(CellConditions.SELECTABLE);
      if (toLeft != null) {
        return toLeft;
      }
      return cell.getPrevLeaf(CellConditions.SELECTABLE);
    }
  }

  public static class MoveToRoot extends NavigationAction {
    private boolean myHome;

    public MoveToRoot(boolean home) {
      myHome = home;
    }

    public boolean canExecute(EditorContext context) {
      return findTarget(context.getNodeEditorComponent().getSelectionManager()) != null;
    }

    public void execute(EditorContext context) {
      SelectionManager selectionManager = context.getNodeEditorComponent().getSelectionManager();
      selectionManager.setSelection(findTarget(selectionManager));
      selectionManager.getSelection().ensureVisible();
    }

    private EditorCell findTarget(SelectionManager selectionManager) {
      Selection selection = selectionManager.getSelection();
      if (selection == null) {
        return null;
      }
      EditorCell cell = selection.getSelectedCells().get(0);
      while (cell.getParent() != null) {
        cell = cell.getParent();
      }
      if (cell instanceof  EditorCell_Collection) {
        return cell.findChild(myHome ? CellFinders.FIRST_SELECTABLE_LEAF : CellFinders.LAST_SELECTABLE_LEAF);
      }
      return cell;
    }
  }

  public static class MoveHome extends NavigationAction {
    public boolean canExecute(EditorContext context) {
      return findTarget(context.getNodeEditorComponent()) != null;
    }

    public void execute(EditorContext context) {
      EditorComponent editorComponent = context.getNodeEditorComponent();
      EditorCell target = findTarget(editorComponent);
      if (target instanceof EditorCell_Label) {
        EditorCell_Label label = (EditorCell_Label) target;
        label.home();
        editorComponent.resetLastCaretX();
      }
      editorComponent.changeSelection(target);
    }

    private EditorCell findTarget(EditorComponent editorComponent) {
      Selection selection = editorComponent.getSelectionManager().getSelection();
      if (selection == null) {
        return null;
      }
      List<EditorCell> selectedCells = selection.getSelectedCells();
      EditorCell cell = selectedCells.get(0);
      return cell.getHomeCell(CellConditions.SELECTABLE);
    }

  }

  public static class MoveEnd extends NavigationAction {

    public boolean canExecute(EditorContext context) {
      return findTarget(context.getNodeEditorComponent()) != null;
    }

    public void execute(EditorContext context) {
      EditorComponent editorComponent = context.getNodeEditorComponent();
      EditorCell target = findTarget(editorComponent);
      if (target instanceof EditorCell_Label) {
        EditorCell_Label label = (EditorCell_Label) target;
        label.end();
        editorComponent.resetLastCaretX();
      }
      editorComponent.changeSelection(target);
    }

    private EditorCell findTarget(EditorComponent editorComponent) {
      Selection selection = editorComponent.getSelectionManager().getSelection();
      if (selection == null) {
        return null;
      }
      List<EditorCell> selectedCells = selection.getSelectedCells();
      EditorCell cell = selectedCells.get(selectedCells.size() - 1);
      return cell.getEndCell(CellConditions.SELECTABLE);
    }
  }

  public static class MoveRight extends NavigationAction {
    public boolean canExecute(EditorContext context) {
      EditorCell selection = getDeepestSelectedCell(context);
      return selection != null && findTarget(selection) != null;
    }

    public void execute(EditorContext context) {
      EditorCell selection = getDeepestSelectedCell(context);
      EditorCell target = findTarget(selection);
      context.getNodeEditorComponent().changeSelection(target);
      if (target.isPunctuationLayout() && ((EditorCell_Label) target).isCaretPositionAllowed(1)) {
        ((EditorCell_Label) target).setCaretPosition(1);
      } else if (target instanceof EditorCell_Label) {
        EditorCell_Label label = (EditorCell_Label) target;
        label.home();
      }
    }

    private EditorCell getDeepestSelectedCell(EditorContext context) {
      Selection deepestSelection = context.getNodeEditorComponent().getSelectionManager().getDeepestSelection();
      if (deepestSelection instanceof SingularSelection) {
        return ((SingularSelection) deepestSelection).getEditorCell();
      } else if (deepestSelection instanceof NodeRangeSelection) {
        return ((NodeRangeSelection) deepestSelection).getLastCell();
      }
      return null;
    }

    private EditorCell findTarget(EditorCell cell) {
      EditorCell toRight = cell.getLeafToRight(CellConditions.SELECTABLE);
      if (toRight != null) {
        return toRight;
      }
      return cell.getNextLeaf(CellConditions.SELECTABLE);
    }
  }

  public static class MoveUp extends NavigationAction {
    public boolean canExecute(EditorContext context) {
      EditorCell selectedCell = getDeepestSelectedCell(context);
      return selectedCell != null && selectedCell.getParent() != null && findTarget(selectedCell, selectedCell.getCaretX()) != null;
    }

    public void execute(EditorContext context) {
      EditorCell selectedCell = getDeepestSelectedCell(context);
      int caretX = selectedCell.getCaretX();
      if (context.getNodeEditorComponent().hasLastCaretX()) {
        caretX = context.getNodeEditorComponent().getLastCaretX();
      }
      context.getNodeEditorComponent().saveLastCaretX(caretX);
      EditorCell target = findTarget(selectedCell, caretX);
      target.setCaretX(caretX);
      context.getNodeEditorComponent().changeSelection(target, false);
    }

    private EditorCell getDeepestSelectedCell(EditorContext context) {
      Selection deepestSelection = context.getNodeEditorComponent().getSelectionManager().getDeepestSelection();
      if (deepestSelection instanceof SingularSelection) {
        return ((SingularSelection) deepestSelection).getEditorCell();
      } else if (deepestSelection instanceof NodeRangeSelection) {
        return ((NodeRangeSelection) deepestSelection).getFirstCell();
      }
      return null;
    }

    private EditorCell findTarget(EditorCell cell, int caretX) {
      return cell.getUpper(CellConditions.SELECTABLE, caretX);
    }
  }

  public static class MoveDown extends NavigationAction {
    public boolean canExecute(EditorContext context) {
      EditorCell selectedCell = getDeepestSelectedCell(context);
      return selectedCell != null && findTarget(selectedCell, selectedCell.getCaretX()) != null;
    }

    public void execute(EditorContext context) {
      EditorCell selectedCell = getDeepestSelectedCell(context);
      int caretX = selectedCell.getCaretX();
      if (context.getNodeEditorComponent().hasLastCaretX()) {
        caretX = context.getNodeEditorComponent().getLastCaretX();
      }
      context.getNodeEditorComponent().saveLastCaretX(caretX);
      EditorCell target = findTarget(selectedCell, caretX);
      target.setCaretX(caretX);
      context.getNodeEditorComponent().changeSelection(target, false);
    }

    private EditorCell getDeepestSelectedCell(EditorContext context) {
      Selection deepestSelection = context.getNodeEditorComponent().getSelectionManager().getDeepestSelection();
      if (deepestSelection instanceof SingularSelection) {
        return ((SingularSelection) deepestSelection).getEditorCell();
      } else if (deepestSelection instanceof NodeRangeSelection) {
        return ((NodeRangeSelection) deepestSelection).getLastCell();
      }
      return null;
    }

    private EditorCell findTarget(EditorCell cell, int caretX) {
      return cell.getLower(CellConditions.SELECTABLE, caretX);
    }
  }

  public static class MoveNext extends NavigationAction {
    public boolean canExecute(EditorContext context) {
      EditorCell selection = context.getNodeEditorComponent().getSelectedCell();
      return selection != null && selection.getNextLeaf(CellConditions.EDITABLE) != null;
    }

    public void execute(EditorContext context) {
      EditorCell selection = context.getNodeEditorComponent().getSelectedCell();
      context.getNodeEditorComponent().changeSelection(selection.getNextLeaf(CellConditions.EDITABLE));
    }
  }

  public static class MovePrev extends NavigationAction {
    public boolean canExecute(EditorContext context) {
      EditorCell selection = context.getNodeEditorComponent().getSelectedCell();
      return selection != null && selection.getPrevLeaf(CellConditions.EDITABLE) != null;
    }

    public void execute(EditorContext context) {
      EditorCell selection = context.getNodeEditorComponent().getSelectedCell();
      context.getNodeEditorComponent().changeSelection(selection.getPrevLeaf(CellConditions.EDITABLE));
    }
  }

  private static void navigatePage(EditorContext context, boolean isDown) {
    EditorComponent editor = context.getNodeEditorComponent();
    EditorCell selection = editor.getSelectedCell();
    Rectangle rect = editor.getVisibleRect();
    int height = (int) rect.getHeight();
    height = isDown ? height : -height;
    int caretX = selection.getCaretX();
    int y = selection.getY() + (selection.getHeight() / 2);
    int newY = y + height;
    EditorCell target = editor.findCellWeak(caretX, newY);
    if (target == null) {
      target = isDown ? editor.myRootCell.findChild(CellFinders.LAST_SELECTABLE_LEAF) : editor.myRootCell.findChild(CellFinders.FIRST_SELECTABLE_LEAF);
      editor.changeSelection(target);
    } else {
      target.setCaretX(caretX);
      editor.changeSelection(target);
    }
  }

  public static class MovePageUp extends NavigationAction {
    public boolean canExecute(EditorContext context) {
      return true;
    }

    public void execute(EditorContext context) {
      navigatePage(context, true);
    }
  }

  public static class MovePageDown extends EditorCellAction {
    public boolean canExecute(EditorContext context) {
      return true;
    }

    public void execute(EditorContext context) {
      navigatePage(context, false);
    }
  }

  public static class SelectUp extends EditorCellAction {
    public boolean canExecute(EditorContext context) {
      return findTarget(context.getNodeEditorComponent().getSelectionManager()) != null;
    }

    public void execute(EditorContext context) {
      SelectionManager selectionManager = context.getNodeEditorComponent().getSelectionManager();
      EditorCell cell = findTarget(selectionManager);
      selectionManager.pushSelection(selectionManager.createSelection(cell));
      if (cell instanceof EditorCell_Label) {
        ((EditorCell_Label) cell).selectAll();
      }
    }

    private EditorCell findTarget(SelectionManager selectionManager) {
      Selection selection = selectionManager.getSelection();
      if (selection == null) {
        return null;
      }

      EditorCell cell = selection.getSelectedCells().get(0);
      if (cell instanceof EditorCell_Label && !((EditorCell_Label) cell).isEverythingSelected()) {
        return cell;
      }

      if (cell.getParent() == null) {
        return null;
      }

      while (cell.getParent() != null && cell.getParent().isTransparentCollection()) {
        cell = cell.getParent();
      }
      EditorCell_Collection parent = cell.getParent();
      while (parent != null) {
        if (parent.isSelectable()) {
          while (parent.getParent() != null && parent.getParent().isTransparentCollection() && parent.getParent().isSelectable()) {
            parent = parent.getParent();
          }
          return parent;
        }
        parent = parent.getParent();
      }
      return null;
    }
  }

  public static class SelectDown extends EditorCellAction {
    public boolean canExecute(EditorContext context) {
      return context.getNodeEditorComponent().getSelectionManager().getSelectionStackSize() > 1;
    }

    public void execute(EditorContext context) {
      context.getNodeEditorComponent().getSelectionManager().popSelection();
    }
  }

  public static class SideSelect extends EditorCellAction {
    private CellSide mySide;

    protected SideSelect(CellSide side) {
      mySide = side;
    }

    private EditorCell getNextLeaf(EditorCell current) {
      if (mySide == CellSide.LEFT) {
        return current.getPrevLeaf(CellConditions.SELECTABLE);
      } else {
        return current.getNextLeaf(CellConditions.SELECTABLE);
      }
    }

    @CodeOrchestraPatch
    public boolean canExecute(EditorContext context) {
      // RE-3212
      if (!EditorSettings.getInstance().allowSideSelect()) {
        return false;
      }

      SelectionManager selectionManager = context.getNodeEditorComponent().getSelectionManager();
      Selection selection = selectionManager.getSelection();
      if (selection instanceof SingularSelection) {
        SingularSelection singularSelection = (SingularSelection) selection;
        if (!expandSelection(singularSelection) && selectionManager.getSelectionStackSize() > 1) {
          return true;
        }
        EditorCell selected = singularSelection.getEditorCell();
        EditorCell nextLeaf = getNextLeaf(selected);
        return nextLeaf != null && getCommonSelectableAncestor(selected, nextLeaf) != null;
      }
      return false;
    }

    public void execute(EditorContext context) {
      SelectionManager selectionManager = context.getNodeEditorComponent().getSelectionManager();
      SingularSelection selection = (SingularSelection) selectionManager.getSelection();
      if (!expandSelection(selection) && selectionManager.getSelectionStackSize() > 1) {
        selectionManager.popSelection();
        return;
      }
      EditorCell selected = selection.getEditorCell();
      EditorCell nextLeaf = getNextLeaf(selected);
      EditorCell cellToSelect = getCommonSelectableAncestor(selected, nextLeaf);
      Selection newSelection = selectionManager.createSelection(cellToSelect);
      if (newSelection instanceof SingularSelection) {
        ((SingularSelection) newSelection).setSideSelectDirection(mySide == CellSide.LEFT ? SideSelectDirection.LEFT : SideSelectDirection.RIGHT);
      }
      selectionManager.pushSelection(newSelection);
    }

    private boolean expandSelection(SingularSelection selection) {
      switch (selection.getSideSelectDirection()) {
        case LEFT:
          return mySide == CellSide.LEFT;
        case RIGHT:
          return mySide == CellSide.RIGHT;
      }
      return true;
    }

    private EditorCell getCommonSelectableAncestor(EditorCell first, EditorCell... cells) {
      EditorCell result = first;
      while (result != null) {
        if (result.isSelectable()) {
          boolean common = true;
          for (EditorCell cell : cells) {
            if (!result.isAncestorOf(cell) && result != cell) {
              common = false;
              break;
            }
          }
          if (common) return result;
        }

        result = result.getParent();
      }
      return null;
    }
  }

  public static class EnlargeSelection extends NavigationAction {

    private boolean myUp;

    public EnlargeSelection(boolean up) {
      myUp = up;
    }

    @Override
    public boolean canExecute(EditorContext context) {
      // TODO: this check should be reallocated into Selection.canExecuteAction() method once it created
      Selection selection = context.getNodeEditorComponent().getSelectionManager().getSelection();
      if (selection instanceof NodeRangeSelection) {
        return true;
      }
      if (selection instanceof SingularSelection) {
        EditorCell editorCell = ((SingularSelection) selection).getEditorCell();
        return editorCell.getSNode().getParent() != null;
      }
      return false;
    }

    @Override
    public void execute(final EditorContext context) {
      EditorComponent editorComponent = context.getNodeEditorComponent();
      SelectionManager selectionManager = editorComponent.getSelectionManager();
      Selection selection = selectionManager.getSelection();
      if (selection instanceof SingularSelection) {
        EditorCell selectedCell = ((SingularSelection) selection).getEditorCell();
        SNode selectedNode = selectedCell.getSNode();
        SNode topMostNodeInSingularContainment = BlockListHelper.findTopMostNodeWithSingularContainment(selectedNode);
        if (topMostNodeInSingularContainment != selectedNode) {
          EditorCell nodeCell = editorComponent.findNodeCell(topMostNodeInSingularContainment);
          if (nodeCell != null) {
            editorComponent.pushSelection(nodeCell);
            editorComponent.scrollToCell(nodeCell);
          }
        } else {
          Selection newSelection = selectionManager.createRangeSelection(selectedNode, selectedNode);
          if (newSelection instanceof NodeRangeSelection && selectedCell.isBigCell()) {
            newSelection = ((NodeRangeSelection) newSelection).enlargeSelection(myUp);
          }
          if (newSelection != null) {
            selectionManager.pushSelection(newSelection);
            newSelection.ensureVisible();
          }
        }
      } else if (selection instanceof NodeRangeSelection) {
        Selection newSelection = ((NodeRangeSelection) selection).enlargeSelection(myUp);
        if (newSelection != null) {
          selectionManager.pushSelection(newSelection);
          newSelection.ensureVisible();
        }
      }
    }
  }

  public static class CompleteNoAuto extends EditorCellAction {
    public boolean canExecute(EditorContext context) {
      EditorCell selection = context.getSelectedCell();
      return selection != null && selection.getSubstituteInfo() != null;
    }

    public void execute(EditorContext context) {
      EditorCell selection = context.getSelectedCell();
      context.getNodeEditorComponent().activateNodeSubstituteChooserNoAuto(selection);
    }
  }

  public static class Complete extends EditorCellAction {
    public boolean canExecute(EditorContext context) {
      EditorCell selection = context.getSelectedCell();
      return selection != null && selection.getSubstituteInfo() != null;
    }

    public void execute(EditorContext context) {
      EditorCell selection = context.getSelectedCell();
      context.getNodeEditorComponent().activateNodeSubstituteChooser(selection, false);
    }
  }

  public static class CompleteSmart extends EditorCellAction {
    public boolean canExecute(EditorContext context) {
      EditorCell selection = context.getSelectedCell();
      return selection != null && selection.getSubstituteInfo() != null;
    }

    public void execute(EditorContext context) {
      EditorCell selection = context.getSelectedCell();
      context.getNodeEditorComponent().activateNodeSubstituteChooser(selection, false, true);
    }
  }

  public static class ShowMessage extends EditorCellAction {
    public void execute(EditorContext context) {
      context.getNodeEditorComponent().showMessageTooltip();
    }
  }
}
