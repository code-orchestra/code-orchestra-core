package jetbrains.mps.vcs.diff.oldchanges;

/*Generated by MPS */

import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

@Deprecated
public class OldAddRootChange extends NewNodeChange {
  @Deprecated
  public OldAddRootChange(String conceptFqName, SNodeId nodeId) {
    super(conceptFqName, nodeId, null, null);
  }

  public String toString() {
    return "add root " + getAffectedNodeId();
  }

  public boolean apply(SModel m) {
    SNode n = SModelUtil_new.instantiateConceptDeclaration(getConceptFqName(), m, GlobalScope.getInstance(), false);
    assert n != null;
    n.setId(getAffectedNodeId());
    m.addRoot(n);
    return true;
  }
}
