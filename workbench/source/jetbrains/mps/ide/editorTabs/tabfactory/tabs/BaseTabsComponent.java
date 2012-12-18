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
package jetbrains.mps.ide.editorTabs.tabfactory.tabs;

import com.intellij.openapi.actionSystem.*;
import com.intellij.openapi.actionSystem.impl.ActionButton;
import com.intellij.openapi.editor.Document;
import com.intellij.openapi.util.Computable;
import gnu.trove.THashMap;
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import jetbrains.mps.ide.editorTabs.tabfactory.NodeChangeCallback;
import jetbrains.mps.ide.editorTabs.tabfactory.TabsComponent;
import jetbrains.mps.ide.editorTabs.tabfactory.tabs.baseListening.ModelListener;
import jetbrains.mps.ide.undo.MPSUndoUtil;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.event.SModelCommandListener;
import jetbrains.mps.smodel.event.SModelEvent;
import jetbrains.mps.smodel.event.SModelRootEvent;

import javax.swing.*;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public abstract class BaseTabsComponent implements TabsComponent {
  private final NodeChangeCallback myCallback;
  private CreateModeCallback myCreateModeCallback;
  protected final SNodePointer myBaseNode;
  protected final Set<EditorTabDescriptor> myPossibleTabs;
  protected final JComponent myEditor;
  protected final boolean myShowGrayed;

  private List<Document> myEditedDocuments = new ArrayList<Document>();
  private List<SNodePointer> myEditedNodes = new ArrayList<SNodePointer>();
  private SNodePointer myLastNode = null;

  private ModelListener myTabRemovalListener = new MyTabRemovalListener();

  private JComponent myComponent;
  private MySModelCommandListener myRootAdditionListener = new MySModelCommandListener();

  public BaseTabsComponent(SNodePointer baseNode, Set<EditorTabDescriptor> possibleTabs, JComponent editor, NodeChangeCallback callback, boolean showGrayed, CreateModeCallback createModeCallback) {
    myBaseNode = baseNode;
    myPossibleTabs = possibleTabs;
    myEditor = editor;
    myCallback = callback;
    myShowGrayed = showGrayed;
    myCreateModeCallback = createModeCallback;

    AnAction addAction = new AddAspectAction(myBaseNode, myPossibleTabs, new NodeChangeCallback() {
      public void changeNode(SNode newNode) {
        updateTabs();
        onNodeChange(newNode);
      }
    }) {
      protected SNode getCurrentAspect() {
        return getLastNode().getNode();
      }
    };

    myComponent = new JPanel(new BorderLayout());
    ActionButton btn = new ActionButton(addAction, addAction.getTemplatePresentation(), ActionPlaces.UNKNOWN, new Dimension(23, 23));
    myComponent.add(btn, BorderLayout.WEST);

    myComponent.registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            prevTab();
          }
        });
      }
    }, KeyStroke.getKeyStroke("ctrl alt shift LEFT"), JComponent.WHEN_IN_FOCUSED_WINDOW);

    myComponent.registerKeyboardAction(new AbstractAction() {
      public void actionPerformed(ActionEvent e) {
        ModelAccess.instance().runReadAction(new Runnable() {
          public void run() {
            nextTab();
          }
        });
      }
    }, KeyStroke.getKeyStroke("ctrl alt shift RIGHT"), JComponent.WHEN_IN_FOCUSED_WINDOW);

    addListeners();
  }

  public void dispose() {
    removeListeners();
  }

  public final JComponent getComponent() {
    return myComponent;
  }

  public List<SNodePointer> getAllEditedNodes() {
    return myEditedNodes;
  }

  public List<Document> getAllEditedDocuments() {
    return myEditedDocuments;
  }

  public void setLastNode(SNodePointer node) {
    myLastNode = node;
  }

  public SNodePointer getLastNode() {
    return myLastNode;
  }

  public ModelListener getTabRemovalListener() {
    return myTabRemovalListener;
  }

  protected void onNodeChange(SNode node) {
    SNodePointer oldNode = myLastNode;
    setLastNode(new SNodePointer(node));
    if (oldNode == null && node != null) {
      if (myCreateModeCallback != null) {
        myCreateModeCallback.exitCreateMode();
      }
    }
    myCallback.changeNode(node);
  }

  protected void enterCreateMode(EditorTabDescriptor tab) {
    setLastNode(null);
    if (myCreateModeCallback != null) {
      myCreateModeCallback.enterCreateMode(new CreatePanel(tab));
    }
  }

  protected Map<EditorTabDescriptor, List<SNode>> updateDocumentsAndNodes() {
    List<Document> editedDocumentsNew = new ArrayList<Document>();
    List<SNodePointer> editedNodesNew = new ArrayList<SNodePointer>();

    Map<EditorTabDescriptor, List<SNode>> result = new THashMap<EditorTabDescriptor, List<SNode>>();
    getTabRemovalListener().clearAspects();
    for (EditorTabDescriptor d : myPossibleTabs) {
      List<SNode> nodes = d.getNodes(myBaseNode.getNode());
      if (nodes.isEmpty()) continue;

      result.put(d, nodes);
      for (SNode node : nodes) {
        getTabRemovalListener().aspectAdded(node.getContainingRoot());
        SNodePointer nodePointer = new SNodePointer(node);
        editedNodesNew.add(nodePointer);
        editedDocumentsNew.add(MPSUndoUtil.getDoc(nodePointer));
      }
    }

    myEditedDocuments = editedDocumentsNew;
    myEditedNodes = editedNodesNew;

    return result;
  }

  ///-------------tab navigation----------------

  protected abstract void nextTab();

  protected abstract void prevTab();

  ///-------------events----------------

  private void addListeners() {
    myTabRemovalListener.startListening();
    GlobalSModelEventsManager.getInstance().addGlobalCommandListener(myRootAdditionListener);
  }

  private void removeListeners() {
    GlobalSModelEventsManager.getInstance().removeGlobalCommandListener(myRootAdditionListener);
    myTabRemovalListener.stopListening();
  }

  private class MyTabRemovalListener extends ModelListener {
    protected void onImportantRootRemoved(SNodePointer node) {
      if (!checkNodeRemoved(node)) return;
      updateTabs();
    }
  }

  protected abstract boolean checkNodeRemoved(SNodePointer node);

  protected abstract void updateTabs();

  ///-------------grayed mode----------------

  private class CreatePanel extends JPanel {
    public CreatePanel(final EditorTabDescriptor tab) {
      super(new BorderLayout());

      JLabel label = new JLabel("Click to create new aspect");
      label.setAlignmentX(JLabel.CENTER_ALIGNMENT);
      label.setHorizontalAlignment(SwingConstants.CENTER);
      add(label, BorderLayout.CENTER);

      this.addMouseListener(new MouseAdapter() {
        public void mouseClicked(final MouseEvent e) {
          ActionGroup group = ModelAccess.instance().runReadAction(new Computable<ActionGroup>() {
            public ActionGroup compute() {
              return CreateGroupsBuilder.getCreateGroup(myBaseNode, new NodeChangeCallback() {
                public void changeNode(SNode newNode) {
                  updateTabs();
                  onNodeChange(newNode);
                }
              }, tab);
            }
          });

          ActionPopupMenu popup = ActionManager.getInstance().createActionPopupMenu(ActionPlaces.UNKNOWN, group);
          JPopupMenu popupComponent = popup.getComponent();
          popupComponent.show(e.getComponent(), e.getX(), e.getY());
        }
      });
    }
  }

  private class MySModelCommandListener implements SModelCommandListener {
    public void eventsHappenedInCommand(List<SModelEvent> events) {
      for (SModelEvent e: events){
        if (!(e instanceof SModelRootEvent)) continue;
        SModelRootEvent re = (SModelRootEvent) e;
        if (!re.isAdded()) continue;

        updateTabs();
        return;
      }
    }
  }
}
