package jetbrains.mps.vcs.diff.oldchanges;

/*Generated by MPS */

import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.errors.messageTargets.MessageTarget;
import jetbrains.mps.errors.messageTargets.NodeMessageTarget;

@Deprecated
public abstract class NewNodeChange extends OldChange {
  private String myConceptFqName;
  private SNodeId myNodeId;
  private String myNodeRole;
  private SNodeId myNodeParent;

  @Deprecated
  protected NewNodeChange(String conceptFqName, SNodeId nodeId, String nodeRole, SNodeId nodeParent) {
    myConceptFqName = conceptFqName;
    myNodeId = nodeId;
    myNodeRole = nodeRole;
    myNodeParent = nodeParent;
  }

  public SNodeId getAffectedNodeId() {
    return myNodeId;
  }

  public String getConceptFqName() {
    return myConceptFqName;
  }

  public String getNodeRole() {
    return myNodeRole;
  }

  public SNodeId getNodeParent() {
    return myNodeParent;
  }

  @Override
  public OldChangeType getChangeType() {
    return OldChangeType.ADD;
  }

  @Override
  public MessageTarget getMessageTarget() {
    return new NodeMessageTarget();
  }

  @Override
  public boolean isSameChange(OldChange c) {
    if (this == c) {
      return true;
    }
    if (c == null || getClass() != c.getClass()) {
      return false;
    }
    NewNodeChange that = (NewNodeChange) c;
    if (!(myConceptFqName.equals(that.myConceptFqName))) {
      return false;
    }
    if (!(myNodeId.equals(that.myNodeId))) {
      return false;
    }
    if ((myNodeParent != null ?
      !(myNodeParent.equals(that.myNodeParent)) :
      that.myNodeParent != null
    )) {
      return false;
    }
    if ((myNodeRole != null ?
      !(myNodeRole.equals(that.myNodeRole)) :
      that.myNodeRole != null
    )) {
      return false;
    }
    return true;
  }

  @Override
  public Object getChangeKey() {
    return myNodeId;
  }
}
