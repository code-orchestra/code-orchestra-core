package jetbrains.mps.xmlSchema.editor;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.DefaultNodeEditor;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell_Error;

public class TypeExpression_Editor extends DefaultNodeEditor {
  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createError_6uinal_a(editorContext, node);
  }

  private EditorCell createError_6uinal_a(EditorContext editorContext, SNode node) {
    EditorCell_Error editorCell = new EditorCell_Error(editorContext, node, "typeExpression");
    editorCell.setCellId("Error_6uinal_a");
    return editorCell;
  }
}
