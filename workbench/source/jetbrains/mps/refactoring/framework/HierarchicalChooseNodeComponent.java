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
package jetbrains.mps.refactoring.framework;

import com.intellij.openapi.util.Computable;
import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.hierarchy.AbstractHierarchyTree;
import jetbrains.mps.ide.hierarchy.HierarchyTreeNode;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeUtil;
import jetbrains.mps.util.Condition;

import javax.swing.*;
import javax.swing.tree.TreePath;
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.util.HashSet;
import java.util.Set;

@Deprecated
//left for compatibility with old refactorings
public class HierarchicalChooseNodeComponent extends JPanel implements IChooseComponent<SNode> {
  private MyHierarchyTree myHierarchyTree;
  private IOperationContext myOperationContext;
  private IDescendantsProvider myDescendantsProvider;
  private SNode myInitialNode;
  private String myPropertyName;
  private String myCaption;

  public HierarchicalChooseNodeComponent(IOperationContext operationContext, IDescendantsProvider descendantsProvider, SNode initialNode) {
    myOperationContext = operationContext;
    myDescendantsProvider = descendantsProvider;
    myInitialNode = initialNode;

    //initComponent();
  }

  public void initComponent() {
    myHierarchyTree = new MyHierarchyTree(myDescendantsProvider);
    setLayout(new GridBagLayout());
    GridBagConstraints constraints = new GridBagConstraints();
    constraints.gridx = 0;
    constraints.gridy = 0;
    constraints.fill = GridBagConstraints.HORIZONTAL;
    constraints.weightx = 1;
    constraints.weighty = 0;
    add(new JLabel(myCaption), constraints);
    constraints.gridx = 0;
    constraints.gridy = 1;
    constraints.fill = GridBagConstraints.BOTH;
    constraints.weightx = 1;
    constraints.weighty = 1;
    add(ScrollPaneFactory.createScrollPane(myHierarchyTree), constraints);
    setMinimumSize(new Dimension(350, 350));
    setPreferredSize(new Dimension(350, 350));
    showHierarchy(myInitialNode, myOperationContext);
  }

  public void setCaption(String caption) {
    myCaption = caption;
  }

  private void showHierarchy(SNode node, IOperationContext operationContext) {
    myHierarchyTree.setOperationContext(operationContext);
    myHierarchyTree.setHierarchyNode(node);
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        myHierarchyTree.rebuildNow();
        // if (myTreeNode != null) myHierarchyTree.selectNode(myTreeNode);
      }
    });
  }

  public JComponent getComponentToFocus() {
    return myHierarchyTree;
  }

  public void setCondition(Condition<SNode> condition) {
    //todo
  }

  public String getPropertyName() {
    return myPropertyName;
  }

  public void setPropertyName(String propertyName) {
    myPropertyName = propertyName;
  }

  public void setInitialValue(SNode initialValue) {
    myHierarchyTree.selectNode(myHierarchyTree.findNodeWith(initialValue.getAdapter()));
  }

  public SNode submit() throws InvalidInputValueException {
    TreePath selectionPath = myHierarchyTree.getSelectionPath();
    if (selectionPath == null) throw new InvalidInputValueException("nothing is selected");
    Object lastComponent = selectionPath.getLastPathComponent();
    if (!(lastComponent instanceof HierarchyTreeNode)) {
      throw new InvalidInputValueException("no node is selected");
    }
    final HierarchyTreeNode selectedTreeNode = (HierarchyTreeNode) lastComponent;
    SNode node = ModelAccess.instance().runReadAction(new Computable<SNode>() {
      public SNode compute() {
        return selectedTreeNode.getNode();
      }
    });
    return node;
  }

  public JComponent getMainComponent() {
    return this;
  }

  class MyHierarchyTree extends AbstractHierarchyTree {
    private IDescendantsProvider myDescendantsProvider;

    public MyHierarchyTree(IDescendantsProvider descendantsProvider) {
      super(null, SNodeUtil.concept_BaseConcept, false);
      myDescendantsProvider = descendantsProvider;
    }

    protected String noNodeString() {
      return "no node";
    }

    protected SNode getParent(SNode node) {
      return null;
    }

    protected Set<SNode> getParents(SNode node, Set<SNode> visited) {
      return new HashSet<SNode>();
    }

    protected Set<SNode> getDescendants(SNode node, Set<SNode> visited) {
      return myDescendantsProvider.getDescendants(node);
    }

    public void setHierarchyNode(SNode node) {
      myHierarchyNode = node;
    }

  }

}
