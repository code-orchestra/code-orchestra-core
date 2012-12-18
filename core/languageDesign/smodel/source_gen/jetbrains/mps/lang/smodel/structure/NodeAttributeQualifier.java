package jetbrains.mps.lang.smodel.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.structure.structure.ConceptDeclaration;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class NodeAttributeQualifier extends AttributeQualifier {
  public static final String concept = "jetbrains.mps.lang.smodel.structure.NodeAttributeQualifier";
  public static final String ATTRIBUTE_CONCEPT = "attributeConcept";

  public NodeAttributeQualifier(SNode node) {
    super(node);
  }

  public ConceptDeclaration getAttributeConcept() {
    return (ConceptDeclaration) this.getReferent(ConceptDeclaration.class, NodeAttributeQualifier.ATTRIBUTE_CONCEPT);
  }

  public void setAttributeConcept(ConceptDeclaration node) {
    super.setReferent(NodeAttributeQualifier.ATTRIBUTE_CONCEPT, node);
  }

  public static NodeAttributeQualifier newInstance(SModel sm, boolean init) {
    return (NodeAttributeQualifier) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.smodel.structure.NodeAttributeQualifier", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static NodeAttributeQualifier newInstance(SModel sm) {
    return NodeAttributeQualifier.newInstance(sm, false);
  }
}
