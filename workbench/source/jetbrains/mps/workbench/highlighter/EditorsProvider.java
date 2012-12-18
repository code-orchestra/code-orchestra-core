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
package jetbrains.mps.workbench.highlighter;

import com.intellij.openapi.fileEditor.FileEditor;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.fileEditor.FileEditorManagerAdapter;
import com.intellij.openapi.fileEditor.FileEditorManagerListener;
import com.intellij.openapi.fileEditor.FileEditorManagerListener.Before;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.vfs.VirtualFile;
import com.intellij.util.messages.MessageBusConnection;
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.editors.MPSFileNodeEditor;

import java.util.ArrayList;
import java.util.List;

public class EditorsProvider {
  private List<EditorOpenListener> myEditorOpenListeners = new ArrayList<EditorOpenListener>();
  private MessageBusConnection myMessageBusConnection;

  public EditorsProvider(Project project) {
    myMessageBusConnection = project.getMessageBus().connect();
    myMessageBusConnection.subscribe(FileEditorManagerListener.FILE_EDITOR_MANAGER, new FileEditorManagerAdapter() {
      public void fileOpened(FileEditorManager source, VirtualFile file) {
        FileEditor selectedEditor = source.getSelectedEditor(file);
        if (selectedEditor instanceof MPSFileNodeEditor) {
          MPSFileNodeEditor editor = (MPSFileNodeEditor) selectedEditor;
          fireEditorOpened(editor);
        }
      }
    });

    myMessageBusConnection.subscribe(FileEditorManagerListener.Before.FILE_EDITOR_MANAGER, new Before() {
      public void beforeFileOpened(FileEditorManager source, VirtualFile file) {

      }

      public void beforeFileClosed(FileEditorManager source, VirtualFile file) {
        FileEditor selectedEditor = source.getSelectedEditor(file);
        if (selectedEditor instanceof MPSFileNodeEditor) {
          MPSFileNodeEditor editor = (MPSFileNodeEditor) selectedEditor;
          fireEditorClosed(editor);
        }
      }
    });
  }

  public void dispose() {
    myMessageBusConnection.disconnect();
  }

  //todo add synchronization if necessary
  public void addEditorOpenListener(EditorOpenListener listener) {
    myEditorOpenListeners.add(listener);
  }

  //todo add synchronization if necessary
  public void removeEditorOpenListener(EditorOpenListener listener) {
    myEditorOpenListeners.remove(listener);
  }

  //todo add synchronization if necessary
  @CodeOrchestraPatch
  public void fireEditorOpened(MPSFileNodeEditor editor) {
    for (EditorOpenListener listener : myEditorOpenListeners) {
      listener.editorOpened(editor);
    }
  }

  //todo add synchronization if necessary
  @CodeOrchestraPatch
  public void fireEditorClosed(MPSFileNodeEditor editor) {
    for (EditorOpenListener listener : myEditorOpenListeners) {
      listener.editorClosed(editor);
    }
  }

}
