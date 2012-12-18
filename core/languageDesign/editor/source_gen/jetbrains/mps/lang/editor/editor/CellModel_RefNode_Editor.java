package jetbrains.mps.lang.editor.editor;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.DefaultNodeEditor;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.style.Style;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.AbstractCellProvider;
import jetbrains.mps.nodeEditor.cells.EditorCell_Constant;
import jetbrains.mps.nodeEditor.cellProviders.CellProviderWithRole;
import jetbrains.mps.lang.editor.cellProviders.RefCellCellProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.nodeEditor.EditorManager;
import jetbrains.mps.lang.editor.cellProviders.PropertyCellProvider;
import jetbrains.mps.nodeEditor.MPSColors;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.nodeEditor.InlineCellProvider;

public class CellModel_RefNode_Editor extends DefaultNodeEditor {
  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createCollection_2hk56f_a(editorContext, node);
  }

  public EditorCell createInspectedCell(EditorContext editorContext, SNode node) {
    return this.createCollection_2hk56f_a_0(editorContext, node);
  }

  private EditorCell createCollection_2hk56f_a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_2hk56f_a");
    Styles_StyleSheet.getRootCellModelStyle(editorCell).apply(editorCell);
    editorCell.addEditorCell(this.createComponent_2hk56f_a0(editorContext, node));
    editorCell.addEditorCell(this.createRefCell_2hk56f_b0(editorContext, node));
    editorCell.addEditorCell(this.createComponent_2hk56f_c0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_2hk56f_a_0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createVertical(editorContext, node);
    editorCell.setCellId("Collection_2hk56f_a_0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createComponent_2hk56f_a0_0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_2hk56f_b0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_2hk56f_c0(editorContext, node));
    editorCell.addEditorCell(this.createCollection_2hk56f_d0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_2hk56f_d0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createVertical(editorContext, node);
    editorCell.setCellId("Collection_2hk56f_d0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.DRAW_BORDER, true);
    }
    editorCell.setGridLayout(true);
    editorCell.addEditorCell(this.createCollection_2hk56f_a3a(editorContext, node));
    editorCell.addEditorCell(this.createCollection_2hk56f_b3a(editorContext, node));
    if (renderingCondition_2hk56f_a2d0(node, editorContext, editorContext.getOperationContext().getScope())) {
      editorCell.addEditorCell(this.createCollection_2hk56f_c3a(editorContext, node));
    }
    return editorCell;
  }

  private EditorCell createCollection_2hk56f_a3a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_2hk56f_a3a");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
      style.set(StyleAttributes.DRAW_BORDER, true);
    }
    editorCell.addEditorCell(this.createConstant_2hk56f_a0d0(editorContext, node));
    editorCell.addEditorCell(this.createRefCell_2hk56f_b0d0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_2hk56f_b3a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_2hk56f_b3a");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
      style.set(StyleAttributes.DRAW_BORDER, true);
    }
    editorCell.addEditorCell(this.createConstant_2hk56f_a1d0(editorContext, node));
    editorCell.addEditorCell(this.createProperty_2hk56f_b1d0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_2hk56f_c3a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_2hk56f_c3a");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
      style.set(StyleAttributes.DRAW_BORDER, true);
    }
    editorCell.addEditorCell(this.createConstant_2hk56f_a2d0(editorContext, node));
    editorCell.addEditorCell(this.createProperty_2hk56f_b2d0(editorContext, node));
    return editorCell;
  }

  private EditorCell createComponent_2hk56f_a0(EditorContext editorContext, SNode node) {
    AbstractCellProvider provider = new _OpenTag(node);
    EditorCell editorCell = provider.createEditorCell(editorContext);
    return editorCell;
  }

  private EditorCell createComponent_2hk56f_c0(EditorContext editorContext, SNode node) {
    AbstractCellProvider provider = new _CloseTag(node);
    EditorCell editorCell = provider.createEditorCell(editorContext);
    return editorCell;
  }

  private EditorCell createComponent_2hk56f_a0_0(EditorContext editorContext, SNode node) {
    AbstractCellProvider provider = new _CellModel_Common(node);
    EditorCell editorCell = provider.createEditorCell(editorContext);
    return editorCell;
  }

  private EditorCell createConstant_2hk56f_b0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "");
    editorCell.setCellId("Constant_2hk56f_b0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_2hk56f_c0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "Ref.node cell:");
    editorCell.setCellId("Constant_2hk56f_c0");
    Styles_StyleSheet.getHeader(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_2hk56f_a0d0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "link");
    editorCell.setCellId("Constant_2hk56f_a0d0");
    Styles_StyleSheet.getProperty(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_2hk56f_a1d0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "text*");
    editorCell.setCellId("Constant_2hk56f_a1d0");
    Styles_StyleSheet.getProperty(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_2hk56f_a2d0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "empty text*");
    editorCell.setCellId("Constant_2hk56f_a2d0");
    Styles_StyleSheet.getProperty(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createRefCell_2hk56f_b0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefCellCellProvider(node, editorContext);
    provider.setRole("linkDeclaration");
    provider.setNoTargetText("<no link>");
    EditorCell editorCell;
    provider.setAuxiliaryCellProvider(new CellModel_RefNode_Editor._Inline_2hk56f_a1a());
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

  private EditorCell createRefCell_2hk56f_b0d0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefCellCellProvider(node, editorContext);
    provider.setRole("linkDeclaration");
    provider.setNoTargetText("<no link>");
    EditorCell editorCell;
    provider.setAuxiliaryCellProvider(new CellModel_RefNode_Editor._Inline_2hk56f_a1a3a());
    editorCell = provider.createEditorCell(editorContext);
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.DRAW_BORDER, true);
    }
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

  private EditorCell createProperty_2hk56f_b1d0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new PropertyCellProvider(node, editorContext);
    provider.setRole("noTargetText");
    provider.setNoTargetText("<none>");
    provider.setAllowsEmptyTarget(true);
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
    editorCell.setCellId("property_noTargetText");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.DRAW_BORDER, true);
      style.set(StyleAttributes.TEXT_BACKGROUND_COLOR, MPSColors.yellow);
      style.set(StyleAttributes.SELECTED_TEXT_BACKGROUND_COLOR, MPSColors.cyan);
    }
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

  private EditorCell createProperty_2hk56f_b2d0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new PropertyCellProvider(node, editorContext);
    provider.setRole("emptyNoTargetText");
    provider.setNoTargetText("<none>");
    provider.setAllowsEmptyTarget(true);
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
    editorCell.setCellId("property_emptyNoTargetText");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.DRAW_BORDER, true);
      style.set(StyleAttributes.TEXT_BACKGROUND_COLOR, MPSColors.yellow);
      style.set(StyleAttributes.SELECTED_TEXT_BACKGROUND_COLOR, MPSColors.cyan);
    }
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

  private static boolean renderingCondition_2hk56f_a2d0(SNode node, EditorContext editorContext, IScope scope) {
    return SPropertyOperations.getString(node, "noTargetText") == null;
  }

  public static class _Inline_2hk56f_a1a extends InlineCellProvider {
    public _Inline_2hk56f_a1a() {
      super();
    }

    public EditorCell createEditorCell(EditorContext editorContext) {
      return this.createEditorCell(editorContext, this.getSNode());
    }

    public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
      return this.createProperty_2hk56f_a0b0(editorContext, node);
    }

    private EditorCell createProperty_2hk56f_a0b0(EditorContext editorContext, SNode node) {
      CellProviderWithRole provider = new PropertyCellProvider(node, editorContext);
      provider.setRole("role");
      provider.setNoTargetText("<no role>");
      provider.setReadOnly(true);
      EditorCell editorCell;
      editorCell = provider.createEditorCell(editorContext);
      editorCell.setCellId("property_role");
      {
        Style style = editorCell.getStyle();
        style.set(StyleAttributes.DRAW_BORDER, true);
      }
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

  public static class _Inline_2hk56f_a1a3a extends InlineCellProvider {
    public _Inline_2hk56f_a1a3a() {
      super();
    }

    public EditorCell createEditorCell(EditorContext editorContext) {
      return this.createEditorCell(editorContext, this.getSNode());
    }

    public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
      return this.createProperty_2hk56f_a0b0d0(editorContext, node);
    }

    private EditorCell createProperty_2hk56f_a0b0d0(EditorContext editorContext, SNode node) {
      CellProviderWithRole provider = new PropertyCellProvider(node, editorContext);
      provider.setRole("role");
      provider.setNoTargetText("<no role>");
      provider.setReadOnly(true);
      EditorCell editorCell;
      editorCell = provider.createEditorCell(editorContext);
      editorCell.setCellId("property_role_1");
      {
        Style style = editorCell.getStyle();
        style.set(StyleAttributes.DRAW_BORDER, true);
      }
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
