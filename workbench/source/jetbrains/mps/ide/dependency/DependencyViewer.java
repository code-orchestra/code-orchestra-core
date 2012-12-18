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
package jetbrains.mps.ide.dependency;

import com.intellij.openapi.actionSystem.ActionManager;
import com.intellij.openapi.actionSystem.ActionPlaces;
import com.intellij.openapi.actionSystem.DataProvider;
import com.intellij.openapi.actionSystem.DefaultActionGroup;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.ToolWindowAnchor;
import com.intellij.ui.components.JBScrollPane;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModuleRepositoryAdapter;
import jetbrains.mps.smodel.ModuleRepositoryListener;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.tools.BaseProjectTool;
import org.jetbrains.annotations.NonNls;

import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import java.awt.BorderLayout;
import java.awt.LayoutManager;

public class DependencyViewer extends BaseProjectTool {
  private DependencyTree myTree;
  private MyPanel myExternalComponent;

  private ModuleRepositoryListener myListener = new ModuleRepositoryAdapter() {
    public void moduleAdded(IModule module) {
      myTree.rebuildLater();
    }

    public void moduleRemoved(IModule module) {
      myTree.rebuildLater();
    }

    @Override
    public void repositoryChanged() {
      myTree.rebuildLater();
    }

    public void moduleInitialized(IModule module) {
    }

    public void moduleChanged(IModule module) {
    }
  };

  public DependencyViewer(Project project) {
    super(project, "Module Dependency Viewer", -1, null, ToolWindowAnchor.BOTTOM, false);
  }

  public void setModule(IModule module) {
    myTree.setModule(module);
    myTree.rebuildLater();
  }

  public void projectOpened() {
    super.projectOpened();

    myTree = new DependencyTree(getProject());
    JScrollPane scrollPane = new JBScrollPane(myTree) {
      public void addNotify() {
        super.addNotify();
        addListeners();
      }

      public void removeNotify() {
        removeListeners();
        super.removeNotify();
      }
    };

    DefaultActionGroup group = ActionUtils.groupFromActions(createCloseAction());
    JComponent toolbar = ActionManager.getInstance().createActionToolbar(ActionPlaces.UNKNOWN, group, false).getComponent();

    myExternalComponent = new MyPanel(new BorderLayout());
    myExternalComponent.add(scrollPane, BorderLayout.CENTER);
    myExternalComponent.add(toolbar, BorderLayout.WEST);

    myTree.rebuildLater();
  }

  public Icon getIcon() {
    return Icons.MODULE_DEPENDENCIES_ICON;
  }

  public JComponent getComponent() {
    return myExternalComponent;
  }

  private void addListeners() {
    MPSModuleRepository.getInstance().addModuleRepositoryListener(myListener);
  }

  private void removeListeners() {
    MPSModuleRepository.getInstance().removeModuleRepositoryListener(myListener);
  }

  public class MyPanel extends JPanel implements DataProvider {
    public MyPanel(LayoutManager layout) {
      super(layout);
    }

    public Object getData(@NonNls String dataId) {
      return myTree.getData(dataId);
    }
  }
}

