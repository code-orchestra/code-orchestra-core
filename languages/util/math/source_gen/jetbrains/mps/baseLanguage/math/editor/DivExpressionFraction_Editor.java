package jetbrains.mps.baseLanguage.math.editor;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.DefaultNodeEditor;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.style.Style;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.style.CellAlign;
import jetbrains.mps.nodeEditor.AbstractCellProvider;
import jetbrains.mps.baseLanguage.closures.runtime._FunctionTypes;
import jetbrains.mps.baseLanguage.math.plugin.HLineCellProvider;
import jetbrains.mps.nodeEditor.cellProviders.CellProviderWithRole;
import jetbrains.mps.lang.editor.cellProviders.RefNodeCellProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.nodeEditor.EditorManager;
import jetbrains.mps.editor.runtime.EditorCell_Empty;

public class DivExpressionFraction_Editor extends DefaultNodeEditor {
  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createCollection_ksgn1c_a(editorContext, node);
  }

  private EditorCell createCollection_ksgn1c_a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createIndent2(editorContext, node);
    editorCell.setCellId("Collection_ksgn1c_a");
    editorCell.addEditorCell(this.createEmpty_ksgn1c_a0(editorContext, node));
    editorCell.addEditorCell(this.createCollection_ksgn1c_b0(editorContext, node));
    editorCell.addEditorCell(this.createEmpty_ksgn1c_c0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_ksgn1c_b0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createVertical(editorContext, node);
    editorCell.setCellId("Collection_ksgn1c_b0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, true);
      style.set(StyleAttributes.HORIZONTAL_ALIGN, CellAlign.CENTER);
    }
    editorCell.addEditorCell(this.createRefNode_ksgn1c_a1a(editorContext, node));
    editorCell.addEditorCell(this.createCustom_ksgn1c_b1a(editorContext, node));
    editorCell.addEditorCell(this.createRefNode_ksgn1c_c1a(editorContext, node));
    return editorCell;
  }

  private EditorCell createCustom_ksgn1c_b1a(final EditorContext editorContext, final SNode node) {
    AbstractCellProvider provider = new _FunctionTypes._return_P0_E0<HLineCellProvider>() {
      public HLineCellProvider invoke() {
        return new HLineCellProvider(node);
      }
    }.invoke();
    EditorCell editorCell = provider.createEditorCell(editorContext);
    editorCell.setCellId("Custom_ksgn1c_b1a");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.BASE_LINE_CELL, true);
    }
    return editorCell;
  }

  private EditorCell createRefNode_ksgn1c_a1a(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefNodeCellProvider(node, editorContext);
    provider.setRole("numerator");
    provider.setNoTargetText("<no numerator>");
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
    delete_numerator.setCellActions(editorCell, node, editorContext);
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

  private EditorCell createRefNode_ksgn1c_c1a(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefNodeCellProvider(node, editorContext);
    provider.setRole("denominator");
    provider.setNoTargetText("<no denominator>");
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
    delete_denominator.setCellActions(editorCell, node, editorContext);
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

  private EditorCell createEmpty_ksgn1c_a0(EditorContext editorContext, SNode node) {
    EditorCell_Empty editorCell = new EditorCell_Empty(editorContext, node);
    editorCell.setCellId("Empty_ksgn1c_a0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.PUNCTUATION_RIGHT, true);
    }
    return editorCell;
  }

  private EditorCell createEmpty_ksgn1c_c0(EditorContext editorContext, SNode node) {
    EditorCell_Empty editorCell = new EditorCell_Empty(editorContext, node);
    editorCell.setCellId("Empty_ksgn1c_c0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.PUNCTUATION_LEFT, true);
    }
    return editorCell;
  }
}
