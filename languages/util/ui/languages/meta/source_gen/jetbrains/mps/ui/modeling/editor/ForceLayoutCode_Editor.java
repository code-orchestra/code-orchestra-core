package jetbrains.mps.ui.modeling.editor;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.DefaultNodeEditor;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.style.Style;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.cells.EditorCell_Constant;
import jetbrains.mps.nodeEditor.cells.EditorCell_Indent;
import jetbrains.mps.nodeEditor.cellProviders.CellProviderWithRole;
import jetbrains.mps.lang.editor.cellProviders.RefNodeCellProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.nodeEditor.EditorManager;

public class ForceLayoutCode_Editor extends DefaultNodeEditor {
  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createCollection_owhuo5_a(editorContext, node);
  }

  private EditorCell createCollection_owhuo5_a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createVertical(editorContext, node);
    editorCell.setCellId("Collection_owhuo5_a");
    editorCell.addEditorCell(this.createCollection_owhuo5_a0(editorContext, node));
    editorCell.addEditorCell(this.createCollection_owhuo5_b0(editorContext, node));
    editorCell.addEditorCell(this.createCollection_owhuo5_c0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_owhuo5_a0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_owhuo5_a0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createConstant_owhuo5_a0a(editorContext, node));
    editorCell.addEditorCell(this.createConstant_owhuo5_b0a(editorContext, node));
    editorCell.addEditorCell(this.createConstant_owhuo5_c0a(editorContext, node));
    editorCell.addEditorCell(this.createConstant_owhuo5_d0a(editorContext, node));
    editorCell.addEditorCell(this.createConstant_owhuo5_e0a(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_owhuo5_b0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_owhuo5_b0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createIndentCell_owhuo5_a1a(editorContext, node));
    editorCell.addEditorCell(this.createRefNode_owhuo5_b1a(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_owhuo5_c0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_owhuo5_c0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createConstant_owhuo5_a2a(editorContext, node));
    return editorCell;
  }

  private EditorCell createConstant_owhuo5_a0a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "(");
    editorCell.setCellId("Constant_owhuo5_a0a");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_owhuo5_b0a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, ")");
    editorCell.setCellId("Constant_owhuo5_b0a");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_owhuo5_c0a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "->");
    editorCell.setCellId("Constant_owhuo5_c0a");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_owhuo5_d0a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "void");
    editorCell.setCellId("Constant_owhuo5_d0a");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_owhuo5_e0a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "{");
    editorCell.setCellId("Constant_owhuo5_e0a");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_owhuo5_a2a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "}");
    editorCell.setCellId("Constant_owhuo5_a2a");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createIndentCell_owhuo5_a1a(EditorContext editorContext, SNode node) {
    EditorCell_Indent result = new EditorCell_Indent(editorContext, node);
    return result;
  }

  private EditorCell createRefNode_owhuo5_b1a(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefNodeCellProvider(node, editorContext);
    provider.setRole("body");
    provider.setNoTargetText("<no body>");
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
