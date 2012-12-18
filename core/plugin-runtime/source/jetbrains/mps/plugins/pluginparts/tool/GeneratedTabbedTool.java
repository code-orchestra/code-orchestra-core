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
package jetbrains.mps.plugins.pluginparts.tool;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.ToolWindowAnchor;
import com.intellij.ui.content.Content;
import com.intellij.ui.content.ContentManager;
import com.intellij.ui.content.ContentManagerAdapter;
import com.intellij.ui.content.ContentManagerEvent;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.JComponent;
import java.util.ArrayList;
import java.util.List;

public abstract class GeneratedTabbedTool extends BaseGeneratedTool {
  private List<IDisposableTab> myTabList = new ArrayList<IDisposableTab>();
  private boolean myContentRemovedListenerAdded = false;

  protected GeneratedTabbedTool(Project project, String id, int number, Icon icon, ToolWindowAnchor anchor, boolean canCloseContent) {
    super(project, id, number, icon, anchor, canCloseContent);
  }

  public void init(Project project) {

  }

  public void dispose() {
    getContentManager().removeAllContents(true);
  }

  public void closeTab(JComponent component) {
    ContentManager contentManager = getContentManager();
    Content content = contentManager.getContent(component);
    contentManager.removeContent(content, true);
  }

  public <T extends JComponent> void addTab(final T tabComponent, @NotNull String title, Icon icon,
                                            final IComponentDisposer<T> tabDisposer) {
    IDisposableTab tab = new IDisposableTab() {
      public void disposeTab() {
        if (tabDisposer == null) {
          return;
        }
        tabDisposer.disposeComponent(tabComponent);
      }

      public JComponent getComponent() {
        return tabComponent;
      }
    };

    addContentRemovedListenerIfNeeded();
    closeCurrentTabIfUnpinned();
    addContent(tab.getComponent(), title, icon, true);
    setSelectedComponent(tab.getComponent());
    myTabList.add(tab);
    openToolLater(true);
  }

  public JComponent getSelectedTab() {
    ContentManager contentManager = getContentManager();
    Content selectedContent = contentManager.getSelectedContent();
    if (selectedContent == null) {
      return null;
    } else {
      return selectedContent.getComponent();
    }
  }

  private void closeCurrentTabIfUnpinned() {
    ContentManager contentManager = getContentManager();
    Content selectedContent = contentManager.getSelectedContent();
    if (selectedContent == null) {
      return;
    }
    if (!(selectedContent.isPinned())) {
      contentManager.removeContent(selectedContent, true);
    }
  }

  private void addContentRemovedListenerIfNeeded() {
    if (myContentRemovedListenerAdded) { return; }

    this.getContentManager().addContentManagerListener(new ContentManagerAdapter() {
      @Override
      public void contentRemoved(ContentManagerEvent event) {
        int index = event.getIndex();
        IDisposableTab tab = myTabList.get(index);
        tab.disposeTab();
        myTabList.remove(index);
      }
    });
    myContentRemovedListenerAdded = true;
  }

  public interface IDisposableTab {
    void disposeTab();
    JComponent getComponent();
  }
}
