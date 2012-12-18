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
package jetbrains.mps.workbench.components;


import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.ui.popup.JBPopup;
import jetbrains.mps.ide.embeddableEditor.EmbeddableEditor;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.projectPane.ProjectPane;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.ModelOwner;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.editors.MPSEditorOpener;

import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyEvent;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ShowImplementationComponent extends JPanel {
  private JComboBox myNodeChooser;
  private JLabel myLocationLabel = new JLabel("<location>");
  private JLabel myCountLanel = new JLabel("<count>");
  private EmbeddableEditor myEditor;
  private List<SNode> myNodes;
  private Map<String, SNode> myItemToNode = new LinkedHashMap<String, SNode>();
  private JComponent myEditorPanel;
  private int mySelectedIndex = -1;
  private JBPopup myPopup;

  public ShowImplementationComponent(List<SNode> nodes, IOperationContext context) {
    myNodes = nodes;
    myEditor = new EmbeddableEditor(context, new ModelOwner() {
    }, SNodeOperations.copyNode(nodes.get(0)), false);
    for (SNode node : myNodes) {
      myItemToNode.put(node.getModel().getSModelReference() + ":" + node.getSNodeId(), node);
    }
    init();
    updateControls();
  }

  public void setPopup(JBPopup popup) {
    myPopup = popup;
  }

  public JComponent getPrefferedFocusableComponent() {
    return myNodeChooser;
  }

  private ActionToolbar createToolbar() {
    DefaultActionGroup group = new DefaultActionGroup();

    BackAction back = new BackAction();
    back.registerCustomShortcutSet(new CustomShortcutSet(KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, 0)), this);
    group.add(back);

    ForwardAction forward = new ForwardAction();
    forward.registerCustomShortcutSet(new CustomShortcutSet(KeyStroke.getKeyStroke(KeyEvent.VK_RIGHT, 0)), this);
    group.add(forward);

    ShowSourceAction showSource = new ShowSourceAction("Show Source", Icons.SHOW_SOURCE_ICON, false);
    showSource.registerCustomShortcutSet(new CompositeShortcutSet(CommonShortcuts.getViewSource(), CommonShortcuts.CTRL_ENTER), this);
    group.add(showSource);

    showSource = new ShowSourceAction("Edit Source", Icons.EDIT_SOURCE_ICON, true);
    showSource.registerCustomShortcutSet(new CustomShortcutSet(KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0)), this);
    group.add(showSource);

    return ActionManager.getInstance().createActionToolbar(ActionPlaces.UNKNOWN, group, true);
  }

  private void updateControls() {
    String selectedItem = (String) myNodeChooser.getSelectedItem();
    final SNode selectedNode = myItemToNode.get(selectedItem);
    final int index = myNodes.indexOf(selectedNode);
    if (mySelectedIndex == index) return;
    ModelAccess.instance().runReadInEDT(new Runnable() {
      public void run() {
        IModule module = selectedNode.getModel().getModelDescriptor().getModule();
        myLocationLabel.setText(module.getModuleFqName());
        myLocationLabel.setIcon(IconManager.getIconFor(module));
        myCountLanel.setText((index + 1) + " of " + myNodes.size());
        myEditor.setNode(SNodeOperations.copyNode(myNodes.get(index)));
        myEditor.setBackground(new Color(255, 255, 215));
        mySelectedIndex = index;
        myEditorPanel.repaint();
      }
    });
  }

  private void init() {
    setLayout(new BorderLayout());
    myEditorPanel = myEditor.getComponenet();
    add(myEditorPanel, BorderLayout.CENTER);
    JPanel northPanel = new JPanel(new BorderLayout());
    add(northPanel, BorderLayout.NORTH);
    JPanel toolbarPanel = new JPanel(new FlowLayout());
    toolbarPanel.add(createToolbar().getComponent());
    this.myNodeChooser = new JComboBox(myItemToNode.keySet().toArray());
    myNodeChooser.setRenderer(new DefaultListCellRenderer() {
      @Override
      public Component getListCellRendererComponent(JList list, final Object value, int index, boolean isSelected, boolean cellHasFocus) {
        super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
        updateControls();
        ModelAccess.instance().runReadAction(new Runnable() {
          @Override
          public void run() {
            SNode root = myItemToNode.get((String) value).getContainingRoot();
            setIcon(IconManager.getIconFor(root, true));
            setText(root.getPresentation());
          }
        });
        return this;
      }
    });
    toolbarPanel.add(myNodeChooser);
    toolbarPanel.add(myCountLanel);
    northPanel.add(toolbarPanel, BorderLayout.LINE_START);
    northPanel.add(myLocationLabel, BorderLayout.LINE_END);

    setPreferredSize(new Dimension(600, 400));
  }

  private class BackAction extends AnAction {
    public BackAction() {
      super("Back", null, Icons.BACK_ICON);
    }

    @Override
    public void actionPerformed(AnActionEvent e) {
      assert myNodeChooser.getSelectedIndex() > 0;
      myNodeChooser.setSelectedIndex(myNodeChooser.getSelectedIndex() - 1);
      updateControls();
    }

    @Override
    public void update(AnActionEvent e) {
      e.getPresentation().setEnabled(myNodeChooser != null
        && myNodeChooser.getSelectedIndex() > 0);
    }
  }

  private class ForwardAction extends AnAction {
    public ForwardAction() {
      super("Forward", null, Icons.FORWARD_ICON);
    }

    @Override
    public void actionPerformed(AnActionEvent e) {
      assert myNodeChooser.getSelectedIndex() < myNodeChooser.getItemCount() - 1;
      myNodeChooser.setSelectedIndex(myNodeChooser.getSelectedIndex() + 1);
      updateControls();
    }

    @Override
    public void update(AnActionEvent e) {
      e.getPresentation().setEnabled(myNodeChooser != null
        && myNodeChooser.getSelectedIndex() < myNodeChooser.getItemCount() - 1);
    }
  }

  private class ShowSourceAction extends AnAction {
    private boolean myClosePopup;

    public ShowSourceAction(String name, Icon icon, boolean closePopup) {
      super(name, null, icon);
      myClosePopup = closePopup;
    }

    @Override
    public void actionPerformed(AnActionEvent e) {
      IOperationContext operationContext = myEditor.getEditor().getOperationContext();
      final SNode selectedNode = myItemToNode.get((String) myNodeChooser.getSelectedItem());
      operationContext.getComponent(MPSEditorOpener.class).editNode(selectedNode, operationContext);
      ProjectPane.getInstance(operationContext.getProject()).selectNode(selectedNode, false);
      if (myClosePopup) {
        myPopup.cancel();
      }
    }
  }
}
