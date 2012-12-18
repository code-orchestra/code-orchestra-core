package jetbrains.mps.baseLanguage.editor;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.AbstractCellProvider;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.style.Style;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.cells.EditorCell_Constant;
import jetbrains.mps.nodeEditor.style.AttributeCalculator;
import jetbrains.mps.nodeEditor.cellProviders.CellProviderWithRole;
import jetbrains.mps.lang.editor.cellProviders.RefNodeCellProvider;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.nodeEditor.EditorManager;
import jetbrains.mps.smodel.SModelStereotype;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;

public class BaseMethodDeclaration_BodyComponent extends AbstractCellProvider {
  public BaseMethodDeclaration_BodyComponent(SNode node) {
    super(node);
  }

  public EditorCell createEditorCell(EditorContext editorContext) {
    return this.createEditorCell(editorContext, this.getSNode());
  }

  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createCollection_fao2ea_a(editorContext, node);
  }

  private EditorCell createCollection_fao2ea_a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createIndent2(editorContext, node);
    editorCell.setCellId("Collection_fao2ea_a");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.INDENT_LAYOUT_NEW_LINE, true);
    }
    editorCell.setCanBeFolded(true);
    editorCell.setFoldedCell(this.createComponent_fao2ea_a0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_fao2ea_a0(editorContext, node));
    editorCell.addEditorCell(this.createRefNode_fao2ea_b0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_fao2ea_c0(editorContext, node));
    return editorCell;
  }

  private EditorCell createComponent_fao2ea_a0(EditorContext editorContext, SNode node) {
    AbstractCellProvider provider = new GenericDeclaration_FoldedCodeBlock_Component(node);
    EditorCell editorCell = provider.createEditorCell(editorContext);
    return editorCell;
  }

  private EditorCell createConstant_fao2ea_a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "{");
    editorCell.setCellId("Constant_fao2ea_a0");
    BaseLanguageStyle_StyleSheet.getLeftBrace(editorCell).apply(editorCell);
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.INDENT_LAYOUT_NEW_LINE, new AttributeCalculator<Boolean>() {
        public Boolean calculate(EditorCell cell) {
          return BaseMethodDeclaration_BodyComponent._StyleParameter_QueryFunction_fao2ea_a0a0((cell == null ?
            null :
            cell.getSNode()
          ), (cell == null ?
            null :
            cell.getEditorContext()
          ));
        }
      });
    }
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_fao2ea_c0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "}");
    editorCell.setCellId("Constant_fao2ea_c0");
    BaseLanguageStyle_StyleSheet.getRightBrace(editorCell).apply(editorCell);
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.POSITION, "next-line");
    }
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createRefNode_fao2ea_b0(EditorContext editorContext, SNode node) {
    CellProviderWithRole provider = new RefNodeCellProvider(node, editorContext);
    provider.setRole("body");
    provider.setNoTargetText("<no body>");
    EditorCell editorCell;
    editorCell = provider.createEditorCell(editorContext);
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.INDENT_LAYOUT_NEW_LINE, new AttributeCalculator<Boolean>() {
        public Boolean calculate(EditorCell cell) {
          return BaseMethodDeclaration_BodyComponent._StyleParameter_QueryFunction_fao2ea_a0b0((cell == null ?
            null :
            cell.getSNode()
          ), (cell == null ?
            null :
            cell.getEditorContext()
          ));
        }
      });
      style.set(StyleAttributes.INDENT_LAYOUT_INDENT, true);
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

  private static boolean _StyleParameter_QueryFunction_fao2ea_a0a0(SNode node, EditorContext editorContext) {
    return !(SModelStereotype.isStubModelStereotype(SNodeOperations.getModel(node).getStereotype()));
  }

  private static boolean _StyleParameter_QueryFunction_fao2ea_a0b0(SNode node, EditorContext editorContext) {
    return !(SModelStereotype.isStubModelStereotype(SNodeOperations.getModel(node).getStereotype()));
  }
}
