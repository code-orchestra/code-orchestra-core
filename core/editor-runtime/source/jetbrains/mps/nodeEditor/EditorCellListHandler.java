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

import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.nodeEditor.cellMenu.DefaultChildSubstituteInfo;
import jetbrains.mps.nodeEditor.cellProviders.AbstractCellListHandler;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Constant;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodeUtil;

import java.util.List;

/**
 * Author: Sergey Dmitriev.
 * Time: Oct 21, 2003 5:12:16 PM
 */
public abstract class EditorCellListHandler extends AbstractCellListHandler {

  private SNode myChildConcept;
  private SNode myLinkDeclaration;

  public EditorCellListHandler(SNode ownerNode, String childRole, EditorContext editorContext) {
    super(ownerNode, childRole, editorContext);
    myLinkDeclaration = ownerNode.getLinkDeclaration(childRole);
    myChildConcept = SModelUtil.getLinkDeclarationTarget(myLinkDeclaration);
    SNode genuineLink = SModelUtil.getGenuineLinkDeclaration(myLinkDeclaration);
    if (SNodeUtil.getLinkDeclaration_IsReference(genuineLink)) {
      throw new RuntimeException("Only Aggregation links can be used in list");
    }
    myElementRole = SModelUtil.getLinkDeclarationRole(genuineLink);
  }

  public SNode getLinkDeclaration() {
    return myLinkDeclaration;
  }

  public SNode getChildConcept() {
    return myChildConcept;
  }


  public EditorCell createNodeCell(EditorContext editorContext, SNode node) {
    return editorContext.createNodeCell(node);
  }

  protected EditorCell createEmptyCell(EditorContext editorContext) {
    EditorCell_Constant emptyCell = new EditorCell_Constant(editorContext, getOwner(), null);
    emptyCell.setDefaultText("<< ... >>");
    emptyCell.setEditable(true);
    emptyCell.setSubstituteInfo(new DefaultChildSubstituteInfo(getOwner(), null, getLinkDeclaration(), editorContext));
    emptyCell.setRole(getElementRole());
    return emptyCell;
  }


  protected SNode getAnchorNode(EditorCell anchorCell) {
    SNode anchorNode = (anchorCell != null ? anchorCell.getSNode() : null);
    if (anchorNode != null) {
      List<SNode> listElements = getOwner().getChildren(getElementRole());
      // anchor should be directly referenced from "list owner"
      while (anchorNode != null && !listElements.contains(anchorNode)) {
        anchorNode = anchorNode.getParent();
      }
    }
    return anchorNode;
  }

  protected void doInsertNode(SNode anchorNode, boolean insertBefore) {
    getOwner().insertChild(anchorNode, getElementRole(), myInsertedNode, insertBefore);
  }

  protected List<SNode> getNodesForList() {
    return myOwnerNode.getChildren(getElementRole());
  }

}
