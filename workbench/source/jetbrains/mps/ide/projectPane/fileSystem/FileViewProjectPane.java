/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.ide.projectPane.fileSystem;

import com.intellij.ide.SelectInContext;
import com.intellij.ide.SelectInTarget;
import com.intellij.ide.projectView.ProjectView;
import com.intellij.ide.projectView.impl.AbstractProjectViewPane;
import com.intellij.openapi.actionSystem.DataProvider;
import com.intellij.openapi.actionSystem.DefaultActionGroup;
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.fileEditor.FileEditorManagerAdapter;
import com.intellij.openapi.fileEditor.FileEditorManagerEvent;
import com.intellij.openapi.fileEditor.FileEditorManagerListener;
import com.intellij.openapi.fileEditor.ex.IdeDocumentHistory;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.ActionCallback;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.vcs.FileStatusListener;
import com.intellij.openapi.vcs.FileStatusManager;
import com.intellij.openapi.vcs.ProjectLevelVcsManager;
import com.intellij.openapi.vcs.VcsListener;
import com.intellij.openapi.vcs.changes.ChangeListAdapter;
import com.intellij.openapi.vcs.changes.ChangeListListener;
import com.intellij.openapi.vcs.changes.ChangeListManager;
import com.intellij.openapi.vfs.*;
import com.intellij.openapi.wm.ToolWindow;
import com.intellij.openapi.wm.ToolWindowId;
import com.intellij.openapi.wm.ToolWindowManager;
import com.intellij.ui.ScrollPaneFactory;
import com.intellij.util.messages.MessageBus;
import com.intellij.util.messages.MessageBusConnection;
import jetbrains.mps.ide.projectPane.AbstractProjectViewSelectInTarget;
import jetbrains.mps.ide.projectPane.fileSystem.actions.providers.FilePaneCopyProvider;
import jetbrains.mps.ide.projectPane.fileSystem.actions.providers.FilePanePasteProvider;
import jetbrains.mps.ide.projectPane.fileSystem.nodes.*;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.ide.vfs.VirtualFileUtils;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.vcs.ChangedListener;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.ActionPlace;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.nodesFs.MPSNodeVirtualFile;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.JScrollPane;
import javax.swing.Timer;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.TreeNode;
import javax.swing.tree.TreePath;
import java.awt.event.*;
import java.util.LinkedList;
import java.util.List;

public class FileViewProjectPane extends AbstractProjectViewPane implements DataProvider {
  private static final Logger LOG = Logger.getLogger(FileViewProjectPane.class);
  private static final int DELAY = 10;
  @NonNls
  public static final String ID = "FileSystem";
  public static final String TITLE = "File System";

  private final Project myProject;
  private final MessageBus myBus;
  private final IdeDocumentHistory myIdeDocumentHistory;
  private final ProjectView myProjectView;
  private final FileEditorManager myEditorManager;

  private ChangeListListener myChangeListListener;
  private MessageBusConnection myMessageBusConnection;
  private FileStatusListener myFileStatusListener;
  private VirtualFileAdapter myFileListener;
  private Timer myTimer;
  private VcsListener myDirectoryMappingListener;
  private VirtualFileManagerListener myVirtualFileManagerListener;
  private JScrollPane myScrollPane;
  private ChangedListener myChangedListener = new ChangedListener() {
    public void changed() {
      rebuildTreeLater();
    }
  };

  @Override
  public void addToolbarActions(DefaultActionGroup actionGroup) {
    super.addToolbarActions(actionGroup);
  }

  protected FileViewProjectPane(final Project project, final ProjectView projectView, final MessageBus bus, @NotNull IdeDocumentHistory ideDocumentHistory, @NotNull FileEditorManager fileEditorManager) {
    super(project);

    myProject = project;
    myProjectView = projectView;
    myBus = bus;
    myIdeDocumentHistory = ideDocumentHistory;
    myEditorManager = fileEditorManager;
  }

  private MPSTreeNode createRoot(Project project) {
    VirtualFile folder = project.getBaseDir();
    assert folder != null;
    return new ProjectTreeNode(project);
  }

  public void dispose() {
    if (isInitialized()) {
      myTimer.stop();
      disposeListeners();
    }
    myScrollPane = null;
  }

  public MPSTree getTree() {
    return (MPSTree) myTree;
  }

  public Project getProject() {
    return myProject;
  }

  public void rebuildTreeLater() {
    if (myTimer.isRunning()) {
      return;
    } else {
      myTimer.restart();
    }
  }

  public Icon getIcon() {
    return FileIcons.FILE_VIEW_ICON;
  }

  public JComponent createComponent() {
    if (isInitialized()) {
      return myScrollPane;
    }
    installListeners();
    myTree = new MPSTree() {
      protected MPSTreeNode rebuild() {
        MPSTreeNode node;
        if (myProject != null && !myProject.isDisposed() && (myProject.getBaseDir() != null)) {
          node = createRoot(myProject);
        } else {
          node = new TextTreeNode("No Project");
        }
        return node;
      }
    };

    myTree.addKeyListener(new KeyAdapter() {
      @Override
      public void keyPressed(KeyEvent e) {
        if (e.getKeyCode() == KeyEvent.VK_ENTER && e.getModifiers() == 0) {
          openEditor();
          e.consume();
        }
      }
    });
    myTree.addMouseListener(new MouseAdapter() {
      @Override
      public void mouseClicked(MouseEvent e) {
        if (e.getClickCount() >= 2) {
          openEditor();
          e.consume();
        }
      }
    });

    myTimer = new Timer(DELAY, new ActionListener() {
      public void actionPerformed(ActionEvent e) {
        //why write? see http://youtrack.jetbrains.net/issue/MPS-8411 for details; IDEA can acquire write lock under that code
        ModelAccess.instance().runWriteInEDT(new Runnable() {
          public void run() {
            getTree().rebuildNow();
          }
        });
      }
    });
    myTimer.setRepeats(false);
    myTimer.setInitialDelay(DELAY);

    // Looks like this method can be called from different threads
    if (ModelAccess.instance().isInEDT()) {
      ModelAccess.instance().executeCommand(new Runnable() {
        public void run() {
          getTree().rebuildNow();
        }
      }, myProject);
    } else {
      rebuildTreeLater();
    }
    myScrollPane = ScrollPaneFactory.createScrollPane(myTree);
    return myScrollPane;
  }

  private void installListeners() {
    FileStatusManager.getInstance(myProject).addFileStatusListener(myFileStatusListener = new FileStatusChangeListener());
    VirtualFileManager.getInstance().addVirtualFileListener(myFileListener = new FileChangesListener());
    VirtualFileManager.getInstance().addVirtualFileManagerListener(myVirtualFileManagerListener = new RefreshListener());
    myDirectoryMappingListener = new VcsListener() {
      public void directoryMappingChanged() {
        rebuildTreeLater();
      }
    };
    myProject.getComponent(ProjectLevelVcsManager.class).addVcsListener(myDirectoryMappingListener);
    ChangeListManager.getInstance(myProject).addChangeListListener(myChangeListListener = new ChangeListUpdateListener());
    myMessageBusConnection = myBus.connect();
    myMessageBusConnection.subscribe(FileEditorManagerListener.FILE_EDITOR_MANAGER, new FileEditorManagerAdapter() {
      @Override
      public void fileOpened(FileEditorManager source, VirtualFile file) {
        if (myProjectView.isAutoscrollFromSource(getId())) {
          selectNode(file, false);
        }
      }

      @Override
      public void selectionChanged(FileEditorManagerEvent event) {
        if (myProjectView.isAutoscrollFromSource(getId())) {
          VirtualFile newFile = event.getNewFile();
          if (newFile != null) {
            selectNode(newFile, false);
          }
        }
      }
    });
  }

  private void disposeListeners() {
    FileStatusManager.getInstance(myProject).removeFileStatusListener(myFileStatusListener);
    VirtualFileManager.getInstance().removeVirtualFileListener(myFileListener);
    VirtualFileManager.getInstance().removeVirtualFileManagerListener(myVirtualFileManagerListener);
    myProject.getComponent(ProjectLevelVcsManager.class).removeVcsListener(myDirectoryMappingListener);
    ChangeListManager.getInstance(myProject).removeChangeListListener(myChangeListListener);
    myMessageBusConnection.disconnect();
  }

  private boolean isInitialized() {
    return myScrollPane != null;
  }

  public ActionCallback updateFromRoot(boolean restoreExpandedPaths) {
    getTree().rebuildLater();
    return new ActionCallback();
  }

  public void select(Object element, VirtualFile file, boolean requestFocus) {
    selectNode(file, false);
  }

  public Object getData(String dataId) {
    if (PlatformDataKeys.VIRTUAL_FILE_ARRAY.getName().equals(dataId)) {
      List<VirtualFile> files = new LinkedList<VirtualFile>();
      TreePath[] treePaths = getSelectionPaths();
      if (treePaths != null) {
        for (TreePath tp : treePaths) {
          Object lastPathComponent = tp.getLastPathComponent();
          if (lastPathComponent instanceof AbstractFileTreeNode) {
            AbstractFileTreeNode node = (AbstractFileTreeNode) lastPathComponent;
            VirtualFile file = node.getFile();
            if (file.isValid()) {
              files.add(file);
            }
          }
        }
      }
      return files.toArray(new VirtualFile[files.size()]);
    } else if (PlatformDataKeys.VIRTUAL_FILE.getName().equals(dataId)) {
      TreePath tp = getSelectedPath();
      if (tp == null) {
        return super.getData(dataId);
      }
      Object lastPathComponent = tp.getLastPathComponent();
      if (lastPathComponent instanceof AbstractFileTreeNode) {
        AbstractFileTreeNode node = (AbstractFileTreeNode) lastPathComponent;
        VirtualFile file = node.getFile();
        if (file.isValid()) {
          return file;
        }
      }
    } else if (PlatformDataKeys.COPY_PROVIDER.getName().equals(dataId)) {
      return new FilePaneCopyProvider();
    } else if (PlatformDataKeys.PASTE_PROVIDER.getName().equals(dataId)) {
      return new FilePanePasteProvider();
    } else if (PlatformDataKeys.CUT_PROVIDER.getName().equals(dataId)) {
      return new FilePaneCopyProvider();
    } else if (dataId.equals(MPSDataKeys.PLACE.getName())) {
      TreeNode treeNode = getSelectedTreeNode(TreeNode.class);
      if (treeNode instanceof ModuleTreeNode) {
        return ActionPlace.PROJECT_PANE_MODULE;
      } else if (treeNode instanceof FileTreeNode) {
        return ActionPlace.PROJECT_PANE_FILE;
      } else if (treeNode instanceof FolderTreeNode) {
        return ActionPlace.PROJECT_PANE_FOLDER;
      }
    }

    return super.getData(dataId);
  }

  //todo eliminate code duplication in BaseLogicalViewProjectPane
  private <T extends TreeNode> T getSelectedTreeNode(Class<T> nodeClass) {
    TreePath selectionPath = getTree().getSelectionPath();
    if (selectionPath == null) return null;
    Object selectedNode = selectionPath.getLastPathComponent();
    if (!(nodeClass.isInstance(selectedNode))) return null;
    return (T) selectedNode;
  }

  private void openEditor() {
    TreePath selectionPath = getTree().getSelectionPath();
    if (selectionPath == null) return;
    if (!(selectionPath.getLastPathComponent() instanceof FileTreeNode)) return;
    final FileTreeNode fileTreeNode = (FileTreeNode) selectionPath.getLastPathComponent();

    // assertion was added for http://youtrack.jetbrains.net/issue/MPS-7762
    assert fileTreeNode.getFile().isValid() : "Underlying file is not valid";
    com.intellij.openapi.command.CommandProcessor.getInstance().executeCommand(myProject, new Runnable() {
      public void run() {
        myIdeDocumentHistory.includeCurrentCommandAsNavigation();
        myEditorManager.openFile(fileTreeNode.getFile(), true);
      }
    }, "navigate", "");
  }

  public void selectNode(@NotNull final VirtualFile file, final boolean changeView) {
    ToolWindowManager windowManager = ToolWindowManager.getInstance(getProject());
    ToolWindow projectViewToolWindow = windowManager.getToolWindow(ToolWindowId.PROJECT_VIEW);
    projectViewToolWindow.activate(new Runnable() {
      public void run() {
        myProjectView.changeView(getId());
        MPSTreeNode nodeToSelect = getNode(file);

        if (nodeToSelect != null) {
          TreePath treePath = new TreePath(nodeToSelect.getPath());
          getTree().setSelectionPath(treePath);
          getTree().scrollPathToVisible(treePath);
          getTree().selectNode(nodeToSelect);
          if (changeView) {
            myProjectView.changeView(getId());
          }
        } else {
          LOG.info("Can not find file " + file + " in tree.");
        }
      }
    }, false);
  }

  @Nullable
  protected MPSTreeNode getNode(VirtualFile file) {
    DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();
    MPSTreeNode rootTreeNode = (MPSTreeNode) treeModel.getRoot();
    return getNode(rootTreeNode, file);
  }

  @Nullable
  private MPSTreeNode getNode(MPSTreeNode rootTreeNode, VirtualFile file) {
    if (rootTreeNode instanceof AbstractFileTreeNode) {
      VirtualFile nodeFile = ((AbstractFileTreeNode) rootTreeNode).getFile();

      if (nodeFile != null) {
        if (nodeFile.getUrl().equals(file.getUrl())) {
          return rootTreeNode;
        }

        if (!VfsUtil.isAncestor(nodeFile, file, false)) {
          return null;
        }
      } else {
        return null;
      }
    }

    for (MPSTreeNode node : rootTreeNode) {
      node.init();
      MPSTreeNode result = getNode(node, file);
      if (result != null) {
        return result;
      }
    }

    return null;
  }

  public SelectInTarget createSelectInTarget() {
    return new AbstractProjectViewSelectInTarget(myProject, getId(), getWeight(), getTitle()) {
      public VirtualFile myFile;

      public boolean canSelect(SelectInContext context) {
        VirtualFile virtualFile = context.getVirtualFile();
        if (!(virtualFile instanceof MPSNodeVirtualFile)) {
          myFile = virtualFile;
          if (isInitialized() && getNode(virtualFile) == null) return false;
          return true;
        }

        final MPSNodeVirtualFile nodeVirtualFile = (MPSNodeVirtualFile) virtualFile;
        SModel smodel = ModelAccess.instance().runReadAction(new Computable<SModel>() {
          public SModel compute() {
            return nodeVirtualFile.getNode().getModel();
          }
        });
        SModelDescriptor d = smodel.getModelDescriptor();
        if (!(d instanceof EditableSModelDescriptor)) return false;

        IFile modelFile = ((EditableSModelDescriptor) d).getModelFile();
        VirtualFile realFile = null;
        if (modelFile != null) {
          realFile = VirtualFileUtils.getVirtualFile(modelFile);
        }

        myFile = realFile;
        if ((realFile == null) || (isInitialized() && getNode(realFile) == null)) return false;

        return true;
      }

      @Override
      protected void doSelectIn(SelectInContext context, boolean requestFocus) {
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            selectNode(myFile, true);
          }
        });
      }
    };
  }

  public String getTitle() {
    return TITLE;
  }

  @NotNull
  public String getId() {
    return ID;
  }

  // used for sorting tabs in the tabbed pane
  public int getWeight() {
    return 5;
  }

  private class RefreshListener implements VirtualFileManagerListener {

    public void beforeRefreshStart(boolean asynchonous) {

    }

    public void afterRefreshFinish(boolean asynchonous) {
      rebuildTreeLater();
    }
  }

  private class FileChangesListener extends VirtualFileAdapter {
    @Override
    public void fileCreated(VirtualFileEvent event) {
      rebuildTreeLater();
    }

    @Override
    public void fileDeleted(VirtualFileEvent event) {
      rebuildTreeLater();
    }

    @Override
    public void fileMoved(VirtualFileMoveEvent event) {
      rebuildTreeLater();
    }

    @Override
    public void fileCopied(VirtualFileCopyEvent event) {
      rebuildTreeLater();
    }
  }

  private class ChangeListUpdateListener extends ChangeListAdapter {
    @Override
    public void changeListUpdateDone() {
      rebuildTreeLater();
    }
  }

  private class FileStatusChangeListener implements FileStatusListener {
    public void fileStatusesChanged() {
      rebuildTreeLater();
    }

    public void fileStatusChanged(@NotNull VirtualFile virtualFile) {
      rebuildTreeLater();
    }
  }
}
