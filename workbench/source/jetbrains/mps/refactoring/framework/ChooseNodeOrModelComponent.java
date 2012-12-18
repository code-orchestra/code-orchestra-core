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

import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.ChooseItemComponent;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;
import jetbrains.mps.ide.ui.smodel.SNodeTreeNode;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.Condition;

import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.tree.TreeNode;
import javax.swing.tree.TreePath;
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import static java.awt.GridBagConstraints.BOTH;
import static java.awt.GridBagConstraints.HORIZONTAL;

@Deprecated
//left for compatibility with old refactorings
public class ChooseNodeOrModelComponent extends JPanel implements IChooseComponent<Object> {
  private String myCaption;
  private String myPropertyName;
  private MyTree myTree = new MyTree();
  private MyChooseItemComponent myChooseItemComponent = new MyChooseItemComponent();
  private String myConceptFQName;
  private IOperationContext myOperationContext;
  private Set<SModelDescriptor> myModels = new HashSet<SModelDescriptor>();
  private SModelDescriptor myModel = null;
  boolean myMayBeModel;
  boolean myMayBeNode;
  boolean myReturnLoadedModels = false;

  private Condition myCondition = Condition.TRUE_CONDITION;

  public ChooseNodeOrModelComponent(IOperationContext operationContext, String conceptFQName, boolean mayBeModel, boolean mayBeNode) {
    myOperationContext = operationContext;
    myMayBeModel = mayBeModel;
    myMayBeNode = mayBeNode;
    myConceptFQName = conceptFQName;
  }

  public void initComponent() {
    setLayout(new GridBagLayout());
    GridBagConstraints constraints = new GridBagConstraints();
    constraints.gridx = 0;
    constraints.gridy = 0;
    constraints.fill = HORIZONTAL;
    constraints.weightx = 1;
    constraints.weighty = 0;
    add(new JLabel(myCaption), constraints);
    constraints.gridy++;
    constraints.fill = BOTH;
    constraints.weighty = 0.5;
    add(myChooseItemComponent, constraints);
    constraints.gridy++;
    constraints.fill = BOTH;
    constraints.weighty = 1;
    add(ScrollPaneFactory.createScrollPane(myTree), constraints);

    myTree.setRootVisible(true);
    updateModels(myCondition);
    myTree.rebuildNow();
    myChooseItemComponent.rebuild();
    myTree.expandPath(new TreePath(myTree.getRootNode()));
  }


  public ChooseNodeOrModelComponent(IOperationContext operationContext, String conceptFQName, boolean mayBeModel, boolean mayBeNode, boolean useLoadedModels) {
    this(operationContext, conceptFQName, mayBeModel, mayBeNode);
    myReturnLoadedModels = useLoadedModels;
  }

  public void setCaption(String caption) {
    myCaption = caption;
  }

  public JComponent getComponentToFocus() {
    return myChooseItemComponent.getTextField();
  }

  public void setCondition(Condition<Object> condition) {
    myCondition = condition;
    Condition modelCondition = Condition.TRUE_CONDITION;
    if (myMayBeModel) {
      modelCondition = myCondition;
    }
    updateModels(modelCondition);
    myTree.rebuildNow();
    myChooseItemComponent.rebuild();
  }

  private void updateModels(Condition modelCondition) {
    Set<SModelDescriptor> models = getModelsFrom(myOperationContext, modelCondition);
    myModels = models;
  }

  private Set<SModelDescriptor> getModelsFrom(IOperationContext context, Condition condition) {
    Set<SModelDescriptor> models = new HashSet<SModelDescriptor>(SModelRepository.getInstance().getModelDescriptors());
    for (SModelDescriptor model : new ArrayList<SModelDescriptor>(models)) {
      if (!(model instanceof EditableSModelDescriptor)) {
        models.remove(model);
      } else if (!SModelStereotype.isUserModel(model)) {
        models.remove(model);
      } else if (((EditableSModelDescriptor) model).isPackaged()) {
        models.remove(model);
      } else if (myReturnLoadedModels && !condition.met(model.getSModel())) {
        models.remove(model);
      } else if (!myReturnLoadedModels && !condition.met(model)) {
        models.remove(model);
      }
    }
    return models;
  }

  private final class MyTree extends MPSTree {
    {
      setShowsRootHandles(true);
    }

    public boolean isRootVisible() {
      return true;
    }

    protected MPSTreeNode rebuild() {
      MPSTreeNode root;
      if (myModel != null) {
        Condition<SNode> nodeCondition = Condition.FALSE_CONDITION;
        if (myMayBeNode) {
          nodeCondition = myCondition;
        }
        root = new SModelTreeNode(myModel, null, myOperationContext, nodeCondition);
      } else {
        root = new TextTreeNode("no model is selected");
        root.setIcon(Icons.DEFAULT_ICON);
      }

      return root;
    }
  }

  public Object submit() throws InvalidInputValueException {
    if (myTree.getSelectionPath() == null) {

      if (myChooseItemComponent.getSelectedItem() != null && myMayBeModel) {
        return myChooseItemComponent.getSelectedItem();
      }

      throw new InvalidInputValueException(myCaption + ": nothing is selected");
    }

    MPSTreeNode node = (MPSTreeNode) myTree.getSelectionPath().getLastPathComponent();
    if (node instanceof SNodeTreeNode) {
      if (!myMayBeNode) {
        throw new InvalidInputValueException(myCaption + ": selected value should not not be a node");
      }
      SNode sNode = ((SNodeTreeNode) node).getSNode();
      if (myConceptFQName != null && !sNode.isInstanceOfConcept(myConceptFQName)) {
        throw new InvalidInputValueException(myCaption + ": selected node should be an istance of " + myConceptFQName);
      }
      return sNode;
    }
    if (node instanceof SModelTreeNode) {
      if (!myMayBeModel) {
        throw new InvalidInputValueException(myCaption + ": selected value should not not be a model");
      }
      SModelDescriptor modelDescriptor = ((SModelTreeNode) node).getSModelDescriptor();
      if (myReturnLoadedModels) {
        return modelDescriptor.getSModel();
      } else {
        return modelDescriptor;
      }
    }
    throw new InvalidInputValueException(myCaption + ": nothing is selected");
  }

  public String getPropertyName() {
    return myPropertyName;
  }

  public void setPropertyName(String propertyName) {
    myPropertyName = propertyName;
  }

  public void setInitialValue(Object initialValue) {
    if (myReturnLoadedModels && initialValue instanceof SModel) {
      initialValue = ((SModel) initialValue).getModelDescriptor();
    }
    TreeNode treeNode = myTree.findNodeWith(initialValue);
    if (treeNode != null) {
      myTree.selectNode(treeNode);
    }
  }

  public JComponent getMainComponent() {
    return this;
  }

  class MyChooseItemComponent extends ChooseItemComponent<SModelDescriptor> {
    public MyChooseItemComponent() {
      super(null);
      setMinimumSize(new Dimension(400, 100));
      setPreferredSize(new Dimension(400, 100));
    }

    protected String getItemPresentation(SModelDescriptor sm) {
      return sm.getSModelReference().getSModelFqName().toString();
    }

    public void doChoose(SModelDescriptor sModelDescriptor) {
      myModel = sModelDescriptor;
      myTree.rebuildNow();//selectNode(myTree.findNodeWith(sModelDescriptor));
    }

    public void rebuild() {
      getNames().clear();
      getItemsMap().clear();
      for (SModelDescriptor modelDescriptor : myModels) {
        putItem(modelDescriptor.getSModelReference().getSModelFqName().toString(), modelDescriptor);
      }
      makeNamesConsistent();
    }
  }
}
