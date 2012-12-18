package codeOrchestra.actionscript.view;

import com.intellij.openapi.actionSystem.ActionGroup;
import com.intellij.openapi.project.Project;
import com.intellij.ui.LayeredIcon;
import codeOrchestra.actionscript.view.utils.NodeUtils;
import jetbrains.mps.generator.ModelGenerationStatusListener;
import jetbrains.mps.generator.ModelGenerationStatusManager;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.projectPane.LogicalViewTree;
import jetbrains.mps.ide.projectPane.ProjectPane;
import jetbrains.mps.ide.projectPane.SortUtil;
import jetbrains.mps.ide.projectPane.logicalview.SNodeTreeUpdater;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNodeEx;
import jetbrains.mps.ide.ui.smodel.*;
import jetbrains.mps.ide.ui.smodel.SModelEventsDispatcher.SModelEventsListener;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.smodel.event.SModelEvent;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.ConditionalIterable;
import jetbrains.mps.util.ToStringComparator;
import jetbrains.mps.workbench.action.ActionUtils;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.tree.DefaultTreeModel;
import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public class ASPackageTreeNode extends MPSTreeNodeEx implements ISModelTreeNode {

  private final static List<String> memberRoles = new ArrayList<String>();

  static {
    memberRoles.add("field");
    memberRoles.add("staticField");
    memberRoles.add("constructor");
    memberRoles.add("staticMethod");
    memberRoles.add("method");
  }

  public static final String PACK = "package";
  public static final String ACTIONS_ID = "codeOrchestra.actionScript.core.plugin.ASPackageActions_ActionGroup";
  public static final Icon PACKAGE_ICON = new ImageIcon(ASPackageTreeNode.class.getResource("nodes/packageClosed.png"));

  private SModelDescriptor modelDescriptor;
  private SModelEventsListener myEventsListener;
  private ModuleDescriptor moduleDescriptor;

  private boolean myInitialized = false;

  private Condition<SNode> myNodesCondition = new Condition<SNode>(){
    public boolean met(SNode node) {
      if (node == null) {
        return false;
      }
      if (node.isRoot()) {
        // RE-1979
        Set<String> sourceModuleUIDs = node.getSourceModuleUIDs();
        if (!sourceModuleUIDs.isEmpty()) {
          return sourceModuleUIDs.contains(moduleDescriptor.getUUID());
        }
        return true;
      }
      SNode parent = node.getParent();
      if (parent == null) {
        return true;
      }
      if (!parent.isRoot()) {
        return false;
      }

      return memberRoles.contains(node.getRole_());
    }
  };
  private DependencyRecorder<ASRootTreeNode> myDependencyRecorder = new DependencyRecorder<ASRootTreeNode>();

  private MySimpleModelListener mySimpleModelListener = new MySimpleModelListener();
  private MyGenerationStatusListener myStatusListener = new MyGenerationStatusListener();

  private SNodeTreeUpdater myTreeUpdater;

  public ASPackageTreeNode(SModelDescriptor modelDescriptor, IOperationContext operationContext, ModuleDescriptor moduleDescriptor) {
    super(operationContext);
    this.modelDescriptor = modelDescriptor;
    this.moduleDescriptor = moduleDescriptor;

    if (getSModelDescriptor() != null && getSModelDescriptor() instanceof EditableSModelDescriptor) {
      myTreeUpdater = new MySNodeTreeUpdater(operationContext.getProject(), this);
      myTreeUpdater.setDependencyRecorder(myDependencyRecorder);
    }

    updatePresentation();
  }

  protected void onAdd() {
    super.onAdd();
    if (getSModelDescriptor() != null) {
      addListeners();
    }
  }

  protected void onRemove() {
    super.onRemove();
    if (getSModelDescriptor() != null) {
      removeListeners();
    }
  }

  protected void doInit() {
    {
      try {
        removeAllChildren();

        SModel model = getSModel();
        ConditionalIterable<SNode> filteredRootsIterable = new ConditionalIterable<SNode>(model.roots(), myNodesCondition);
        List<SNode> filteredRoots = new ArrayList<SNode>();
        for (SNode root : filteredRootsIterable) {
          filteredRoots.add(root);
        }
        List<SNode> sortedRoots = SortUtil.sortNodesByPresentation(filteredRoots);
        for (SNode sortedRoot : sortedRoots) {
          if (!NodeUtils.shouldBeVisible(sortedRoot)) {
            continue;
          }

          MPSTreeNodeEx treeNode = createASRootTreeNode(sortedRoot, getOperationContext(), myNodesCondition);
          add(treeNode);
        }

        MPSTree tree = getTree();
        if (tree == null) {
          System.out.println("Tree is null");
          return;
        }

        DefaultTreeModel treeModel = (DefaultTreeModel) tree.getModel();
        treeModel.nodeStructureChanged(this);
      } finally {
        myInitialized = true;
      }
    }
  }

  private void addListeners() {
    assert myEventsListener == null;

    myEventsListener = new SModelEventsListener() {
      @NotNull
      @Override
      public SModelDescriptor getModelDescriptor() {
        return modelDescriptor;
      }

      @Override
      public void eventsHappened(List<SModelEvent> events) {
        if (myTreeUpdater == null) return;
        myTreeUpdater.eventsHappenedInCommand(events);
      }
    };
    SModelEventsDispatcher.getInstance().registerListener(myEventsListener);
    getSModelDescriptor().addModelListener(mySimpleModelListener);

    if (!SModelStereotype.isStubModelStereotype(modelDescriptor.getStereotype())) {
      ModelGenerationStatusManager.getInstance().addGenerationStatusListener(myStatusListener);
    }
  }

  private void removeListeners() {
    getSModelDescriptor().removeModelListener(mySimpleModelListener);

    if (!SModelStereotype.isStubModelStereotype(modelDescriptor.getStereotype())) {
      ModelGenerationStatusManager.getInstance().removeGenerationStatusListener(myStatusListener);
    }

    if (myEventsListener == null) return;
    SModelEventsDispatcher.getInstance().unregisterListener(myEventsListener);
    myEventsListener = null;
  }

  public void updatePresentation() {
    super.updatePresentation();

    // Icon
    Icon icon = PACKAGE_ICON;
    SModelDescriptor sModelDescriptor = getSModelDescriptor();
    if (
      sModelDescriptor != null &&
        sModelDescriptor instanceof EditableSModelDescriptor &&
        ((EditableSModelDescriptor) sModelDescriptor).isChanged()) {
      icon = new LayeredIcon(icon, Icons.MODIFIED_ICON);
    }
    setIcon(icon);

    // Node Id
    if (getSModelDescriptor() != null) {
      setNodeIdentifier(getSModelDescriptor().toString());
    } else {
      setNodeIdentifier("");
    }

    // Node text
    SModelReference reference;
    if (getSModelDescriptor() != null) {
      reference = getSModelDescriptor().getSModelReference();
    } else {
      reference = getSModel().getSModelReference();
    }
    if (reference != null) {
      String modelName = reference.getLongName();
      if (StringUtils.isEmpty(modelName)) {
        modelName = "(default)";
      }
      setText(modelName);
    } else {
      setText("");
    }

    // Needs generation
    /*
    if (generationRequired()) {
      setAdditionalText("generation required");
    }
    */
  }

  public boolean isInitialized() {
    return myInitialized;
  }

  public SModel getSModel() {
    return modelDescriptor.getSModel();
  }

  public SModelDescriptor getSModelDescriptor() {
    return modelDescriptor;
  }

  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ACTIONS_ID);
  }

  public ASCreateRootNodeGroup getQuickCreateGroup(boolean plain) {
    return new ASCreateRootNodeGroup();
  }

  public void flush() {

  }

  private class MySimpleModelListener extends SModelAdapter {
    public void modelSaved(SModelDescriptor sm) {
      updateNodePresentation(false, true);
    }

    public void modelInitialized(SModelDescriptor sm) {
      updateNodePresentation(false, false);
    }

    public void modelReloaded(SModelDescriptor sm) {
      updateNodePresentation(true, true);
    }
  }

  private class MyGenerationStatusListener implements ModelGenerationStatusListener {
    public void generatedFilesChanged(SModelDescriptor sm) {
      if (sm == getSModelDescriptor()) {
        updateNodePresentation(false, true);
      }
    }
  }

  private void updateNodePresentation(final boolean reloadSubTree, final boolean updateAncesotrs) {
    ModelAccess.instance().runReadInEDT(new Runnable() {
      public void run() {
        if (getTree() == null) return;

        //module has been already removed
        if (!getOperationContext().isValid()) return;

        updatePresentation();
        updateNodePresentationInTree();
        if (reloadSubTree) {
          updateSubTree();
        }

        if (updateAncesotrs) {
          updateAncestorsPresentationInTree();
        }
      }
    });
  }

  DependencyRecorder<ASRootTreeNode> getDependencyRecorder() {
    return myDependencyRecorder;
  }

  private ASRootTreeNode findRootASRootTreeNode(SNode node) {
    return findRootASRootTreeNode(this, node);
  }

  private ASRootTreeNode findRootASRootTreeNode(MPSTreeNode current, SNode node) {
    for (int i = 0; i < current.getChildCount(); i++) {
      MPSTreeNode child = (MPSTreeNode) current.getChildAt(i);

      if (child instanceof ASRootTreeNode && ((ASRootTreeNode) child).getSNode() == node) {
        return (ASRootTreeNode) child;
      }
    }

    return null;
  }

  private void insertRoots(Set<SNode> addedRoots) {
    if (addedRoots.isEmpty()) {
      return;
    }

    DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();

    final List<SNode> allRoots = new ArrayList<SNode>();
    for (SNode root : getSModel().roots()) {
      allRoots.add(root);
    }
    Collections.sort(allRoots, new ToStringComparator(true));

    List<SNode> added = new ArrayList<SNode>(addedRoots);
    Collections.sort(added, new Comparator<SNode>() {
      public int compare(SNode o1, SNode o2) {
        return new Integer(allRoots.indexOf(o1)).compareTo(allRoots.indexOf(o2));
      }
    });

    for (SNode root : added) {
      // RE-2123
      if (!NodeUtils.shouldBeVisible(root)) {
        continue;
      }

      ASRootTreeNode nodeToInsert = new ASRootTreeNode(root, null, getOperationContext(), myNodesCondition);
      MPSTreeNode targetNode = ASPackageTreeNode.this;

      int index = -1;
      for (int i = 0; i < targetNode.getChildCount(); i++) {
        ASRootTreeNode child = (ASRootTreeNode) targetNode.getChildAt(i);
        String rp = root.toString();
        String cp = child.getSNode().toString();
        if (rp.compareTo(cp) < 0) {
          index = i;
          break;
        }
      }
      if (index == -1) {
        index = targetNode.getChildCount();
      }
      treeModel.insertNodeInto(nodeToInsert, targetNode, index);
    }
  }

  private void updateChangedPresentations(Set<SNode> nodesWithChangedProperties) {
    DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();
    for (SNode node : nodesWithChangedProperties) {
      ASRootTreeNode treeNode = (ASRootTreeNode) findDescendantWith(node);

      if (treeNode == null) continue;
      if (node.isRoot()) {
        MPSTreeNode parentTreeNode = (MPSTreeNode) treeNode.getParent();
        int currentIndex = parentTreeNode.getIndex(treeNode);

        int newIndex = -1;
        for (int i = 0; i < parentTreeNode.getChildCount(); i++) {
          if (i == currentIndex) continue;
          if (!(parentTreeNode.getChildAt(i) instanceof ASRootTreeNode)) continue;
          ASRootTreeNode child = (ASRootTreeNode) parentTreeNode.getChildAt(i);

          String rp = node.toString();
          String cp = child.getSNode().toString();
          if (rp.compareTo(cp) < 0) {
            newIndex = i;
            if (newIndex > currentIndex) {
              newIndex--;
            }
            break;
          }
        }
        if (newIndex == -1) {
          newIndex = parentTreeNode.getChildCount() - 1;
        }

        if (currentIndex != newIndex) {
          treeModel.removeNodeFromParent(treeNode);
          treeModel.insertNodeInto(treeNode, parentTreeNode, newIndex);
        }
      }

      if (treeNode.isInitialized() && showPropertiesAndReferences()) {
        MPSTreeNodeEx propsNode = (MPSTreeNodeEx) treeNode.getChildAt(0);
        propsNode.update();
        propsNode.init();
      }

      treeNode.updatePresentation();
      treeNode.updateNodePresentationInTree();
    }
  }

  private boolean showPropertiesAndReferences() {
    Project project = getOperationContext().getProject();
    return getTree() instanceof ActionScriptTree &&
      ActionScriptViewPane.getInstance(project).isShowPropertiesAndReferences();
  }

  public final ASRootTreeNode createASRootTreeNode(SNode node, IOperationContext operationContext, Condition<SNode> condition) {
    return createASRootTreeNode(node, null, operationContext, condition);
  }

  public ASRootTreeNode createASRootTreeNode(SNode node, String role, IOperationContext operationContext, Condition<SNode> condition) {
    return new ASRootTreeNode(node, role, operationContext, condition);
  }

  public List<ISModelTreeNode> getSubfolderSModelTreeNodes() {
    List<ISModelTreeNode> isModelTreeNodes = new ArrayList<ISModelTreeNode>();
    //TODO: test
    return isModelTreeNodes;
  }

  private class MySNodeTreeUpdater extends SNodeTreeUpdater<ASPackageTreeNode> {
    public MySNodeTreeUpdater(Project project, ASPackageTreeNode treeNode) {
      super(project, treeNode);
    }

    public boolean showPropertiesAndReferences() {
      return showPropertiesAndReferences(myTreeNode);
    }

    private boolean showPropertiesAndReferences(ASPackageTreeNode node) {
      Project project = node.getOperationContext().getProject();
      return node.getTree() instanceof LogicalViewTree &&
        ProjectPane.getInstance(project).isShowPropertiesAndReferences();
    }

    private SNodeTreeNode findRootSNodeTreeNode(SNode node) {
      return findRootSNodeTreeNode(myTreeNode, node);
    }

    private SNodeTreeNode findRootSNodeTreeNode(MPSTreeNode current, SNode node) {
      for (int i = 0; i < current.getChildCount(); i++) {
        MPSTreeNode child = (MPSTreeNode) current.getChildAt(i);

        if (child instanceof SNodeTreeNode && ((SNodeTreeNode) child).getSNode() == node) {
          return (SNodeTreeNode) child;
        }

        if (child instanceof SNodeGroupTreeNode || child instanceof SModelTreeNode) {
          SNodeTreeNode result = findRootSNodeTreeNode(child, node);
          if (result != null) {
            return result;
          }
        }
      }

      return null;
    }

    public SModelDescriptor getSModelDescriptor() {
      return myTreeNode.getSModel().getModelDescriptor();
    }

    public void addAndRemoveRoots(Set<SNode> removedRoots, Set<SNode> addedRoots) {
      DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();
      for (SNode root : removedRoots) {
        SNodeTreeNode node = findRootSNodeTreeNode(root);
        if (node == null) continue;


        treeModel.removeNodeFromParent(node);


      }
      myTreeNode.insertRoots(addedRoots);
    }

    public void updateNodesWithChangedPackages(Set<SNode> nodesWithChangedPackages) {
      DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();

      for (SNode node : nodesWithChangedPackages) {
        SNodeTreeNode treeNode = findRootSNodeTreeNode(node);
        if (treeNode == null) continue;



        treeModel.removeNodeFromParent(treeNode);

      }
      myTreeNode.insertRoots(nodesWithChangedPackages);
    }
  }



}
