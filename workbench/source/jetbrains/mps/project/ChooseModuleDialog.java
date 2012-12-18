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
package jetbrains.mps.project;

import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;

import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.tree.TreePath;
import java.awt.Frame;
import java.awt.HeadlessException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

public class ChooseModuleDialog extends BaseDialog {
  private MPSTree myTree = new MPSTree() {
    protected MPSTreeNode rebuild() {
      return ChooseModuleDialog.this.rebuild();
    }
  };
  private Set<IModule> myModules = new HashSet<IModule>();
  private IModule myResult;
  private JComponent myComponent = ScrollPaneFactory.createScrollPane(myTree);

  public ChooseModuleDialog(String text, Frame mainFrame, Collection<IModule> modules) throws HeadlessException {
    super(mainFrame, text);
    myModules.addAll(modules);
    myTree.setRootVisible(false);
    myTree.rebuildNow();
  }

  public DialogDimensionsSettings.DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensionsSettings.DialogDimensions(200, 200, 400, 300);
  }

  private MPSTreeNode rebuild() {
    TextTreeNode root = new TextTreeNode("Root");
    for (IModule m : myModules) {
      root.add(new ModuleTreeNode(m));
    }

    return root;
  }

  protected JComponent getMainComponent() {
    return myComponent;
  }

  public IModule getResult() {
    return myResult;
  }

  @Button(position = 0, name = "OK", mnemonic = 'O')
  public void okButton() {
    TreePath selection = myTree.getSelectionPath();
    if (selection == null || !(selection.getLastPathComponent() instanceof ModuleTreeNode)) {
      JOptionPane.showMessageDialog(this, "Choose Module", "Error", JOptionPane.ERROR_MESSAGE);
      return;
    }
    myResult = (IModule) ((ModuleTreeNode) selection.getLastPathComponent()).getModule();
    dispose();
  }

  @Button(position = 1, name = "Cancel", mnemonic = 'C')
  public void cancelButton() {
    myResult = null;
    dispose();
  }

  public class ModuleTreeNode extends MPSTreeNode {
    private IModule myModule;

    public ModuleTreeNode(IModule module) {
      super(module, null);
      myModule = module;

      setNodeIdentifier(myModule.toString());
      setIcon(IconManager.getIconFor(module));
    }

    public void doubleClick() {
      okButton();
    }

    public IModule getModule() {
      return myModule;
    }

    public boolean isLeaf() {
      return true;
    }
  }
}
