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
package jetbrains.mps.debugger.api.ui.breakpoints;

import jetbrains.mps.ide.ui.CheckBoxNodeRenderer;
import jetbrains.mps.ide.ui.CheckBoxNodeRenderer.CheckBoxNodeEditor;
import jetbrains.mps.ide.ui.CheckBoxNodeRenderer.NodeData;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.smodel.IOperationContext;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.UIManager;
import java.awt.Color;
import java.util.*;

abstract class GroupedTree<D extends NodeData> extends MPSTree {
  private final IOperationContext myContext;

  public GroupedTree(IOperationContext context) {
    myContext = context;
    setCellRenderer(new CheckBoxNodeRenderer(true));
    setCellEditor(new CheckBoxNodeEditor(true) {
      @Override
      protected NodeData createNodeData(boolean selected) {
        NodeData data = getObject();
        data.setSelected(selected);
        repaint();
        return data;
      }
    });
    setEditable(true);
  }

  protected abstract MPSTreeNode createDataNode(IOperationContext operationContext, D data);

  protected abstract GroupKind<D, Object> createRootGroupKind();

  protected abstract Collection<D> getData();

  @Override
  protected MPSTreeNode rebuild() {
    return new GroupTreeNode<Object>(myContext, createRootGroupKind(), new Object(), getData());
  }

  @Nullable
  public MPSTreeNode findNodeForData(D nodeData) {
    if (this.isEmpty()) return null;
    return findNodeForData((GroupTreeNode) getRootNode(), nodeData);
  }

  @Nullable
  private MPSTreeNode findNodeForData(GroupTreeNode rootNode, D nodeData) {
    for (int i = 0; i < rootNode.getChildCount(); i++) {
      MPSTreeNode child = (MPSTreeNode) rootNode.getChildAt(i);
      if (child instanceof GroupTreeNode) {
        GroupData groupData = ((GroupTreeNode) child).getGroupData();
        if (groupData.getKind().getGroup(nodeData).equals(groupData.getGroup())) {
          return findNodeForData((GroupTreeNode) child, nodeData);
        }
      } else if (child.getUserObject() != null && child.getUserObject().equals(nodeData)) {
        return child;
      }
    }
    return null;
  }

  public static abstract class GroupKind<D, T> {
    private boolean myIsVisible = true;

    @Nullable
    public abstract T getGroup(D data);

    @Nullable
    public Icon getIcon(T group) {
      return null;
    }

    public String getText(@NotNull T group) {
      return group.toString();
    }

    @Nullable
    public GroupKind getSubGroupKind() {
      return null;
    }

    public Map<T, Set<D>> sortByGroups(Collection<D> dataToSort) {
      Map<T, Set<D>> result = new HashMap<T, Set<D>>();

      for (D data : dataToSort) {
        T group = getGroup(data);
        Set<D> dataForGroup = result.get(group);
        if (dataForGroup == null) {
          dataForGroup = new HashSet<D>();
          result.put(group, dataForGroup);
        }
        dataForGroup.add(data);
      }

      return result;
    }

    public boolean isVisible() {
      return myIsVisible;
    }

    public void setVisible(boolean isVisible) {
      myIsVisible = isVisible;
    }
  }

  private class GroupData<D extends NodeData, T> implements NodeData {
    private final
    @NotNull
    GroupKind<D, T> myKind;
    private final
    @NotNull
    T myGroup;
    private final Collection<D> myData;

    public GroupData(T group, GroupKind<D, T> kind, Collection<D> data) {
      myGroup = group;
      myKind = kind;
      myData = data;
    }

    @Override
    public Icon getIcon(boolean expanded) {
      return myKind.getIcon(myGroup);
    }

    @Override
    public Color getColor() {
      return UIManager.getColor("Tree.textForeground");
    }

    @Override
    public String getText() {
      return myKind.getText(myGroup);
    }

    @Override
    public boolean isSelected() {
      for (D d : myData) {
        if (!d.isSelected()) {
          return false;
        }
      }
      return true;
    }

    @NotNull
    public GroupKind<D, T> getKind() {
      return myKind;
    }

    @NotNull
    public T getGroup() {
      return myGroup;
    }

    public void setSelected(boolean selected) {
      for (D d : myData) {
        d.setSelected(selected);
      }
    }
  }

  private class GroupTreeNode<T> extends MPSTreeNode {
    private final Collection<D> myData;

    public GroupTreeNode(IOperationContext operationContext, @NotNull GroupKind<D, T> kind, @NotNull T group, Collection<D> data) {
      super(new GroupData(group, kind, data), operationContext);

      GroupData groupData = getGroupData();
      setNodeIdentifier(groupData.getText());
      setText(groupData.getText());
      Icon icon = groupData.getIcon(false);
      if (icon != null) {
        setIcon(icon);
      }

      myData = data;

      GroupKind<D, Object> subGroupKind = kind.getSubGroupKind();
      while (subGroupKind != null && !subGroupKind.isVisible()) {
        subGroupKind = subGroupKind.getSubGroupKind();
      }

      if (subGroupKind == null) {
        for (D d : myData) {
          add(createDataNode(operationContext, d));
        }
      } else {
        Map<Object, Set<D>> sorted = subGroupKind.sortByGroups(myData);
        for (Object subGroup : sorted.keySet()) {
          if (subGroup != null) {
            add(new GroupTreeNode<Object>(operationContext, subGroupKind, subGroup, sorted.get(subGroup)));
          } else {
            for (D d : sorted.get(subGroup)) {
              add(createDataNode(operationContext, d));
            }
          }
        }
      }
    }

    private GroupData getGroupData() {
      return (GroupData) getUserObject();
    }
  }
}
