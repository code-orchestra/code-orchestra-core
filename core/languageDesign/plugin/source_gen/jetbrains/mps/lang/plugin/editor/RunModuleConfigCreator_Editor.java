package jetbrains.mps.lang.plugin.editor;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.DefaultNodeEditor;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.style.Style;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.cells.EditorCell_Constant;
import jetbrains.mps.baseLanguage.editor.BaseLanguageStyle_StyleSheet;
import jetbrains.mps.nodeEditor.cells.EditorCell_Indent;
import jetbrains.mps.nodeEditor.cellProviders.CellProviderWithRole;
import jetbrains.mps.lang.editor.cellProviders.RefCellCellProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.nodeEditor.EditorManager;
import jetbrains.mps.lang.editor.cellProviders.RefNodeCellProvider;
import jetbrains.mps.lang.editor.cellProviders.PropertyCellProvider;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.nodeEditor.BlockCells;
import jetbrains.mps.nodeEditor.InlineCellProvider;

public class RunModuleConfigCreator_Editor extends DefaultNodeEditor {
  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createCollection_2e5ul8_a(editorContext, node);
  }

  private EditorCell createCollection_2e5ul8_a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createVertical(editorContext, node);
    editorCell.setCellId("Collection_2e5ul8_a");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createCollection_2e5ul8_a0(editorContext, node));
    editorCell.addEditorCell(this.createCollection_2e5ul8_b0(editorContext, node));
    if (renderingCondition_2e5ul8_a2a(node, editorContext, editorContext.getOperationContext().getScope())) {
      editorCell.addEditorCell(this.createConstant_2e5ul8_c0(editorContext, node));
    }
    return editorCell;
  }

  private EditorCell createCollection_2e5ul8_a0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_2e5ul8_a0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createCollection_2e5ul8_a0a(editorContext, node));
    if (renderingCondition_2e5ul8_a1a0(node, editorContext, editorContext.getOperationContext().getScope())) {
      editorCell.addEditorCell(this.createConstant_2e5ul8_b0a(editorContext, node));
    }
    return editorCell;
  }

  private EditorCell createCollection_2e5ul8_a0a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_2e5ul8_a0a");
    editorCell.addEditorCell(this.createConstant_2e5ul8_a0a0(editorContext, node));
    editorCell.addEditorCell(this.createProperty_2e5ul8_b0a0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_2e5ul8_c0a0(editorContext, node));
    editorCell.addEditorCell(this.createRefCell_2e5ul8_d0a0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_2e5ul8_b0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_2e5ul8_b0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createIndentCell_2e5ul8_a1a(editorContext, node));
    editorCell.addEditorCell(this.createRefNode_2e5ul8_b1a(editorContext, node));
    return editorCell;
  }

  private EditorCell createConstant_2e5ul8_a0a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "run module configuration creator");
    editorCell.setCellId("Constant_2e5ul8_a0a0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_2e5ul8_c0a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "for");
    editorCell.setCellId("Constant_2e5ul8_c0a0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_2e5ul8_b0a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "{");
    editorCell.setCellId("Constant_2e5ul8_b0a");
    BaseLanguageStyle_StyleSheet.getLeftBrace(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_2e5ul8_c0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "}");
    editorCell.setCellId("Constant_2e5ul8_c0");
    BaseLanguageStyle_StyleSheet.getRightBrace(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createIndentCell_2e5ul8_a1a(EditorContext editorContext, SNode node) {
    EditorCell_Indent result = new EditorCell_Indent(editorContext, node);
    return result;
  }

  private EditorCell createRefCell_2e5ul8_d0a0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefCellCellProvider(node, editorContext);
    provider.setRole("rcType");
    provider.setNoTargetText("<no rcType>");
    EditorCell editorCell;
    provider.setAuxiliaryCellProvider(new RunModuleConfigCreator_Editor._Inline_2e5ul8_a3a0a());
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

  private EditorCell createRefNode_2e5ul8_b1a(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefNodeCellProvider(node, editorContext);
    provider.setRole("createModuleRunConfigBlock");
    provider.setNoTargetText("<no createModuleRunConfigBlock>");
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

  private EditorCell createProperty_2e5ul8_b0a0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new PropertyCellProvider(node, editorContext);
    provider.setRole("name");
    provider.setNoTargetText("<no name>");
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
    editorCell.setCellId("property_name");
    BaseLanguageStyle_StyleSheet.getClassName(editorCell).apply(editorCell);
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

  private static boolean renderingCondition_2e5ul8_a1a0(SNode node, EditorContext editorContext, IScope scope) {
    return BlockCells.useBraces();
  }

  private static boolean renderingCondition_2e5ul8_a2a(SNode node, EditorContext editorContext, IScope scope) {
    return BlockCells.useBraces();
  }

  public static class _Inline_2e5ul8_a3a0a extends InlineCellProvider {
    public _Inline_2e5ul8_a3a0a() {
      super();
    }

    public EditorCell createEditorCell(EditorContext editorContext) {
      return this.createEditorCell(editorContext, this.getSNode());
    }

    public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
      return this.createProperty_2e5ul8_a0d0a0(editorContext, node);
    }

    private EditorCell createProperty_2e5ul8_a0d0a0(EditorContext editorContext, SNode node) {
      CellProviderWithRole provider = new PropertyCellProvider(node, editorContext);
      provider.setRole("name");
      provider.setNoTargetText("<no name>");
      provider.setReadOnly(true);
      EditorCell editorCell;
      editorCell = provider.createEditorCell(editorContext);
      editorCell.setCellId("property_name_1");
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
}
