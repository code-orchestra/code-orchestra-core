package codeOrchestra.editor;

import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.selection.Selection;

import java.awt.Point;
import java.awt.Rectangle;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public final class ScrollHelper {

  public static void centerTheSelection(EditorComponent editorComponent, Selection newSelection) {
    if (newSelection == null) {
      return;
    }
    List<EditorCell> selectedCells = newSelection.getSelectedCells();
    if (selectedCells.isEmpty()) {
      return;
    }

    EditorCell selectedCell = selectedCells.get(0);

    Point newViewPosition = new Point(0, selectedCell.getY() - (int)(editorComponent.getViewport().getExtentSize().getHeight() / 2));
    Rectangle newViewport = new Rectangle(newViewPosition, editorComponent.getViewport().getExtentSize());

    editorComponent.scrollRectToVisible(newViewport);
  }

}
