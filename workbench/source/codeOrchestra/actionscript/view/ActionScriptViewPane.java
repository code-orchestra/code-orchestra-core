package codeOrchestra.actionscript.view;

import com.intellij.ide.*;
import com.intellij.ide.projectView.ProjectView;
import com.intellij.ide.projectView.impl.AbstractProjectViewPane;
import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.command.CommandAdapter;
import com.intellij.openapi.command.CommandEvent;
import com.intellij.openapi.command.CommandProcessor;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.fileEditor.FileEditor;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.fileEditor.FileEditorManagerAdapter;
import com.intellij.openapi.fileEditor.FileEditorManagerEvent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.ActionCallback;
import com.intellij.openapi.util.Disposer;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.openapi.vfs.VirtualFileManager;
import com.intellij.openapi.vfs.VirtualFileManagerListener;
import com.intellij.openapi.wm.ToolWindow;
import com.intellij.openapi.wm.ToolWindowId;
import com.intellij.openapi.wm.ToolWindowManager;
import codeOrchestra.actionscript.stubs.SWCStubsRegistry;
import codeOrchestra.actionscript.view.assets.AssetFileProvider;
import codeOrchestra.actionscript.view.utils.Languages;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.environment.view.EnvironmentLibraryManager;
import jetbrains.mps.generator.GenerationListener;
import jetbrains.mps.generator.GenerationOptions;
import jetbrains.mps.generator.GeneratorManager;
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.ide.actions.CopyNode_Action;
import jetbrains.mps.ide.actions.CutNode_Action;
import jetbrains.mps.ide.actions.PasteNode_Action;
import jetbrains.mps.ide.projectPane.AbstractProjectViewSelectInTarget;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.projectPane.ProjectPane.ComponentCreationListener;
import jetbrains.mps.ide.projectPane.logicalview.ProjectTreeFindHelper;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModuleTreeNode;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNodeEx;
import jetbrains.mps.ide.ui.smodel.NodeEditor;
import jetbrains.mps.ide.ui.smodel.PackageNode;
import jetbrains.mps.ide.ui.smodel.SNodeTreeNode;
import jetbrains.mps.ide.vfs.VirtualFileUtils;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.reloading.ReloadListener;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.Condition;
import jetbrains.mps.util.annotation.Hack;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.ActionPlace;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.BaseSNodeDescriptor;
import jetbrains.mps.workbench.actions.goTo.index.descriptor.SNodeDescriptor;
import jetbrains.mps.workbench.editors.MPSEditorOpener;
import jetbrains.mps.workbench.editors.MPSFileNodeEditor;
import jetbrains.mps.workbench.nodesFs.MPSNodeVirtualFile;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.JScrollPane;
import javax.swing.JTree;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreeNode;
import javax.swing.tree.TreePath;
import java.awt.Component;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.util.*;

/**
 * @author Alexander Eliseyev
 */
@State(
  name = "ActionScriptViewPane",
  storages = {
    @Storage(
      id = "other",
      file = "$WORKSPACE_FILE$"
    )
  }
)
public class ActionScriptViewPane extends AbstractProjectViewPane implements IProjectPane, AssetFileProvider {

  private static final Logger LOG = Logger.getLogger(ActionScriptViewPane.class);

  /** SWC stereotype name. */
  public static final String SWC_STUB = "swc_stub";

  public static final String ID = "ActionScript";
  public static final String TITLE = "ActionScript View";

  ASLibrariesTreeNode librariesTreeNode;
  ProjectView myProjectView;

  private boolean updateTreeOnModelDelete = true;
  private boolean myNeedRebuild = false;
  private boolean myDisposed;
  private boolean myLastPropertiesState;
  private MyScrollPane myScrollPane;

  private boolean preserveNodeCache;
  private BaseSNodeDescriptor[] cachedNodes;
  private Object cacheMonitor = new Object();

  // Listener fields

  private MyModelAccessListener myModelAccessListener = new MyModelAccessListener();
  private VirtualFileManagerListener myRefreshListener = new RefreshListener();
  private SModelRepositoryListener mySModelRepositoryListener = new MyModelRepositoryAdapter();
  private MyCommandListener myCommandListener = new MyCommandListener();
  private MyModuleRepositoryListener myRepositoryListener = new MyModuleRepositoryListener();

  private ReloadListener myReloadListener = new ReloadAdapter() {
    public void onAfterReload() {
      ModelAccess.instance().runReadInEDT(new Runnable() {
        public void run() {
          rebuild();
        }
      });
    }
  };

  public boolean isUpdateTreeOnModelDelete() {
    return updateTreeOnModelDelete;
  }

  public void setUpdateTreeOnModelDelete(boolean updateTreeOnModelDelete) {
    this.updateTreeOnModelDelete = updateTreeOnModelDelete;
  }

  private class MyModelAccessListener extends ModelAccessAdapter {
    public void commandStarted() {
      myNeedRebuild = false;
    }

    public void commandFinished() {
      if (!myNeedRebuild) return;
      JTree tree = getTree();
      if (tree instanceof MPSTree) {
        ((MPSTree) tree).rebuildLater();
      }
      myNeedRebuild = false;
    }
  }

  private FileEditorManagerAdapter myEditorListener = new FileEditorManagerAdapter() {
    public void selectionChanged(FileEditorManagerEvent event) {
      FileEditor fileEditor = event.getNewEditor();
      if (fileEditor instanceof MPSFileNodeEditor) {
        final MPSFileNodeEditor editor = (MPSFileNodeEditor) fileEditor;
        if (myProjectView.isAutoscrollFromSource(ID)) {
          EditorComponent editorComponent = editor.getNodeEditor().getCurrentEditorComponent();
          if (editorComponent == null) return;
          final SNode sNode = editorComponent.getEditedNode();
          ModelAccess.instance().runReadInEDT(new Runnable() {
            public void run() {
              selectNode(sNode);
            }
          });
        }
      }
    }
  };

  @Override
  public void selectModel(SModelDescriptor model, boolean focus) {
    selectModel(model);
  }

  @Override
  public void selectModule(IModule module, boolean focus) {
    selectModule(module);
  }

  public void addComponentCreationListener(@NotNull ComponentCreationListener l) {
    // do nothing
  }

  public void removeComponentCreationListener(ComponentCreationListener componentCreationListener) {
    // do nothing
  }

  public String getMessageMarker() {
    return ASMessageMarker.MARKER;
  }

  /**
   * Generation listener.
   */
  private GenerationListener myGenerationListener = new GenerationListener() {
    public void beforeGeneration(List<SModelDescriptor> inputModels, GenerationOptions options, IOperationContext operationContext) {
    }
    public void afterGeneration(List<SModelDescriptor> inputModels, GenerationOptions options, IOperationContext operationContext) {
    }
    public void modelsGenerated(List<SModelDescriptor> models, boolean success) {
    }
  };

  /**
   * Constructs an ActionScriptViewPane object.
   *
   * @param project
   * @param projectView
   */
  public ActionScriptViewPane(Project project, ProjectView projectView) {
    super(project);

    if (project == null) {
      throw new IllegalArgumentException("Null project in pane init");
    }

    myTree = new ActionScriptTree(this);
    Disposer.register(this, (ActionScriptTree) myTree);
    myProjectView = projectView;
    myLastPropertiesState = projectView.isShowMembers(ID);

    myScrollPane = new MyScrollPane(getTree());
    getTree().addKeyListener(new KeyAdapter() {
      public void keyPressed(KeyEvent e) {
        if (e.getKeyCode() == KeyEvent.VK_F4 && e.getModifiers() == 0) {
          openEditor();
          e.consume();
        }
        if (e.getKeyCode() == KeyEvent.VK_ENTER && e.getModifiers() == 0) {
          openEditor();
          e.consume();
        }
      }
    });

    addListeners();
  }

  public void openEditor() {
    TreePath selectionPath = getTree().getSelectionPath();
    if (selectionPath == null) return;
    if (!(selectionPath.getLastPathComponent() instanceof SNodeTreeNode)) return;
    SNodeTreeNode selectedTreeNode = (SNodeTreeNode) selectionPath.getLastPathComponent();

    IEditor editor = getProject().getComponent(MPSEditorOpener.class).editNode(selectedTreeNode.getSNode(), selectedTreeNode.getOperationContext());
    //editor.requestFocus();
  }

  public NodeEditor getNodeEditor() {
    return (NodeEditor) getTree();
  }

  public void rebuild() {
    doRebuildTree();
  }

  public void doRebuildTree() {
    ModelAccess.instance().runReadInEDT(new Runnable() {
      public void run() {
        if (isDisposed()) {
          return;
        }
        rebuildTreeNow();
      }
    });
  }

  private void rebuildTreeNow() {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        rebuildTree();
      }
    });
  }

  private class MyScrollPane extends JScrollPane implements DataProvider {
    private MyScrollPane(Component view) {
      super(view);
    }

    @Nullable
    public Object getData(@NonNls String dataId) {
      return ActionScriptViewPane.this.getData(dataId);
    }
  }

  public boolean isDisposed() {
    return myDisposed;
  }

  public MPSTree getTree() {
    return (MPSTree) myTree;
  }

  public void rebuildTree() {
    getTree().rebuildNow();
  }

  public String getTitle() {
    return TITLE;
  }

  public Icon getIcon() {
    return Icons.CLOSED_FOLDER;
  }

  @NotNull
  public String getId() {
    return ID;
  }

  public JComponent createComponent() {
    return myScrollPane;
  }

  public void selectNode(@NotNull final SNode node) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        getTree().runWithoutExpansion(new Runnable() {
          public void run() {
            MPSTreeNodeEx sNodeNode = findMostSuitableSNodeTreeNode(node);

            if (sNodeNode == null) {
              LOG.warning("Couldn't select node \"" + node.getName() + "\" : tree node not found.");
              return;
            }

            getTree().selectNode(sNodeNode);
          }
        });
      }
    });
  }

  @Override
  public void selectNode(@NotNull SNode node, boolean focus) {
    selectNode(node);
  }

  protected void addListeners() {
    VirtualFileManager.getInstance().addVirtualFileManagerListener(myRefreshListener);
    SModelRepository.getInstance().addModelRepositoryListener(mySModelRepositoryListener);
    ModelAccess.instance().addCommandListener(myModelAccessListener);
    //CommandProcessor.getInstance().addCommandListener(myCommandListener);
    MPSModuleRepository.getInstance().addModuleRepositoryListener(myRepositoryListener);
    getProject().getComponent(GeneratorManager.class).addGenerationListener(myGenerationListener);
    getProject().getComponent(FileEditorManager.class).addFileEditorManagerListener(myEditorListener);
    ClassLoaderManager.getInstance().addReloadHandler(myReloadListener);
  }

  public void dispose() {
    ClassLoaderManager.getInstance().removeReloadHandler(myReloadListener);
    removeListeners();
    myDisposed = true;
  }

  public void selectModule(@NotNull final IModule solution) {
    ModelAccess.instance().runReadInEDT(new Runnable() {
      public void run() {
        // RE-955
        getTree().rebuildNow();

        MPSTreeNode moduleTreeNode = findMostSuitableModuleTreeNode(solution);

        if (moduleTreeNode == null) {
          LOG.warning("Couldn't select solution \"" + solution.getModuleFqName() + "\" : tree node not found.");
          return;
        }

        getTree().selectNode(moduleTreeNode);
      }
    });
  }

  @Hack
  public static ActionScriptViewPane getInstance(Project project) {
    final ProjectView projectView = ProjectView.getInstance(project);

    //to ensure panes are initialized
    //filed http://jetbrains.net/tracker/issue/IDEA-24732

    projectView.getSelectInTargets();

    return (ActionScriptViewPane) projectView.getProjectViewPaneById(ID);
  }

  // --- Assets methods

  @Override
  public String getAssetRelativePath() {
    DefaultMutableTreeNode selectedNode = getSelectedNode();
    if (selectedNode instanceof AssetFileProvider) {
      return ((AssetFileProvider) selectedNode).getAssetRelativePath();
    }
    return null;
  }

  @Override
  public String getAssetAbsolutePath() {
    DefaultMutableTreeNode selectedNode = getSelectedNode();
    if (selectedNode instanceof AssetFileProvider) {
      return ((AssetFileProvider) selectedNode).getAssetAbsolutePath();
    }
    return null;
  }

  public List<String> getAssetAbsolutePaths() {
    List<MPSTreeNode> selectedTreeNodes = getSelectedTreeNodes(MPSTreeNode.class);

    if (selectedTreeNodes == null || selectedTreeNodes.isEmpty()) {
      return null;
    }

    List<String> result = new ArrayList<String>();
    for (MPSTreeNode selectedNode : selectedTreeNodes) {
      if (selectedNode instanceof AssetFileProvider) {
        result.add(((AssetFileProvider) selectedNode).getAssetAbsolutePath());
      }
    }

    if (result.isEmpty()) {
      return null;
    }

    return result;
  }

  // ---

  @Nullable
  public Object getData(@NonNls String dataId) {
    // Assets
    if (dataId.equals(MPSDataKeys.ASSET_ABSOLUTE_PATHS.getName())) return getAssetAbsolutePaths();
    if (dataId.equals(MPSDataKeys.ASSET_ABSOLUTE_PATH.getName())) return getAssetAbsolutePath();
    if (dataId.equals(MPSDataKeys.ASSET_RELATIVE_PATH.getName())) return getAssetRelativePath();

    //MPSDK
    if (dataId.equals(MPSDataKeys.NODE.getName())) return getSelectedSNode();
    if (dataId.equals(MPSDataKeys.NODES.getName())) return getSelectedSNodes();

    if (dataId.equals(MPSDataKeys.MODEL.getName())) return getSelectedModel();
    if (dataId.equals(MPSDataKeys.CONTEXT_MODEL.getName())) return getContextModel();
    if (dataId.equals(MPSDataKeys.MODELS.getName())) return getSelectedModels();

    if (dataId.equals(MPSDataKeys.MODULE.getName())) return getSelectedModule();
    if (dataId.equals(MPSDataKeys.CONTEXT_MODULE.getName())) return getContextModule();
    if (dataId.equals(MPSDataKeys.MODULES.getName())) return getSelectedModules();

    if (dataId.equals(MPSDataKeys.VIRTUAL_PACKAGE.getName())) {
      List<String> selectedPackages = getSelectedPackages();
      if (selectedPackages.size() != 1) return null;
      return selectedPackages.get(0);
    }
    if (dataId.equals(MPSDataKeys.VIRTUAL_PACKAGES.getName())) return getSelectedPackages();

    if (dataId.equals(MPSDataKeys.OPERATION_CONTEXT.getName())) return getContextForSelection();
    if (dataId.equals(MPSDataKeys.LOGICAL_VIEW_NODE.getName())) return getSelectedTreeNode(TreeNode.class);
    if (dataId.equals(MPSDataKeys.LOGICAL_VIEW_NODES.getName())) return getSelectedTreeNodes(TreeNode.class);
    if (dataId.equals(MPSDataKeys.LOGICAL_VIEW_SELECTION_SIZE.getName())) return getSelectionSize();
    if (dataId.equals(MPSDataKeys.PLACE.getName())) return getPlace();

    //PDK
    if (dataId.equals(PlatformDataKeys.COPY_PROVIDER.getName())) return new MyCopyProvider();
    if (dataId.equals(PlatformDataKeys.PASTE_PROVIDER.getName())) return new MyPasteProvider();
    if (dataId.equals(PlatformDataKeys.CUT_PROVIDER.getName())) return new MyCutProvider();
    if (dataId.equals(PlatformDataKeys.VIRTUAL_FILE_ARRAY.getName())) return getSelectedFiles();

    //not found
    return null;
  }

  protected ASProjectModuleTreeNode findMostSuitableModuleTreeNode(final @NotNull IModule module) {
    ASProjectModuleTreeNode result = findModuleTreeNodeInProject(module);
    if (result != null) return result;

    if (librariesTreeNode != null) {
      librariesTreeNode.init();
    }

    return findModuleTreeNodeAnywhere(module);
  }

  protected ASProjectModuleTreeNode findModuleTreeNodeAnywhere(@NotNull IModule module) {
    return (ASProjectModuleTreeNode) findTreeNode(getTree().getRootNode(),
      new ModuleEverywhereCondition(),
      new NodeForModuleCondition(module));
  }

  protected ASProjectModuleTreeNode findModuleTreeNodeInProject(final @NotNull IModule module) {
    return (ASProjectModuleTreeNode) findTreeNode(getTree().getRootNode(),
      new ModuleInProjectCondition(),
      new NodeForModuleCondition(module));
  }

  private static class NodeForModuleCondition implements Condition<MPSTreeNode> {
    private final IModule myModule;

    public NodeForModuleCondition(IModule module) {
      myModule = module;
    }

    public boolean met(MPSTreeNode treeNode) {
      if (!(treeNode instanceof ASProjectModuleTreeNode)) return false;
      IOperationContext nodeContext = treeNode.getOperationContext();
      return nodeContext != null && nodeContext.getModule() == myModule;
    }
  }

  private static class ModuleInProjectCondition extends ModuleEverywhereCondition {
    public boolean met(MPSTreeNode object) {
      if (!super.met(object)) return false;
      //do not go into libraries
      return !(object instanceof ASLibrariesTreeNode);
    }
  }

  private static class ModuleEverywhereCondition implements Condition<MPSTreeNode> {
    public boolean met(MPSTreeNode node) {
      if (node instanceof ASProjectModuleTreeNode) return false;
      if (node instanceof ASPackageTreeNode) return false;
      return true;
    }
  }

  protected MPSTreeNode findTreeNode(MPSTreeNode root, Condition<MPSTreeNode> descendCondition, Condition<MPSTreeNode> resultCondition) {
    if (resultCondition.met(root)) {
      return root;
    }

    if (descendCondition.met(root)) {
      if (!root.isInitialized()) {
        root.init();
      }
      for (MPSTreeNode node : root) {
        MPSTreeNode result = findTreeNode(node, descendCondition, resultCondition);
        if (result != null) {
          return result;
        }
      }
    }
    return null;
  }

  public ActionCallback updateFromRoot(boolean b) {
    getTree().rebuildLater();
    return new ActionCallback();
  }

  public void select(Object o, VirtualFile virtualFile, boolean b) {
  }

  public int getWeight() {
    return 0;
  }

  @Override
  public SelectInTarget createSelectInTarget() {
    return new ActionScriptSelectInTarget();
  }

  private class ActionScriptSelectInTarget extends AbstractProjectViewSelectInTarget {
    private ActionScriptSelectInTarget() {
      super(myProject, ID, 0, "ActionScript View");
    }

    @Override
    public boolean canSelect(SelectInContext context) {
      return getNode(context) != null;
    }


    @Override
    protected void doSelectIn(SelectInContext context, boolean requestFocus) {
      SNode toSelect = getNode(context);
      if (toSelect != null) {
        selectNode(toSelect);
      }
    }

    private SNode getNode(SelectInContext context) {
      VirtualFile virtualFile = context.getVirtualFile();
      if (!(virtualFile instanceof MPSNodeVirtualFile)) return null;

      MPSNodeVirtualFile file = (MPSNodeVirtualFile) virtualFile;
      FileEditor[] editors = FileEditorManager.getInstance(myProject).getEditors(file);
      if (editors.length != 0) {
        FileEditor editor = editors[0];
        if (!(editor instanceof MPSFileNodeEditor)) return null;
        EditorComponent editorComponent = ((MPSFileNodeEditor) editor).getNodeEditor().getCurrentEditorComponent();
        if (editorComponent == null) return null;
        return editorComponent.getEditedNode();
      } else {
        return file.getNode();
      }
    }
  }

  public void activate() {
    activatePane(new PaneActivator(false), true);
  }

  private void activatePane(PaneActivator activator, boolean autoFocusContents) {
    ToolWindowManager windowManager = ToolWindowManager.getInstance(getProject());
    ToolWindow projectViewToolWindow = windowManager.getToolWindow(ToolWindowId.PROJECT_VIEW);
    projectViewToolWindow.activate(activator, autoFocusContents);
  }

  public ProjectView getProjectView() {
    return myProjectView;
  }

  private class PaneActivator implements Runnable {
    private boolean myRunReadAction;

    private PaneActivator(boolean runReadAction) {
      myRunReadAction = runReadAction;
    }

    @Override
    public final void run() {
      getProjectView().changeView(getId());
      // TODO: check if we need running read action here, or should we better do it inside myFindHelper methods.
      if (myRunReadAction) {
        ModelAccess.instance().runReadAction(new Runnable() {
          @Override
          public void run() {
            doOnPaneActivation();
          }
        });
      } else {
        doOnPaneActivation();
      }
    }

    protected void doOnPaneActivation() {
    }
  }

  public Project getProject() {
    return myProject;
  }

  //todo:the same thing for nodes & modules
  protected void onBeforeModelWillBeDeleted(SModelDescriptor sm) {
    if (updateTreeOnModelDelete) {
      selectNextModel(sm);
    }
  }

  //----select next queries----

  public void selectNextModel(SModelDescriptor modelDescriptor) {
    MPSTreeNode mpsTreeNode = findNextTreeNode(modelDescriptor);
    getTree().selectNode(mpsTreeNode);
  }

  public void selectNextNode(SNode node) {
    MPSTreeNode mpsTreeNode = findNextTreeNode(node);
    getTree().selectNode(mpsTreeNode);
  }

  //todo: will work bad e.g. if operating with project data from modules pool
  public MPSTreeNode findNextTreeNode(SModelDescriptor modelDescriptor) {
    ASPackageTreeNode sModelNode = findMostSuitableModelTreeNode(modelDescriptor);
    if (sModelNode == null) return null;
    DefaultMutableTreeNode parentNode = (DefaultMutableTreeNode) sModelNode.getParent();
    TreeNode result = parentNode.getChildAfter(sModelNode);
    if (result == null) result = parentNode.getChildBefore(sModelNode);
    if (result == null) result = parentNode;
    return (MPSTreeNode) result;
  }

  //todo: will work bad e.g. if operating with project data from modules pool
  public MPSTreeNode findNextTreeNode(SNode node) {
    MPSTreeNode foundNode = findMostSuitableSNodeTreeNode(node);
    if (foundNode == null) return null;
    DefaultMutableTreeNode parentNode = (DefaultMutableTreeNode) foundNode.getParent();
    TreeNode result = parentNode.getChildAfter(foundNode);
    if (result == null) result = parentNode.getChildBefore(foundNode);
    if (result == null) result = parentNode;
    return (MPSTreeNode) result;
  }

  protected MPSTreeNodeEx findMostSuitableSNodeTreeNode(@NotNull SNode node) {
    SModel model = node.getModel();
    if (model == null) return null;
    SModelDescriptor modelDescriptor = model.getModelDescriptor();
    ASPackageTreeNode modelNode = findMostSuitableModelTreeNode(modelDescriptor, node);
    if (modelNode == null) return null;

    return findSNodeTreeNodeInParent(node, modelNode);
  }

  protected MPSTreeNodeEx findSNodeTreeNodeInParent(@NotNull SNode node, @NotNull MPSTreeNode parent) {
    //todo rewrite using findTreeNode
    if (!(parent.isInitialized() || parent.hasInfiniteSubtree())) parent.init();
    if (parent instanceof SNodeTreeNode) {
      SNodeTreeNode parentSNodeTreeNode = (SNodeTreeNode) parent;
      if (node == parentSNodeTreeNode.getSNode()) {
        return parentSNodeTreeNode;
      }
    }
    for (MPSTreeNode childNode : parent) {
      MPSTreeNodeEx foundNode = findSNodeTreeNodeInParent(node, childNode);
      if (foundNode != null) {
        return foundNode;
      }
    }
    return null;
  }

  protected void editNode(final SNode node, final IOperationContext context, final boolean focus, final boolean select) {
    ModelAccess.instance().executeCommand(new Runnable() {
      public void run() {
        MPSEditorOpener opener = getProject().getComponent(MPSEditorOpener.class);
        assert opener != null;
        opener.openNode(node, context, focus, select);
      }
    }, myProject);
  }

  protected ASPackageTreeNode findMostSuitableModelTreeNode(@NotNull SModelDescriptor model, SNode forNode) {
    IModule module = null;
    if (forNode == null) {
      module = ProjectTreeFindHelper.getModuleForModel(getProject().getComponent(MPSProject.class), model);
    } else {
      module = ProjectTreeFindHelper.getModuleForModelAndRoot(getProject().getComponent(MPSProject.class), model, forNode);
    }

    if (module == null) return findModelTreeNodeAnywhere(model, getTree().getRootNode());

    ASProjectModuleTreeNode moduleTreeNode = findMostSuitableModuleTreeNode(module);
    if (moduleTreeNode == null) return findModelTreeNodeAnywhere(model, getTree().getRootNode());

    return findModelTreeNodeInModule(model, moduleTreeNode);
  }

  protected ASPackageTreeNode findMostSuitableModelTreeNode(@NotNull SModelDescriptor model) {
    return findMostSuitableModelTreeNode(model, null);
  }

  protected ASPackageTreeNode findModelTreeNodeInModule(final @NotNull SModelDescriptor model, @NotNull ASProjectModuleTreeNode moduleNode) {
    return (ASPackageTreeNode) findTreeNode(moduleNode, new ModelInModuleCondition(), new NodeForModelCondition(model));
  }

  protected ASPackageTreeNode findModelTreeNodeAnywhere(@NotNull SModelDescriptor model, @NotNull MPSTreeNode parentNode) {
    return (ASPackageTreeNode) findTreeNode(parentNode, new ModelEverywhereCondition(), new NodeForModelCondition(model));
  }

  void invalidateCache() {
    synchronized (cacheMonitor) {
      if (preserveNodeCache) {
        preserveNodeCache = false;
      } else {
        cachedNodes = null;
      }
    }
  }

  private class RefreshListener implements VirtualFileManagerListener {
    public void beforeRefreshStart(boolean asynchonous) {

    }

    public void afterRefreshFinish(boolean asynchonous) {
      if (myNeedRebuild) {
        JTree tree = getTree();
        if (tree instanceof MPSTree) {
          ((MPSTree) tree).rebuildLater();
        }
        myNeedRebuild = false;
      }
    }
  }

  private static class NodeForModelCondition implements Condition<MPSTreeNode> {
    private final SModelDescriptor myModel;

    public NodeForModelCondition(SModelDescriptor model) {
      myModel = model;
    }

    public boolean met(MPSTreeNode node) {
      if (!(node instanceof ASPackageTreeNode)) return false;
      ASPackageTreeNode modelNode = (ASPackageTreeNode) node;
      SModelDescriptor modelDescriptor = modelNode.getSModelDescriptor();
      SModelReference modelReference = modelDescriptor.getSModelReference();
      return modelReference.equals(myModel.getSModelReference());
    }
  }

  private static class ModelInModuleCondition extends ModelEverywhereCondition {
    public boolean met(MPSTreeNode node) {
      if (!super.met(node)) return false;

      boolean descent = false;

      if (node instanceof ASProjectModuleTreeNode) descent = true;

      if (!descent) return false;

      if (!node.isInitialized() && !node.hasInfiniteSubtree()) {
        node.init();
        return true;
      }

      return node.isInitialized();
    }
  }

  private static class ModelEverywhereCondition implements Condition<MPSTreeNode> {
    public boolean met(MPSTreeNode node) {
      if (node instanceof ASPackageTreeNode) return false;
      if (!node.isInitialized() && !node.hasInfiniteSubtree()) {
        node.init();
        return true;
      }
      return node.isInitialized();
    }
  }

  private class MyModelRepositoryAdapter extends SModelRepositoryAdapter {

    public void modelRepositoryChanged(SModelDescriptor modelDescriptor) {
      if (!SModelStereotype.INTERNAL.equals(modelDescriptor.getStereotype())) {
        myNeedRebuild = true;
      }
    }

    public void beforeModelDeleted(SModelDescriptor modelDescriptor) {
      onBeforeModelWillBeDeleted(modelDescriptor);
    }
  }

  private class MyModuleRepositoryListener extends ModuleRepositoryAdapter {
    public void moduleAdded(IModule module) {
      myNeedRebuild = true;
    }

    public void moduleRemoved(IModule module) {
      myNeedRebuild = true;
    }
  }

  private class MyCommandListener extends CommandAdapter {
    public void commandStarted(CommandEvent event) {
      myNeedRebuild = false;
    }

    public void commandFinished(CommandEvent event) {
      if (myNeedRebuild) {
        getTree().rebuildLater();
        myNeedRebuild = false;
      }
    }
  }

  protected void removeListeners() {
    MPSProject mpsProject = getProject().getComponent(MPSProject.class);

    if (mpsProject != null) {
      SModelRepository.getInstance().removeModelRepositoryListener(mySModelRepositoryListener);
      CommandProcessor.getInstance().removeCommandListener(myCommandListener);
      MPSModuleRepository.getInstance().removeModuleRepositoryListener(myRepositoryListener);
      getProject().getComponent(GeneratorManager.class).addGenerationListener(myGenerationListener);
      getProject().getComponent(FileEditorManager.class).removeFileEditorManagerListener(myEditorListener);
      VirtualFileManager.getInstance().removeVirtualFileManagerListener(myRefreshListener);
    }
  }

  //----selection queries----

  public IModule getSelectedModule() {
    ProjectModuleTreeNode selectedTreeNode = getSelectedTreeNode(ProjectModuleTreeNode.class);
    if (selectedTreeNode == null) return null;
    return selectedTreeNode.getModule();
  }

  public IModule getContextModule() {
    MPSTreeNode treeNode = (MPSTreeNode) getSelectedTreeNode(TreeNode.class);
    while (treeNode != null && !(treeNode instanceof ProjectModuleTreeNode)) {
      treeNode = (MPSTreeNode) treeNode.getParent();
    }
    if (treeNode == null) return null;
    return ((ProjectModuleTreeNode) treeNode).getModule();
  }

  public List<IModule> getSelectedModules() {
    List<IModule> result = new ArrayList<IModule>();
    for (ProjectModuleTreeNode node : getSelectedTreeNodes(ProjectModuleTreeNode.class)) {
      result.add(node.getModule());
    }
    return result;
  }

  public SModelDescriptor getSelectedModel() {
    ASPackageTreeNode selectedTreeNode = getSelectedTreeNode(ASPackageTreeNode.class);
    if (selectedTreeNode == null) return null;
    return selectedTreeNode.getSModelDescriptor();
  }

  public SModelDescriptor getContextModel() {
    MPSTreeNode treeNode = (MPSTreeNode) getSelectedTreeNode(TreeNode.class);
    while (treeNode != null && !(treeNode instanceof ASPackageTreeNode)) {
      treeNode = (MPSTreeNode) treeNode.getParent();
    }
    if (treeNode == null) return null;
    return ((ASPackageTreeNode) treeNode).getSModelDescriptor();
  }

  public List<SModelDescriptor> getSelectedModels() {
    List<SModelDescriptor> result = new ArrayList<SModelDescriptor>();
    for (ASPackageTreeNode node : getSelectedTreeNodes(ASPackageTreeNode.class)) {
      result.add(node.getSModelDescriptor());
    }
    return result;
  }

  public SNode getSelectedSNode() {
    MPSTreeNodeEx selectedTreeNode = getSelectedTreeNode(MPSTreeNodeEx.class);
    if (selectedTreeNode == null) return null;
    return selectedTreeNode.getSNode();
  }

  public List<SNode> getSelectedSNodes() {
    List<SNode> result = new ArrayList<SNode>();
    for (MPSTreeNodeEx node : getSelectedTreeNodes(MPSTreeNodeEx.class)) {
      SNode snode = node.getSNode();
      if (snode == null) continue;
      result.add(snode);
    }
    return result;
  }

  public List<SNode> getNormalizedSelectedSNodes() {
    List<SNode> selectedNodes = new ArrayList<SNode>(getSelectedSNodes());
    HashSet<SNode> unselectedNodes = new HashSet<SNode>();

    for (SNode node : selectedNodes) {
      if (node == null) continue;
      if (unselectedNodes.contains(node)) continue;
      unselectedNodes.addAll(node.getDescendants());
    }
    selectedNodes.removeAll(unselectedNodes);
    return selectedNodes;
  }

  public List<String> getSelectedPackages() {
    List<String> result = new ArrayList<String>();
    TreePath[] paths = getTree().getSelectionPaths();
    if (paths == null) return result;
    for (TreePath path : paths) {
      MPSTreeNode node = (MPSTreeNode) path.getLastPathComponent();
      while (node != null && !(node instanceof PackageNode)) {
        node = (MPSTreeNode) node.getParent();
      }
      if (node != null) {
        result.add(((PackageNode) node).getFullPackage());
      }
    }
    return result;
  }

  //----tree node selection queries---

  private VirtualFile[] getSelectedFiles() {
    List<VirtualFile> selectedFilesList = new LinkedList<VirtualFile>();

    // add selected model files
    List<SModelDescriptor> descriptors = getSelectedModels();
    if (descriptors != null) {
      for (SModelDescriptor descriptor : descriptors) {
        if (!(descriptor instanceof EditableSModelDescriptor)) continue;
        EditableSModelDescriptor emd = (EditableSModelDescriptor) descriptor;
        IFile ifile = emd.getModelFile();
        if (ifile == null) continue;
        VirtualFile vfile = VirtualFileUtils.getVirtualFile(ifile);
        if (vfile == null) continue;
        selectedFilesList.add(vfile);
      }
    }

    // add selected modules files
    List<IModule> modules = getSelectedModules();
    if (modules != null) {
      for (IModule module : modules) {
        IFile home = module.getBundleHome();
        if (home != null) {
          VirtualFile vfile = VirtualFileUtils.getVirtualFile(home);
          if (vfile != null) {
            selectedFilesList.add(vfile);
          }
        }
        IFile ifile = module.getDescriptorFile();
        if (ifile != null) {
          VirtualFile vfile = VirtualFileUtils.getVirtualFile(ifile);
          if (vfile != null) {
            selectedFilesList.add(vfile);
          }
        }
      }
    }

    if (selectedFilesList.size() == 0) {
      return null;
    }

    return selectedFilesList.toArray(new VirtualFile[selectedFilesList.size()]);
  }

  private <T extends TreeNode> T getSelectedTreeNode(Class<T> nodeClass) {
    TreePath selectionPath = getTree().getSelectionPath();
    if (selectionPath == null) return null;
    Object selectedNode = selectionPath.getLastPathComponent();
    if (!(nodeClass.isInstance(selectedNode))) return null;
    return (T) selectedNode;
  }

  <T extends TreeNode> List<T> getSelectedTreeNodes(Class<T> nodeClass) {
    TreePath[] selectionPaths = getTree().getSelectionPaths();
    if (selectionPaths == null) return new ArrayList<T>();

    List<T> selectedTreeNodes = new ArrayList<T>(selectionPaths.length);

    for (TreePath selectionPath : selectionPaths) {
      if (selectionPath == null) continue;
      Object selectedNode = selectionPath.getLastPathComponent();
      if (!(nodeClass.isInstance(selectedNode))) continue;
      selectedTreeNodes.add((T) selectedNode);
    }
    return selectedTreeNodes;
  }

  private IOperationContext getContextForSelection() {
    TreePath[] selection = getTree().getSelectionPaths();
    if (selection == null) return null;
    if (selection.length > 0) {
      MPSTreeNode lastPathComponent = (MPSTreeNode) selection[0].getLastPathComponent();
      return lastPathComponent.getOperationContext();
    }
    return null;
  }

  public int getSelectionSize() {
    TreePath[] selection = getSelectionPaths();
    return selection == null ? 0 : selection.length;
  }

  private ActionPlace getPlace() {
    TreeNode treeNode = getSelectedTreeNode(TreeNode.class);
    if (treeNode instanceof SNodeTreeNode) {
      return ActionPlace.PROJECT_PANE_SNODE;
    } else if (treeNode instanceof ASPackageTreeNode) {
      return ActionPlace.PROJECT_PANE_SMODEL;
    } else if (treeNode instanceof ASProjectTreeNode) {
      return ActionPlace.PROJECT_PANE_PROJECT;
    } else if (treeNode instanceof ASProjectModuleTreeNode) {
      return ActionPlace.PROJECT_PANE_SOLUTION;
    }
    return ActionPlace.PROJECT_PANE;
  }

  public void selectModel(@NotNull final SModelDescriptor model) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        ASPackageTreeNode modelTreeNode = findMostSuitableModelTreeNode(model);

        if (modelTreeNode == null) {
          LOG.warning("Couldn't select model \"" + model.getLongName() + "\" : tree node not found.");
          return;
        }

        getTree().selectNode(modelTreeNode);
      }
    });
  }

  public boolean isShowPropertiesAndReferences() {
    return myLastPropertiesState;
  }

  //----copy-paste----

  private class MyCopyProvider implements CopyProvider {
    private CopyNode_Action myAction = new CopyNode_Action();

    public void performCopy(DataContext dataContext) {
      AnActionEvent event = createEvent(dataContext);
      ActionUtils.updateAndPerformAction(myAction, event);
    }

    public boolean isCopyEnabled(DataContext dataContext) {
      AnActionEvent event = createEvent(dataContext);
      myAction.update(event);
      return event.getPresentation().isEnabled();
    }

    public boolean isCopyVisible(DataContext dataContext) {
      return true;
    }
  }

  private class MyPasteProvider implements PasteProvider {
    private PasteNode_Action myAction = new PasteNode_Action();

    public void performPaste(DataContext dataContext) {
      AnActionEvent event = createEvent(dataContext);
      ActionUtils.updateAndPerformAction(myAction, event);
    }

    public boolean isPastePossible(DataContext dataContext) {
      return true;
    }

    public boolean isPasteEnabled(DataContext dataContext) {
      AnActionEvent event = createEvent(dataContext);
      myAction.update(event);
      return event.getPresentation().isEnabled();
    }
  }

  private class MyCutProvider implements CutProvider {
    private CutNode_Action myAction = new CutNode_Action();

    public void performCut(DataContext dataContext) {
      AnActionEvent event = createEvent(dataContext);
      ActionUtils.updateAndPerformAction(myAction, event);
    }

    public boolean isCutEnabled(DataContext dataContext) {
      AnActionEvent event = createEvent(dataContext);
      myAction.update(event);
      return event.getPresentation().isEnabled();
    }

    public boolean isCutVisible(DataContext dataContext) {
      return true;
    }
  }

  private AnActionEvent createEvent(DataContext context) {
    return ActionUtils.createEvent(ActionPlaces.PROJECT_VIEW_POPUP, context);
  }

  public boolean goToOperationsEnabled() {
    return true;
  }

  public BaseSNodeDescriptor[] getNodeDescriptors() {
    synchronized (cacheMonitor) {
      if (cachedNodes != null) {
        return cachedNodes;
      }
    }

    EnvironmentLibraryManager environmentConfiguration = getProject().getComponent(EnvironmentLibraryManager.class);

    List<BaseSNodeDescriptor> result = new ArrayList<BaseSNodeDescriptor>();
    ASProjectTreeNode root = (ASProjectTreeNode) getTree().getRootNode();

    // Regular modules
    for (int i = 0; i < root.getChildCount(); i++) {
      TreeNode rootChild = root.getChildAt(i);
      if (rootChild instanceof ASProjectModuleTreeNode) {
        ASProjectModuleTreeNode moduleNode = (ASProjectModuleTreeNode) rootChild;

        // RE-3484 - Skip the env. libraries implementations
        IModule module = moduleNode.getModule();
        if (environmentConfiguration.isLibraryImplementation(module)) {
          continue;
        }

        if (!moduleNode.isLibrary()) {
          extractSNodes(moduleNode, result);
        }
      }
    }

    // Library modules (non-stubs)
    List<Solution> stubSolutions = new ArrayList<Solution>();
    if (!librariesTreeNode.isInitialized()) {
      librariesTreeNode.init();
    }
    for (int i = 0; i < librariesTreeNode.getChildCount(); i++) {
      TreeNode libraryChild = librariesTreeNode.getChildAt(i);
      if (libraryChild instanceof ASLibraryTreeNode) {
        ASLibraryTreeNode libraryNode = (ASLibraryTreeNode) libraryChild;

        if (!(libraryNode.getModule() instanceof Solution)) {
          continue;
        }

        Solution module = (Solution) libraryNode.getModule();
        if (SolutionUtils.isStubSolution(module)) {
          stubSolutions.add(module);
          continue;
        } else if (environmentConfiguration.isLibraryImplementation(module)) {
          continue;
        } else {
          extractSNodes(libraryNode, result);
        }
      }
    }

    // RE-3389: Library modules (stubs)
    result.addAll(SWCStubsRegistry.getInstance().getAllBaseStubDescriptors(stubSolutions));

    // Accessory models
    for (Language language : MPSModuleRepository.getInstance().getAllLanguages()) {
      if (Languages.isCodeOrchestraLanguage(language)) {
        for (SModelDescriptor sModelDescriptor : language.getAccessoryModels()) {
          // RE-3551
          if (!(sModelDescriptor.getModule() instanceof Language)) {
            continue;
          }

          // Non-stubs only
          if (StringUtils.isEmpty(sModelDescriptor.getStereotype())) {
            for (SNode sNode : sModelDescriptor.getSModel().roots()) {
              result.add(SNodeDescriptor.fromModelReference(
                sNode.getName(),
                sNode.getConceptFqName(),
                sModelDescriptor.getSModelReference(),
                sNode.getSNodeId()
              )
              );
            }
          }
        }
      }
    }

    getTree().rebuildLater();

    BaseSNodeDescriptor[] descriptors = result.toArray(new BaseSNodeDescriptor[result.size()]);

    synchronized (cacheMonitor) {
      preserveNodeCache = true;
      this.cachedNodes = descriptors;
    }

    return descriptors;
  }

  private void extractSModelDescriptors(ASProjectModuleTreeNode moduleTreeNode, List<SModelDescriptor> sModelDescriptors) {
    if (!moduleTreeNode.isInitialized()) {
      moduleTreeNode.init();
    }
    for (int j = 0; j < moduleTreeNode.getChildCount(); j++) {
      TreeNode moduleChild = moduleTreeNode.getChildAt(j);
      if (moduleChild instanceof ASPackageTreeNode) {
        ASPackageTreeNode packageNode = (ASPackageTreeNode) moduleChild;
        sModelDescriptors.add(packageNode.getSModelDescriptor());
      }
    }
  }

  private void extractSNodes(ASProjectModuleTreeNode moduleTreeNode, List<BaseSNodeDescriptor> sNodes) {
    if (!moduleTreeNode.isInitialized()) {
      moduleTreeNode.init();
    }
    for (int i = 0; i < moduleTreeNode.getChildCount(); i++) {
      TreeNode moduleChild = moduleTreeNode.getChildAt(i);
      if (moduleChild instanceof ASPackageTreeNode) {
        ASPackageTreeNode packageNode = (ASPackageTreeNode) moduleChild;

        SModelReference modelReference = packageNode.getSModelDescriptor().getSModelReference();
        SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(modelReference);
        if (modelDescriptor == null) {
          continue;
        }

        int j = 0;
        SModel sModel = modelDescriptor.getSModel();
        for (SNode sNode : sModel.roots()) {
          BaseSNodeDescriptor nodeDescriptor = SNodeDescriptor.fromModelReference(sNode.getName(), sNode.getConceptFqName(), modelReference, sNode.getSNodeId());
          if (!sNodes.contains(nodeDescriptor)) {
            sNodes.add(nodeDescriptor);
          }
        }
      }
    }
  }

  public SModelReference[] getModelReferences() {
    SModelReference[] projectModelReferences = getProjectModelReferences();
    SModelReference[] libraryModelReferences = getLibraryModelReferences();

    SModelReference[] result = new SModelReference[projectModelReferences.length + libraryModelReferences.length];

    System.arraycopy(projectModelReferences, 0, result, 0, projectModelReferences.length);
    System.arraycopy(libraryModelReferences, 0, result, projectModelReferences.length, libraryModelReferences.length);

    return result;
  }

  public SModelReference[] getLibraryModelReferences() {
    List<SModelDescriptor> sModelDescriptors = new ArrayList<SModelDescriptor>();
    ASProjectTreeNode root = (ASProjectTreeNode) getTree().getRootNode();

    // Library modules
    if (!librariesTreeNode.isInitialized()) {
      librariesTreeNode.init();
    }
    for (int i = 0; i < librariesTreeNode.getChildCount(); i++) {
      TreeNode libraryChild = librariesTreeNode.getChildAt(i);
      if (libraryChild instanceof ASProjectModuleTreeNode) {
        ASProjectModuleTreeNode moduleNode = (ASProjectModuleTreeNode) libraryChild;
        extractSModelDescriptors(moduleNode, sModelDescriptors);
      }
    }

    List<SModelReference> result = new ArrayList<SModelReference>();
    for (SModelDescriptor md : sModelDescriptors) {
      result.add(md.getSModelReference());
    }
    return result.toArray(new SModelReference[result.size()]);
  }

  public SModelReference[] getProjectModelReferences() {
    List<SModelDescriptor> sModelDescriptors = new ArrayList<SModelDescriptor>();
    ASProjectTreeNode root = (ASProjectTreeNode) getTree().getRootNode();

    // Project regular modules
    for (int i = 0; i < root.getChildCount(); i++) {
      TreeNode rootChild = root.getChildAt(i);
      if (rootChild instanceof ASProjectModuleTreeNode) {
        ASProjectModuleTreeNode moduleNode = (ASProjectModuleTreeNode) rootChild;
        extractSModelDescriptors(moduleNode, sModelDescriptors);
      }
    }

    List<SModelReference> result = new ArrayList<SModelReference>();
    for (SModelDescriptor md : sModelDescriptors) {
      result.add(md.getSModelReference());
    }
    return result.toArray(new SModelReference[result.size()]);
  }

}
