package jetbrains.mps.editor.runtime;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import javax.swing.JOptionPane;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SModelOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.smodel.behaviour.BehaviorManager;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;


/**
 * TODO: most probably move out to mps.ide.editor (plugin)
 * currently canot do that due to the compilation problems of editor.intentions model
 */
public class ExtractComponentUtil {
  public ExtractComponentUtil() {
  }

  public static void extractComponent(final SNode node, EditorContext editorContext) {
    final SNode container = SNodeOperations.getAncestor(node, "jetbrains.mps.lang.editor.structure.BaseEditorComponent", false, false);
    final String componentName = JOptionPane.showInputDialog(editorContext.getNodeEditorComponent(), "Enter a component name:", "");
    if (componentName == null) {
      return;
    }
    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        SModel model = SNodeOperations.getModel(node);
        SNode component = SModelOperations.createNewRootNode(model, "jetbrains.mps.lang.editor.structure.EditorComponentDeclaration", null);
        SPropertyOperations.set(component, "name", componentName);
        SLinkOperations.setTarget(component, "conceptDeclaration", ((SNode) BehaviorManager.getInstance().invoke(Object.class, SNodeOperations.cast(container, "jetbrains.mps.lang.editor.structure.AbstractComponent"), "virtual_getConceptDeclaration_7055725856388417603", new Class[]{SNode.class})), false);
        SLinkOperations.setTarget(component, "cellModel", SNodeOperations.copyNode(node), true);
        SNode toReplace = SConceptOperations.createNewNode("jetbrains.mps.lang.editor.structure.CellModel_Component", null);
        SLinkOperations.setTarget(toReplace, "editorComponent", component, false);
        SNodeOperations.replaceWithAnother(node, toReplace);
      }
    });
  }
}
