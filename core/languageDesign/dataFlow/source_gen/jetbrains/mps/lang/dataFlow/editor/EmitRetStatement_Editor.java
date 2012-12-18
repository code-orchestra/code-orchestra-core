package jetbrains.mps.lang.dataFlow.editor;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.DefaultNodeEditor;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell_Constant;

public class EmitRetStatement_Editor extends DefaultNodeEditor {
  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createConstant_kzxe6t_a(editorContext, node);
  }

  private EditorCell createConstant_kzxe6t_a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "ret");
    editorCell.setCellId("Constant_kzxe6t_a");
    DataFlow_StyleSheet.getInstruction(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }
}
