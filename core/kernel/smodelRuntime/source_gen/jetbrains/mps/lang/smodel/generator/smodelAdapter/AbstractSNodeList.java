package jetbrains.mps.lang.smodel.generator.smodelAdapter;

/*Generated by MPS */

import java.util.ArrayList;
import jetbrains.mps.smodel.SNode;
import java.util.List;
import java.util.Collection;

/*package*/ abstract class AbstractSNodeList extends ArrayList<SNode> {
  protected final SNode myReferenceContainer;
  protected final String myRole;

  private AbstractSNodeList(SNode referenceContainer, String role, int initialSize) {
    super(initialSize);
    assert referenceContainer != null;
    myReferenceContainer = referenceContainer;
    assert role != null;
    myRole = role;
  }

  protected AbstractSNodeList(SNode referenceContainer, String role, List<SNode> referents) {
    this(referenceContainer, role, referents.size());
    super.addAll(referents);
  }

  protected AbstractSNodeList(SNode referenceContainer, String role, SNode referent) {
    this(referenceContainer, role, 1);
    super.add(referent);
  }

  protected void removeReference(SNode node) {
    if (node != null) {
      doRemoveReference(node);
    }
  }

  protected void addReference(SNode node) {
    if (node != null) {
      doAddReference(node);
    }
  }

  private void addReference(int index, SNode node) {
    if (node != null) {
      SNode anchorNode = (index > 0 ?
        get(index - 1) :
        null
      );
      insertAfter(node, anchorNode);
    }
  }

  protected abstract void doRemoveReference(SNode node);

  protected abstract void doAddReference(SNode node);

  protected abstract void insertAfter(SNode node, SNode anchorNode);

  @Override
  protected void removeRange(int fromIndex, int toIndex) {
    List<SNode> sublist = subList(fromIndex, toIndex);
    SNode[] nodesToRemove = sublist.toArray(new SNode[sublist.size()]);
    super.removeRange(fromIndex, toIndex);
    for (SNode nextNode : nodesToRemove) {
      removeReference(nextNode);
    }
  }

  @Override
  public boolean addAll(Collection<? extends SNode> c) {
    for (SNode nextNode : c) {
      addReference(nextNode);
    }
    return super.addAll(c);
  }

  @Override
  public void clear() {
    for (SNode nextNode : this) {
      removeReference(nextNode);
    }
    super.clear();
  }

  @Override
  public boolean remove(Object o) {
    if (o instanceof SNode) {
      removeReference((SNode) o);
    }
    return super.remove(o);
  }

  @Override
  public SNode remove(int index) {
    SNode result = super.remove(index);
    removeReference(result);
    return result;
  }

  @Override
  public void add(int index, SNode element) {
    super.add(index, element);
    addReference(index, element);
  }

  @Override
  public boolean add(SNode sNode) {
    addReference(sNode);
    return super.add(sNode);
  }

  @Override
  public SNode set(int index, SNode element) {
    SNode result = super.set(index, element);
    removeReference(result);
    addReference(index, element);
    return result;
  }

  public static class AggregatedSNodesList extends AbstractSNodeList {
    public AggregatedSNodesList(SNode parent, String role) {
      super(parent, role, parent.getChildren(role));
    }

    @Override
    protected void doRemoveReference(SNode node) {
      myReferenceContainer.removeChild(node);
    }

    @Override
    protected void doAddReference(SNode node) {
      if (node.getParent() != null) {
        node.getParent().removeChild(node);
      }
      myReferenceContainer.addChild(myRole, node);
    }

    @Override
    protected void insertAfter(SNode node, SNode anchorNode) {
      if (node.getParent() != null) {
        node.getParent().removeChild(node);
      }
      myReferenceContainer.insertChild(anchorNode, myRole, node);
    }
  }

  public static class LinkedSNodesList extends AbstractSNodeList {
    public LinkedSNodesList(SNode referenceContainer, String role) {
      super(referenceContainer, role, referenceContainer.getReferent(role));
    }

    @Override
    protected void doRemoveReference(SNode node) {
      myReferenceContainer.removeReferent(myRole);
    }

    @Override
    protected void doAddReference(SNode node) {
      myReferenceContainer.setReferent(myRole, node);
    }

    @Override
    protected void insertAfter(SNode node, SNode anchorNode) {
      doAddReference(node);
    }
  }
}
