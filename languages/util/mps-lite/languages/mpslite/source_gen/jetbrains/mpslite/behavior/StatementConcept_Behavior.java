package jetbrains.mpslite.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import java.util.Map;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;

public class StatementConcept_Behavior {
  public static void init(SNode thisNode) {
  }

  public static boolean virtual_isRootable_1239714833738(SNode thisNode) {
    return false;
  }

  public static boolean virtual_isAbstract_1239715026284(SNode thisNode) {
    return true;
  }

  public static void virtual_fillConcept_1239891562930(SNode thisNode, SNode concept, Map<SNode, SNode> conceptsToTargets, Map<SNode, SNode> partsToLinks) {
  }

  public static SNode virtual_createEditor_1239890004879(SNode thisNode, Map<SNode, SNode> conceptsToTargets, Map<SNode, SNode> partsToLinks) {
    SNode result = SConceptOperations.createNewNode("jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration", null);
    SNode cellModelError = SLinkOperations.setNewChild(result, "cellModel", "jetbrains.mps.lang.editor.structure.CellModel_Error");
    SPropertyOperations.set(cellModelError, "text", "<abstract statement>");
    return result;
  }
}
