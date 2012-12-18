package codeOrchestra.actionscript.view.dnd;

import com.intellij.ide.DataManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.wm.WindowManager;
import codeOrchestra.actionscript.view.ASPackageTreeNode;
import codeOrchestra.actionscript.view.utils.ActionInvokeUtil;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.workbench.ActionPlace;
import jetbrains.mps.workbench.MPSDataKeys;

import javax.swing.JOptionPane;
import javax.swing.JTree;
import javax.swing.tree.TreePath;
import java.awt.Point;
import java.awt.datatransfer.DataFlavor;
import java.awt.dnd.DropTargetDragEvent;
import java.awt.dnd.DropTargetDropEvent;
import java.awt.dnd.DropTargetEvent;
import java.awt.dnd.DropTargetListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ASProjectPaneRootDnDListener implements DropTargetListener {

  private static final String ROOT_MOVE_INVOKE_ACTION = "codeOrchestra.actionScript.refactoring.plugin.ASMoveRootInvoke_Action";

  private JTree myTree;
  private DataFlavor myDataFlavor;

  public ASProjectPaneRootDnDListener(final JTree tree, DataFlavor dataFlavor) {
    myDataFlavor = dataFlavor;
    myTree = tree;
  }

  private SModelDescriptor getModelDescriptor(final SNode node) {
    if (node == null) return null;
    SModel model = ModelAccess.instance().runReadAction(new Computable<SModel>() {
      public SModel compute() {
        return node.getModel();
      }
    });
    return (model == null) ? null : model.getModelDescriptor();
  }

  private String getConfirmLabel(List<SNode> sourceNodes, String target) {
    StringBuilder builder = new StringBuilder();
    builder.append("<html>Do you want to move ");
    builder.append(NameUtil.formatNumericalString(sourceNodes.size(), "class")).append(" ");
    builder.append("to ");
    builder.append(target);
    builder.append("?</html>");
    return builder.toString();
  }

  private List<SNode> getNodesToMove(SModelDescriptor targetModel, List<SNode> nodes) {
    List<SNode> result = new ArrayList<SNode>();

    for (SNode node : nodes) {
      if (targetModel != getModelDescriptor(node)) {
        result.add(node);
      }
    }

    return result;
  }

  private SModelDescriptor getTargetModel(TreePath target) {
    MPSTreeNode node = (MPSTreeNode) target.getLastPathComponent();
    while (node != null && !(node instanceof ASPackageTreeNode)) {
      node = (MPSTreeNode) node.getParent();
    }
    if (node != null) {
      SModelDescriptor sModelDescriptor = ((ASPackageTreeNode) node).getSModelDescriptor();
      if (sModelDescriptor instanceof EditableSModelDescriptor) {
        EditableSModelDescriptor editableSModelDescriptor = (EditableSModelDescriptor) sModelDescriptor;
        if (!editableSModelDescriptor.isPackaged()) {
          return sModelDescriptor;
        }
      }
    }
    return null;
  }

  public void dragEnter(DropTargetDragEvent dtde) {
    dtde.acceptDrag(dtde.getDropAction());
  }

  public void dragOver(DropTargetDragEvent dtde) {
    dtde.acceptDrag(dtde.getDropAction());
  }

  public void dropActionChanged(DropTargetDragEvent dtde) {
  }

  public void dragExit(DropTargetEvent dte) {
  }

  public void drop(DropTargetDropEvent dtde) {
    Point point = dtde.getLocation();
    TreePath treePath = myTree.getPathForLocation(point.x, point.y);
    if (treePath == null) {
      dtde.rejectDrop();
      return;
    }
    Object target = treePath.getLastPathComponent();
    if (!(target instanceof MPSTreeNode)) {
      dtde.rejectDrop();
      return;
    }
    Object source = null;
    try {
      source = dtde.getTransferable().getTransferData(myDataFlavor);
    } catch (Throwable t) {
      t.printStackTrace();
    }
    if (!(source instanceof List) || ((List) source).isEmpty()) {
      dtde.rejectDrop();
      return;
    }

    // Finally got the root(s) (classes) to move
    final List<SNode> sourceNodes = (List<SNode>) source;

    // Get the target model
    final SModelDescriptor targetModel = getTargetModel(treePath);
    if (targetModel == null) {
      dtde.rejectDrop();
      return;
    }

    // Filter out those roots that are already in the target package (model)
    final List<SNode> nodesToMove = getNodesToMove(targetModel, sourceNodes);
    if (nodesToMove.isEmpty()) {
      dtde.rejectDrop();
      return;
    }

    final Project project = MPSDataKeys.PROJECT.getData(DataManager.getInstance().getDataContext());

    // Confirm move
    String text = getConfirmLabel(nodesToMove, targetModel.getLongName());
    int result = JOptionPane.showConfirmDialog(WindowManager.getInstance().getFrame(project), text, "Move Classes", JOptionPane.YES_NO_OPTION);

    // Do the actual move
    if (result == JOptionPane.YES_OPTION) {
      final Map<String, Object> paramsMap = new HashMap<String, Object>() {{
        put(MPSDataKeys.NODES.getName(), nodesToMove);
        put(MPSDataKeys.MODEL.getName(), targetModel);
        put(MPSDataKeys.PROJECT.getName(), project);
      }};
      ModelAccess.instance().runWriteActionInCommand(new Runnable() {
        @Override
        public void run() {
          ActionInvokeUtil.invoke(ActionPlace.PROJECT_PANE, ROOT_MOVE_INVOKE_ACTION, paramsMap, false);
        }
      }, project);
    }

    dtde.acceptDrop(dtde.getDropAction());
  }
}
