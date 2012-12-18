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

import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.workbench.tools.BaseProjectTool;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTree.TreeState;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.nodeEditor.bookmark.BookmarkManager.BookmarkListener;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.ToolWindowAnchor;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;

import javax.swing.JScrollPane;
import javax.swing.JComponent;

@State(
  name = "BookmarksTool",
  storages = {
  @Storage(
    id = "other",
    file = "$WORKSPACE_FILE$"
  )
    }
)
public class BookmarksTool extends BaseProjectTool implements PersistentStateComponent<BookmarksTool.MyState> {
  JScrollPane myComponent;
  private BookmarkManager myBookmarkManager;
  private MPSTree myTree;
  private TreeState myTreeState;

  public BookmarksTool(Project project) {
    super(project, "Bookmarks", -1, null, ToolWindowAnchor.BOTTOM, true);
  }

  public void initComponent() {
    myBookmarkManager = getProject().getComponent(BookmarkManager.class);
    myTree = new BookmarksTree(getProject(), myBookmarkManager);
    myComponent = ScrollPaneFactory.createScrollPane(myTree);
    if (myTreeState != null) {
      ModelAccess.instance().runReadInEDT(new Runnable() {
        public void run() {
          myTree.rebuildNow();
          myTree.loadState(myTreeState);
        }
      });
    }
  }

  public JComponent getComponent() {
    return myComponent;
  }

  public MyState getState() {
    return new MyState(myTree.saveState());
  }

  public void loadState(final MyState state) {
    myTreeState = state.myTreeState;
  }

  public static class MyState {
    public TreeState myTreeState;

    public MyState(TreeState treeState) {
      myTreeState = treeState;
    }

    public MyState() {

    }
  }

}
