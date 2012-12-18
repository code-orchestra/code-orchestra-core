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

import com.intellij.openapi.util.Computable;
import jetbrains.mps.debug.api.BreakpointManagerComponent;
import jetbrains.mps.debug.api.BreakpointManagerComponent.BreakpointManagerListener;
import jetbrains.mps.debug.api.BreakpointManagerComponent.IBreakpointManagerListener;
import jetbrains.mps.debug.api.breakpoints.IBreakpoint;
import jetbrains.mps.debug.api.breakpoints.ILocationBreakpoint;
import jetbrains.mps.debugger.api.ui.breakpoints.GroupedTree.GroupKind;
import jetbrains.mps.ide.icons.IconManager;
import jetbrains.mps.ide.ui.CheckBoxNodeRenderer.NodeData;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.*;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.UIManager;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.TreePath;
import java.awt.Color;
import java.util.ArrayList;
import java.util.Collection;

abstract class AbstractBreakpointsTree extends BreakpointsView {
  protected final IOperationContext myContext;
  protected final GroupedTree<BreakpointNodeData> myTree;
  protected final GroupKind myModuleKind = new ModuleGroupKind();
  protected final GroupKind myModelKind = new ModelGroupKind();
  protected final GroupKind myRootKind = new RootGroupKind();
  protected Collection<BreakpointNodeData> myData;
  protected final IBreakpointManagerListener myListener = new BreakpointManagerListener() {
    @Override
    public void breakpointsChanged() {
      update();
    }
  };

  public AbstractBreakpointsTree(BreakpointManagerComponent breakpointsManager, IOperationContext context) {
    super(breakpointsManager);
    myContext = context;
    myBreakpointsManager.addChangeListener(myListener);
    updateBreakpointsData();
    myTree = new GroupedTree<BreakpointNodeData>(myContext) {
      protected BreakpointTreeNode createDataNode(IOperationContext operationContext, BreakpointNodeData data) {
        return new BreakpointTreeNode(operationContext, data);
      }

      @Override
      protected GroupKind<BreakpointNodeData, Object> createRootGroupKind() {
        return new AllGroupKind();
      }

      @Override
      protected Collection<BreakpointNodeData> getData() {
        return myData;
      }
    };
    myTree.addTreeSelectionListener(new TreeSelectionListener() {
      @Override
      public void valueChanged(TreeSelectionEvent e) {
        fireBreakpointSelected(getSelectedBreakpoint(e.getPath()));
      }
    });
    myTree.setRootVisible(false);
    myTree.setShowsRootHandles(true);
  }

  @Override
  public void dispose() {
    myBreakpointsManager.removeChangeListener(myListener);
    super.dispose();
  }

  @Override
  @Nullable
  public IBreakpoint getSelectedBreakpoint() {
    TreePath path = myTree.getSelectionPath();
    return getSelectedBreakpoint(path);
  }

  @Nullable
  protected IBreakpoint getSelectedBreakpoint(@Nullable TreePath path) {
    if (path != null) {
      Object lastPathComponent = path.getLastPathComponent();
      if (lastPathComponent instanceof BreakpointTreeNode) {
        return ((BreakpointNodeData) ((BreakpointTreeNode) lastPathComponent).getUserObject()).myBreakpoint;
      }
    }
    return null;
  }

  @Override
  public void selectBreakpoint(@Nullable final IBreakpoint breakpoint) {
    if (breakpoint != null) {
      MPSTreeNode treeNode = ModelAccess.instance().runReadAction(new Computable<MPSTreeNode>() {
        @Override
        public MPSTreeNode compute() {
          return myTree.findNodeForData(new BreakpointNodeData(breakpoint));
        }
      });
      myTree.selectNode(treeNode);
    } else {
      myTree.clearSelection();
    }
  }

  protected void updateView() {
    myModelKind.setVisible(BreakpointViewSettingsComponent.getInstance(myContext.getProject()).isGroupByModel());
    myModuleKind.setVisible(BreakpointViewSettingsComponent.getInstance(myContext.getProject()).isGroupByModule());
    myRootKind.setVisible(BreakpointViewSettingsComponent.getInstance(myContext.getProject()).isGroupByRoot());
  }

  protected void updateBreakpointsData() {
    Collection<BreakpointNodeData> data = new ArrayList<BreakpointNodeData>();
    for (IBreakpoint bp : getBreakpointsList()) {
      data.add(new BreakpointNodeData(bp));
    }
    myData = data;
  }

  @Override
  public JComponent getMainComponent() {
    return myTree;
  }

  public void update() {
    updateBreakpoints();
    updateBreakpointsData();
    myTree.rebuildLater();
  }

  @Override
  public Object getData(@NonNls String dataId) {
    TreePath path = myTree.getSelectionPath();
    if (path == null) return null;
    Object node = path.getLastPathComponent();
    if (MPS_BREAKPOINT.is(dataId)) {
      if (node instanceof BreakpointTreeNode) {
        BreakpointTreeNode breakpointNode = (BreakpointTreeNode) node;
        return ((BreakpointNodeData) breakpointNode.getUserObject()).myBreakpoint;
      }
      return null;
    }
    return null;
  }

  protected class AllGroupKind extends GroupKind<BreakpointNodeData, Object> {

    @Override
    public Object getGroup(BreakpointNodeData breakpoint) {
      return new Object();
    }

    @Override
    public GroupKind getSubGroupKind() {
      return myModuleKind;
    }
  }

  private class ModuleGroupKind extends GroupKind<BreakpointNodeData, IModule> {
    @Override
    public IModule getGroup(BreakpointNodeData breakpointData) {
      IBreakpoint breakpoint = breakpointData.getBreakpoint();
      if (breakpoint instanceof ILocationBreakpoint) {
        SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(((ILocationBreakpoint) breakpoint).getLocation().getModelReference());
        if (modelDescriptor != null) {
          return modelDescriptor.getModule();
        }
      }
      return null;
    }

    @Override
    public GroupKind getSubGroupKind() {
      return myModelKind;
    }

    @Override
    public Icon getIcon(IModule m) {
      return IconManager.getIconFor(m);
    }
  }

  private class ModelGroupKind extends GroupKind<BreakpointNodeData, SModelReference> {
    @Override
    public SModelReference getGroup(BreakpointNodeData breakpointNodeData) {
      IBreakpoint breakpoint = breakpointNodeData.getBreakpoint();
      if (breakpoint instanceof ILocationBreakpoint) {
        return ((ILocationBreakpoint) breakpoint).getLocation().getModelReference();
      } else {
        return null;
      }
    }

    @Override
    public GroupKind getSubGroupKind() {
      return myRootKind;
    }

    @Override
    public String getText(@NotNull SModelReference group) {
      return group.getLongName();
    }

    @Override
    public Icon getIcon(SModelReference model) {
      return IconManager.getIconFor(SModelRepository.getInstance().getModelDescriptor(model));
    }
  }

  private class RootGroupKind extends GroupKind<BreakpointNodeData, SNodePointer> {
    @Override
    public SNodePointer getGroup(@NotNull BreakpointNodeData breakpointNodeData) {
      IBreakpoint breakpoint = breakpointNodeData.getBreakpoint();
      if (breakpoint instanceof ILocationBreakpoint) {
        SNode node = ((ILocationBreakpoint) breakpoint).getLocation().getSNode();
        if (node != null) {
          return new SNodePointer(node.getContainingRoot());
        }
      }
      return null;
    }

    @Override
    public Icon getIcon(SNodePointer group) {
      return IconManager.getIconFor(group.getNode());
    }
  }

  protected class BreakpointNodeData implements NodeData {
    @NotNull
    private final IBreakpoint myBreakpoint;

    public BreakpointNodeData(@NotNull IBreakpoint breakpoint) {
      myBreakpoint = breakpoint;
    }

    @Override
    public Icon getIcon(boolean expanded) {
      return BreakpointIconRenderer.getIconFor(myBreakpoint);
    }

    @Override
    public Color getColor() {
      return UIManager.getColor("Tree.textForeground");
    }

    @Override
    public String getText() {
      return myBreakpoint.getPresentation();
    }

    @Override
    public boolean isSelected() {
      return myBreakpoint.isEnabled();
    }

    @Override
    public void setSelected(boolean selected) {
      myBreakpoint.setEnabled(selected);
    }

    @NotNull
    public IBreakpoint getBreakpoint() {
      return myBreakpoint;
    }

    @Override
    public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      jetbrains.mps.debugger.api.ui.breakpoints.BreakpointsTree.BreakpointNodeData that = (jetbrains.mps.debugger.api.ui.breakpoints.BreakpointsTree.BreakpointNodeData) o;

      if (!myBreakpoint.equals(that.myBreakpoint)) return false;

      return true;
    }

    @Override
    public int hashCode() {
      return myBreakpoint.hashCode();
    }
  }

  protected class BreakpointTreeNode extends MPSTreeNode {
    public BreakpointTreeNode(IOperationContext operationContext, BreakpointNodeData breakpoint) {
      super(breakpoint, operationContext);

      BreakpointNodeData bp = (BreakpointNodeData) getUserObject();

      setNodeIdentifier(bp.getText());
      setIcon(bp.getIcon(true));
      setText(bp.getText());
    }

    public boolean isLeaf() {
      return true;
    }
  }
}
