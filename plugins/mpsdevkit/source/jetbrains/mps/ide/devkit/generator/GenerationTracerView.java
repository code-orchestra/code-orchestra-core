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

import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.project.Project;
import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.devkit.generator.icons.Icons;
import jetbrains.mps.workbench.action.ActionUtils;

import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import java.awt.BorderLayout;
import java.awt.Component;

public abstract class GenerationTracerView {
  private JPanel myPanel;
  private GenerationTracerTree myTree;
  private ToggleAction myAutoscrollAction;
  private boolean myAutoscroll;

  private TracerNode myRootTracerNode;

  public GenerationTracerView(TracerNode tracerNode, Project project) {
    myRootTracerNode = tracerNode;
    myPanel = new JPanel(new BorderLayout());
    myTree = new GenerationTracerTree(tracerNode, project);
    myPanel.add(ScrollPaneFactory.createScrollPane(myTree), BorderLayout.CENTER);
    myPanel.add(createActionsToolbar(), BorderLayout.WEST);

    myTree.rebuildLater();
  }

  private Component createActionsToolbar() {
    myAutoscrollAction = new ToggleAction("", "Autoscroll to Source", Icons.AUTOSCROLL_TO_SOURCE) {
      public boolean isSelected(AnActionEvent e) {
        return myAutoscroll;
      }

      public void setSelected(AnActionEvent e, boolean state) {
        if (myAutoscroll != state) {
          autoscrollsChanged(state);
        }
        myAutoscroll = state;
      }
    };

    AnAction closeAction = new AnAction("", "Close", Icons.CLOSE) {
      @Override
      public void actionPerformed(AnActionEvent e) {
        close();
      }
    };

    ActionGroup group = ActionUtils.groupFromActions(myAutoscrollAction, closeAction);
    ActionManager manager = ActionManager.getInstance();
    ActionToolbar toolbar = manager.createActionToolbar(ActionPlaces.USAGE_VIEW_TOOLBAR, group, false);
    return toolbar.getComponent();
  }

  public TracerNode getRootTracerNode() {
    return myRootTracerNode;
  }

  public String getCaption() {
    return myRootTracerNode.getNodePointer().toString();
  }

  public Icon getIcon() {
    return Icons.getIcon(myRootTracerNode);
  }

  public JComponent getComponent() {
    return myPanel;
  }

  public abstract void close();

  public abstract void autoscrollsChanged(boolean b);

  public void setAutoscrollToSource(boolean b) {
    myTree.setAutoOpen(b);
    myAutoscroll = b;
  }
}
