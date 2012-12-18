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
package jetbrains.mps.ide.findusages.view;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.ToolWindowAnchor;
import com.intellij.ui.content.Content;
import com.intellij.ui.content.ContentManager;
import com.intellij.ui.content.ContentManagerAdapter;
import com.intellij.ui.content.ContentManagerEvent;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.ide.findusages.INavigateableTool;
import jetbrains.mps.ide.findusages.INavigator;
import jetbrains.mps.ide.findusages.UsagesViewTracker;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.workbench.tools.BaseProjectTool;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.SwingUtilities;

public abstract class TabbedUsagesTool extends BaseProjectTool implements INavigateableTool {
  private static final Logger LOG = Logger.getLogger(UsagesViewTool.class);
  private ContentManagerAdapter myContentListener;
  private ReloadAdapter myReloadHandler;
  private ContentManager myContentManager;

  public TabbedUsagesTool(Project project, String id, int number, Icon icon, ToolWindowAnchor anchor, boolean canCloseContent) {
    super(project, id, number, icon, anchor, canCloseContent);
  }

  @Nullable
  public INavigator getCurrentNavigateableView() {
    if (!ThreadUtils.isEventDispatchThread()) {
      throw new IllegalStateException("Can't use this outside of EDT");
    }

    int index = getCurrentTabIndex();
    if (index == -1) return null;

    return getUsagesView(index);
  }

  public void doRegister() {
    UsagesViewTracker.register(this);

    myContentListener = new ContentManagerAdapter() {
      public void contentRemoved(ContentManagerEvent event) {
        int index = event.getIndex();

        getUsagesView(index).dispose();
        onRemove(index);
      }
    };

    myContentManager = getContentManager();

    myContentManager.addContentManagerListener(myContentListener);

    if (forceCloseOnReload()) {
      myReloadHandler = new ReloadAdapter() {
        public void unload() {
          SwingUtilities.invokeLater(new Runnable() {
            public void run() {
              if (getProject().isDisposed()) return;
              myContentManager.removeAllContents(true);
            }
          });
        }
      };
      ClassLoaderManager.getInstance().addReloadHandler(myReloadHandler);
    }
  }

  public void doUnregister() {
    //this is done automatically on content manager dispose, otherwise a dependency UVT->CM must be added
    //getContentManager().removeContentManagerListener(myContentListener);

    if (myReloadHandler != null) {
      ClassLoaderManager.getInstance().removeReloadHandler(myReloadHandler);
    }

    UsagesViewTracker.unregister(this);
  }

  protected void closeTab(int index) {
    ContentManager contentManager = getContentManager();
    Content content = contentManager.getContent(index);
    assert content != null;
    contentManager.removeContent(content, true);
  }

  protected void closeLastUnpinnedTab(int index) {
    if (index == -1) return;
    ContentManager contentManager = getContentManager();
    Content content = contentManager.getContent(index);
    assert content != null;
    if (content.isPinned()) return;
    contentManager.removeContent(content, true);
  }

  protected abstract UsagesView getUsagesView(int index);

  protected abstract void onRemove(int index);

  protected boolean forceCloseOnReload() {
    return false;
  }
}
