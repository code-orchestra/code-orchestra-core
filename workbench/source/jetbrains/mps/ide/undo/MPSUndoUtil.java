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
package jetbrains.mps.ide.undo;

import com.intellij.openapi.command.undo.DocumentReference;
import com.intellij.openapi.command.undo.DocumentReferenceManager;
import com.intellij.openapi.diff.FragmentContent;
import com.intellij.openapi.editor.Document;
import com.intellij.openapi.fileEditor.FileDocumentManager;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.workbench.nodesFs.MPSNodeVirtualFile;
import jetbrains.mps.workbench.nodesFs.MPSNodesVirtualFileSystem;

public class MPSUndoUtil {
  public static Document getDoc(SNodePointer node) {
    MPSNodeVirtualFile file = MPSNodesVirtualFileSystem.getInstance().getFileFor(node);
    return getDoc(file);
  }

  public static Document getDoc(MPSNodeVirtualFile file) {
    return FileDocumentManager.getInstance().getDocument(file);
  }

  public static DocumentReference getRefForDoc(Document doc) {
    Document origin = doc.getUserData(FragmentContent.ORIGINAL_DOCUMENT);
    return DocumentReferenceManager.getInstance().create(origin == null ? doc : origin);
  }
}
