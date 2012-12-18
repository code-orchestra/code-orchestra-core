package codeOrchestra.actionscript.view.dnd;

import com.intellij.ide.DataManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.wm.WindowManager;
import codeOrchestra.actionscript.view.ASProjectModuleTreeNode;
import codeOrchestra.actionscript.view.utils.ActionInvokeUtil;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
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

public class ASProjectPaneModelDnDListener implements DropTargetListener {

  private static final String PACKAGE_MOVE_INVOKE_ACTION = "codeOrchestra.actionScript.refactoring.plugin.ASMovePackageInvoke_Action";

  private JTree myTree;
  private DataFlavor myDataFlavor;

  public ASProjectPaneModelDnDListener(final JTree tree, DataFlavor dataFlavor) {
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

  private String getConfirmLabel(List<SModelDescriptor> sourceNodes, String target) {
    StringBuilder builder = new StringBuilder();
    builder.append("<html>Do you want to move ");
    builder.append(NameUtil.formatNumericalString(sourceNodes.size(), "package")).append(" ");
    builder.append("to ");
    builder.append(target);
    builder.append("?</html>");
    return builder.toString();
  }

  private List<SModelDescriptor> getModelsToMove(IModule targetModule, List<SModelDescriptor> models) {
    List<SModelDescriptor> result = new ArrayList<SModelDescriptor>();

    for (SModelDescriptor modelDescriptor : models) {
      if (!targetModule.getOwnModelDescriptors().contains(modelDescriptor)) {
        result.add(modelDescriptor);
      }
    }

    return result;
  }

  private IModule getTargetModule(TreePath target) {
    MPSTreeNode node = (MPSTreeNode) target.getLastPathComponent();
    while (node != null && !(node instanceof ASProjectModuleTreeNode)) {
      node = (MPSTreeNode) node.getParent();
    }
    if (node != null) {
      ASProjectModuleTreeNode moduleTreeNode = (ASProjectModuleTreeNode) node;
      IModule module = moduleTreeNode.getModule();
      if (!module.isPackaged() && !moduleTreeNode.isLibrary()) {
        return module;
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

    // RE-3224
    if (((List) source).iterator().next() instanceof SNode) {
      ASProjectPaneRootDnDListener rootDnDListener = new ASProjectPaneRootDnDListener(myTree, myDataFlavor);
      rootDnDListener.drop(dtde);
      return;
    }

    // Finally got the root(s) (classes) to move
    final List<SModelDescriptor> sourceModels = (List<SModelDescriptor>) source;

    // Get the target module
    final IModule targetModule = getTargetModule(treePath);
    if (targetModule == null) {
      dtde.rejectDrop();
      return;
    }

    // Filter out those models that are already in the target module
    final List<SModelDescriptor> modelsToMove = getModelsToMove(targetModule, sourceModels);
    if (modelsToMove.isEmpty()) {
      dtde.rejectDrop();
      return;
    }

    final Project project = MPSDataKeys.PROJECT.getData(DataManager.getInstance().getDataContext());

    // Confirm move
    String text = getConfirmLabel(modelsToMove, targetModule.toString());
    int result = JOptionPane.showConfirmDialog(WindowManager.getInstance().getFrame(project), text, "Move Packages", JOptionPane.YES_NO_OPTION);

    // Do the actual move
    if (result == JOptionPane.YES_OPTION) {
      final Map<String, Object> paramsMap = new HashMap<String, Object>() {{
        put(MPSDataKeys.MODELS.getName(), modelsToMove);
        put(MPSDataKeys.MODULE.getName(), targetModule);
        put(MPSDataKeys.PROJECT.getName(), project);
      }};
      ModelAccess.instance().runWriteActionInCommand(new Runnable() {
        @Override
        public void run() {
          ActionInvokeUtil.invoke(ActionPlace.PROJECT_PANE, PACKAGE_MOVE_INVOKE_ACTION, paramsMap, false);
        }
      }, project);
    }

    dtde.acceptDrop(dtde.getDropAction());
  }
}
