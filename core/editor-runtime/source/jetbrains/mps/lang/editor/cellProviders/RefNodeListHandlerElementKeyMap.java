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

import codeOrchestra.actionscript.view.utils.NodeUtils;
import jetbrains.mps.nodeEditor.EditorCellKeyMap;
import jetbrains.mps.nodeEditor.EditorCellKeyMapAction;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.nodeEditor.cellProviders.AbstractCellListHandler;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

import java.awt.event.KeyEvent;

public class RefNodeListHandlerElementKeyMap extends EditorCellKeyMap {
  private AbstractCellListHandler myListHandler;

  @CodeOrchestraPatch
  public RefNodeListHandlerElementKeyMap(AbstractCellListHandler listHandler, String elementSeparator) {
    myListHandler = listHandler;
    if (elementSeparator != null && elementSeparator.length() == 1) {
      EditorCellKeyMapAction insertAction = new EditorCellKeyMapAction() {
        public String getDescriptionText() {
          return "insert " + myListHandler.getElementRole();
        }

        public void execute(KeyEvent keyEvent, EditorContext context) {
          SNode anchorNode = getAnchorNode(context);

          // RE-4606
          SNode ownerNode = myListHandler.getOwner();
          if (NodeUtils.isCallWithActualArguments(ownerNode)) {
            NodeUtils.catchInsertByCommaLeft(ownerNode, anchorNode, context);
            return;
          }

          SNode nodeToInsert = myListHandler.createNodeToInsert(context);
          ownerNode.insertChild(anchorNode, myListHandler.getElementRole(), nodeToInsert, true);
        }
      };
      insertAction.setCaretPolicy(EditorCellKeyMapAction.CARET_AT_FIRST_POSITION);

      EditorCellKeyMapAction addAction = new EditorCellKeyMapAction() {
        public String getDescriptionText() {
          return "add " + myListHandler.getElementRole();
        }

        public void execute(KeyEvent keyEvent, EditorContext context) {
          SNode anchorNode = getAnchorNode(context);

          // RE-4606
          SNode ownerNode = myListHandler.getOwner();
          if (NodeUtils.isCallWithActualArguments(ownerNode)) {
            NodeUtils.catchInsertByCommaRight(ownerNode, anchorNode, context);
            return;
          }

          SNode nodeToInsert = myListHandler.createNodeToInsert(context);
          ownerNode.insertChild(anchorNode, myListHandler.getElementRole(), nodeToInsert, false);
        }
      };
      addAction.setCaretPolicy(EditorCellKeyMapAction.CARET_AT_LAST_POSITION);

      // populate the key map
      if (!" ".equals(elementSeparator)) { //we do not want separator triggered inserts to interfere with RT.
        putAction(EditorCellKeyMap.KEY_MODIFIERS_ANY, elementSeparator, insertAction);
        putAction(EditorCellKeyMap.KEY_MODIFIERS_ANY, elementSeparator, addAction);
      }
    }
  }

  private SNode getAnchorNode(EditorContext context) {
    SNode owner = myListHandler.getOwner();
    SNode anchorNode = context.getContextCell().getSNode();
    assert anchorNode != null;
    while (anchorNode.getParent() != owner) {
      anchorNode = anchorNode.getParent();
      assert anchorNode != null;
    }
    return anchorNode;
  }
}
