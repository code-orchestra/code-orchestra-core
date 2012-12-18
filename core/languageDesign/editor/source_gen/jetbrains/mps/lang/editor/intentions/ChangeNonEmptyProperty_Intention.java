package jetbrains.mps.lang.editor.intentions;

/*Generated by MPS */

import jetbrains.mps.intentions.BaseIntention;
import jetbrains.mps.intentions.Intention;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.action.SNodeFactoryOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.Map;
import jetbrains.mps.internal.collections.runtime.SetSequence;
import jetbrains.mps.smodel.SReference;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;

public class ChangeNonEmptyProperty_Intention extends BaseIntention implements Intention {
  public ChangeNonEmptyProperty_Intention() {
  }

  public String getConcept() {
    return "jetbrains.mps.lang.editor.structure.CellModel_NonEmptyProperty";
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
    return "Replace Non Empty Property by Concept Property";
  }

  public void execute(final SNode node, final EditorContext editorContext) {
    SNode property = SNodeFactoryOperations.createNewNode("jetbrains.mps.lang.editor.structure.CellModel_Property", null);
    SLinkOperations.setTarget(property, "relationDeclaration", SLinkOperations.getTarget(node, "relationDeclaration", false), false);
    SLinkOperations.setTarget(node, "relationDeclaration", null, false);
    for (SNode child : ListSequence.fromList(node.getChildren())) {
      String role = child.getRole_();
      node.removeChild(child);
      property.addChild(role, child);
    }
    for (Map.Entry<String, String> propertyEntry : SetSequence.fromSet(node.getProperties().entrySet())) {
      property.setProperty(propertyEntry.getKey(), propertyEntry.getValue());
    }
    for (SReference reference : ListSequence.fromList(node.getReferences())) {
      property.addReference(reference);
    }
    SNodeOperations.replaceWithAnother(node, property);
  }

  public String getLocationString() {
    return "jetbrains.mps.lang.editor.intentions";
  }
}
