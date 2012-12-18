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
package jetbrains.mps.ide.projectPane.logicalview;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.ide.ui.MPSTree;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.ide.ui.MPSTreeNodeEx;
import jetbrains.mps.ide.ui.smodel.SModelTreeNode;
import jetbrains.mps.ide.ui.smodel.SNodeTreeNode;
import jetbrains.mps.smodel.DependencyRecorder;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.event.*;

import javax.swing.tree.DefaultTreeModel;
import java.util.Enumeration;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public abstract class SNodeTreeUpdater<T extends MPSTreeNode> {
  private Project myProject;
  protected T myTreeNode;
  private DependencyRecorder<SNodeTreeNode> myDependencyRecorder;

  public SNodeTreeUpdater(Project project, T treeNode) {
    myProject = project;
    myTreeNode = treeNode;
  }

  public void setDependencyRecorder(DependencyRecorder recorder) {
    myDependencyRecorder = recorder;
  }

  public abstract SModelDescriptor getSModelDescriptor();

  public abstract void updateNodesWithChangedPackages(Set<SNode> nodesWithChangedPackages);

  public abstract void addAndRemoveRoots(Set<SNode> removedRoots, Set<SNode> addedRoots);

  protected MPSTree getTree() {
    return myTreeNode.getTree();
  }

  protected IOperationContext getOperationContext() {
    return myTreeNode.getOperationContext();
  }

  protected boolean showPropertiesAndReferences() {
    return false;
  }

  public void addAndRemoveVisibleChildren(Set<SNode> removedNodes, Set<SNode> addedNodes) {
    if (getTree() == null) return;
    DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();
    for (SNode removed : removedNodes) {
      SNodeTreeNode node = (SNodeTreeNode) myTreeNode.findDescendantWith(removed);
      if (node == null) continue;
      treeModel.removeNodeFromParent(node);
    }

    outer:
    for (SNode added : addedNodes) {
      if (added.isDeleted()) continue;
      if (added.getParent() == null) continue;
      SNodeTreeNode parent = (SNodeTreeNode) myTreeNode.findDescendantWith(added.getParent());
      if (parent == null) continue;
      if (!parent.isInitialized()) continue;
      SNode parentNode = parent.getSNode();
      int indexof = parentNode.getChildren().indexOf(added);
      Enumeration children = parent.children();

      while(children.hasMoreElements()){
        Object child = children.nextElement();
        if (!(child instanceof SNodeTreeNode)) continue;
        SNodeTreeNode childNode = (SNodeTreeNode) child;
        int index = parentNode.getChildren().indexOf(childNode.getSNode());
        if (index <= indexof) continue;
        SNodeTreeNode newTreeNode = new SNodeTreeNode(added, added.getRole_(), getOperationContext());
        treeModel.insertNodeInto(newTreeNode,
          parent, treeModel.getIndexOfChild(parent, childNode));
        continue outer;
      }
      treeModel.insertNodeInto(new SNodeTreeNode(added, added.getRole_(), getOperationContext()), parent, parent.getChildCount());
    }
  }

  public void updateChangedPresentations(Set<SNode> nodesWithChangedPresentations) {
    if (getTree() == null) return;
    DefaultTreeModel treeModel = (DefaultTreeModel) getTree().getModel();
    for (SNode node : nodesWithChangedPresentations) {
      SNodeTreeNode treeNode = (SNodeTreeNode) myTreeNode.findDescendantWith(node);
      if (treeNode == null) continue;

      if (node.isRoot()) {
        MPSTreeNode parentTreeNode = (MPSTreeNode) treeNode.getParent();
        int currentIndex = parentTreeNode.getIndex(treeNode);

        int newIndex = -1;
        for (int i = 0; i < parentTreeNode.getChildCount(); i++) {
          if (i == currentIndex) continue;
          if (!(parentTreeNode.getChildAt(i) instanceof SNodeTreeNode)) continue;
          SNodeTreeNode child = (SNodeTreeNode) parentTreeNode.getChildAt(i);

          String rp = node.toString();
          String cp = child.getSNode().toString();
          if (rp.compareTo(cp) < 0) {
            newIndex = i;
            if (newIndex > currentIndex) {
              newIndex--;
            }
            break;
          }
        }
        if (newIndex == -1) {
          newIndex = parentTreeNode.getChildCount() - 1;
        }

        if (currentIndex != newIndex) {
          treeModel.removeNodeFromParent(treeNode);
          treeModel.insertNodeInto(treeNode, parentTreeNode, newIndex);
        }
      }

      if (treeNode.isInitialized() && showPropertiesAndReferences()) {
        MPSTreeNodeEx propsNode = (MPSTreeNodeEx) treeNode.getChildAt(0);
        propsNode.update();
        propsNode.init();
      }

      treeNode.renewPresentation();
    }
  }

  public void updateChangedRefs(Set<SNode> nodesWithChangedRefs) {
    if (!showPropertiesAndReferences()) return;

    for (SNode sourceNode : nodesWithChangedRefs) {
      MPSTreeNode nodeTreeNode = myTreeNode.findDescendantWith(sourceNode);
      if (nodeTreeNode == null || !nodeTreeNode.isInitialized()) return;

      MPSTreeNodeEx refsNode = (MPSTreeNodeEx) nodeTreeNode.getChildAt(1);
      refsNode.update();
      refsNode.init();
    }
  }

  public void updateAncestorsPresentationInTree() {
    myTreeNode.updateAncestorsPresentationInTree();
  }

  public void eventsHappenedInCommand(final List<SModelEvent> events) {
    final Runnable action = new UpdateRunnable(events);

    if (ThreadUtils.isEventDispatchThread()) {
      action.run();
    } else {
      getTree().rebuildTreeLater(new Runnable() {
        public void run() {
          if (myProject.isDisposed()) return;
          action.run();
        }
      }, false);
    }
  }

  private class UpdateRunnable implements Runnable {
    private final List<SModelEvent> myEvents;

    public UpdateRunnable(List<SModelEvent> events) {
      myEvents = events;
    }

    public void run() {
      if (myProject.getDisposed().value(null)) return;

      final Set<SNode> addedRoots = new LinkedHashSet<SNode>();
      final Set<SNode> removedRoots = new LinkedHashSet<SNode>();

      final Set<SNode> addedNodes = new LinkedHashSet<SNode>();
      final Set<SNode> removedNodes = new LinkedHashSet<SNode>();

      final Set<SNode> nodesWithChangedPresentations = new LinkedHashSet<SNode>();
      final Set<SNode> nodesWithChangedPackages = new LinkedHashSet<SNode>();

      final Set<SNode> nodesWithChangedRefs = new LinkedHashSet<SNode>();

      final Set<SNode> changedNodes = new LinkedHashSet<SNode>();

      for (SModelEvent event : myEvents) {
        event.accept(new SModelEventVisitorAdapter() {
          public void visitRootEvent(SModelRootEvent event) {
            changedNodes.add(event.getRoot());

            if (event.isAdded()) {
              addedRoots.add(event.getRoot());
              removedRoots.remove(event.getRoot());
            }

            if (event.isRemoved()) {
              removedRoots.add(event.getRoot());
              addedRoots.remove(event.getRoot());
            }
          }

          public void visitChildEvent(SModelChildEvent event) {
            changedNodes.add(event.getParent());
            changedNodes.add(event.getChild());

            if (event.isAdded()) {
              addedNodes.add(event.getChild());
            }

            if (event.isRemoved()) {
              removedNodes.add(event.getChild());
            }
          }

          public void visitPropertyEvent(SModelPropertyEvent event) {
            changedNodes.add(event.getNode());

            nodesWithChangedPresentations.add(event.getNode());

            if (SModelTreeNode.PACK.equals(event.getPropertyName()) && event.getNode().isRoot()) {
              nodesWithChangedPackages.add(event.getNode());
            }
          }

          public void visitReferenceEvent(SModelReferenceEvent event) {
            changedNodes.add(event.getReference().getSourceNode());

            nodesWithChangedRefs.add(event.getReference().getSourceNode());
          }
        });
      }

      Set<SNodeTreeNode> treeNodesToUpdate = new LinkedHashSet<SNodeTreeNode>();
      for (SNode changedNode : changedNodes) {
        if (myDependencyRecorder != null) {
          treeNodesToUpdate.addAll(myDependencyRecorder.getDependOn(changedNode));
        }
      }
      for (SNodeTreeNode n : treeNodesToUpdate) {
        nodesWithChangedPresentations.add(n.getSNode());
      }

      addAndRemoveRoots(removedRoots, addedRoots);
      addAndRemoveVisibleChildren(removedNodes, addedNodes);

      updateChangedPresentations(nodesWithChangedPresentations);

      updateChangedRefs(nodesWithChangedRefs);
      updateNodesWithChangedPackages(nodesWithChangedPackages);

      updateAncestorsPresentationInTree();
    }
  }
}
