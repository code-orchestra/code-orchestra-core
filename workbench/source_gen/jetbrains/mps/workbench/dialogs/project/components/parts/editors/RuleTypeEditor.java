package jetbrains.mps.workbench.dialogs.project.components.parts.editors;

/*Generated by MPS */

import javax.swing.DefaultCellEditor;
import javax.swing.JComboBox;
import jetbrains.mps.project.structure.modules.mappingpriorities.RuleType;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.dialogs.project.components.parts.renderers.RuleTypeRenderer;

public class RuleTypeEditor extends DefaultCellEditor {
  @CodeOrchestraPatch
  public RuleTypeEditor() {
    super(new JComboBox());
    JComboBox cb = (JComboBox) editorComponent;
    cb.addItem(RuleType.STRICTLY_BEFORE);
    cb.addItem(RuleType.STRICTLY_TOGETHER);
    cb.addItem(RuleType.BEFORE_OR_TOGETHER);
    cb.addItem(RuleType.AFTER_OR_TOGETHER);
    cb.addItem(RuleType.STRICTLY_AFTER);
    cb.addItem(RuleType.ABSOLUTE_FIRST); // CO-4941
    editorComponent = RuleTypeRenderer.createCenterAlignmentInCell(editorComponent);
  }
}
