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

import jetbrains.mps.editor.runtime.impl.CellUtil;
import jetbrains.mps.nodeEditor.AbstractCellProvider;
import jetbrains.mps.nodeEditor.CellActionType;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.InlineCellProvider;
import jetbrains.mps.nodeEditor.cellActions.CellAction_DeleteNode;
import jetbrains.mps.nodeEditor.cellActions.CellAction_DeleteOnErrorReference;
import jetbrains.mps.nodeEditor.cellActions.CellAction_DeleteReference;
import jetbrains.mps.nodeEditor.cellActions.CellAction_Empty;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Basic;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import jetbrains.mps.nodeEditor.cells.EditorCell_Error;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.presentation.ReferenceConceptUtil;

import java.util.Iterator;

public class RefCellCellProvider extends AbstractReferentCellProvider {

  //it is important for descendants to have a unique constructor and with the same parameters as this one
  public RefCellCellProvider(SNode node, EditorContext context) {
    super(node, context);
  }

  public EditorCell createEditorCell(EditorContext context) {
    EditorCell result = super.createEditorCell(context);
    result.setRefNode(getSNode());
    return result;
  }

  protected EditorCell createRefCell(EditorContext context, final SNode effectiveNode, SNode node) {
    AbstractCellProvider inlineComponent = myAuxiliaryCellProvider;
    myAuxiliaryCellProvider.setSNode(effectiveNode);
    if (inlineComponent instanceof InlineCellProvider) {
      InlineCellProvider inlineComponentProvider = (InlineCellProvider) inlineComponent;
      inlineComponentProvider.setRefNode(node);
      inlineComponentProvider.setLinkDeclaration(myGenuineLinkDeclaration);
    }
    EditorCell editorCell;
    if (myIsAggregation) {
      editorCell = inlineComponent.createEditorCell(context);
    } else {
      editorCell = context.createReferentCell(inlineComponent, getSNode(), effectiveNode, myGenuineRole);
      CellUtil.setupIDeprecatableStyles(effectiveNode, editorCell);
    }
    setSemanticNodeToCells(editorCell, node);

    if (myIsCardinality1) {
      if (ReferenceConceptUtil.getCharacteristicReference(node.getConceptDeclarationNode()) != null) {
        editorCell.setAction(CellActionType.DELETE, new CellAction_DeleteNode(node));
      } else {
        editorCell.setAction(CellActionType.DELETE, new CellAction_Empty());
      }
    } else {
      if (myIsAggregation) {
        editorCell.setAction(CellActionType.DELETE, new CellAction_DeleteNode(node));
      } else {
        editorCell.setAction(CellActionType.DELETE, new CellAction_DeleteReference(node, myGenuineRole));
      }
    }
    return editorCell;
  }

  private void setSemanticNodeToCells(EditorCell rootCell, SNode semanticNode) {
    if (!(rootCell instanceof EditorCell_Basic) || semanticNode == null) {
      return;
    }
    ((EditorCell_Basic) rootCell).setSNode(semanticNode);
    if (rootCell instanceof EditorCell_Collection) {
      Iterator<EditorCell> children = ((EditorCell_Collection) rootCell).cells();
      while (children.hasNext()) {
        setSemanticNodeToCells(children.next(), semanticNode);
      }
    }
  }

  protected EditorCell createErrorCell(String error, SNode node, EditorContext context) {
    EditorCell_Error errorCell = new EditorCell_Error(context, node, error, true);
    errorCell.setAction(CellActionType.DELETE, new CellAction_DeleteOnErrorReference(node, myGenuineRole));
    return errorCell;
  }
}
