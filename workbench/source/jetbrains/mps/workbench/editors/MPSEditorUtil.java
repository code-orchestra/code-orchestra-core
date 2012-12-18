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
package jetbrains.mps.workbench.editors;

import com.intellij.openapi.fileEditor.FileEditor;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.ide.editorTabs.TabbedEditor;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.nodeEditor.NodeEditorComponent;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.nodesFs.MPSNodeVirtualFile;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/**
 * @author Evgeny Gerashchenko
 * @since 22 March 2011
 */
public class MPSEditorUtil {
  @Nullable
  public static SNode getCurrentEditedNode(@NotNull Project project, @NotNull MPSNodeVirtualFile file) {
    FileEditor[] editors = FileEditorManager.getInstance(project).getEditors(file);
    if (editors.length <= 0) return null;

    FileEditor editor = editors[0];
    if (!(editor instanceof MPSFileNodeEditor)) return null;

    IEditor nodeEditor = ((MPSFileNodeEditor) editor).getNodeEditor();
    if (!(nodeEditor instanceof TabbedEditor)) return null;

    TabbedEditor tabbedEditor = (TabbedEditor) nodeEditor;
    EditorComponent tabEditor = tabbedEditor.getCurrentEditorComponent();
    if (!(tabEditor instanceof NodeEditorComponent)) return null;

    return tabEditor.getEditedNode();
  }
}
