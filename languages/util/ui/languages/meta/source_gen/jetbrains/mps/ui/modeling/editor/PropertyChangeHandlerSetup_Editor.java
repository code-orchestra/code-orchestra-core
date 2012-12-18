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
import jetbrains.mps.nodeEditor.cells.EditorCell_Property;
import jetbrains.mps.nodeEditor.cells.ModelAccessor;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.core.behavior.BaseConcept_Behavior;
import jetbrains.mps.util.EqualUtil;
import jetbrains.mps.nodeEditor.CellActionType;
import jetbrains.mps.nodeEditor.cellActions.CellAction_Empty;
import jetbrains.mps.nodeEditor.cells.EditorCell_Indent;
import jetbrains.mps.nodeEditor.cellProviders.CellProviderWithRole;
import jetbrains.mps.lang.editor.cellProviders.RefNodeCellProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.nodeEditor.EditorManager;
import java.util.Set;
import java.util.HashSet;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.lang.typesystem.runtime.HUtil;

public class PropertyChangeHandlerSetup_Editor extends DefaultNodeEditor {
  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createCollection_mum76i_a(editorContext, node);
  }

  private EditorCell createCollection_mum76i_a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createVertical(editorContext, node);
    editorCell.setCellId("Collection_mum76i_a");
    editorCell.addEditorCell(this.createCollection_mum76i_a0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_mum76i_a0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createVertical(editorContext, node);
    editorCell.setCellId("Collection_mum76i_a0");
    editorCell.addEditorCell(this.createCollection_mum76i_a0a(editorContext, node));
    editorCell.addEditorCell(this.createCollection_mum76i_b0a(editorContext, node));
    editorCell.addEditorCell(this.createCollection_mum76i_c0a(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_mum76i_a0a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_mum76i_a0a");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createConstant_mum76i_a0a0(editorContext, node));
    editorCell.addEditorCell(this.createReadOnlyModelAccessor_mum76i_b0a0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_mum76i_c0a0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_mum76i_d0a0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_mum76i_e0a0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_mum76i_f0a0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_mum76i_g0a0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_mum76i_b0a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_mum76i_b0a");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createIndentCell_mum76i_a1a0(editorContext, node));
    editorCell.addEditorCell(this.createRefNode_mum76i_b1a0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_mum76i_c0a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_mum76i_c0a");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createConstant_mum76i_a2a0(editorContext, node));
    return editorCell;
  }

  private EditorCell createConstant_mum76i_a0a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "(");
    editorCell.setCellId("Constant_mum76i_a0a0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_mum76i_c0a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "handler");
    editorCell.setCellId("Constant_mum76i_c0a0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_mum76i_d0a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, ")");
    editorCell.setCellId("Constant_mum76i_d0a0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_mum76i_e0a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "->");
    editorCell.setCellId("Constant_mum76i_e0a0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_mum76i_f0a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "void");
    editorCell.setCellId("Constant_mum76i_f0a0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_mum76i_g0a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "{");
    editorCell.setCellId("Constant_mum76i_g0a0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_mum76i_a2a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "}");
    editorCell.setCellId("Constant_mum76i_a2a0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createReadOnlyModelAccessor_mum76i_b0a0(final EditorContext editorContext, final SNode node) {
    EditorCell_Property editorCell = EditorCell_Property.create(editorContext, new ModelAccessor() {
      public String getText() {
        SNode pt = SLinkOperations.getTarget(SLinkOperations.getTarget(SNodeOperations.getAncestor(node, "jetbrains.mps.ui.modeling.structure.EditableUIPropertyAccessCode", false, false), "property", false), "dataType", true);
        SNode res = new PropertyChangeHandlerSetup_Editor.QuotationClass_mum76i_a0a1a0a0b0a0a31().createNode(pt);
        return BaseConcept_Behavior.call_getPresentation_1213877396640(res);
      }

      public void setText(String s) {
      }

      public boolean isValidText(String s) {
        return EqualUtil.equals(s, this.getText());
      }
    }, node);
    editorCell.setAction(CellActionType.DELETE, new CellAction_Empty());
    editorCell.setCellId("ReadOnlyModelAccessor_mum76i_b0a0");
    return editorCell;
  }

  private EditorCell createIndentCell_mum76i_a1a0(EditorContext editorContext, SNode node) {
    EditorCell_Indent result = new EditorCell_Indent(editorContext, node);
    return result;
  }

  private EditorCell createRefNode_mum76i_b1a0(EditorContext editorContext, SNode node) {
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

  public static class QuotationClass_mum76i_a0a1a0a0b0a0a31 {
    public QuotationClass_mum76i_a0a1a0a0b0a0a31() {
    }

    public SNode createNode(Object parameter_7) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      SNode quotedNode_2 = null;
      SNode quotedNode_3 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.closures.structure.FunctionType", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_4 = quotedNode_1;
        {
          quotedNode_2 = (SNode) parameter_7;
          SNode quotedNode1_5;
          if (_parameterValues_129834374.contains(quotedNode_2)) {
            quotedNode1_5 = HUtil.copyIfNecessary(quotedNode_2);
          } else {
            _parameterValues_129834374.add(quotedNode_2);
            quotedNode1_5 = quotedNode_2;
          }
          if (quotedNode1_5 != null) {
            quotedNode_1.addChild("parameterType", HUtil.copyIfNecessary(quotedNode1_5));
          }
        }
        {
          quotedNode_3 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.VoidType", null, GlobalScope.getInstance(), false);
          SNode quotedNode1_6 = quotedNode_3;
          quotedNode_1.addChild("resultType", quotedNode1_6);
        }
        result = quotedNode1_4;
      }
      return result;
    }
  }
}
