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
package jetbrains.mps.lang.editor.cellProviders;

import jetbrains.mps.editor.runtime.impl.cellActions.CellAction_DeleteEasily;
import jetbrains.mps.kernel.model.SModelUtil;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.attribute.AttributeKind;
import jetbrains.mps.nodeEditor.CellActionType;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cellActions.CellAction_DeleteNode;
import jetbrains.mps.nodeEditor.cellActions.CellAction_Insert;
import jetbrains.mps.nodeEditor.cellMenu.CellContext;
import jetbrains.mps.nodeEditor.cellMenu.DefaultChildSubstituteInfo;
import jetbrains.mps.nodeEditor.cellMenu.DefaultReferenceSubstituteInfo;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteInfo;
import jetbrains.mps.nodeEditor.cellProviders.CellProviderWithRole;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Constant;
import jetbrains.mps.nodeEditor.cells.EditorCell_Error;
import jetbrains.mps.nodeEditor.cells.EditorCell_Label;
import jetbrains.mps.smodel.*;

public abstract class AbstractReferentCellProvider extends CellProviderWithRole {

  public static final Logger LOG = Logger.getLogger(AbstractReferentCellProvider.class);

  protected SNode myLinkDeclaration;
  protected String myGenuineRole;
  protected SNode myGenuineLinkDeclaration;

  protected boolean myIsAggregation;
  protected boolean myIsCardinality0;
  protected boolean myIsCardinality1;

  private String myErrorText = null;

  //it is important for descendants to have a unique constructor and with the same parameters as this one
  public AbstractReferentCellProvider(SNode node, EditorContext context) {
    super(node, context);
  }


  public void
  setRole(Object role) {
    myLinkDeclaration = getSNode().getLinkDeclaration(role.toString());
    if (myLinkDeclaration == null) {
      myErrorText = "?" + role.toString() + "?";
      LOG.error("can't find a link declaration '" + role.toString() + "' in " + getSNode(), getSNode());
      return;
    }

    NodeReadAccessCasterInEditor.runReadTransparentAction(new Runnable() {
      public void run() {
        myGenuineLinkDeclaration = SModelUtil.getGenuineLinkDeclaration(myLinkDeclaration);
        myGenuineRole = SModelUtil.getLinkDeclarationRole(myGenuineLinkDeclaration);
        myIsAggregation = !SNodeUtil.getLinkDeclaration_IsReference(myGenuineLinkDeclaration);
        myIsCardinality1 = SNodeUtil.getLinkDeclaration_IsAtLeastOneMultiplicity(myGenuineLinkDeclaration);
        myIsCardinality0 = !myIsCardinality1;
      }
    });
  }

  //gets an attribute for this provider's node hanging on this provider's role
  public SNode getRoleAttribute() {
    return AttributeOperations.getLinkAttribute(getSNode(), null, myGenuineRole);
  }

  // gets a kind of attributes possibly hanging on this provider's role
  public Class getRoleAttributeClass() {
    return AttributeKind.Reference.class;
  }

  public EditorCell createEditorCell(EditorContext context) {
    EditorCell result = createCell_internal(myEditorContext);
    // do not override role/link-declaration if they are already set
    if (result.getRole() == null &&
      result.getLinkDeclaration() == null) {
      result.setRole(myGenuineRole);
      if (myGenuineLinkDeclaration != null) {
        result.setLinkDeclaration(myGenuineLinkDeclaration);
      } else {
        LOG.error("Can't find link declaration " + myGenuineRole);
      }
    }
    return result;
  }

  protected EditorCell createCell_internal(EditorContext context) {
    SNode node = getSNode();
    if (myErrorText != null) {
      return createErrorCell(myErrorText, node, context);
    }
    SNode referentNode = null;
    if (myIsAggregation) {
      referentNode = node.getChild(myGenuineRole);
    } else {
      SReference reference = node.getReference(myGenuineRole);
      if (reference != null) {
        referentNode = reference.getTargetNode();
        if (referentNode == null || context.getScope().getModelDescriptor(referentNode.getModel().getSModelReference()) == null) {
          String rinfo = reference.getResolveInfo();
          myErrorText = rinfo != null ? rinfo : "?" + SModelUtil.getLinkDeclarationRole(myLinkDeclaration) + "?";
          return createErrorCell(myErrorText, node, context);
        }
      }
    }

    if (referentNode == null) {
      EditorCell_Label noRefCell = myIsCardinality1 ?
        new EditorCell_Error(context, node, myNoTargetText) :
        new EditorCell_Constant(context, node, "");
      noRefCell.setText("");
      noRefCell.setEditable(true);
      noRefCell.setDefaultText(myNoTargetText);

      noRefCell.setAction(CellActionType.DELETE, new CellAction_DeleteEasily(getSNode()));

      if (myIsAggregation) {
        noRefCell.setAction(CellActionType.INSERT, new CellAction_Insert(getSNode(), myGenuineRole));
        noRefCell.setAction(CellActionType.INSERT_BEFORE, new CellAction_Insert(getSNode(), myGenuineRole));
      }

      noRefCell.setCellId("empty_" + SModelUtil.getLinkDeclarationRole(myLinkDeclaration));
      return noRefCell;
    }

    return createRefCell(context, referentNode, node);
  }

  protected EditorCell createErrorCell(String error, SNode node, EditorContext context) {
    EditorCell_Error errorCell = new EditorCell_Error(context, node, error);
    errorCell.setAction(CellActionType.DELETE, new CellAction_DeleteNode(getSNode()));
    return errorCell;
  }

  protected abstract EditorCell createRefCell(EditorContext context, SNode referencedNode, SNode node);

  public NodeSubstituteInfo createDefaultSubstituteInfo() {
    if (myIsAggregation) return new DefaultChildSubstituteInfo(getSNode(), myLinkDeclaration, myEditorContext);
    return new DefaultReferenceSubstituteInfo(getSNode(), myLinkDeclaration, myEditorContext);
  }


  public SNode getLinkDeclaration() {
    return myLinkDeclaration;
  }

  public CellContext getCellContext() {
    if (myIsAggregation) {
      SNode parentNode = getSNode();
      SNode currentChild = parentNode.getChild(myGenuineRole);
      return new AggregationCellContext(parentNode, currentChild, myLinkDeclaration);
    }
    SNode referenceNode = getSNode();
    SNode currentReferent = referenceNode.getReferent(myGenuineRole);
    return new ReferenceCellContext(referenceNode, currentReferent, myLinkDeclaration);
  }
}
