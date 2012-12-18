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
package jetbrains.mps.dialogs;

import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;
import jetbrains.mps.ide.ui.smodel.SNodeTreeNode;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.ToStringComparator;

import javax.swing.*;
import javax.swing.tree.TreePath;
import java.awt.BorderLayout;
import java.awt.Frame;
import java.util.*;

public final class ChooseNodeDialog extends BaseDialog {

  private final JPanel myPanel = new JPanel(new BorderLayout());
  private MyTree myTree = new MyTree();
  private Set<SModelDescriptor> myModels = new HashSet<SModelDescriptor>();
  private IOperationContext myContext;
  private Object myResult;
  private List<SNode> mySourceNodes;

  public ChooseNodeDialog(String text, IOperationContext context, Frame mainFrame, List<SNode> sourceNodes) {
    this(text, context, mainFrame, getModelsFrom(context), sourceNodes);
  }

  private static Set<SModelDescriptor> getModelsFrom(IOperationContext context) {
    IModule module = context.getModule();
    assert module != null;
    Set<SModelDescriptor> models = new HashSet<SModelDescriptor>(module.getOwnModelDescriptors());
    for (SModelDescriptor model : new ArrayList<SModelDescriptor>(models)) {
      if (SModelStereotype.isStubModelStereotype(model.getStereotype())) {
        models.remove(model);
      }
    }
    return models;
  }

  private ChooseNodeDialog(String text, IOperationContext context, Frame mainFrame, Set<SModelDescriptor> models, List<SNode> sourceNodes) {
    super(mainFrame, text);

    myContext = context;

    myModels.addAll(models);
    mySourceNodes = sourceNodes;

    myPanel.add(new JLabel("Choose Node"), BorderLayout.NORTH);
    myPanel.add(ScrollPaneFactory.createScrollPane(myTree));

    myTree.setRootVisible(false);
    myTree.rebuildNow();
    myTree.expandPath(new TreePath(myTree.getRootNode()));
    if (mySourceNodes != null && !mySourceNodes.isEmpty()) {
      myTree.selectNode(myTree.findNodeWith(mySourceNodes.get(0)));
    }
  }

  public DialogDimensionsSettings.DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensionsSettings.DialogDimensions(200, 200, 800, 600);
  }

  protected JComponent getMainComponent() {
    return myPanel;
  }

  @Button(position = 0, name = "OK", mnemonic = 'O', defaultButton = true)
  public void onOk() {
    if (myTree.getSelectionPath() == null) return;

    dispose();

    MPSTreeNode node = (MPSTreeNode) myTree.getSelectionPath().getLastPathComponent();
    if (node instanceof SNodeTreeNode) {
      SNode sNode = ((SNodeTreeNode) node).getSNode();
      if (mySourceNodes != null && !mySourceNodes.isEmpty()) {
        if (mySourceNodes.contains(sNode)) {
          JOptionPane.showMessageDialog(myContext.getMainFrame(), "Can't refactor node onto itself");
          return;
        }
        String role = getRoleInTarget(mySourceNodes.get(0), sNode, myContext.getScope());
        if (role == null) {
          JOptionPane.showMessageDialog(myContext.getMainFrame(), "Can't find suitable role");
          return;
        }
      }
      myResult = sNode;
    }

    if (node instanceof SModelTreeNode) {
      myResult = ((SModelTreeNode) node).getSModelDescriptor();
    }
  }

  public static String getRoleInTarget(SNode nodeToMove, SNode targetNode, IScope scope) {
    SNode nodeToMoveDeclaration = SModelUtil.findConceptDeclaration(nodeToMove.getConceptFqName(), scope);
    SNode conceptDeclaration = SModelUtil.findConceptDeclaration(targetNode.getConceptFqName(), scope);
    String roleInParent = null;
    for (SNode abstractConceptDeclaration : SModelUtil_new.getConceptAndSuperConcepts(conceptDeclaration)) {
      for (SNode linkDeclaration : SNodeUtil.getConcept_LinkDeclarations(abstractConceptDeclaration)) {
        if (SNodeUtil.getLinkDeclaration_IsReference(linkDeclaration)) continue;
        SNode targetConcept = SModelUtil.getLinkDeclarationTarget(linkDeclaration);
        if (SModelUtil.isAssignableConcept(nodeToMoveDeclaration, targetConcept)) {
          roleInParent = SModelUtil.getLinkDeclarationRole(linkDeclaration);
          break;
        }
      }
    }
    return roleInParent;
  }

  public Object getResult() {
    return myResult;
  }

  @Button(position = 1, name = "Cancel", mnemonic = 'C')
  public void onCancel() {
    dispose();
    myResult = null;
  }

  private final class MyTree extends MPSTree {
    protected MPSTreeNode rebuild() {
      TextTreeNode root = new TextTreeNode("root");

      List<SModelDescriptor> models = new ArrayList<SModelDescriptor>(myModels);
      Collections.sort(models, new ToStringComparator());

      for (SModelDescriptor modelDescriptor : models) {
        root.add(new SModelTreeNode(modelDescriptor, null, myContext));
      }

      return root;
    }
  }
}
