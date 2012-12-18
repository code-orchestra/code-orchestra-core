package jetbrains.mps.ui.modeling.editor;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.DefaultNodeEditor;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.cells.EditorCell_Constant;
import jetbrains.mps.nodeEditor.cellProviders.CellProviderWithRole;
import jetbrains.mps.lang.editor.cellProviders.RefNodeCellProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.nodeEditor.EditorManager;

public class VerticalConstraint_Editor extends DefaultNodeEditor {
  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createCollection_f02xlo_a(editorContext, node);
  }

  private EditorCell createCollection_f02xlo_a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_f02xlo_a");
    editorCell.addEditorCell(this.createConstant_f02xlo_a0(editorContext, node));
    editorCell.addEditorCell(this.createRefNode_f02xlo_b0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_f02xlo_c0(editorContext, node));
    editorCell.addEditorCell(this.createRefNode_f02xlo_d0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_f02xlo_e0(editorContext, node));
    editorCell.addEditorCell(this.createRefNode_f02xlo_f0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_f02xlo_g0(editorContext, node));
    return editorCell;
  }

  private EditorCell createConstant_f02xlo_a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "|-");
    editorCell.setCellId("Constant_f02xlo_a0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_f02xlo_c0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "-[");
    editorCell.setCellId("Constant_f02xlo_c0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_f02xlo_e0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "]-");
    editorCell.setCellId("Constant_f02xlo_e0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_f02xlo_g0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "-|");
    editorCell.setCellId("Constant_f02xlo_g0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createRefNode_f02xlo_b0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefNodeCellProvider(node, editorContext);
    provider.setRole("top");
    provider.setNoTargetText("..");
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
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

  private EditorCell createRefNode_f02xlo_d0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefNodeCellProvider(node, editorContext);
    provider.setRole("height");
    provider.setNoTargetText("..");
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
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

  private EditorCell createRefNode_f02xlo_f0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefNodeCellProvider(node, editorContext);
    provider.setRole("bottom");
    provider.setNoTargetText("..");
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
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
