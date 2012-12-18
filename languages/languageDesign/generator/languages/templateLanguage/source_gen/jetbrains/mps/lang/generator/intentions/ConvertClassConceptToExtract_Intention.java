package jetbrains.mps.lang.generator.intentions;

/*Generated by MPS */

import jetbrains.mps.intentions.BaseIntention;
import jetbrains.mps.intentions.Intention;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.action.SNodeFactoryOperations;
import java.util.HashMap;
import java.util.List;
import jetbrains.mps.smodel.CopyUtil;
import jetbrains.mps.smodel.SReference;

public class ConvertClassConceptToExtract_Intention extends BaseIntention implements Intention {
  public ConvertClassConceptToExtract_Intention() {
  }

  public String getConcept() {
    return "jetbrains.mps.baseLanguage.structure.ClassConcept";
  }

  public boolean isParameterized() {
    return false;
  }

  public boolean isErrorIntention() {
    return false;
  }

  public boolean isAvailableInChildNodes() {
    return false;
  }

  public String getDescription(final SNode node, final EditorContext editorContext) {
    return "Convert ClassConcept to ExtractStaticInnerClassConcept";
  }

  public boolean isApplicable(final SNode node, final EditorContext editorContext) {
    if (!(this.isApplicableToNode(node, editorContext))) {
      return false;
    }
    return true;
  }

  public boolean isApplicableToNode(final SNode node, final EditorContext editorContext) {
    return SConceptOperations.isExactly(SNodeOperations.getConceptDeclaration(node), "jetbrains.mps.baseLanguage.structure.ClassConcept");
  }

  public void execute(final SNode node, final EditorContext editorContext) {
    SNode newNode = SNodeFactoryOperations.createNewNode("jetbrains.mps.baseLanguageInternal.structure.ExtractStaticInnerClassConcept", null);
    for (SNode child : newNode.getChildren()) {
      newNode.removeChild(child);
    }
    HashMap<SNode, SNode> mapping = new HashMap<SNode, SNode>();
    mapping.put(node, newNode);
    List<SNode> children = node.getChildren();
    CopyUtil.copy(children, mapping);
    for (SNode child : children) {
      newNode.addChild(child.getRole_(), mapping.get(child));
    }
    for (SReference reference : node.getReferences()) {
      newNode.setReferent(reference.getRole(), reference.getTargetNode());
    }
    for (String propertyName : node.getPropertyNames()) {
      newNode.setProperty(propertyName, node.getProperty(propertyName));
    }
    SNodeOperations.replaceWithAnother(node, newNode);
  }

  public String getLocationString() {
    return "jetbrains.mps.lang.generator.intentions";
  }
}
