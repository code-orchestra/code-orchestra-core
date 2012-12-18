package codeOrchestra.utils.macro.util;

import com.intellij.openapi.fileEditor.FileEditorManager;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.ide.BaseNodeEditor;
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.NodeEditorComponent;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteChooser;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstitutePatternEditor;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.workbench.highlighter.EditorsHelper;

import javax.swing.text.JTextComponent;
import java.awt.*;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public final class CursorUtil {

  private static final Point TEXT_COMPONENT_OFFSET = new Point(4, 6);

  private CursorUtil() {
  }

  public static boolean setCursorPosition(Point point) {
    Window activeWindow = KeyboardFocusManager.getCurrentKeyboardFocusManager().getActiveWindow();
    if (activeWindow == null) {
      activeWindow = KeyboardFocusManager.getCurrentKeyboardFocusManager().getFocusedWindow();
    }
    if (activeWindow == null) {
      return false;
    }

    Component focusOwner = activeWindow.getFocusOwner();
    if (focusOwner == null) {
      return false;
    }

    if (focusOwner instanceof NodeEditorComponent) {
      NodeEditorComponent nodeEditorComponent = (NodeEditorComponent) focusOwner;

      EditorComponent editorComponent = nodeEditorComponent.getEditorContext().getNodeEditorComponent();
      if (editorComponent == null) {
        return false;
      }

      Point editorComponentViewPosition = editorComponent.getViewport().getViewPosition();

      int caretX = (int) (point.getX() - editorComponent.getLeftEditorHighlighter().getWidth() + editorComponentViewPosition.getX());
      int selectionY = (int) (point.getY() + editorComponentViewPosition.getY());

      EditorCell cell = editorComponent.findCellWeak(caretX, selectionY);

      if (cell != null && cell.isSelectable()) {
        editorComponent.getSelectionManager().setSelection(cell);

        // flush?

        cell.setCaretX(caretX);
        return true;
      }
    }

    return false;
  }

  public static Point getCursorPosition() {
    Window activeWindow = KeyboardFocusManager.getCurrentKeyboardFocusManager().getActiveWindow();
    if (activeWindow == null) {
      activeWindow = KeyboardFocusManager.getCurrentKeyboardFocusManager().getFocusedWindow();
    }
    if (activeWindow == null) {
      return null;
    }

    Component focusOwner = activeWindow.getFocusOwner();
    if (focusOwner == null) {
      return null;
    }

    if (focusOwner instanceof JTextComponent) {
      JTextComponent textComponent = (JTextComponent) focusOwner;
      FontMetrics fontMetrics = textComponent.getFontMetrics(textComponent.getFont());

      Point textComponentLocationOnScreen = textComponent.getLocationOnScreen();

      Point caretPixelPosition = getCaretPixelPosition(textComponent);
      Point caretPositionInTextComponent = caretPixelPosition == null ? TEXT_COMPONENT_OFFSET : caretPixelPosition;

      EditorComponent editorComponent = getEditorComponent();
      if (editorComponent != null) {
        Point leftHighlighterPosition = editorComponent.getLeftEditorHighlighter().getLocationOnScreen();
        return new Point(
          (int) (textComponentLocationOnScreen.getX() + caretPositionInTextComponent.getX() - leftHighlighterPosition.getX()),
          (int) (textComponentLocationOnScreen.getY() + caretPositionInTextComponent.getY() - leftHighlighterPosition.getY() + fontMetrics.getHeight() + 1)
        );
      }

      return null;
    } else if (focusOwner instanceof NodeEditorComponent) {
      NodeEditorComponent nodeEditorComponent = (NodeEditorComponent) focusOwner;

      EditorComponent editorComponent = nodeEditorComponent.getEditorContext().getNodeEditorComponent();
      if (editorComponent == null) {
        return null;
      }

      Point editorComponentViewPosition = editorComponent.getViewport().getViewPosition();

      // Handle the case of the auto-complete popup cursor
      NodeSubstituteChooser nodeSubstituteChooser = editorComponent.getNodeSubstituteChooser();
      if (nodeSubstituteChooser.isVisible()) {
        NodeSubstitutePatternEditor patternEditor = nodeSubstituteChooser.getPatternEditor_();

        EditorCell selectedCell = editorComponent.getDeepestSelectedCell();

        int cursorX = (int) (patternEditor.getCaretX(selectedCell.getX()) + editorComponent.getLeftEditorHighlighter().getWidth() - editorComponentViewPosition.getX());
        int cursorY = (int) (selectedCell.getY() + selectedCell.getHeight() - editorComponentViewPosition.getY());

        return new Point(cursorX, cursorY);
      }

      EditorCell selectedCell = editorComponent.getDeepestSelectedCell();
      if (selectedCell != null) {
        int cursorX = (int) (selectedCell.getCaretX() + editorComponent.getLeftEditorHighlighter().getWidth() - editorComponentViewPosition.getX());
        int cursorY = (int) (selectedCell.getY() + selectedCell.getHeight() - editorComponentViewPosition.getY());

        return new Point(cursorX, cursorY);
      }
    }

    return null;
  }

  private static EditorComponent getEditorComponent() {
    List<IEditor> selectedEditors = EditorsHelper.getSelectedEditors(FileEditorManager.getInstance(ProjectHolder.getProject()));
    if (selectedEditors != null && !selectedEditors.isEmpty()) {
      BaseNodeEditor theEditor = null;
      for (IEditor selectedEditor : selectedEditors) {
        if (selectedEditor instanceof BaseNodeEditor) {
          theEditor = (BaseNodeEditor) selectedEditor;
          break;
        }
      }
      if (theEditor == null) {
        return null;
      }

      return theEditor.getCurrentEditorComponent();
    }
    return null;
  }

  private static Point getCaretPixelPosition(JTextComponent textComponent) {
    return textComponent.getCaret().getMagicCaretPosition();
  }

}
