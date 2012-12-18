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
import com.intellij.openapi.fileEditor.FileEditorStateLevel;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.EditorContext;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import org.jetbrains.annotations.NotNull;

import javax.swing.JComponent;
import java.util.List;

public interface IEditor{
  JComponent getComponent();

  EditorComponent getCurrentEditorComponent();

  SNodePointer getCurrentlyEditedNode();

  //  looks like getAllEditedDocuments() is sufficient
  @Deprecated
  List<SNodePointer> getAllEditedNodes();

  List<Document> getAllEditedDocuments();

  EditorContext getEditorContext();

  IOperationContext getOperationContext();

  void showNode(SNode node, boolean select);

  void dispose();

  //---state

  MPSEditorState saveState(@NotNull FileEditorStateLevel level);

  void loadState(@NotNull MPSEditorState state);
}
