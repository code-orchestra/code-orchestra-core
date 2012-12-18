package codeOrchestra.actionscript.view;

import com.intellij.ide.projectView.ProjectView;
import com.intellij.ide.projectView.impl.AbstractProjectViewPane;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.view.assets.ASRootAssetsTreeNode;
import codeOrchestra.actionscript.view.dnd.ASProjectPaneModelDnDListener;
import codeOrchestra.actionscript.view.dnd.ASProjectPaneRootDnDListener;
import codeOrchestra.actionscript.view.dnd.ASTreeTransferable;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.rgs.server.RGSParametersCLI;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.ide.ui.smodel.NodeEditor;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;

import javax.swing.tree.TreeSelectionModel;
import java.awt.dnd.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ActionScriptTree extends MPSTree implements NodeEditor {

  public final static Comparator<Solution> MODULE_COMPARATOR = new Comparator<Solution>() {
    @Override
    public int compare(Solution solution1, Solution solution2) {
      return (solution1.toString().compareTo(solution2.toString()));
    }
  };

  private ActionScriptViewPane asViewPane;

  public ActionScriptTree(ActionScriptViewPane actionScriptViewPane) {
    super();
    asViewPane = actionScriptViewPane;

    getSelectionModel().setSelectionMode(TreeSelectionModel.DISCONTIGUOUS_TREE_SELECTION);
    scrollsOnExpand = false;

    //drag support is alive while the tree is alive
    if (!RGSParametersCLI.isInServerMode()) {
      DragSource.getDefaultDragSource().createDefaultDragGestureRecognizer(this, DnDConstants.ACTION_MOVE, new ASTreeDragGestureListener());
      new DropTarget(this, new ASProjectPaneRootDnDListener(this, new RootsTransferable(null).getTransferDataFlavors()[0]));
      new DropTarget(this, new ASProjectPaneModelDnDListener(this, new ModelsTransferable(null).getTransferDataFlavors()[0]));
    }
  }

  @Override
  public boolean isAutoOpen() {
    return asViewPane.myProjectView.isAutoscrollToSource(ActionScriptViewPane.ID);
  }

  public void editNode(final SNode node, IOperationContext context, boolean focus) {
    boolean select = ModelAccess.instance().runReadAction(new Computable<Boolean>() {
      public Boolean compute() {
        return !node.isRoot();
      }
    });
    asViewPane.editNode(node, context, focus, select);
  }

  @Override
  public void invalidateTreeCache() {
    asViewPane.invalidateCache();
  }

  protected MPSTreeNode rebuild() {
    Project project = asViewPane.getProject();
    if (project == null) {
      return new TextTreeNode("Loading...");
    }
    MPSProject mpsProject = project.getComponent(MPSProject.class);
    ASProjectTreeNode root = new ASProjectTreeNode(mpsProject);

    // Modules
    List<Solution> solutions = mpsProject.getProjectSolutions();
    Collections.sort(solutions, MODULE_COMPARATOR);
    for (Solution solution : solutions) {
      if (!SolutionUtils.isActionScriptDependent(solution) || SolutionUtils.isStubSolution(solution) || SolutionUtils.isLiveCodingSolution(solution, project)) {
        continue;
      }
      ASProjectModuleTreeNode moduleTreeNode = new ASProjectModuleTreeNode(solution, mpsProject);
      root.add(moduleTreeNode);
    }

    // Libraries
    asViewPane.librariesTreeNode = new ASLibrariesTreeNode(mpsProject);
    root.add(asViewPane.librariesTreeNode);

    // Assets
    root.add(new ASRootAssetsTreeNode(mpsProject));

    asViewPane.invalidateCache();

    return root;
  }

  private static class RootsTransferable extends ASTreeTransferable {
    private RootsTransferable(Object o) {
      super(o);
    }

    protected String getSupportedFlavor() {
      return "ASNodeToMoveFlavor";
    }
  }

  private static class ModelsTransferable extends ASTreeTransferable {
    private ModelsTransferable(Object o) {
      super(o);
    }

    protected String getSupportedFlavor() {
      return "ASModelToMoveFlavor";
    }
  }


  private class ASTreeDragSourceListener extends DragSourceAdapter {
    public void dragEnter(DragSourceDragEvent dsde) {
      dsde.getDragSourceContext().setCursor(null);
    }

    public void dropActionChanged(DragSourceDragEvent dsde) {
      dsde.getDragSourceContext().setCursor(null);
    }
  }

  private class ASTreeDragGestureListener implements DragGestureListener {
    public void dragGestureRecognized(DragGestureEvent dge) {
      if ((dge.getDragAction() & DnDConstants.ACTION_COPY_OR_MOVE) == 0) return;

      // Retrieve the AS view pane
      ProjectView projectView = ProjectView.getInstance(asViewPane.getProject());
      if (projectView == null) return;
      final AbstractProjectViewPane currentPane = projectView.getCurrentProjectViewPane();
      if (!(currentPane instanceof ActionScriptViewPane)) return;

      // Drag SNodes
      List<SNode> selectedSNodes = new ArrayList<SNode>(asViewPane.getSelectedSNodes());
      if (!selectedSNodes.isEmpty()) {
        try {
          dge.startDrag(DragSource.DefaultMoveNoDrop, new RootsTransferable(selectedSNodes), new ASTreeDragSourceListener());
        } catch (InvalidDnDOperationException ignored) {
        }
        return;
      }

      // Drag models
      List<SModelDescriptor> selectedModels = new ArrayList<SModelDescriptor>(asViewPane.getSelectedModels());
      if (!selectedModels.isEmpty()) {
        try {
          dge.startDrag(DragSource.DefaultMoveNoDrop, new ModelsTransferable(selectedModels), new ASTreeDragSourceListener());
        } catch (InvalidDnDOperationException ignored) {
        }
      }
    }
  }

}
