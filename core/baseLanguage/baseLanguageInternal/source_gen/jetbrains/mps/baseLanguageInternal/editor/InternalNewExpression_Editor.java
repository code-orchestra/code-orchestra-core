package jetbrains.mps.baseLanguageInternal.editor;

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
import jetbrains.mps.nodeEditor.MPSFonts;
import jetbrains.mps.nodeEditor.cellProviders.AbstractCellListHandler;
import jetbrains.mps.nodeEditor.cellLayout.CellLayout_Indent;
import jetbrains.mps.nodeEditor.FocusPolicy;
import jetbrains.mps.nodeEditor.cellProviders.CellProviderWithRole;
import jetbrains.mps.lang.editor.cellProviders.RefNodeCellProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.nodeEditor.EditorManager;
import jetbrains.mps.lang.editor.cellProviders.PropertyCellProvider;
import jetbrains.mps.lang.editor.cellProviders.RefNodeListHandler;
import jetbrains.mps.smodel.action.NodeFactoryManager;
import jetbrains.mps.nodeEditor.CellActionType;
import jetbrains.mps.nodeEditor.cellActions.CellAction_DeleteNode;
import jetbrains.mps.nodeEditor.cellMenu.DefaultReferenceSubstituteInfo;
import jetbrains.mps.nodeEditor.cellMenu.DefaultChildSubstituteInfo;
import jetbrains.mps.lang.editor.cellProviders.RefNodeListHandlerElementKeyMap;

public class InternalNewExpression_Editor extends DefaultNodeEditor {
  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createCollection_svbh7s_a(editorContext, node);
  }

  public EditorCell createInspectedCell(EditorContext editorContext, SNode node) {
    return this.createCollection_svbh7s_a_0(editorContext, node);
  }

  private EditorCell createCollection_svbh7s_a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createIndent2(editorContext, node);
    editorCell.setCellId("Collection_svbh7s_a");
    editorCell.addEditorCell(this.createConstant_svbh7s_a0(editorContext, node));
    editorCell.addEditorCell(this.createRefNode_svbh7s_b0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_c0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_d0(editorContext, node));
    editorCell.addEditorCell(this.createProperty_svbh7s_e0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_f0(editorContext, node));
    editorCell.addEditorCell(this.createRefNodeList_svbh7s_g0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_h0(editorContext, node));
    editorCell.addEditorCell(this.createCollection_svbh7s_i0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_svbh7s_i0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createIndent2(editorContext, node);
    editorCell.setCellId("Collection_svbh7s_i0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createConstant_svbh7s_a8a(editorContext, node));
    editorCell.addEditorCell(this.createRefNodeList_svbh7s_b8a(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_c8a(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_svbh7s_a_0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createFlow(editorContext, node);
    editorCell.setCellId("Collection_svbh7s_a_0");
    editorCell.addEditorCell(this.createConstant_svbh7s_a0_0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_b0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_c0_0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_d0_0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_e0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_f0_0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_g0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_h0_0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_i0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_j0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_k0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_l0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_m0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_svbh7s_n0(editorContext, node));
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "[");
    editorCell.setCellId("Constant_svbh7s_a0");
    StyleSheet_StyleSheet.getSquareBracket(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_c0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "]");
    editorCell.setCellId("Constant_svbh7s_c0");
    StyleSheet_StyleSheet.getSquareBracket(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_d0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "new");
    editorCell.setCellId("Constant_svbh7s_d0");
    StyleSheet_StyleSheet.getInternalKeyword(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_f0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "<");
    editorCell.setCellId("Constant_svbh7s_f0");
    BaseLanguageStyle_StyleSheet.getBaseAngleBracket(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_h0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, ">");
    editorCell.setCellId("Constant_svbh7s_h0");
    BaseLanguageStyle_StyleSheet.getBaseAngleBracket(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_a8a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "(");
    editorCell.setCellId("Constant_svbh7s_a8a");
    BaseLanguageStyle_StyleSheet.getLeftParenAfterName(editorCell).apply(editorCell);
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.FONT_STYLE, MPSFonts.PLAIN);
    }
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_c8a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, ")");
    editorCell.setCellId("Constant_svbh7s_c8a");
    BaseLanguageStyle_StyleSheet.getRightParen(editorCell).apply(editorCell);
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, true);
      style.set(StyleAttributes.FONT_STYLE, MPSFonts.PLAIN);
      style.set(StyleAttributes.EDITABLE, false);
    }
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_a0_0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "Package");
    editorCell.setCellId("Constant_svbh7s_a0_0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_b0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "name");
    editorCell.setCellId("Constant_svbh7s_b0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_c0_0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "may");
    editorCell.setCellId("Constant_svbh7s_c0_0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_d0_0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "be");
    editorCell.setCellId("Constant_svbh7s_d0_0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_e0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "splitted");
    editorCell.setCellId("Constant_svbh7s_e0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_f0_0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "from");
    editorCell.setCellId("Constant_svbh7s_f0_0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_g0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "short");
    editorCell.setCellId("Constant_svbh7s_g0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_h0_0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "class");
    editorCell.setCellId("Constant_svbh7s_h0_0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_i0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "name");
    editorCell.setCellId("Constant_svbh7s_i0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_j0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "with");
    editorCell.setCellId("Constant_svbh7s_j0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_k0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "either");
    editorCell.setCellId("Constant_svbh7s_k0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_l0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "'.'");
    editorCell.setCellId("Constant_svbh7s_l0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_m0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "or");
    editorCell.setCellId("Constant_svbh7s_m0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_svbh7s_n0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "'!'");
    editorCell.setCellId("Constant_svbh7s_n0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createRefNodeList_svbh7s_g0(EditorContext editorContext, SNode node) {
    AbstractCellListHandler handler = new InternalNewExpression_Editor.parameterListHandler_svbh7s_g0(node, "parameter", editorContext);
    EditorCell_Collection editorCell = handler.createCells(editorContext, new CellLayout_Indent(), false);
    editorCell.setCellId("refNodeList_parameter");
    editorCell.setRole(handler.getElementRole());
    return editorCell;
  }

  private EditorCell createRefNodeList_svbh7s_b8a(EditorContext editorContext, SNode node) {
    AbstractCellListHandler handler = new InternalNewExpression_Editor.actualArgumentListHandler_svbh7s_b8a(node, "actualArgument", editorContext);
    EditorCell_Collection editorCell = handler.createCells(editorContext, new CellLayout_Indent(), false);
    editorCell.setCellId("refNodeList_actualArgument");
    if (true) {
      editorCell.setFocusPolicy(FocusPolicy.FIRST_EDITABLE_CELL);
    }
    editorCell.setRole(handler.getElementRole());
    return editorCell;
  }

  private EditorCell createRefNode_svbh7s_b0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefNodeCellProvider(node, editorContext);
    provider.setRole("type");
    provider.setNoTargetText("no type");
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

  private EditorCell createProperty_svbh7s_e0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new PropertyCellProvider(node, editorContext);
    provider.setRole("fqClassName");
    provider.setNoTargetText("<no fqClassName>");
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
    editorCell.setCellId("property_fqClassName");
    StyleSheet_StyleSheet.getInternalName(editorCell).apply(editorCell);
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

  private static class parameterListHandler_svbh7s_g0 extends RefNodeListHandler {
    public parameterListHandler_svbh7s_g0(SNode ownerNode, String childRole, EditorContext context) {
      super(ownerNode, childRole, context, false);
    }

    public SNode createNodeToInsert(EditorContext editorContext) {
      SNode listOwner = super.getOwner();
      return NodeFactoryManager.createNode(listOwner, editorContext, super.getElementRole());
    }

    public EditorCell createNodeCell(EditorContext editorContext, SNode elementNode) {
      EditorCell elementCell = super.createNodeCell(editorContext, elementNode);
      this.installElementCellActions(this.getOwner(), elementNode, elementCell, editorContext);
      return elementCell;
    }

    public EditorCell createEmptyCell(EditorContext editorContext) {
      EditorCell emptyCell = null;
      emptyCell = super.createEmptyCell(editorContext);
      this.installElementCellActions(super.getOwner(), null, emptyCell, editorContext);
      return emptyCell;
    }

    public void installElementCellActions(SNode listOwner, SNode elementNode, EditorCell elementCell, EditorContext editorContext) {
      if (elementCell.getUserObject(AbstractCellListHandler.ELEMENT_CELL_ACTIONS_SET) == null) {
        elementCell.putUserObject(AbstractCellListHandler.ELEMENT_CELL_ACTIONS_SET, AbstractCellListHandler.ELEMENT_CELL_ACTIONS_SET);
        if (elementNode != null) {
          elementCell.setAction(CellActionType.DELETE, new CellAction_DeleteNode(elementNode));
        }
        if (elementCell.getSubstituteInfo() == null || elementCell.getSubstituteInfo() instanceof DefaultReferenceSubstituteInfo) {
          elementCell.setSubstituteInfo(new DefaultChildSubstituteInfo(listOwner, elementNode, super.getLinkDeclaration(), editorContext));
        }
      }
    }
  }

  private static class actualArgumentListHandler_svbh7s_b8a extends RefNodeListHandler {
    public actualArgumentListHandler_svbh7s_b8a(SNode ownerNode, String childRole, EditorContext context) {
      super(ownerNode, childRole, context, false);
    }

    public SNode createNodeToInsert(EditorContext editorContext) {
      SNode listOwner = super.getOwner();
      return NodeFactoryManager.createNode(listOwner, editorContext, super.getElementRole());
    }

    public EditorCell createNodeCell(EditorContext editorContext, SNode elementNode) {
      EditorCell elementCell = super.createNodeCell(editorContext, elementNode);
      this.installElementCellActions(this.getOwner(), elementNode, elementCell, editorContext);
      return elementCell;
    }

    public EditorCell createEmptyCell(EditorContext editorContext) {
      EditorCell emptyCell = null;
      emptyCell = this.createEmptyCell_internal(editorContext, this.getOwner());
      this.installElementCellActions(super.getOwner(), null, emptyCell, editorContext);
      return emptyCell;
    }

    public EditorCell createEmptyCell_internal(EditorContext editorContext, SNode node) {
      return this.createConstant_svbh7s_a1i0(editorContext, node);
    }

    public void installElementCellActions(SNode listOwner, SNode elementNode, EditorCell elementCell, EditorContext editorContext) {
      if (elementCell.getUserObject(AbstractCellListHandler.ELEMENT_CELL_ACTIONS_SET) == null) {
        elementCell.putUserObject(AbstractCellListHandler.ELEMENT_CELL_ACTIONS_SET, AbstractCellListHandler.ELEMENT_CELL_ACTIONS_SET);
        if (elementNode != null) {
          elementCell.setAction(CellActionType.DELETE, new CellAction_DeleteNode(elementNode));
          elementCell.addKeyMap(new RefNodeListHandlerElementKeyMap(this, ","));
        }
        if (elementCell.getSubstituteInfo() == null || elementCell.getSubstituteInfo() instanceof DefaultReferenceSubstituteInfo) {
          elementCell.setSubstituteInfo(new DefaultChildSubstituteInfo(listOwner, elementNode, super.getLinkDeclaration(), editorContext));
        }
      }
    }

    @Override
    public EditorCell createSeparatorCell(EditorContext editorContext, SNode node) {
      EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, this.getOwner(), ",");
      editorCell.setSelectable(false);
      editorCell.getStyle().set(StyleAttributes.LAYOUT_CONSTRAINT, "");
      editorCell.getStyle().set(StyleAttributes.PUNCTUATION_LEFT, true);
      return editorCell;
    }

    private EditorCell createConstant_svbh7s_a1i0(EditorContext editorContext, SNode node) {
      EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "");
      editorCell.setCellId("Constant_svbh7s_a1i0");
      {
        Style style = editorCell.getStyle();
        style.set(StyleAttributes.SELECTABLE, true);
        style.set(StyleAttributes.EDITABLE, true);
        style.set(StyleAttributes.INDENT_LAYOUT_NO_WRAP, true);
      }
      editorCell.setDefaultText("");
      return editorCell;
    }
  }
}
