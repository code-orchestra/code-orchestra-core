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
package jetbrains.mps.ide.classpath;

import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.ActionPlaces;
import com.intellij.openapi.actionSystem.DefaultActionGroup;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.ToolWindowAnchor;
import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.project.ClasspathCollector;
import jetbrains.mps.project.IModule;
import jetbrains.mps.reloading.IClassPathItem;
import jetbrains.mps.util.CollectionUtil;
import jetbrains.mps.util.ToStringComparator;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.tools.BaseProjectTool;

import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.SwingUtilities;
import java.awt.BorderLayout;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ClassPathViewerTool extends BaseProjectTool {
  private MyClassPathTree myTree = new MyClassPathTree();
  private JPanel myComponent = new JPanel(new BorderLayout());
  private IModule myInspectedModule;

  public ClassPathViewerTool(Project project) {
    super(project, "Classpath Explorer", -1, IconManager.EMPTY_ICON, ToolWindowAnchor.BOTTOM, true);

    myComponent.add(ScrollPaneFactory.createScrollPane(myTree), BorderLayout.CENTER);

    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        DefaultActionGroup group = ActionUtils.groupFromActions(createCloseAction());
        JComponent toolbar = ActionManager.getInstance().createActionToolbar(ActionPlaces.UNKNOWN, group, false).getComponent();
        myComponent.add(toolbar, BorderLayout.WEST);
      }
    });
  }

  public void initComponent() {
    super.initComponent();
    myTree.rebuildLater();
  }

  public JComponent getComponent() {
    return myComponent;
  }

  public void analyzeModule(IModule m) {
    myInspectedModule = m;
    myTree.rebuildLater();
  }

  private class MyClassPathTree extends MPSTree {
    protected MPSTreeNode rebuild() {
      if (myInspectedModule == null) {
        return new TextTreeNode("No Module");
      }

      TextTreeNode root = new TextTreeNode("ClassPath of module " + myInspectedModule.getModuleFqName());
      ClasspathCollector collector = new ClasspathCollector(CollectionUtil.set(myInspectedModule));
      collector.collect(false);

      List<IClassPathItem> items = new ArrayList<IClassPathItem>(collector.getResult());
      Collections.sort(items, new ToStringComparator());

      for (IClassPathItem item : items) {
        TextTreeNode itemNode = new TextTreeNode(item.toString());
        root.add(itemNode);
        for (IModule pathItem : collector.getPathFor(item)) {
          itemNode.add(new ModuleTreeNode(pathItem));
        }
      }

      return root;
    }

    private class ModuleTreeNode extends MPSTreeNode {
      private IModule myModule;

      private ModuleTreeNode(IModule module) {
        super(null);
        myModule = module;

        setNodeIdentifier(myModule.getModuleFqName());

        setText(myModule.getModuleFqName());
        setIcon(IconManager.getIconFor(myModule));
      }

      public boolean isLeaf() {
        return true;
      }
    }
  }
}
