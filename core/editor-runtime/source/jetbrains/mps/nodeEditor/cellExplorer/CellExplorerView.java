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
package jetbrains.mps.nodeEditor.cellExplorer;

import com.intellij.openapi.actionSystem.ActionGroup;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.ToolWindowAnchor;
import com.intellij.ui.ScrollPaneFactory;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.TextTreeNode;
import jetbrains.mps.ide.ui.TreeTextUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.*;
import jetbrains.mps.nodeEditor.cells.*;
import jetbrains.mps.nodeEditor.cellLayout.CellLayout;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.Pair;
import jetbrains.mps.workbench.action.BaseAction;
import jetbrains.mps.workbench.action.ActionUtils;
import jetbrains.mps.workbench.tools.BaseProjectTool;
import jetbrains.mps.workbench.MPSDataKeys;

import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.tree.DefaultTreeModel;
import java.awt.BorderLayout;
import java.util.*;

/**
 * @author Kostik
 */
public class CellExplorerView extends BaseProjectTool {
  public static final Logger LOG = Logger.getLogger(CellExplorerView.class);

  private JPanel myComponent = new JPanel(new BorderLayout());
  private MyTree myTree = new MyTree();
  private EditorComponent myCurrentEditor;

  private CellTreeNode myCashedPropertyCellTreeNode = null;

  private EditorComponent.RebuildListener myRebuildListener = new EditorComponent.RebuildListener() {
    public void editorRebuilt(EditorComponent editor) {
      update();
    }
  };
  private EditorComponent.CellSynchronizationWithModelListener mySynchronizationListener = new EditorComponent.CellSynchronizationWithModelListener() {
    public void cellSynchronizedWithModel(EditorCell cell) {
      if (cell == null) return;
      CellTreeNode cellTreeNode;
      if (myCashedPropertyCellTreeNode != null && cell == myCashedPropertyCellTreeNode.getUserObject()) {
        cellTreeNode = myCashedPropertyCellTreeNode;
      } else {
        cellTreeNode = (CellTreeNode) findCellTreeNode(cell);
        myCashedPropertyCellTreeNode = cellTreeNode;
      }
      if (cellTreeNode == null) return;
      cellTreeNode.init();
      ((DefaultTreeModel) myTree.getModel()).nodeChanged(cellTreeNode);
      myTree.repaint();
    }
  };

  public CellExplorerView(Project project) {
    super(project, "Cell Explorer", -1, null, ToolWindowAnchor.BOTTOM, true);

    myTree.setRootVisible(true);
    myComponent.add(ScrollPaneFactory.createScrollPane(myTree), BorderLayout.CENTER);
    update();
  }

  public void update() {
    removeListeners();
    if (myCurrentEditor != null) {
      myCurrentEditor.addRebuildListener(myRebuildListener);
      myCurrentEditor.addSynchronizationListener(mySynchronizationListener);
    }
    myTree.rebuildLater();
  }

  private void removeListeners() {
    if (myCurrentEditor != null) {
      myCurrentEditor.removeRebuildListener(myRebuildListener);
      myCurrentEditor.removeSynchronizationListener(mySynchronizationListener);
    }
  }

  public void toolShown() {
    update();
  }

  public void toolHidden() {
    removeListeners();
  }

  public void showCell(EditorCell cell) {
    makeAvailable();
    openTool(true);

    EditorComponent cellEditor = cell.getEditorContext().getNodeEditorComponent();
    if (myCurrentEditor != cellEditor) {
      removeListeners();
      myCurrentEditor = cellEditor;
      update();
    }

    MPSTreeNode current = findCellTreeNode(cell);
    if (current == null) {
      LOG.warning("Can't find cell in tree");
      return;
    }
    myTree.selectNode(current);
  }

  private MPSTreeNode findCellTreeNode(EditorCell cell) {
    List<EditorCell> path = new ArrayList<EditorCell>();
    while (cell != null) {
      path.add(cell);
      cell = cell.getParent();
    }
    Collections.reverse(path);

    MPSTreeNode current = myTree.getRootNode();
    for (EditorCell editorCell : path) {
      if (!current.isInitialized()) current.init();
      current = current.findExactChildWith(editorCell);
      if (current == null) {
        break;
      }
    }
    return current;
  }

  public String getName() {
    return "Cell Explorer";
  }

  public Icon getIcon() {
    return Icons.CELL_EXPLORER_ICON;
  }

  public JComponent getComponent() {
    return myComponent;
  }

  private class MyTree extends MPSTree {
    protected MPSTreeNode rebuild() {
      if (myCurrentEditor == null) {
        return new TextTreeNode("No editor selected") {
          {
            setIcon(Icons.CELL_EXPLORER_ICON);
          }
        };
      } else {
        TextTreeNode root = new TextTreeNode("CELLS") {
          {
            setIcon(Icons.CELL_EXPLORER_ICON);
          }
        };
        root.add(new CellTreeNode(myCurrentEditor.getRootCell()));
        return root;
      }
    }
  }

  private class CellTreeNode extends MPSTreeNode {
    private EditorCell myCell;
    private boolean myInitialized = false;

    public CellTreeNode(EditorCell cell) {
      super(cell, null);
      myCell = cell;
      setNodeIdentifier(calculateNodeIdentifier());
    }

    protected void doUpdatePresentation() {
      if (myCell.isErrorState()) {
        setIcon(Icons.CELL_ERROR_ICON);
      } else if (myCell instanceof EditorCell_Collection) {
        setIcon(Icons.CELLS_ICON);
      } else if (myCell instanceof EditorCell_Constant) {
        setIcon(Icons.CELL_CONSTANT_ICON);
      } else if (myCell instanceof EditorCell_Error) {
        setIcon(Icons.CELL_ERROR_ICON);
      } else if (myCell instanceof EditorCell_Component) {
        setIcon(Icons.CELL_COMPONENT_ICON);
      } else if (myCell instanceof EditorCell_Property) {
        setIcon(Icons.CELL_PROPERTY_ICON);
      } else {
        setIcon(Icons.CELL_DEFAULT_ICON);
      }

      setAdditionalText("[" + myCell.getX() + ", " + myCell.getY() + ", " + myCell.getWidth() + ", " + myCell.getHeight() + "], baseLine = " + myCell.getBaseline() + ", ascent = " + myCell.getAscent() + ", descent = " + myCell.getDescent());
    }

    public boolean isInitialized() {
      return myInitialized;
    }

    public int getToggleClickCount() {
      return -1;
    }

    public ActionGroup getActionGroup() {
      BaseAction selectInEditorAction = new BaseAction("Select In Editor") {

        @Override
        protected boolean isEnabledInASView() {
          return true;
        }

        protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
          showCell();
        }
      };
      BaseAction propertiesAction = new BaseAction("Properties") {

        @Override
        protected boolean isEnabledInASView() {
          return true;
        }

        protected void doExecute(AnActionEvent e, Map<String, Object> _params) {
          new CellPropertiesWindow(myCell, e.getData(MPSDataKeys.FRAME));
        }
      };
      return ActionUtils.groupFromActions(selectInEditorAction,propertiesAction);
    }

    private void showCell() {
      makeAvailable();
      if (myCurrentEditor != null) {
        myCurrentEditor.changeSelection(myCell);
      }
    }

    public void doubleClick() {
      showCell();
    }

    protected void doInit() {
      removeAllChildren();
      if (myCell.getSNode() != null) {
        final SNode node = myCell.getSNode();
        String name = node.getName();
        name = name != null ? name : "<no name>";
        String text = "<html><b>Node</b> " + TreeTextUtil.toHtml(name) + " (" + TreeTextUtil.toHtml(node.getConceptShortName()) + ")";
        add(new TextTreeNode(text) {
          {
            setIcon(IconManager.getIconFor(node));
            if (myCell instanceof EditorCell_Collection) {
              CellLayout layout = ((EditorCell_Collection) myCell).getCellLayout();
              setAdditionalText(layout.toString());
            }
          }

          public void doubleClick() {
            CellTreeNode.this.doubleClick();
          }

          public boolean isLeaf() {
            return true;
          }
        });

        if (myCell.getKeyMap() != null) {
          add(new KeyMapTreeNode(myCell.getKeyMap()));
        }

        if (myCell.getAvailableActions().size() > 0) {
          add(new CellActionsTreeNode(myCell, getOperationContext()));
        }
      } else {
        add(new TextTreeNode("No Node"));
      }

      if (myCell instanceof EditorCell_Collection) {
        EditorCell_Collection cell = (EditorCell_Collection) myCell;
        for (EditorCell child : cell) {
          add(new CellTreeNode(child));
        }
        myInitialized = true;
      }
    }


    public String calculateText() {
      String result = NameUtil.shortNameFromLongName(myCell.getClass().getName());
      if (myCell instanceof EditorCell_Label) {
        String text = ((EditorCell_Label) myCell).getText();
        if (text == null || text.length() == 0) {
          text = ((EditorCell_Label) myCell).getNullText();
        }
        result += " text = \"" + text + "\"";
      }
      if (myCell.isErrorState()) {
        result += " (error state)";
      }
      return result;
    }

    public String calculateNodeIdentifier() {
      String result = NameUtil.shortNameFromLongName(myCell.getClass().getName());
      if (myCell.getCellId() != null)
        result += "[" + myCell.getCellId() + "]";
      return result;
    }
  }

  private class CellActionsTreeNode extends MPSTreeNode {

    public CellActionsTreeNode(EditorCell cell, IOperationContext operationContext) {
      super(cell, operationContext);
      Set<CellActionType> actions = new TreeSet<CellActionType>(cell.getAvailableActions());
      for (CellActionType action : actions) {
        add(new TextTreeNode(action + ""));
      }
      setNodeIdentifier("Actions");
    }

  }

  private class KeyMapTreeNode extends MPSTreeNode {
    public KeyMapTreeNode(EditorCellKeyMap keyMap) {
      super(null);


      List<Pair<EditorCellKeyMapAction, EditorCellKeyMap.ActionKey>> list =
        new ArrayList<Pair<EditorCellKeyMapAction, EditorCellKeyMap.ActionKey>>(keyMap.getAllActionsAndKeys());


      Collections.sort(list, new Comparator<Pair<EditorCellKeyMapAction, EditorCellKeyMap.ActionKey>>() {
        public int compare(Pair<EditorCellKeyMapAction, EditorCellKeyMap.ActionKey> o1, Pair<EditorCellKeyMapAction, EditorCellKeyMap.ActionKey> o2) {
          return o1.o2.toString().compareTo(o2.o2.toString());
        }
      });

      for (Pair<EditorCellKeyMapAction, EditorCellKeyMap.ActionKey> key : list) {
        String text = key.o2.toString();

        if (key.o1.getDescriptionText() != null && key.o1.getDescriptionText().length() != 0) {
          text += " (" + key.o1.getDescriptionText() + ")";
        }

        add(new TextTreeNode(text) {
          {
            setIcon(Icons.CELL_ACTION_KEY_ICON);
          }

          public boolean isLeaf() {
            return true;
          }
        });

        setIcon(Icons.CELL_KEY_MAP_ICON);
        setNodeIdentifier("Keymap");
      }
    }
  }
}
