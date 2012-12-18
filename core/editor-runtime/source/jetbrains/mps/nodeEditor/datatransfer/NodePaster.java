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
package jetbrains.mps.nodeEditor.datatransfer;

import jetbrains.mps.datatransfer.CopyPasteManager;
import jetbrains.mps.datatransfer.PasteEnv;
import jetbrains.mps.datatransfer.PastePlaceHint;
import jetbrains.mps.datatransfer.PasteWrappersManager;
import jetbrains.mps.editor.runtime.impl.DataTransferUtil;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeUtil;
import jetbrains.mps.smodel.search.ConceptAndSuperConceptsScope;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Author: Sergey Dmitriev.
 * Time: Nov 25, 2003 7:27:37 PM
 */
public class NodePaster {
  private static final int PASTE_N_A = 0;
  private static final int PASTE_TO_TARGET = 1;
  private static final int PASTE_TO_PARENT = 2;
  private static final int PASTE_TO_ROOT = 3;

  private List<SNode> myPasteNodes;

  public NodePaster(List<SNode> pasteNodes) {
    myPasteNodes = pasteNodes;
  }

  public boolean canPaste(SNode pasteTarget, PasteEnv pasteEnv) {
    return canPaste(pasteTarget, null, pasteEnv) != PASTE_N_A;
  }

  public boolean canPaste(EditorCell targetCell) {
    String role = getRoleFromCell(targetCell);
    SNode pasteTarget = targetCell.getSNode();
    if (pasteTarget == null) return false;
    return canPaste(pasteTarget, role, PasteEnv.NODE_EDITOR) != PASTE_N_A;
  }

  public void paste(EditorCell targetCell) {
    paste(targetCell.getSNode(), getRoleFromCell(targetCell), PasteEnv.NODE_EDITOR);
  }

  public void paste(SNode pasteTarget, PasteEnv pasteEnv) {
    paste(pasteTarget, pasteTarget.getRole_(), pasteEnv);
  }

  private void paste(SNode pasteTarget, String role, PasteEnv pasteEnv) {
    String role_ = role != null ? role : pasteTarget.getRole_();
    int status = canPaste(pasteTarget, role_, pasteEnv);

    if (status == PASTE_TO_TARGET) {
      pasteToTarget(pasteTarget, null, role_, PastePlaceHint.DEFAULT);
    } else if (status == PASTE_TO_PARENT) {
      pasteToParent(pasteTarget, role_, PastePlaceHint.DEFAULT);
    } else if (status == PASTE_TO_ROOT) {
      for (SNode pasteNode : myPasteNodes) {
        pasteNode.getModel().addRoot(pasteNode);
      }
    }
  }

  public void pasteAsRoots(SModel model, String dstPackage) {
    pasteAsRoots(model);
    for (SNode node : myPasteNodes) {
      node.setProperty(SNode.PACK, dstPackage);
    }
  }

  public void pasteAsRoots(SModel model) {
    for (SNode pasteNode : myPasteNodes) {
      model.addRoot(pasteNode);
    }
  }

  public boolean canPasteAsRoots() {
    for (SNode pasteNode : myPasteNodes) {
      SNode nodeConcept = pasteNode.getConceptDeclarationNode();
      if (!SNodeUtil.isInstanceOfConceptDeclaration(nodeConcept) || !SNodeUtil.getConceptDeclaration_IsRootable(nodeConcept)) {
        return false;
      }
    }
    return true;
  }

  public boolean canPasteRelative(SNode anchorNode) {
    return canPasteToParent(anchorNode, anchorNode.getRole_());
  }

  public void pasteRelative(SNode anchorNode, PastePlaceHint placeHint) {
    if (anchorNode.getParent() == null) {
      pasteAsRoots(anchorNode.getModel());
    } else {
      pasteToParent(anchorNode, anchorNode.getRole_(), placeHint);
    }
  }

  private int canPaste(SNode pasteTarget, String role, PasteEnv pasteEnv) {
    if (myPasteNodes == null || myPasteNodes.isEmpty()) {
      return PASTE_N_A;
    }

    String role_ = role != null ? role : pasteTarget.getRole_();

    boolean canPasteAsRoot = (pasteTarget.getParent() == null) && canPasteAsRoots(); // root selected and ..
    boolean canPasteToTarget = canPasteToTarget(pasteTarget, role_, true);

    if (pasteEnv == PasteEnv.PROJECT_TREE) {
      // project pane
      if (canPasteAsRoot) {
        return PASTE_TO_ROOT;
      }

      if (canPasteToTarget) {
        return PASTE_TO_TARGET;
      }
    } else {
      // editor pane
      if (canPasteToTarget) {
        return PASTE_TO_TARGET;
      }
    }

    if (canPasteToParent(pasteTarget, role_)) {
      return PASTE_TO_PARENT;
    }

    return PASTE_N_A;
  }

  private boolean canPasteToTarget(SNode pasteTarget, String role, boolean allowOneCardinality) {
    SNode link = findSuitableLink(pasteTarget.getConceptDeclarationNode(), role);
    if (link != null && SModelUtil.isAggregation(link)) {
      if (!allowOneCardinality) {
        return SModelUtil.isMultipleLinkDeclaration(link);
      } else {
        return true;
      }
    }
    return false;
  }

  private void pasteToTarget(final SNode pasteTarget, final SNode anchorNode, String role, final PastePlaceHint placeHint) {
    final SNode link = findSuitableLink(pasteTarget.getConceptDeclarationNode(), role);

    // RE-1516
    if (myPasteNodes.size() == 1
      && pasteTarget.isInstanceOfConcept("codeOrchestra.actionScript.structure.ExpressionList")
      && "expression".equals(SModelUtil.getLinkDeclarationRole(link))
      && pasteTarget.getChildCount("expression") == 1) {
      pasteTarget.replaceChild(pasteTarget.getChildren("expression").get(0), normalizeForLink(myPasteNodes.get(0), link));
      return;
    }

    // unique child?
    if (!SModelUtil.isMultipleLinkDeclaration(link)) {
      assert myPasteNodes.size() == 1 : "cannot paste multiple children for role '" + SModelUtil.getLinkDeclarationRole(link) + "'";
      SNode node = normalizeForLink(myPasteNodes.get(0), link);
      pasteTarget.setChild(SModelUtil.getLinkDeclarationRole(link), node);
      CopyPasteManager.getInstance().postProcessNode(node);
      return;
    }

    SNode _anchorNode = anchorNode;
    boolean insertBefore = placeHint == PastePlaceHint.BEFORE_ANCHOR;
    for (SNode pasteNode : myPasteNodes) {
      SNode nodeToPaste = normalizeForLink(pasteNode, link);
      pasteTarget.insertChild(_anchorNode, SModelUtil.getGenuineLinkRole(link), nodeToPaste, insertBefore);
      CopyPasteManager.getInstance().postProcessNode(nodeToPaste);
      _anchorNode = nodeToPaste;
      insertBefore = false;
    }

    // delete original anchor if it was abstract concept
    if (anchorNode != null && DataTransferUtil.isAbstract(anchorNode.getConceptDeclarationNode())) {
      anchorNode.delete();
    }
  }

  private SNode normalizeForLink(SNode pasteNode, SNode link) {
    SNode node;
    SNode linkTargetConcept = SModelUtil.getLinkDeclarationTarget(link);
    if (SModelUtil.isAssignableConcept(pasteNode.getConceptDeclarationNode(), linkTargetConcept)) {
      node = pasteNode;
    } else if (PasteWrappersManager.getInstance().canWrapInto(pasteNode, linkTargetConcept)) {
      node = PasteWrappersManager.getInstance().wrapInto(pasteNode, linkTargetConcept);
    } else {
      throw new RuntimeException();
    }
    return node;
  }

  private boolean canPasteToParent(SNode anchorNode, String role) {
    NodeAndRole nodeAndRole = getActualAnchorNode(anchorNode, role);
    return (nodeAndRole != null && nodeAndRole.myNode != null);
  }

  private void pasteToParent(SNode pasteTarget, String role, PastePlaceHint placeHint) {
    SNode actualPasteTarget;
    NodeAndRole nodeAndRole = getActualAnchorNode(pasteTarget, role);
    SNode actualAnchorNode = nodeAndRole.myNode;
    String actualRole = nodeAndRole.myRole;
    actualPasteTarget = actualAnchorNode.getParent();
    if (actualPasteTarget == null) {
      return;
    }
    pasteToTarget(actualPasteTarget, actualAnchorNode, actualRole, placeHint);
  }

  public NodeAndRole getActualAnchorNode(SNode firstAnchorNode, String firstRole) {
    String role = firstRole;
    SNode anchorNode = firstAnchorNode;
    while (anchorNode != null) {
      SNode container = anchorNode.getParent();
      if (container == null) {
        break;
      }
      if (canPasteToTarget(container, role, firstAnchorNode == anchorNode)) {
        return new NodeAndRole(anchorNode, role);
      }
      anchorNode = container;
      role = anchorNode.getRole_();
    }
    return null;
  }

  private SNode findSuitableLink(SNode sourceConcept, String role) {
    List<SNode> links;
    if (role != null) {
      SNode link = new ConceptAndSuperConceptsScope(sourceConcept).getLinkDeclarationByRole(role); // RE-1517
      if (link != null) {
        links = Collections.singletonList(link);
      } else {
        links = Collections.emptyList();
      }
    } else {
      links = new ConceptAndSuperConceptsScope(sourceConcept).getLinkDeclarationsExcludingOverridden();
    }

    for (SNode link : links) {
      boolean suitable = true;
      for (SNode pasteNode : myPasteNodes) {
        SNode pasteConcept = pasteNode.getConceptDeclarationNode();
        if (!SModelUtil.isAssignableConcept(pasteConcept, SModelUtil.getLinkDeclarationTarget(link)) &&
          !PasteWrappersManager.getInstance().canWrapInto(pasteNode, SModelUtil.getLinkDeclarationTarget(link))) {
          suitable = false;
          break;
        }
      }

      if (suitable) {
        if (myPasteNodes.size() == 1 || SModelUtil.isMultipleLinkDeclaration(link)) {
          return link;
        }
      }
    }

    return null;
  }

  private String getRoleFromCell(EditorCell targetCell) {
    String role = targetCell.getRole();
    if (role != null) return role;

    EditorCell_Collection actualCollection = (targetCell instanceof EditorCell_Collection) ? (EditorCell_Collection) targetCell : targetCell.getParent();
    if (actualCollection != null) role = actualCollection.getCellNodesRole();
    while (actualCollection != null && role == null) {
      actualCollection = actualCollection.getParent();
      if (actualCollection == null) break;
      role = actualCollection.getCellNodesRole();
    }

    if (role == null) {
      SNode pasteTarget = targetCell.getSNode();
      role = pasteTarget.getRole_();
    }
    return role;
  }

  public static class NodeAndRole {
    public String myRole;
    public SNode myNode;

    public NodeAndRole(SNode node, String role) {
      this.myRole = role;
      this.myNode = node;
    }
  }

}
