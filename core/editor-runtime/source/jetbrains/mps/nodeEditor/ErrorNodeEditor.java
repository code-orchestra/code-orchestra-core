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

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.nodeEditor.cells.EditorCell;
import jetbrains.mps.nodeEditor.cells.EditorCell_Error;
import jetbrains.mps.nodeEditor.cells.EditorCell_Constant;
import jetbrains.mps.nodeEditor.cells.EditorCell_Collection;
import org.jetbrains.annotations.NotNull;

public class ErrorNodeEditor implements INodeEditor {

  public EditorCell createEditorCell(EditorContext editorContext, SNode node) {
    return new EditorCell_Error(editorContext, node, node.getPresentation());
  }

  public EditorCell createInspectedCell(EditorContext editorContext, SNode node) {
    EditorCell_Collection collection = EditorCell_Collection.createVertical(editorContext, node);
    collection.addEditorCell(new EditorCell_Error(editorContext, node, "Can't find an editor."));
    collection.addEditorCell(new EditorCell_Error(editorContext, node, "Concept = " + node.getConceptFqName()));    
    return collection;

  }

  public static class DefaultInspectorCell extends EditorCell_Constant {
    public DefaultInspectorCell(@NotNull EditorContext editorContext, SNode node, String text, boolean editable) {
      super(editorContext, node, text, editable);
    }
  }
}
