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
package jetbrains.mps.refactoring.framework.paramchooser.mps.internal;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.ide.projectPane.logicalview.ProjectTree;
import jetbrains.mps.ide.projectPane.logicalview.ProjectTreeFindHelper;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModulesPoolTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNodeEx;
import jetbrains.mps.ide.ui.smodel.SNodeTreeNode;
import jetbrains.mps.refactoring.framework.InvalidInputValueException;
import jetbrains.mps.refactoring.framework.RefactoringContext;
import jetbrains.mps.refactoring.framework.paramchooser.IChooser;
import jetbrains.mps.refactoring.framework.paramchooser.mps.IChooserSettings;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;

import javax.swing.JComponent;
import javax.swing.JScrollPane;

public class MPSNodeChooser implements IChooser {
  private jetbrains.mps.ide.projectPane.logicalview.ProjectTree myTree;
  private JScrollPane myScrollPane;

  private ProjectTreeFindHelper myFindHelper = new jetbrains.mps.ide.projectPane.logicalview.ProjectTreeFindHelper() {
    protected jetbrains.mps.ide.projectPane.logicalview.ProjectTree getTree() {
      return myTree;
    }

    protected Project getProject() {
      return myContext.getSelectedProject();
    }

    protected ProjectModulesPoolTreeNode getModulesPoolNode() {
      return getTree().getModulesPoolNode();
    }
  };

  private String myParamName;
  private RefactoringContext myContext;
  private IChooserSettings mySettings;

  public MPSNodeChooser(String paramName, RefactoringContext context, IChooserSettings settings) {
    myParamName = paramName;
    myContext = context;
    mySettings = settings;

    initUI(myContext.getCurrentOperationContext().getProject());

    Object value = settings.getInitialValue();
    if (value == null) {
      value = myContext.getSelectedNode();
    }
    setInitialValue(value);
  }

  private void initUI(Project project) {
    myTree = new ProjectTree(project);
    myScrollPane = ScrollPaneFactory.createScrollPane(myTree);
    ThreadUtils.runInUIThreadNoWait(new Runnable() {
      public void run() {
        myTree.rebuildNow();
      }
    });
  }

  public boolean isStretchable() {
    return true;
  }

  public JComponent getMainComponent() {
    return myScrollPane;
  }

  public JComponent getComponentToFocus() {
    return myTree;
  }

  public void commit() throws InvalidInputValueException {
    String title = mySettings.getTitle();

    SNode node = getSelectedObject();
    if (node == null) throw new InvalidInputValueException(title + ": node not selected");
    if (!mySettings.met(node))
      throw new InvalidInputValueException(title + ": refactoring can't be applied to selected node");

    myContext.setParameter(myParamName, node);
  }

  public void setInitialValue(final Object initialValue) {
    if (initialValue == null) return;

    myTree.runWithoutExpansion(new Runnable() {
      public void run() {
        MPSTreeNodeEx sNodeNode = myFindHelper.findMostSuitableSNodeTreeNode((SNode) initialValue);
        if (sNodeNode == null) return;

        myTree.selectNode(sNodeNode);
      }
    });
  }

  private SNode getSelectedObject() {
    final Object selection = this.myTree.getSelectionPath().getLastPathComponent();
    return ModelAccess.instance().runReadAction(new Computable<SNode>() {
      public SNode compute() {
        if (!(selection instanceof SNodeTreeNode)) return null;
        return ((SNodeTreeNode) selection).getSNode();
      }
    });
  }
}
