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
package jetbrains.mps.typesystem.uiActions;

import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.ide.ui.smodel.SNodeTreeNode;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.smodel.*;
import jetbrains.mps.typesystem.debug.EquationLogItem;
import jetbrains.mps.util.Pair;
import jetbrains.mps.workbench.editors.MPSEditorOpener;
import jetbrains.mps.workbench.highlighter.EditorsHelper;

import javax.swing.*;
import java.awt.Color;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.List;

public class TypecheckerStateViewComponent extends JPanel {
  private static final Logger LOG = Logger.getLogger(TypecheckerStateViewComponent.class);

  private IOperationContext myOperationContext;

  private SNode myNodeToSliceWith = null;
  private List<EquationLogItem> myCurrentSlice = new ArrayList<EquationLogItem>();

  public TypecheckerStateViewComponent(IOperationContext operationContext) {
    myOperationContext = operationContext;
    rebuild();
  }

  private void rebuild() {
    removeAll();
    setLayout(new GridBagLayout());

    GridBagConstraints gridBagConstraints = new GridBagConstraints();
    gridBagConstraints.gridx = 0;
    gridBagConstraints.gridy = 0;
    gridBagConstraints.weightx = 1;
    gridBagConstraints.weighty = 0;
    gridBagConstraints.anchor = GridBagConstraints.NORTH;
    gridBagConstraints.fill = GridBagConstraints.BOTH;

    //upper panel
    JButton debugCurrentRootButton = new JButton(new AbstractAction("Debug Current Root") {
      public void actionPerformed(ActionEvent e) {
        Project project = myOperationContext.getProject();
        IEditor currentEditor = EditorsHelper.getSelectedEditors(FileEditorManager.getInstance(project)).get(0);
        if (currentEditor != null) {
          EditorComponent editorComponent = currentEditor.getCurrentEditorComponent();
          if (editorComponent != null) {
            final SNode currentRoot = editorComponent.getEditedNode();
            debugRoot(currentRoot);
          }
        }
      }
    });
    JPanel upperPanel = new JPanel();
    upperPanel.setLayout(new GridBagLayout());
    GridBagConstraints upperPanelConstraints = new GridBagConstraints();
    upperPanelConstraints.gridx = 0;
    upperPanelConstraints.gridy = 0;
    upperPanelConstraints.weightx = 0;
    upperPanelConstraints.weighty = 0;
    upperPanelConstraints.anchor = GridBagConstraints.NORTHWEST;
    upperPanel.add(debugCurrentRootButton, upperPanelConstraints);

    String text = "no info collected";
    upperPanelConstraints.gridx = 1;
    upperPanel.add(new JLabel(text));

    upperPanelConstraints.weightx = 1;
    upperPanelConstraints.gridx = 2;
    upperPanel.add(new JPanel(), upperPanelConstraints);

    add(upperPanel, gridBagConstraints);

    JPanel innerPanel = new JPanel(new GridBagLayout());

    int y = 0;
    GridBagConstraints innerConstraints = new GridBagConstraints();

    if (myNodeToSliceWith != null) {
      //initial node type

      innerConstraints.gridy = y;
      y++;
      innerConstraints.weighty = 0;
      innerConstraints.weightx = 0;
      innerConstraints.fill = GridBagConstraints.NONE;
      innerConstraints.anchor = GridBagConstraints.NORTHWEST;

      innerConstraints.gridx = 0;
      innerPanel.add(new JLabel("initial type: "), innerConstraints);

      innerConstraints.gridx = 1;
      innerConstraints.gridwidth = GridBagConstraints.REMAINDER;
      SNodeTree initialTypeTree = new SNodeTree(null);
      innerPanel.add(initialTypeTree, innerConstraints);
      initialTypeTree.rebuildNow();

      //innerPanel.add(nodeTypePanel, gridBagConstraints);

      //slice items
      innerConstraints.gridwidth = 1;

      for (EquationLogItem equationLogItem : myCurrentSlice) {
        innerConstraints.gridy = y;
        addEquationLog(innerPanel, innerConstraints, equationLogItem);
        // innerPanel.add(new EquationLogItemPanel(equationLogItem), gridBagConstraints);
        y++;
      }
    }

    innerConstraints.gridy = y;
    innerConstraints.weighty = 1;
    JPanel gauge = new JPanel();
    gauge.setBackground(Color.WHITE);
    innerPanel.add(gauge, innerConstraints);

    innerPanel.setBackground(Color.WHITE);
    JScrollPane scrollPane = ScrollPaneFactory.createScrollPane(innerPanel);
    scrollPane.setBackground(Color.WHITE);

    gridBagConstraints.weighty = 1;
    gridBagConstraints.gridy = 1;
    add(scrollPane, gridBagConstraints);

  }

  public void debugRoot(final SNode currentRoot) {

  }

  private void openRule(String ruleModel, final String ruleID) {
    if (ruleModel == null || ruleID == null) return;
    SModelReference modelUID = SModelReference.fromString(ruleModel);
    modelUID = SModelReference.fromString(modelUID.getLongName());
    final SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(modelUID);
    if (modelDescriptor == null) {
      LOG.error("can't find rule's model " + ruleModel);
      return;
    }

    final SNode rule = ModelAccess.instance().runReadAction(new Computable<SNode>() {
      public SNode compute() {
        return modelDescriptor.getSModel().getNodeById(ruleID);
      }
    });
    if (rule == null) {
      LOG.error("can't find rule with id " + ruleID + " in the model " + modelDescriptor);
      return;
    }
    ModelAccess.instance().executeCommand(new Runnable() {
      public void run() {
        myOperationContext.getComponent(MPSEditorOpener.class).openNode(rule);
      }
    }, myOperationContext.getProject());
  }

  public class SNodeTree extends MPSTree {

    private SNode myNode;

    public SNodeTree(SNode node) {
      myNode = node;
    }

    protected MPSTreeNode rebuild() {
      if (myNode == null) {
        return new TextTreeNode("null");
      }
      SNodeTreeNode treeNode = new SNodeTreeNode(myNode, myOperationContext);
      return treeNode;
    }


  }

  private void addEquationLog(JPanel panel, GridBagConstraints constraints, final EquationLogItem item) {
    constraints.weightx = 0;
    constraints.fill = GridBagConstraints.NONE;
    constraints.anchor = GridBagConstraints.NORTHWEST;

    constraints.gridx = 0;
    JLabel label = new JLabel("equation");
    panel.add(label, constraints);

    constraints.gridx = 1;
    SNodeTree leftTree = new SNodeTree(item.getLeftRepresentator());
    panel.add(leftTree, constraints);

    constraints.gridx = 2;
    SNodeTree rightTree = new SNodeTree(item.getRightRepresentator());
    panel.add(rightTree, constraints);

    constraints.gridx = 3;
    constraints.weightx = 1;
    JLabel reasonLabel = new JLabel(item.getReason());
    reasonLabel.addMouseListener(new MouseAdapter() {
      @Override
      public void mousePressed(MouseEvent e) {
        if (e.getClickCount() == 2) {
          String ruleModel = item.getRuleModel();
          final String ruleID = item.getRuleId();
          openRule(ruleModel, ruleID);
        }
      }
    });
    panel.add(reasonLabel, constraints);

    List<jetbrains.mps.util.Pair<String,String>> causes = item.getCauses();
    constraints.gridx = 4;
    constraints.weightx = 0;
    if (!causes.isEmpty()) {

      CausesTree causesTree = new CausesTree(causes);
      panel.add(causesTree, constraints);
      causesTree.rebuildNow();
    } else {
      add(new JLabel(""), constraints);
    }

    leftTree.rebuildNow();
    rightTree.rebuildNow();
  }

  public class EquationLogItemPanel extends JPanel {

    private EquationLogItem myEquationLogItem;

    public EquationLogItemPanel(EquationLogItem equationLogItem) {
      myEquationLogItem = equationLogItem;

      setLayout(new GridBagLayout());
      setBackground(Color.WHITE);

      GridBagConstraints constraints = new GridBagConstraints();
      constraints.gridy = 0;
      constraints.weighty = 0;
      constraints.weightx = 0;
      constraints.fill = GridBagConstraints.NONE;
      constraints.anchor = GridBagConstraints.NORTHWEST;

      JLabel label = new JLabel("equation");
      add(label, constraints);

      constraints.gridx = 1;
      SNodeTree leftTree = new SNodeTree(myEquationLogItem.getLeftRepresentator());
      add(leftTree, constraints);

      constraints.gridx = 2;
      SNodeTree rightTree = new SNodeTree(myEquationLogItem.getRightRepresentator());
      add(rightTree, constraints);

      constraints.gridx = 3;
      constraints.weightx = 1;
      JLabel reasonLabel = new JLabel(myEquationLogItem.getReason());
      reasonLabel.addMouseListener(new MouseAdapter() {
        @Override
        public void mousePressed(MouseEvent e) {
          if (e.getClickCount() == 2) {
            String ruleModel = myEquationLogItem.getRuleModel();
            final String ruleID = myEquationLogItem.getRuleId();
            openRule(ruleModel, ruleID);
          }
        }
      });
      add(reasonLabel, constraints);

      List<Pair<String, String>> causes = myEquationLogItem.getCauses();
      if (!causes.isEmpty()) {
        constraints.gridx = 4;
        constraints.weightx = 0;
        CausesTree causesTree = new CausesTree(causes);
        add(causesTree, constraints);
        causesTree.rebuildNow();
      }

      leftTree.rebuildNow();
      rightTree.rebuildNow();
    }


  }

  class CausesTree extends MPSTree {
    private List<Pair<String, String>> myCauses;

    public CausesTree(List<Pair<String, String>> causes) {
      myCauses = new ArrayList<Pair<String, String>>(causes);
    }

    protected MPSTreeNode rebuild() {
      TextTreeNode root = new TextTreeNode("causes", myOperationContext);
      for (final Pair<String, String> cause : myCauses) {
        TextTreeNode child = new TextTreeNode(cause.o1 + " : " + cause.o2) {
          public void doubleClick() {
            openRule(cause.o1, cause.o2);
          }
        };
        root.add(child);
      }
      return root;
    }
  }
}
