package jetbrains.mps.execution.configurations.editor;

/*Generated by MPS */

import jetbrains.mps.nodeEditor.AbstractCellProvider;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.style.Style;
import jetbrains.mps.nodeEditor.style.StyleAttributes;
import jetbrains.mps.nodeEditor.cells.EditorCell_Constant;
import jetbrains.mps.baseLanguage.editor.BaseLanguageStyle_StyleSheet;
import jetbrains.mps.nodeEditor.cellMenu.CompositeSubstituteInfo;
import jetbrains.mps.nodeEditor.cellMenu.BasicCellContext;
import jetbrains.mps.nodeEditor.cellMenu.SubstituteInfoPart;
import jetbrains.mps.nodeEditor.MPSColors;
import jetbrains.mps.nodeEditor.cells.EditorCell_Indent;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.lang.editor.generator.internal.AbstractCellMenuPart_Generic_Item;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.IOperationContext;

public class SimpleCanRunAndDebug extends AbstractCellProvider {
  public SimpleCanRunAndDebug(SNode node) {
    super(node);
  }

  public EditorCell createEditorCell(EditorContext editorContext) {
    return this.createEditorCell(editorContext, this.getSNode());
  }

  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return this.createCollection_o92gz8_a(editorContext, node);
  }

  private EditorCell createCollection_o92gz8_a(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_o92gz8_a");
    editorCell.addEditorCell(this.createConstant_o92gz8_a0(editorContext, node));
    editorCell.addEditorCell(this.createCollection_o92gz8_b0(editorContext, node));
    editorCell.addEditorCell(this.createConstant_o92gz8_c0(editorContext, node));
    editorCell.addEditorCell(this.createCollection_o92gz8_d0(editorContext, node));
    return editorCell;
  }

  private EditorCell createCollection_o92gz8_b0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_o92gz8_b0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    editorCell.addEditorCell(this.createIndentCell_o92gz8_a1a(editorContext, node));
    if (renderingCondition_o92gz8_a1b0(node, editorContext, editorContext.getOperationContext().getScope())) {
      editorCell.addEditorCell(this.createConstant_o92gz8_b1a(editorContext, node));
    }
    if (renderingCondition_o92gz8_a2b0(node, editorContext, editorContext.getOperationContext().getScope())) {
      editorCell.addEditorCell(this.createConstant_o92gz8_c1a(editorContext, node));
    }
    return editorCell;
  }

  private EditorCell createCollection_o92gz8_d0(EditorContext editorContext, SNode node) {
    EditorCell_Collection editorCell = EditorCell_Collection.createHorizontal(editorContext, node);
    editorCell.setCellId("Collection_o92gz8_d0");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.SELECTABLE, false);
    }
    if (renderingCondition_o92gz8_a0d0(node, editorContext, editorContext.getOperationContext().getScope())) {
      editorCell.addEditorCell(this.createConstant_o92gz8_a3a(editorContext, node));
    }
    if (renderingCondition_o92gz8_a1d0(node, editorContext, editorContext.getOperationContext().getScope())) {
      editorCell.addEditorCell(this.createConstant_o92gz8_b3a(editorContext, node));
    }
    return editorCell;
  }

  private EditorCell createConstant_o92gz8_a0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "can:");
    editorCell.setCellId("Constant_o92gz8_a0");
    BaseLanguageStyle_StyleSheet.getKeyWord(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_o92gz8_b1a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "run");
    editorCell.setCellId("Constant_o92gz8_b1a");
    BaseLanguageStyle_StyleSheet.getKeyWord(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    editorCell.setSubstituteInfo(new CompositeSubstituteInfo(editorContext, new BasicCellContext(node), new SubstituteInfoPart[]{new SimpleCanRunAndDebug.RunConfigurationExecutor_generic_cellMenu_a0b1a()}));
    return editorCell;
  }

  private EditorCell createConstant_o92gz8_c1a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "can't run");
    editorCell.setCellId("Constant_o92gz8_c1a");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.TEXT_COLOR, MPSColors.lightGray);
    }
    editorCell.setDefaultText("");
    editorCell.setSubstituteInfo(new CompositeSubstituteInfo(editorContext, new BasicCellContext(node), new SubstituteInfoPart[]{new SimpleCanRunAndDebug.RunConfigurationExecutor_generic_cellMenu_a0c1a()}));
    return editorCell;
  }

  private EditorCell createConstant_o92gz8_c0(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, ",");
    editorCell.setCellId("Constant_o92gz8_c0");
    editorCell.setDefaultText("");
    return editorCell;
  }

  private EditorCell createConstant_o92gz8_a3a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "debug");
    editorCell.setCellId("Constant_o92gz8_a3a");
    BaseLanguageStyle_StyleSheet.getKeyWord(editorCell).apply(editorCell);
    editorCell.setDefaultText("");
    editorCell.setSubstituteInfo(new CompositeSubstituteInfo(editorContext, new BasicCellContext(node), new SubstituteInfoPart[]{new SimpleCanRunAndDebug.RunConfigurationExecutor_generic_cellMenu_a0a3a()}));
    return editorCell;
  }

  private EditorCell createConstant_o92gz8_b3a(EditorContext editorContext, SNode node) {
    EditorCell_Constant editorCell = new EditorCell_Constant(editorContext, node, "can't debug");
    editorCell.setCellId("Constant_o92gz8_b3a");
    {
      Style style = editorCell.getStyle();
      style.set(StyleAttributes.TEXT_COLOR, MPSColors.lightGray);
    }
    editorCell.setDefaultText("");
    editorCell.setSubstituteInfo(new CompositeSubstituteInfo(editorContext, new BasicCellContext(node), new SubstituteInfoPart[]{new SimpleCanRunAndDebug.RunConfigurationExecutor_generic_cellMenu_a0b3a()}));
    return editorCell;
  }

  private EditorCell createIndentCell_o92gz8_a1a(EditorContext editorContext, SNode node) {
    EditorCell_Indent result = new EditorCell_Indent(editorContext, node);
    return result;
  }

  private static boolean renderingCondition_o92gz8_a1b0(SNode node, EditorContext editorContext, IScope scope) {
    return SPropertyOperations.getBoolean(node, "canRun");
  }

  private static boolean renderingCondition_o92gz8_a2b0(SNode node, EditorContext editorContext, IScope scope) {
    return !(SPropertyOperations.getBoolean(node, "canRun"));
  }

  private static boolean renderingCondition_o92gz8_a0d0(SNode node, EditorContext editorContext, IScope scope) {
    return SPropertyOperations.getBoolean(node, "canDebug");
  }

  private static boolean renderingCondition_o92gz8_a1d0(SNode node, EditorContext editorContext, IScope scope) {
    return !(SPropertyOperations.getBoolean(node, "canDebug"));
  }

  public static class RunConfigurationExecutor_generic_cellMenu_a0b1a extends AbstractCellMenuPart_Generic_Item {
    public RunConfigurationExecutor_generic_cellMenu_a0b1a() {
    }

    public void handleAction(SNode node, SModel model, IScope scope, IOperationContext operationContext) {
      SPropertyOperations.set(node, "canRun", "" + (false));
    }

    public String getMatchingText() {
      return "can't run";
    }
  }

  public static class RunConfigurationExecutor_generic_cellMenu_a0c1a extends AbstractCellMenuPart_Generic_Item {
    public RunConfigurationExecutor_generic_cellMenu_a0c1a() {
    }

    public void handleAction(SNode node, SModel model, IScope scope, IOperationContext operationContext) {
      SPropertyOperations.set(node, "canRun", "" + (true));
    }

    public String getMatchingText() {
      return "run";
    }
  }

  public static class RunConfigurationExecutor_generic_cellMenu_a0a3a extends AbstractCellMenuPart_Generic_Item {
    public RunConfigurationExecutor_generic_cellMenu_a0a3a() {
    }

    public void handleAction(SNode node, SModel model, IScope scope, IOperationContext operationContext) {
      SPropertyOperations.set(node, "canDebug", "" + (false));
    }

    public String getMatchingText() {
      return "can't debug";
    }
  }

  public static class RunConfigurationExecutor_generic_cellMenu_a0b3a extends AbstractCellMenuPart_Generic_Item {
    public RunConfigurationExecutor_generic_cellMenu_a0b3a() {
    }

    public void handleAction(SNode node, SModel model, IScope scope, IOperationContext operationContext) {
      SPropertyOperations.set(node, "canDebug", "" + (true));
    }

    public String getMatchingText() {
      return "debug";
    }
  }
}
