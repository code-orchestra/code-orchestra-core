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
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.workbench.editors.MPSFileNodeEditor;

import java.util.ArrayList;
import java.util.List;

public class EditorsHelper {
  public static Logger LOG = Logger.getLogger(EditorsHelper.class);

  public static List<MPSFileNodeEditor> getAllEditors(FileEditorManager manager) {
    return filterMPSEditors(manager.getAllEditors());
  }

  public static List<IEditor> getSelectedEditors(FileEditorManager manager) {
    return toMPSEditors(filterMPSEditors(manager.getSelectedEditors()));
  }

  public static List<MPSFileNodeEditor> filterMPSEditors(FileEditor[] selectedEditors) {
    List<MPSFileNodeEditor> editors = new ArrayList<MPSFileNodeEditor>();
    for (FileEditor fileEditor : selectedEditors) {
      if (fileEditor instanceof MPSFileNodeEditor) {
        MPSFileNodeEditor mpsFileNodeEditor = (MPSFileNodeEditor) fileEditor;
        IEditor nodeEditor = mpsFileNodeEditor.getNodeEditor();
        if (nodeEditor != null) {
          editors.add(mpsFileNodeEditor);
        }
      }
    }
    return editors;
  }

  public static List<IEditor> toMPSEditors(List<MPSFileNodeEditor> nodeEditors) {
    List<MPSFileNodeEditor> emptyEditors = new ArrayList<MPSFileNodeEditor>(0);
    List<IEditor> result = new ArrayList<IEditor>();
    for (MPSFileNodeEditor e : nodeEditors) {
      IEditor editor = e.getNodeEditor();
      if (editor != null) {
        result.add(editor);
      } else {
        emptyEditors.add(e);
      }
    }
    for (MPSFileNodeEditor emptyEditor : emptyEditors) {
      LOG.error("MPSFileNodeEditor has null editor : " + emptyEditor);
    }
    return result;
  }
}
