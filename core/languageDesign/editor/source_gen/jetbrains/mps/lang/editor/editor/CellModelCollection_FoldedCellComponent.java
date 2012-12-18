package jetbrains.mps.lang.editor.editor;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.AbstractCellProvider;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.cells.EditorCell_Constant;
import jetbrains.mps.nodeEditor.cellProviders.CellProviderWithRole;
import jetbrains.mps.lang.editor.cellProviders.RefNodeCellProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.nodeEditor.EditorManager;

public class CellModelCollection_FoldedCellComponent extends AbstractCellProvider {
  public CellModelCollection_FoldedCellComponent(SNode node) {
    super(node);
  }

  public EditorCell createEditorCell(EditorContext editorContext) {
    return this.createEditorCell(editorContext, this.getSNode());
  }

  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createCollection_9yikpc_a(editorContext, node);
  }

  private EditorCell createCollection_9yikpc_a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_9yikpc_a");
    Styles_StyleSheet.getBorderedCollection(editorCell).apply(editorCell);
    editorCell.addEditorCell(this.createConstant_9yikpc_a0(editorContext, node));
    editorCell.addEditorCell(this.createRefNode_9yikpc_b0(editorContext, node));
    return editorCell;
  }

  private EditorCell createConstant_9yikpc_a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "/folded cell:");
    editorCell.setCellId("Constant_9yikpc_a0");
    Styles_StyleSheet.getBordered(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createRefNode_9yikpc_b0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefNodeCellProvider(node, editorContext);
    provider.setRole("foldedCellModel");
    provider.setNoTargetText("<default>");
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
    Styles_StyleSheet.getBordered(editorCell).apply(editorCell);
    editorCell.setSubstituteInfo(provider.createDefaultSubstituteInfo());
    SNode attributeConcept = provider.getRoleAttribute();
    Class attributeKind = provider.getRoleAttributeClass();
    if (attributeConcept != null) {
      IOperationContext opContext = editorContext.getOperationContext();
      EditorManager manager = EditorManager.getInstanceFromContext(opContext);
      return manager.createRoleAttributeCell(editorContext, attributeConcept, attributeKind, editorCell);
    } else
    return editorCell;
  }
}
