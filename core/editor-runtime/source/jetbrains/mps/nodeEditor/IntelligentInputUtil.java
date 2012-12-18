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
import codeOrchestra.editor.InputTooltipDisplay;
import jetbrains.mps.nodeEditor.EditorManager.EditorCell_STHint;
import jetbrains.mps.nodeEditor.cellMenu.AbstractNodeSubstituteInfo;
import jetbrains.mps.nodeEditor.cellMenu.NodeSubstituteInfo;
import jetbrains.mps.nodeEditor.cellMenu.NullSubstituteInfo;
import jetbrains.mps.nodeEditor.cells.*;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.action.INodeSubstituteAction;
import jetbrains.mps.smodel.action.SideTransformHintSubstituteActionsHelper;
import jetbrains.mps.typesystem.inference.TypeContextManager;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.util.List;

public class IntelligentInputUtil {

  public static boolean processCell(final EditorCell_Label cell, final EditorContext editorContext, final String pattern, final CellSide side) {
    if (pattern == null || pattern.equals("")) {
      return false;
    }

    return editorContext.executeCommand(new Computable<Boolean>() {
      public Boolean compute() {
        if (cell instanceof EditorCell_STHint) {
          EditorCell_STHint rtHintCell = (EditorCell_STHint) cell;
          return processSTHintCell(rtHintCell, editorContext, pattern);
        }

        if (side == CellSide.LEFT) {
          String head = "" + pattern.charAt(0);
          String smallPattern = pattern.substring(1);
          return processCellAtStart(cell, editorContext, head, smallPattern);
        } else {
          String smallPattern = pattern.substring(0, pattern.length() - 1);
          String tail = pattern.substring(pattern.length() - 1, pattern.length());
          return processCellAtEnd(cell, editorContext, smallPattern, tail);
        }
      }
    });
  }

  private static boolean processSTHintCell(EditorCell_STHint cell, EditorContext editorContext, String pattern) {
    NodeSubstituteInfo info = cell.getSubstituteInfo();
    String smallPattern = pattern.substring(0, pattern.length() - 1);
    String tail = "" + pattern.charAt(pattern.length() - 1);
    EditorCell nextCell = cell.getNextLeaf();
    while (nextCell != null && !nextCell.isSelectable()) {
      nextCell = nextCell.getNextLeaf();
    }

    if (canCompleteSmallPatternImmediately(info, pattern, "") ||
      canCompleteSmallPatternImmediately(info, trimLeft(pattern), "")) {

      if (!canCompleteSmallPatternImmediately(info, pattern, "")) {
        pattern = trimLeft(pattern);
      }

      info.getMatchingActions(pattern, true).get(0).substitute(editorContext, pattern);
    } else if (pattern.length() > 0 && (canCompleteSmallPatternImmediately(info, smallPattern, tail) ||
      canCompleteSmallPatternImmediately(info, trimLeft(smallPattern), tail))) {

      if (!canCompleteSmallPatternImmediately(info, smallPattern, tail)) {
        smallPattern = trimLeft(smallPattern);
      }

      List<INodeSubstituteAction> matchingActions = info.getMatchingActions(smallPattern, true);
      INodeSubstituteAction item = matchingActions.get(0);
      SNode newNode = item.substitute(editorContext, smallPattern);
      editorContext.flushEvents();
      EditorCell cellForNewNode = editorContext.getNodeEditorComponent().findNodeCell(newNode);
      if (cellForNewNode != null) {
        EditorCell_Label target = null;
        EditorCell errorOrEditable = cellForNewNode.findChild(CellFinders.or(CellFinders.FIRST_ERROR, CellFinders.LAST_EDITABLE), true);
        if (errorOrEditable instanceof EditorCell_Label) {
          target = (EditorCell_Label) errorOrEditable;
        }

        if (target != null) {
          target.changeText(tail, null);
          target.end();

          if (target.isErrorState()) {
            target.validate(true, false);
          }

          editorContext.flushEvents();

          if (editorContext.getSelectedCell() instanceof EditorCell_Label) {
            EditorCell_Label label = (EditorCell_Label) editorContext.getSelectedCell();
            label.end();
          }
        }
      }
    } else if (info.getMatchingActions(pattern, false).isEmpty() &&
      info.getMatchingActions(trimLeft(pattern), false).isEmpty() &&
      nextCell != null && nextCell.isErrorState() && nextCell instanceof EditorCell_Label && ((EditorCell_Label) nextCell).isEditable()) {

      SNodeEditorUtil.removeRightTransformHint(cell.getSNode());

      EditorCell_Label label = (EditorCell_Label) nextCell;
      label.changeText(pattern, null);
      label.end();
      editorContext.getNodeEditorComponent().changeSelection(label);      
    } else {
      if (isInOneStepAmbigousPosition(info, smallPattern + tail)) {
        editorContext.getNodeEditorComponent().activateNodeSubstituteChooser(cell, info, false);
      }
    }
    return true;
  }

  @CodeOrchestraPatch
  private static boolean processCellAtEnd(EditorCell_Label cell, final EditorContext editorContext, String smallPattern, final String tail) {
    NodeSubstituteInfo substituteInfo = cell.getSubstituteInfo();
    if (substituteInfo == null) {
      substituteInfo = new NullSubstituteInfo();
    }

    EditorCell cellForNewNode;
    final SNode newNode;
    if (cell.isValidText(smallPattern) && !"".equals(smallPattern)
      && substituteInfo.hasExactlyNActions(smallPattern + tail, false, 0)) {
      newNode = cell.getSNode();
      cellForNewNode = cell;
      return applyRigthTransform(editorContext, smallPattern, tail, cellForNewNode, newNode);
    } else if (canCompleteSmallPatternImmediately(substituteInfo, smallPattern, tail) ||
      canCompleteSmallPatternImmediately(substituteInfo, trimLeft(smallPattern), tail)) {

      if (!canCompleteSmallPatternImmediately(substituteInfo, smallPattern, tail) &&
        canCompleteSmallPatternImmediately(substituteInfo, trimLeft(smallPattern), tail)) {
        smallPattern = trimLeft(smallPattern);
      }

      List<INodeSubstituteAction> matchingActions = substituteInfo.getMatchingActions(smallPattern, true);
      INodeSubstituteAction item = matchingActions.get(0);
      item.substitute(editorContext, smallPattern);

      // RF-1011
      EditorCell selectedCell = editorContext.getSelectedCell();
      if (selectedCell == null) {
        return true;
      }

      newNode = selectedCell.getSNode();

      if (newNode == null) return true;

      cellForNewNode = editorContext.getNodeEditorComponent().findNodeCell(newNode);
      EditorCell errorCell = cellForNewNode.findChild(CellFinders.FIRST_ERROR, true);

      if (errorCell != null && errorCell instanceof EditorCell_Label) {
        editorContext.flushEvents();
        EditorCell cellForNewNode1 = editorContext.getNodeEditorComponent().findNodeCell(newNode);
        EditorCell_Label errorCell1 = (EditorCell_Label) cellForNewNode1.findChild(CellFinders.FIRST_ERROR, true);
        ((EditorCell_Label) errorCell1).changeText(tail, null);
        errorCell1.setCaretPosition(tail.length());
        return true;
      }

      return applyRigthTransform(editorContext, smallPattern, tail, cellForNewNode, newNode);
    } else if (canCompleteTheWholeStringImmediately(substituteInfo, smallPattern + tail) ||
      canCompleteTheWholeStringImmediately(substituteInfo, trimLeft(smallPattern) + tail)) {

      if (!canCompleteTheWholeStringImmediately(substituteInfo, smallPattern + tail) &&
        canCompleteTheWholeStringImmediately(substituteInfo, trimLeft(smallPattern) + tail)) {
        smallPattern = trimLeft(smallPattern);
      }

      List<INodeSubstituteAction> matchingActions = substituteInfo.getMatchingActions(smallPattern + tail, true);
      INodeSubstituteAction item = matchingActions.get(0);
      item.substitute(editorContext, smallPattern + tail);
      return true;
    } else {
      if (isInOneStepAmbigousPosition(substituteInfo, smallPattern + tail)) {
        if (tryToSubstituteFirstSutable(editorContext, smallPattern + tail, substituteInfo)) {
          return true;
        }
        editorContext.getNodeEditorComponent().activateNodeSubstituteChooser(cell, substituteInfo, false);
      } else if (isInAmbigousPosition(substituteInfo, smallPattern, tail)) {
        if (tryToSubstituteFirstSutable(editorContext, smallPattern, substituteInfo)) {
          return true;
        }
        cell.setText(smallPattern);
        editorContext.getNodeEditorComponent().activateNodeSubstituteChooser(cell, substituteInfo, false);
      }
      return true;
    }
  }

  private static boolean applyRigthTransform(EditorContext editorContext, String smallPattern, final String tail, final EditorCell cellForNewNode, SNode newNode) {
    EditorCellAction rtAction = cellForNewNode.findChild(CellFinders.LAST_SELECTABLE_LEAF, true).getApplicableCellAction(CellActionType.RIGHT_TRANSFORM);

    boolean hasSideActions = TypeContextManager.getInstance().runResolveAction(new Computable<Boolean>() {
      @Override
      public Boolean compute() {
        return hasSideActions(cellForNewNode, CellSide.RIGHT, tail);
      }
    });

    if (rtAction == null || !hasSideActions) {
      final CellInfo cellInfo = cellForNewNode.getCellInfo();
      putTextInErrorChild(cellInfo, smallPattern + tail, editorContext);
      return false;
    }

    if (cellForNewNode instanceof EditorCell_Label) {      
      ((EditorCell_Label)cellForNewNode).changeText(smallPattern, null);
    }

    rtAction.execute(editorContext);

    EditorCell newCellForNewNode = editorContext.getNodeEditorComponent().findNodeCell(newNode);
    EditorCell rtHintCell = prepareSTCell(editorContext, newCellForNewNode, tail);

    if (rtHintCell != null) {
      final NodeSubstituteInfo rtSubstituteInfo = rtHintCell.getSubstituteInfo();
      assert rtSubstituteInfo != null;
      List<INodeSubstituteAction> rtMatchingActions =
        TypeContextManager.getInstance().runResolveAction(new Computable<List<INodeSubstituteAction>>(){
          @Override
          public List<INodeSubstituteAction> compute() {
            return rtSubstituteInfo.getMatchingActions(tail, true);
          }
        });

      if (!canCompleteSmallPatternImmediately(rtSubstituteInfo, tail, "")) { //don't execute non-unique action on RT hint cell
        editorContext.flushEvents();

        EditorCell_Label foundCell = prepareRTCell(editorContext, newNode, tail);
        if (foundCell != null) {
          editorContext.getNodeEditorComponent().changeSelection(foundCell);
          processCell(foundCell, editorContext, tail, CellSide.RIGHT);
        }
        return true;
      }

      INodeSubstituteAction rtItem = rtMatchingActions.get(0);
      final SNode yetNewNode = rtItem.substitute(editorContext, smallPattern);

      editorContext.flushEvents();

      if (yetNewNode != null) {
        EditorComponent editor = editorContext.getNodeEditorComponent();
        EditorCell yetNewNodeCell = editor.findNodeCell(yetNewNode);
        assert yetNewNodeCell != null : "Unable to find editor cell for the node " + yetNewNode.toString() + ", created by RT: " + rtItem.toString();
        EditorCell errorCell = yetNewNodeCell.findChild(CellFinders.FIRST_ERROR, true);
        if (errorCell != null) {
          editor.changeSelectionWRTFocusPolicy(errorCell);
        } else {
          editor.changeSelectionWRTFocusPolicy(yetNewNodeCell);
        }
      }
    } else {
      editorContext.flushEvents();
      EditorCell_Label rtCell = prepareRTCell(editorContext, newNode, tail);
      if (rtCell != null) {
        processCell(rtCell, editorContext, tail, CellSide.RIGHT);
      }
    }
    return true;
  }

  private static boolean tryToSubstituteFirstSutable(EditorContext editorContext, String text, NodeSubstituteInfo substituteInfo) {
    SNode concept = substituteInfo.getMatchingActions(text, true).get(0).getOutputConcept();
    if (concept == null) {
      return false;
    }
    String property = concept.getConceptProperty("substituteInAmbigousPosition");
    if ("true".equals(property)) {
      SNode outputConcept = substituteInfo.getMatchingActions(text, true).get(0).getOutputConcept();
      for (INodeSubstituteAction action: substituteInfo.getMatchingActions(text, true)) {
        if (outputConcept != action.getOutputConcept()) {
          return false;
        }
      }
      INodeSubstituteAction action = substituteInfo.getMatchingActions(text, true).get(0);
      action.substitute(editorContext, text);
      return true;
    }
    return false;
  }

  private static boolean processCellAtStart(EditorCell_Label cell, final EditorContext editorContext, String head, String smallPattern) {
    NodeSubstituteInfo info = cell.getSubstituteInfo();
    if (info == null) {
      info = new NullSubstituteInfo();
    }
    EditorCell cellForNewNode;
    SNode newNode;

    if (cell.isValidText(smallPattern) && !"".equals(smallPattern)
      && info.hasExactlyNActions(head + smallPattern, false, 0)) {
      newNode = cell.getSNode();
      cellForNewNode = cell;
      return applyLeftTransform(editorContext, head, smallPattern, cellForNewNode, newNode, true);
    } else if (canCompleteSmallPatternImmediatelyLeft(info, head, smallPattern) &&
      !canCompleteTheWholeStringImmediately(info, head + smallPattern)) {
      newNode = info.getMatchingActions(smallPattern, true).get(0).substitute(editorContext, smallPattern);
      if (newNode == null) return true;

      cellForNewNode = editorContext.getNodeEditorComponent().findNodeCell(newNode);
      return applyLeftTransform(editorContext, head, smallPattern, cellForNewNode, newNode, false);
    } else if (canCompleteTheWholeStringImmediately(info, head + smallPattern)) {

      List<INodeSubstituteAction> matchingActions = info.getMatchingActions(head + smallPattern, true);
      INodeSubstituteAction item = matchingActions.get(0);
      item.substitute(editorContext, head + smallPattern);
      return true;
    } else {
      return true;
    }

  }

  private static boolean applyLeftTransform(EditorContext editorContext, final String head, String smallPattern, final EditorCell cellForNewNode, SNode newNode, boolean sourceCellRemains) {
    EditorCellAction ltAction = cellForNewNode.findChild(CellFinders.FIRST_SELECTABLE_LEAF, true).getApplicableCellAction(CellActionType.LEFT_TRANSFORM);
    boolean hasSideActions = TypeContextManager.getInstance().runResolveAction(new Computable<Boolean>() {
      @Override
      public Boolean compute() {
        return hasSideActions(cellForNewNode, CellSide.LEFT, head);
      }
    });

    if (ltAction == null || !hasSideActions) {
      CellInfo cellInfo = cellForNewNode.getCellInfo();
      if (!sourceCellRemains) {
        putTextInErrorChild(cellInfo, head + smallPattern, editorContext);
        return true;
      } else {
        return false;
      }
    }

    if (sourceCellRemains) {
      ((EditorCell_Label) cellForNewNode).changeText(smallPattern, null);
    }

    ltAction.execute(editorContext);

    EditorCell newCellForNewNode = editorContext.getNodeEditorComponent().findNodeCell(newNode);
    prepareSTCell(editorContext, newCellForNewNode, head);
    return true;
  }

  public static String trimLeft(String text) {
    for (int i = 0; i < text.length(); i++) {
      if (!Character.isWhitespace(text.charAt(i))) {
        return text.substring(i);
      }
    }
    return "";
  }

  private static boolean canCompleteSmallPatternImmediatelyLeft(NodeSubstituteInfo info, String head, String smallPattern) {
    return info.hasExactlyNActions(smallPattern, true, 1) && info.hasExactlyNActions(head + smallPattern, false, 0);
  }

  private static boolean canCompleteSmallPatternImmediately(NodeSubstituteInfo info, String smallPattern, String tail) {
    if ("".equals(tail)) {
      return info.hasExactlyNActions(smallPattern, true, 1) && info.hasExactlyNActions(smallPattern, false, 1);
    }

    // * has special meaning in completion patterns but we often want to complete multiplication
    // operations
    return info.hasExactlyNActions(smallPattern, true, 1) && (tail.equals("*") || info.hasExactlyNActions(smallPattern + tail, false, 0));
  }

  private static boolean canCompleteTheWholeStringImmediately(NodeSubstituteInfo info, String pattern) {
    return info.hasExactlyNActions(pattern, true, 1) && info.hasExactlyNActions(pattern, false, 1);
  }

  private static boolean isInAmbigousPosition(NodeSubstituteInfo info, String smallPattern, String tail) {
    return info.getMatchingActions(smallPattern, true).size() > 1 && info.getMatchingActions(smallPattern + tail, false).isEmpty();
  }

  private static boolean isInOneStepAmbigousPosition(NodeSubstituteInfo info, String smallPattern) {
    return info.getMatchingActions(smallPattern, true).size() > 1 && info.getMatchingActions(smallPattern, true).size() == info.getMatchingActions(smallPattern, false).size();
  }

  @CodeOrchestraPatch
  private static EditorCell_Label prepareSTCell(EditorContext context, EditorCell root, String textToSet) {
    EditorComponent nodeEditorComponent = context.getNodeEditorComponent();
    EditorCell_Label rtCell = root.getSTHintCell();
    String oldText = rtCell.getText();
    if (rtCell == null) {
      EditorCell selectedCell = nodeEditorComponent.getSelectedCell();
      if (selectedCell != null && selectedCell instanceof EditorCell_Label && selectedCell.isErrorState()) {
        rtCell = (EditorCell_Label) selectedCell;
      } else {
        return null;
      }
    }
    rtCell.changeText(textToSet, null);
    rtCell.end();

    // RE-3295
    InputTooltipDisplay.getInstance().tryDisplayMultipleChoiceHint(rtCell, oldText, textToSet, null);

    return rtCell;
  }

  private static EditorCell_Label prepareRTCell(EditorContext context, SNode node, String textToSet) {
    EditorCell root = context.getNodeEditorComponent().findNodeCell(node);
    if (root == null) {
      return null;
    }
    return prepareSTCell(context, root, textToSet);
  }

  private static void putTextInErrorChild(CellInfo cellInfo, String textToSet, EditorContext editorContext) {
    editorContext.flushEvents();
    EditorComponent component = editorContext.getNodeEditorComponent();
    EditorCell cellToSelect = cellInfo.findCell(component);
    if (cellToSelect != null) {
      EditorCell errorCell = cellToSelect.findChild(CellFinders.FIRST_ERROR, true);
      if (errorCell instanceof EditorCell_Label) {
        EditorCell_Label label = (EditorCell_Label) errorCell;
        if (label.isEditable() && !(label instanceof EditorCell_Constant)) {
          label.changeText(textToSet, null);
        }
        label.end();
      }
    }
  }

  private static boolean hasSideActions(EditorCell cell, CellSide side, String prefix) {
    final SideTransformHintSubstituteActionsHelper helper = new SideTransformHintSubstituteActionsHelper(cell.getSNode(), side, cell.getRightTransformAnchorTag(), cell.getEditorContext().getOperationContext());
    NodeSubstituteInfo info = new AbstractNodeSubstituteInfo(cell.getEditorContext()) {
      protected List<INodeSubstituteAction> createActions() {
        return helper.createActions();
      }
    };
    return !info.hasExactlyNActions(prefix, false, 0);
  }
}
