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
package jetbrains.mps.nodeEditor;

import com.intellij.openapi.util.Computable;
import codeOrchestra.actionScript.editor.BlockListHelper;
import codeOrchestra.actionscript.view.utils.NodeUtils;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.selection.SelectionManager;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.search.SModelSearchUtil;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.*;

class IntelligentNodeMover {
  private static final Logger LOG = Logger.getLogger(IntelligentNodeMover.class);

  private List<SNode> myNodes = new ArrayList<SNode>();
  private EditorContext myEditorContext;
  private boolean myForward;

  @CodeOrchestraPatch
  private final Comparator<SNode> nodeByCellPositionComparator = new Comparator<SNode>() {
    @Override
    public int compare(SNode sNode1, SNode sNode2) {
      EditorComponent nodeEditorComponent = getEditorContext().getNodeEditorComponent();
      EditorCell nodeCell1 = nodeEditorComponent.findNodeCell(sNode1);
      EditorCell nodeCell2 = nodeEditorComponent.findNodeCell(sNode2);

      if (nodeCell1 == null || nodeCell2 == null) {
        return 0;
      }

      if (nodeCell1.isAbove(nodeCell2)) {
        return -1;
      }
      if (nodeCell2.isAbove(nodeCell1)) {
        return 1;
      }

      return 0;
    }
  };

  @CodeOrchestraPatch
  IntelligentNodeMover(EditorContext context, final List<SNode> nodes, boolean forward) {
    myEditorContext = context;
    myForward = forward;

    // RE-4284
    SNode blockListNode = ModelAccess.instance().runReadAction(new Computable<SNode>() {
      @Override
      public SNode compute() {
        if (nodes.size() == 1) {
          return BlockListHelper.findTopMostNodeWithSingularContainment(nodes.get(0));
        }
        return null;
      }
    });
    if (blockListNode != null) {
      myNodes.add(blockListNode);
      return;
    }

    myNodes.addAll(nodes);
  }

  public EditorContext getEditorContext() {
    return myEditorContext;
  }

  private boolean forward() {
    return myForward;
  }

  void move() {
    final List<SNode> nodes = new ArrayList<SNode>();
    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        nodes.addAll(myEditorContext.getSelectedNodes());

        if (nodes.isEmpty()) {
          return;
        }

        doMove();
      }
    });

    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        if (nodes.size() == 1) {
          myEditorContext.getNodeEditorComponent().selectNode(nodes.get(0));
        } else if (nodes.size() > 1) {
          SelectionManager selectionManager = myEditorContext.getNodeEditorComponent().getSelectionManager();
          selectionManager.setSelection(selectionManager.createRangeSelection(nodes.get(0), nodes.get(nodes.size() - 1)));
        }
      }
    });
  }

  private void doMove() {
    final SNode current = findBoundaryNode();
    if (current == null) return;
    if (current.getParent() == null) return;

    final SNode parent = current.getParent();
    final String role = current.getRole_();
    assert parent != null && role != null;

    final SNode acd = parent.getConceptDeclarationNode();
    final SNode link = SModelSearchUtil.findLinkDeclaration(acd, role);

    if (link == null) {
      LOG.error("Can't find a link " + role + " in concept " + acd.getName());
      return;
    }

    if (!SModelUtil.isMultipleLinkDeclaration(link)) {
      return;
    }

    final SNode targetType = link.getParent();

    if (isBoundary(current)) {
      SNode currentAnchor = parent;
      SNode currentTarget = parent.getParent();

      while (currentTarget != null) {
        if (currentTarget.isInstanceOfConcept(NameUtil.nodeFQName(targetType))) {
          parent.removeChild(current);
          addWithAnchor(currentTarget, currentAnchor, role, current);
          moveOtherNodes(current);
          return;
        }

        SNode levelCurrent = sibling(currentAnchor);
        while (levelCurrent != null) {
          SNode result = findNodeAtBoundary(targetType, levelCurrent, true);
          if (result != null) {
            parent.removeChild(current);
            addAtBoundary(result, role, current);
            moveOtherNodes(current);
            return;
          }

          levelCurrent = sibling(levelCurrent);
        }

        currentTarget = currentTarget.getParent();
        currentAnchor = currentAnchor.getParent();
      }

      return;
    }

    final SNode prevChild = siblingWithTheSameRole(current);

    SNode innermostContainer = findNodeAtBoundary(targetType, prevChild, true);
    if (innermostContainer != null) {
      parent.removeChild(current);
      addAtBoundary(innermostContainer, role, current);
    } else {
      parent.removeChild(current);
      addWithAnchor(parent, prevChild, role, current);
    }

    moveOtherNodes(current);
  }

  @CodeOrchestraPatch
  private SNode findNodeAtBoundary(SNode acd, SNode current, boolean includeThis) {
    if (includeThis && current.isInstanceOfConcept(NameUtil.nodeFQName(acd))) {
      return current;
    }

    List<SNode> children = new ArrayList<SNode>(current.getChildren());

    // RE-3186
    filterAndSortChildren(children);

    if (!forward()) {
      Collections.reverse(children);
    }
    for (SNode child : children) {
      SNode result = findNodeAtBoundary(acd, child, true);
      if (result != null) {
        return result;
      }
    }

    return null;
  }

  private void filterAndSortChildren(List<SNode> children) {
    Iterator<SNode> childIterator = children.iterator();
    while (childIterator.hasNext()) {
      EditorCell nodeCell = this.myEditorContext.getNodeEditorComponent().findNodeCell(childIterator.next());
      if (nodeCell == null) {
        childIterator.remove();
      }
    }
    Collections.sort(children, nodeByCellPositionComparator);
  }

  @CodeOrchestraPatch
  private SNode sibling(SNode node) {
    if (node.getParent() == null) {
      return null;
    }

    List<SNode> children = node.getParent().getChildren();
    return sibling(node, children);
  }

  @CodeOrchestraPatch
  private SNode siblingWithTheSameRole(SNode node) {
    if (node.getParent() == null) {
      return null;
    }
    return sibling(node, node.getParent().getChildren(node.getRole_()));
  }

  @CodeOrchestraPatch
  private SNode sibling(SNode node, List<SNode> children) {
    List<SNode> allSiblings = new ArrayList<SNode>(children);
    filterAndSortChildren(allSiblings);

    int indexIfCurrentChild = allSiblings.indexOf(node);

    if (forward()) {
      // Last child already
      if (indexIfCurrentChild == allSiblings.size() - 1) {
        return null;
      }
      return allSiblings.get(indexIfCurrentChild + 1);
    } else {
      // First child already
      if (indexIfCurrentChild == 0) {
        return null;
      }
      return allSiblings.get(indexIfCurrentChild - 1);
    }
  }

  private boolean isBoundary(SNode node) {
    String role = node.getRole_();
    assert role != null;
    List<SNode> siblings = node.getParent().getChildren(role);
    int index = siblings.indexOf(node);
    if (forward()) {
      return index == siblings.size() - 1;
    } else {
      return index == 0;
    }
  }

  @CodeOrchestraPatch
  private void addWithAnchor(SNode parent, SNode prevChild, String role, SNode current) {
    // RE-4335
    if (NodeUtils.hasCustomMoveIntoBehavior(parent)) {
      NodeUtils.invokeCustomMoveIntoBehavior(parent);
    }

    if (forward()) {
      parent.insertChild(prevChild, role, current);
    } else {
      parent.insertChild(prevChild, role, current, true);
    }
  }

  @CodeOrchestraPatch
  private void addAtBoundary(SNode parent, String role, SNode current) {
    // RE-4335
    if (NodeUtils.hasCustomMoveIntoBehavior(parent)) {
      NodeUtils.invokeCustomMoveIntoBehavior(parent);
    }

    if (forward()) {
      parent.insertChild(null, role, current);
    } else {
      parent.addChild(role, current);
    }
  }

  private SNode findBoundaryNode() {
    if (forward()) {
      return myNodes.get(myNodes.size() - 1);
    } else {
      return myNodes.get(0);
    }
  }

  private void moveOtherNodes(SNode current) {
    if (forward()) {
      for (SNode node : myNodes.subList(0, myNodes.size() - 1)) {
        node.getParent().removeChild(node);
        current.addPrevSibling(node);
      }
    } else {
      List<SNode> list = new ArrayList<SNode>(myNodes.subList(1, myNodes.size()));
      Collections.reverse(list);
      for (SNode node : list) {
        node.getParent().removeChild(node);
        current.addNextSibling(node);
      }
    }
  }

}
