package jetbrains.mps.transformation.test.inputLang.editor;

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
import jetbrains.mps.lang.editor.cellProviders.PropertyCellProvider;

public class InputRootWithStatementList_Editor extends DefaultNodeEditor {
  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createCollection_9a4nm0_a(editorContext, node);
  }

  private EditorCell createCollection_9a4nm0_a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createVertical(editorContext, node);
    editorCell.setCellId("Collection_9a4nm0_a");
    editorCell.addEditorCell(this.createCollection_9a4nm0_a0(editorContext, node));
    editorCell.addEditorCell(this.createCollection_9a4nm0_b0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_9a4nm0_c0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_9a4nm0_d0(editorContext, node));
    editorCell.addEditorCell(this.createCollection_9a4nm0_e0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_9a4nm0_a0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_9a4nm0_a0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createConstant_9a4nm0_a0a(editorContext, node));
    editorCell.addEditorCell(this.createConstant_9a4nm0_b0a(editorContext, node));
    editorCell.addEditorCell(this.createProperty_9a4nm0_c0a(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_9a4nm0_b0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_9a4nm0_b0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createConstant_9a4nm0_a1a(editorContext, node));
    editorCell.addEditorCell(this.createConstant_9a4nm0_b1a(editorContext, node));
    editorCell.addEditorCell(this.createProperty_9a4nm0_c1a(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_9a4nm0_e0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_9a4nm0_e0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createIndentCell_9a4nm0_a4a(editorContext, node));
    editorCell.addEditorCell(this.createRefNode_9a4nm0_b4a(editorContext, node));
    return editorCell;
  }

  private EditorCell createConstant_9a4nm0_a0a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "input root");
    editorCell.setCellId("Constant_9a4nm0_a0a");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_9a4nm0_b0a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, ":");
    editorCell.setCellId("Constant_9a4nm0_b0a");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_9a4nm0_a1a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "useInTest");
    editorCell.setCellId("Constant_9a4nm0_a1a");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_9a4nm0_b1a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, ":");
    editorCell.setCellId("Constant_9a4nm0_b1a");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_9a4nm0_c0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "");
    editorCell.setCellId("Constant_9a4nm0_c0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_9a4nm0_d0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "statement list:");
    editorCell.setCellId("Constant_9a4nm0_d0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createIndentCell_9a4nm0_a4a(EditorContext editorContext, SNode node) {
    EditorCell_Indent result = new EditorCell_Indent(editorContext, node);
    return result;
  }

  private EditorCell createRefNode_9a4nm0_b4a(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefNodeCellProvider(node, editorContext);
    provider.setRole("statementList");
    provider.setNoTargetText("<no statementList>");
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

  private EditorCell createProperty_9a4nm0_c0a(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new PropertyCellProvider(node, editorContext);
    provider.setRole("name");
    provider.setNoTargetText("<no name>");
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
    editorCell.setCellId("property_name");
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

  private EditorCell createProperty_9a4nm0_c1a(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new PropertyCellProvider(node, editorContext);
    provider.setRole("useInTest");
    provider.setNoTargetText("<no useInTest>");
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
    editorCell.setCellId("property_useInTest");
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
