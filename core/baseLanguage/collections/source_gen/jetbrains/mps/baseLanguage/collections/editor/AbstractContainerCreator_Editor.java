package jetbrains.mps.baseLanguage.collections.editor;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.DefaultNodeEditor;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.AbstractCellProvider;

public class AbstractContainerCreator_Editor extends DefaultNodeEditor {
  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createComponent_8tcnfj_a(editorContext, node);
  }

  private EditorCell createComponent_8tcnfj_a(EditorContext editorContext, SNode node) {
    AbstractCellProvider provider = new AbstractContainerCreator_Component(node);
    EditorCell editorCell = provider.createEditorCell(editorContext);
    return editorCell;
  }
}
