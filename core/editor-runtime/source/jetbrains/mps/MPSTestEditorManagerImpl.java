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
package jetbrains.mps;

import com.intellij.openapi.diagnostic.Logger;
import com.intellij.openapi.editor.ex.EditorEx;
import com.intellij.openapi.fileEditor.FileEditor;
import com.intellij.openapi.fileEditor.FileEditorProvider;
import com.intellij.openapi.fileEditor.FileEditorState;
import com.intellij.openapi.fileEditor.TextEditor;
import com.intellij.openapi.fileEditor.ex.FileEditorProviderManager;
import com.intellij.openapi.fileEditor.ex.IdeDocumentHistory;
import com.intellij.openapi.fileEditor.impl.EditorHistoryManager;
import com.intellij.openapi.fileEditor.impl.EditorWithProviderComposite;
import com.intellij.openapi.fileEditor.impl.IdeDocumentHistoryImpl;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.testFramework.TestEditorManagerImpl;
import com.intellij.util.containers.HashMap;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.Map;

@NonNls
public class MPSTestEditorManagerImpl extends TestEditorManagerImpl {
  private static final Logger LOG = Logger.getInstance("#com.intellij.idea.test.TestEditorManagerImpl");

  private Map<VirtualFile, FileEditor[]> myVirtualFile2FileEditor = new HashMap<VirtualFile, FileEditor[]>();

  public MPSTestEditorManagerImpl(Project project) {
    super(project);
  }

  @NotNull
  public void closeFile(@NotNull VirtualFile file) {
    super.closeFile(file);
    if (myVirtualFile2FileEditor.containsKey(file)) {
      for (FileEditor fileEditor : myVirtualFile2FileEditor.get(file)) {
        fileEditor.dispose();
      }
      myVirtualFile2FileEditor.remove(file);
    }
  }

  @NotNull
  public FileEditor[] getAllEditors() {
    return new FileEditor[0];
  }

  @NotNull
  public FileEditor[] openFile(@NotNull final VirtualFile file, final boolean focusEditor) {
    // Open file
    FileEditor[] editors;
    FileEditorProvider[] providers;
    final EditorWithProviderComposite newSelectedComposite;
    boolean newEditorCreated = false;

    // File is not opened yet. In this case we have to create editors
    // and select the created EditorComposite.
    final FileEditorProviderManager editorProviderManager = FileEditorProviderManager.getInstance();
    providers = editorProviderManager.getProviders(getProject(), file);

    newEditorCreated = true;

    editors = new FileEditor[providers.length];
    for (int i = 0; i < providers.length; i++) {
      try {
        final FileEditorProvider provider = providers[i];
        LOG.assertTrue(provider != null);
        LOG.assertTrue(provider.accept(getProject(), file));
        final FileEditor editor = provider.createEditor(getProject(), file);
        editors[i] = editor;
        LOG.assertTrue(editor != null);
        LOG.assertTrue(editor.isValid());
      }
      catch (Exception e) {
        LOG.error(e);
      }
      catch (AssertionError e) {
        LOG.error(e);
      }
    }


    final EditorHistoryManager editorHistoryManager = EditorHistoryManager.getInstance(getProject());
    for (int i = 0; i < editors.length; i++) {
      final FileEditor editor = editors[i];
      if (editor instanceof TextEditor) {
        // hack!!!
        // This code prevents "jumping" on next repaint.
        ((EditorEx) ((TextEditor) editor).getEditor()).stopOptimizedScrolling();
      }

      final FileEditorProvider provider = providers[i];//getProvider(editor);

      // Restore editor state
      FileEditorState state = null;

      if (state == null) {
        // We have to try to get state from the history only in case
        // if editor is not opened. Otherwise history enty might have a state
        // out of sync with the current editor state.
        state = editorHistoryManager.getState(file, provider);
      }
      if (state != null) {
        editor.setState(state);
      }
    }

    //[jeka] this is a hack to support back-forward navigation
    // previously here was incorrect call to fireSelectionChanged() with a side-effect
    ((IdeDocumentHistoryImpl) IdeDocumentHistory.getInstance(getProject())).onSelectionChanged();

    // Make back/forward work
    IdeDocumentHistory.getInstance(getProject()).includeCurrentCommandAsNavigation();

    myVirtualFile2FileEditor.put(file, editors);

    return editors;
  }
}
