package jetbrains.mps.lang.smodel.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration;
import jetbrains.mps.lang.structure.structure.LinkDeclaration;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class Node_IsRoleOperation extends SNodeOperation {
  public static final String concept = "jetbrains.mps.lang.smodel.structure.Node_IsRoleOperation";
  public static final String CONCEPT_OF_PARENT = "conceptOfParent";
  public static final String LINK_IN_PARENT = "linkInParent";

  public Node_IsRoleOperation(SNode node) {
    super(node);
  }

  public AbstractConceptDeclaration getConceptOfParent() {
    return (AbstractConceptDeclaration) this.getReferent(AbstractConceptDeclaration.class, Node_IsRoleOperation.CONCEPT_OF_PARENT);
  }

  public void setConceptOfParent(AbstractConceptDeclaration node) {
    super.setReferent(Node_IsRoleOperation.CONCEPT_OF_PARENT, node);
  }

  public LinkDeclaration getLinkInParent() {
    return (LinkDeclaration) this.getReferent(LinkDeclaration.class, Node_IsRoleOperation.LINK_IN_PARENT);
  }

  public void setLinkInParent(LinkDeclaration node) {
    super.setReferent(Node_IsRoleOperation.LINK_IN_PARENT, node);
  }

  public static Node_IsRoleOperation newInstance(SModel sm, boolean init) {
    return (Node_IsRoleOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.smodel.structure.Node_IsRoleOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static Node_IsRoleOperation newInstance(SModel sm) {
    return Node_IsRoleOperation.newInstance(sm, false);
  }
}
