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
package jetbrains.mps.ide.migration.persistence;

import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.dialogs.BaseDialog;
import jetbrains.mps.ide.dialogs.DialogDimensionsSettings.DialogDimensions;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;

import javax.swing.*;
import java.awt.Frame;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Cyril.Konopko
 * Date: 25.12.2009
 * Time: 16:18:36
 * To change this template use File | Settings | File Templates.
 */
public class UpdatePersistenceDialog extends BaseDialog {
  private boolean mySetVersion = false;
  private String myUnitDescription;
  List<SModelDescriptor> myModelDescriptors;
  private JRadioButton myButtonYes =
    new JRadioButton("Yes, I want to set new persistence version to application. All old-persistence models will be upgraded automatically on load.");
  private JRadioButton myButtonNo =
    new JRadioButton("No, I will set new persistence version later. I will upgrade my models manually.");
  private boolean myNeedsAskToSetVersion;
  private boolean myAnswer = false;

  private MPSTree myTree = new MPSTree() {
    protected MPSTreeNode rebuild() {
      return rebuildOurTree();
    }
  };

  public UpdatePersistenceDialog(List<EditableSModelDescriptor> modelDescriptors, Frame mainFrame, String unitDescription, boolean needsAskToSetVersion) {
    super(mainFrame, "Upgrade Model Persistence In " + unitDescription);
    myUnitDescription = unitDescription;
    myModelDescriptors = new ArrayList<SModelDescriptor>(modelDescriptors);
    myNeedsAskToSetVersion = needsAskToSetVersion;
  }

  @Override
  protected JComponent getMainComponent() {
    JPanel mainPanel = new JPanel();
    mainPanel.setLayout(new GridBagLayout());
    this.myTree.rebuildNow();
    this.myTree.expandAll();

    GridBagConstraints constraints = new GridBagConstraints();
    constraints.weightx = 1;
    constraints.gridx = 0;
    constraints.weighty = 1;
    constraints.gridy = 0;

    constraints.fill = GridBagConstraints.BOTH;
    JScrollPane scrollPane = ScrollPaneFactory.createScrollPane(this.myTree);
    mainPanel.add(scrollPane, constraints);

    if (myNeedsAskToSetVersion) {
      constraints.fill = GridBagConstraints.NONE;
      constraints.anchor = GridBagConstraints.WEST;
      ButtonGroup buttonGroup = new ButtonGroup();
      buttonGroup.add(myButtonYes);
      buttonGroup.add(myButtonNo);
      myButtonNo.setSelected(true);

      constraints.weighty = 0;
      constraints.gridy = 1;
      mainPanel.add(myButtonYes, constraints);
      constraints.gridy = 2;
      mainPanel.add(myButtonNo, constraints);
    }

    return mainPanel;
  }

  @Override
  public DialogDimensions getDefaultDimensionSettings() {
    return new DialogDimensions(300, 300, 400, 600);
  }

  private void disposeTrue() {
    if (myNeedsAskToSetVersion) {
      this.mySetVersion = myButtonYes.isSelected();
    }
    this.myAnswer = true;
    this.dispose();
  }


  @BaseDialog.Button(position = 0, name = "OK", mnemonic = 'O', defaultButton = true)
  public void onOk() {
    this.disposeTrue();
  }


  @BaseDialog.Button(position = 1, name = "Cancel", mnemonic = 'C')
  public void onCancel() {
    this.dispose();
  }


  private MPSTreeNode rebuildOurTree() {
    TextTreeNode root = new TextTreeNode("Models To Upgrade");
    for (final SModelDescriptor modelDescriptor : myModelDescriptors) {
      MPSTreeNode newNode = new MPSTreeNode(null) {

      };
      newNode.setIcon(IconManager.getIconFor(modelDescriptor));
      newNode.setText(modelDescriptor.getSModelReference().getSModelFqName().toString());
      root.add(newNode);
    }
    return root;
  }

  public boolean getAnswer() {
    return myAnswer;
  }

  public boolean needsSetVersion() {
    return mySetVersion;
  }

}
