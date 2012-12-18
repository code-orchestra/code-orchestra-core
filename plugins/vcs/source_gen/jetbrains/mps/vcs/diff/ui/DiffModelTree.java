package jetbrains.mps.vcs.diff.ui;

/*Generated by MPS */

import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.smodel.IOperationContext;
import java.util.List;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.internal.collections.runtime.Sequence;
import jetbrains.mps.internal.collections.runtime.IWhereFilter;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.internal.collections.runtime.ISelector;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import org.apache.commons.lang.StringUtils;
import jetbrains.mps.smodel.SModel;
import org.jetbrains.annotations.NotNull;
import jetbrains.mps.workbench.action.BaseAction;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.ide.projectPane.Icons;
import javax.swing.Icon;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.ide.icons.IconManager;
import com.intellij.openapi.actionSystem.ActionGroup;
import jetbrains.mps.workbench.action.ActionUtils;

public abstract class DiffModelTree extends MPSTree {
  private IOperationContext myOperationContext;
  private List<DiffModelTree.RootTreeNode> myRootNodes;

  public DiffModelTree(IOperationContext operationContext) {
    rebuildNow();
    expandAll();
    myOperationContext = operationContext;
  }

  protected MPSTreeNode rebuild() {
    DiffModelTree.ModelTreeNode modelNode = new DiffModelTree.ModelTreeNode();
    myRootNodes = Sequence.fromIterable(getAffectedRoots()).where(new IWhereFilter<SNodeId>() {
      public boolean accept(SNodeId r) {
        return r != null;
      }
    }).select(new ISelector<SNodeId, DiffModelTree.RootTreeNode>() {
      public DiffModelTree.RootTreeNode select(SNodeId r) {
        return new DiffModelTree.RootTreeNode(r);
      }
    }).sort(new ISelector<DiffModelTree.RootTreeNode, Comparable<?>>() {
      public Comparable<?> select(DiffModelTree.RootTreeNode rtn) {
        return rtn.myVirtualPackage + "|" + rtn.myPresentation;
      }
    }, true).toListSequence();
    for (DiffModelTree.RootTreeNode rtn : ListSequence.fromList(myRootNodes)) {
      MPSTreeNode parentNode = modelNode;
      if (StringUtils.isNotEmpty(rtn.myVirtualPackage)) {
        for (final String sub : Sequence.fromIterable(Sequence.fromArray(rtn.myVirtualPackage.split("\\.")))) {
          Iterable<MPSTreeNode> children = (Iterable<MPSTreeNode>) parentNode;
          MPSTreeNode child = Sequence.fromIterable(children).findFirst(new IWhereFilter<MPSTreeNode>() {
            public boolean accept(MPSTreeNode c) {
              return c instanceof DiffModelTree.PackageTreeNode && sub.equals(c.getText());
            }
          });
          if (child == null) {
            child = new DiffModelTree.PackageTreeNode(sub);
            parentNode.add(child);
          }
          parentNode = child;
        }
      }
      parentNode.add(rtn);
    }
    if (Sequence.fromIterable(getAffectedRoots()).any(new IWhereFilter<SNodeId>() {
      public boolean accept(SNodeId r) {
        return r == null;
      }
    })) {
      modelNode.add(new DiffModelTree.MetadataTreeNode());
    }
    return modelNode;
  }

  @Override
  public void rebuildNow() {
    super.rebuildNow();
    expandAll();
  }

  protected abstract Iterable<SNodeId> getAffectedRoots();

  protected abstract Iterable<SModel> getModels();

  protected abstract void updateRootCustomPresentation(@NotNull DiffModelTree.RootTreeNode rootTreeNode);

  protected abstract Iterable<BaseAction> getRootActions(@Nullable SNodeId rootId);

  protected boolean isMultipleRootNames() {
    return false;
  }

  private DiffModelTree.RootTreeNode findRootNode(@NotNull final SNodeId nodeId) {
    return ListSequence.fromList(myRootNodes).findFirst(new IWhereFilter<DiffModelTree.RootTreeNode>() {
      public boolean accept(DiffModelTree.RootTreeNode r) {
        return nodeId.equals(r.myRootId);
      }
    });
  }

  @Nullable
  public SNodeId getNeighbourRoot(@NotNull SNodeId nodeId, boolean next) {
    int index = ListSequence.fromList(myRootNodes).indexOf(findRootNode(nodeId));
    if (index == -1) {
      return null;
    }
    index = (next ?
      index + 1 :
      index - 1
    );
    if (index == -1 || index == ListSequence.fromList(myRootNodes).count()) {
      return null;
    } else {
      return ListSequence.fromList(myRootNodes).getElement(index).myRootId;
    }
  }

  public String getNameForRoot(@NotNull SNodeId nodeId) {
    return findRootNode(nodeId).myPresentation;
  }

  private class ModelTreeNode extends MPSTreeNode {
    public ModelTreeNode() {
      super(myOperationContext);
      setNodeIdentifier("model");
    }

    @Override
    protected void doUpdatePresentation() {
      setText(Sequence.fromIterable(getModels()).first().getLongName());
      setIcon(Icons.MODEL_ICON);
    }
  }

  private class PackageTreeNode extends MPSTreeNode {
    private PackageTreeNode(String packageName) {
      super(myOperationContext);
      setNodeIdentifier("" + packageName);
      setText(packageName);
    }
  }

  public class RootTreeNode extends MPSTreeNode {
    private SNodeId myRootId;
    private String myPresentation = null;
    private String myVirtualPackage = null;

    public RootTreeNode(SNodeId rootId) {
      super(myOperationContext);
      myRootId = rootId;
      setNodeIdentifier("" + myRootId);
      doUpdatePresentation();
    }

    @Override
    protected void doUpdatePresentation() {
      myPresentation = null;
      Icon icon = null;
      for (SModel model : Sequence.fromIterable(getModels())) {
        SNode root = model.getNodeById(myRootId);
        if (root != null && SNodeOperations.getParent(root) == null) {
          String presentation = root.getPresentation();
          if (myPresentation == null) {
            myPresentation = presentation;
          } else if (isMultipleRootNames()) {
            if (("/ " + myPresentation + " /").contains("/ " + presentation + " /")) {
            } else {
              myPresentation += " / " + presentation;
            }
          }

          if (myVirtualPackage == null) {
            myVirtualPackage = (SPropertyOperations.getString(root, "virtualPackage") == null ?
              "" :
              SPropertyOperations.getString(root, "virtualPackage")
            );
          }
          if (icon == null) {
            icon = IconManager.getIconFor(root);
          }
        }
      }
      setText(myPresentation);
      setIcon(icon);
      updateRootCustomPresentation(this);
    }

    @Override
    public void doubleClick() {
      Sequence.fromIterable(getRootActions(myRootId)).first().actionPerformed(null);
    }

    @Override
    public ActionGroup getActionGroup() {
      return ActionUtils.groupFromActions(Sequence.fromIterable(getRootActions(myRootId)).toGenericArray(BaseAction.class));
    }

    @Nullable
    public SNodeId getRootId() {
      return myRootId;
    }
  }

  public class MetadataTreeNode extends DiffModelTree.RootTreeNode {
    public MetadataTreeNode() {
      super(null);
      setNodeIdentifier("metadata");
      doUpdatePresentation();
    }

    @Override
    protected void doUpdatePresentation() {
      setText("Model Properties");
      setIcon(Icons.PROPERTIES_ICON);
      updateRootCustomPresentation(this);
    }
  }
}
