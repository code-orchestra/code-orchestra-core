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
package jetbrains.mps.ide.devkit.generator;

import com.intellij.openapi.actionSystem.ActionGroup;
import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.ActionPlaces;
import com.intellij.openapi.actionSystem.ActionToolbar;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.startup.StartupManager;
import com.intellij.openapi.wm.ToolWindowAnchor;
import com.intellij.ui.content.Content;
import com.intellij.ui.content.ContentManager;
import com.intellij.ui.content.ContentManagerAdapter;
import com.intellij.ui.content.ContentManagerEvent;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.ide.devkit.generator.TracerNode.Kind;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.tools.BaseProjectTool;
import jetbrains.mps.workbench.tools.CloseAction;

import javax.swing.BoxLayout;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;
import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.util.ArrayList;
import java.util.List;

public class GenerationTracerViewTool extends BaseProjectTool {
  private NoTabsComponent myNoTabsComponent;

  private List<GenerationTracerView> myTracerViews = new ArrayList<GenerationTracerView>();
  private ContentManagerAdapter myContentListener;
  private final GenerationTracer myTracer;

  public GenerationTracerViewTool(Project project, GenerationTracer tracer) {
    super(project, "Generation Tracer", -1, Icons.DEFAULT_ICON, ToolWindowAnchor.BOTTOM, true);
    myTracer = tracer;
    myNoTabsComponent = new NoTabsComponent(this);
  }

  public void initComponent() {
    super.initComponent();

    StartupManager.getInstance(getProject()).registerPostStartupActivity(new Runnable() {
      public void run() {
        SwingUtilities.invokeLater(new Runnable() {
          public void run() {
            setTracingDataIsAvailable(myTracer.hasTracingData());
            showNoTabsComponent();
            setAvailable(false);
            getContentManager().addContentManagerListener(new ContentManagerAdapter() {
              public void contentRemoved(ContentManagerEvent event) {
                boolean closeAfter = event.getContent().getComponent() == myNoTabsComponent;
                if (getContentManager().getContentCount() == 0) {
                  showNoTabsComponent();
                  if (closeAfter) {
                    makeUnavailableLater();
                  }
                }
              }
            });
          }
        });
      }
    });
  }

  protected void doRegister() {
    super.doRegister();
    myContentListener = new ContentManagerAdapter() {
      public void contentRemoved(ContentManagerEvent event) {
        //noTabs component could be removed
        if (event.getContent().getComponent() != myNoTabsComponent) {
          myTracerViews.remove(event.getIndex());
        }
      }
    };

    getContentManager().addContentManagerListener(myContentListener);
  }

  private void showNoTabsComponent() {
    ContentManager manager = getContentManager();
    manager.removeAllContents(true);
    addContent(myNoTabsComponent, "", null, false);
  }

  private void closeTab(int index) {
    //noinspection ConstantConditions
    getContentManager().removeContent(getContentManager().getContent(index), true);
  }

  public void closeAll() {
    getContentManager().removeAllContents(true);
  }

  public void selectIndex(int index) {
    ContentManager manager = getContentManager();
    //noinspection ConstantConditions
    manager.setSelectedContent(manager.getContent(index));
  }

  public int getTabIndex(Kind kind, SNode node) {
    int index = 0;
    for (GenerationTracerView tracerView : myTracerViews) {
      TracerNode tracerNode = tracerView.getRootTracerNode();
      if (tracerNode.getKind() == kind &&
        tracerNode.getNodePointer().getNode() == node) {
        return index;
      }
      index++;
    }
    return -1;
  }

  public void showTraceView(TracerNode tracerNode) {
    GenerationTracerView tracerView = new GenerationTracerView(tracerNode, getProject()) {
      public void close() {
        GenerationTracerViewTool.this.closeTab(myTracerViews.indexOf(this));
      }

      public void autoscrollsChanged(boolean b) {
        for (GenerationTracerView tracerView : myTracerViews) {
          tracerView.setAutoscrollToSource(b);
        }
      }
    };

    myTracerViews.add(tracerView);

    Content content = addContent(tracerView.getComponent(), tracerView.getCaption(), tracerView.getIcon(), true);
    getContentManager().setSelectedContent(content);

    Content noTabsContent = getContentManager().getContent(myNoTabsComponent);
    if (noTabsContent != null) {
      getContentManager().removeContent(noTabsContent, true);
    }

    openToolLater(true);
  }

  public void setTracingDataIsAvailable(boolean b) {
    assert ThreadUtils.isEventDispatchThread();
    myNoTabsComponent.setDataIsAvailable(b);
  }

  public static class NoTabsComponent extends JPanel {
    JPanel myLabelsPanel = new JPanel();

    public NoTabsComponent(final GenerationTracerViewTool tool) {
      setLayout(new BorderLayout());

      JPanel mainPanel = new JPanel(new GridBagLayout());
      myLabelsPanel.setLayout(new BoxLayout(myLabelsPanel, BoxLayout.Y_AXIS));
      GridBagConstraints c = new GridBagConstraints();
      c.anchor = GridBagConstraints.CENTER;
      mainPanel.add(myLabelsPanel, c);
      add(mainPanel, BorderLayout.CENTER);

      SwingUtilities.invokeLater(new Runnable() {
        public void run() {
          ActionGroup group = ActionUtils.groupFromActions(new CloseAction(tool));

          ActionToolbar toolbar = ActionManager.getInstance().createActionToolbar(ActionPlaces.UNKNOWN, group, false);
          add(toolbar.getComponent(), BorderLayout.WEST);
        }
      });
    }

    public void setDataIsAvailable(boolean state) {
      myLabelsPanel.removeAll();

      String[] strings;
      if (state) {
        strings = new String[]{"Tracing data is available.", "To view trace/traceback data use generated node's popup menu."};
      } else {
        strings = new String[]{"No data available.", "To use the 'generation tracer' generate model with the 'save transient models' option."};
      }

      for (String string : strings) {
        JLabel label = new JLabel(string);
        label.setAlignmentX(Component.CENTER_ALIGNMENT);
        myLabelsPanel.add(label);
      }
    }
  }
}
