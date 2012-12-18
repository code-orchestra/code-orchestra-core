package jetbrains.mps.lang.smodelTests.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ReferenceContainerSubConcept extends ReferenceContainer {
  public static final String concept = "jetbrains.mps.lang.smodelTests.structure.ReferenceContainerSubConcept";

  public ReferenceContainerSubConcept(SNode node) {
    super(node);
  }

  public ChildSubConcept getSpecializedRightChild() {
    return this.ensureAdapter(ChildSubConcept.class, "rightChild", this.getRightChild());
  }

  public void setSpecializedRightChild(ChildSubConcept node) {
    this.setRightChild(node);
  }

  public static ReferenceContainerSubConcept newInstance(SModel sm, boolean init) {
    return (ReferenceContainerSubConcept) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.smodelTests.structure.ReferenceContainerSubConcept", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ReferenceContainerSubConcept newInstance(SModel sm) {
    return ReferenceContainerSubConcept.newInstance(sm, false);
  }
}
