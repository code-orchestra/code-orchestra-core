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
package jetbrains.mps.ide;

import com.intellij.openapi.editor.Document;
import jetbrains.mps.ide.undo.MPSUndoUtil;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.workbench.nodesFs.MPSNodeVirtualFile;

import java.util.Collections;
import java.util.List;

public class NodeEditor extends BaseNodeEditor {
  public NodeEditor(IOperationContext context, SNode node) {
    super(context);
    getCurrentEditorComponent().editNode(node, context);
  }

  public List<SNodePointer> getAllEditedNodes() {
    SNodePointer editedNodePointer = getCurrentlyEditedNode();
    if (editedNodePointer == null) {
      return Collections.emptyList();
    }
    return Collections.singletonList(editedNodePointer);
  }

  @Override
  public List<Document> getAllEditedDocuments() {
    final MPSNodeVirtualFile virtualFile = getCurrentEditorComponent().getVirtualFile();
    return virtualFile != null ? Collections.singletonList(MPSUndoUtil.getDoc(virtualFile)) : Collections.<Document>emptyList();
  }

  public void showNode(SNode node, boolean select) {
    getCurrentEditorComponent().selectNode(node);
  }
}
