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
package jetbrains.mps.nodeEditor.bookmark;

import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.ide.ui.smodel.SNodeTreeNode;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.workbench.action.BaseAction;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.editors.MPSEditorOpener;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.nodeEditor.bookmark.BookmarkManager.BookmarkListener;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.actionSystem.ActionGroup;
import com.intellij.openapi.actionSystem.AnActionEvent;

import java.util.List;
import java.util.Map;

public class BookmarksTree extends MPSTree {

  private BookmarkManager myBookmarkManager;
  private Project myProject;

  public BookmarksTree(Project project, BookmarkManager bookmarkManager) {
    myBookmarkManager = bookmarkManager;
    myProject = project;

    myBookmarkManager.addBookmarkListener(new BookmarkListener() {
      public void bookmarkAdded(int number, SNode node) {
        rebuildBookmarksTree();
      }

      public void bookmarkRemoved(int number, SNode node) {
        rebuildBookmarksTree();
      }
    });
  }

  private void rebuildBookmarksTree() {
    ModelAccess.instance().runReadInEDT(new Runnable() {
      public void run() {
        BookmarksTree.this.rebuildNow();
      }
    });
  }

  protected MPSTreeNode rebuild() {
    MPSTreeNode root = new TextTreeNode("no bookmarks") {
      public ActionGroup getActionGroup() {
        BaseAction hierarchyAction = new BaseAction("Remove All Bookmarks") {

          @Override
          protected boolean isEnabledInASView() {
            return true;
          }

          protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
            myBookmarkManager.clearBookmarks();
          }
        };
        return ActionUtils.groupFromActions(hierarchyAction);
      }
    };
    root.setIcon(Icons.DEFAULT_ICON);
    List<SNodePointer> nodePointers = myBookmarkManager.getAllNumberedBookmarks();
    boolean hasBookmarks = false;
    for (int i = 0; i < nodePointers.size(); i++) {
      final SNodePointer nodePointer = nodePointers.get(i);
      if (nodePointer != null && nodePointer.getNode() != null) {
        hasBookmarks = true;
        TextTreeNode textTreeNode = new MyTextTreeNodeNumbered(i);
        textTreeNode.setIcon(BookmarkManager.getIcon(i));
        textTreeNode.add(new MySNodeTreeNode(nodePointer.getNode(), null, ProjectOperationContext.get(myProject)));
        root.add(textTreeNode);
      }
    }
    nodePointers = myBookmarkManager.getAllUnnumberedBookmarks();
    for (SNodePointer nodePointer : nodePointers) {
      if (nodePointer != null && nodePointer.getNode() != null) {
        hasBookmarks = true;
        TextTreeNode textTreeNode = new MyTextTreeNodeUnnumbered(nodePointer);
        textTreeNode.setIcon(BookmarkManager.getIcon(-1));
        textTreeNode.add(new MySNodeTreeNode(nodePointer.getNode(), null, ProjectOperationContext.get(myProject)));
        root.add(textTreeNode);
      }
    }
    if (hasBookmarks) {
      root.setText("bookmarks");
    }
    return root;
  }

  public void gotoSelectedBookmark() {
    BookmarkNode node = getSelectedBookmarkNode();
    if (node != null) {
      node.navigateToBookmark();
    }
  }

  public void removeSelectedBookmark() {
    BookmarkNode node = getSelectedBookmarkNode();
    if (node != null) {
      node.removeBookmark();
    }
  }

  private BookmarkNode getSelectedBookmarkNode() {
    MPSTreeNode selectedNode = (MPSTreeNode) getSelectionPath().getLastPathComponent();
    while (selectedNode != null) {
      if (selectedNode instanceof BookmarkNode) {
        return (BookmarkNode) selectedNode;
      }
      selectedNode = (MPSTreeNode) selectedNode.getParent();
    }
    return null;
  }

  private interface BookmarkNode {
    public void navigateToBookmark();
    public void removeBookmark();
  }

  private class MyTextTreeNodeNumbered extends TextTreeNode implements BookmarkNode {
    int myNumber;

    public MyTextTreeNodeNumbered(int i) {
      super("bookmark " + i);
      myNumber = i;
      setNodeIdentifier("bookmark"+i);
    }

    public void removeBookmark() {
      myBookmarkManager.removeBookmark(myNumber);
    }

    public void navigateToBookmark() {
      myBookmarkManager.navigateToBookmark(myNumber);
    }

    public ActionGroup getActionGroup() {
      BaseAction action = new BaseAction("Remove Bookmark") {

        @Override
        protected boolean isEnabledInASView() {
          return true;
        }

        protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
          removeBookmark();
        }
      };
      return ActionUtils.groupFromActions(action);
    }
  }

  private class MyTextTreeNodeUnnumbered extends TextTreeNode implements BookmarkNode {
    SNodePointer myNodePointer;

    public MyTextTreeNodeUnnumbered(SNode node) {
      super("bookmark");
      myNodePointer = new SNodePointer(node);
      setNodeIdentifier("bookmark_"+node.getId());
    }

    public void removeBookmark() {
      myBookmarkManager.removeUnnumberedBookmark(myNodePointer);
    }

    public MyTextTreeNodeUnnumbered(SNodePointer nodePointer) {
      super("bookmark");
      myNodePointer = nodePointer;
      setNodeIdentifier("bookmark_"+nodePointer.getNodeId().toString());
    }

    public void navigateToBookmark() {
      myProject.getComponent(MPSEditorOpener.class).openNode(myNodePointer.getNode());
    }

    public ActionGroup getActionGroup() {
      BaseAction action = new BaseAction("Remove Bookmark") {

        @Override
        protected boolean isEnabledInASView() {
          return true;
        }

        protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
         removeBookmark();
        }
      };
      return ActionUtils.groupFromActions(action);
    }
  }

  private static class MySNodeTreeNode extends SNodeTreeNode {
    public MySNodeTreeNode(SNode node, String role, IOperationContext operationContext) {
      super(node, role, operationContext);
    }

    public void doubleClick() {
      getOperationContext().getComponent(MPSEditorOpener.class).openNode(getSNode());
    }

    public ActionGroup getActionGroup() {
      return null;
    }

    protected SNodeTreeNode createChildTreeNode(SNode childNode, String role, IOperationContext operationContext) {
      return new MySNodeTreeNode(childNode, role, operationContext);
    }
  }
}
