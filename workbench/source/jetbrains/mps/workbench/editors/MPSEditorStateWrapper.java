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

import com.intellij.openapi.fileEditor.FileEditorState;
import com.intellij.openapi.fileEditor.FileEditorStateLevel;
import jetbrains.mps.ide.MPSEditorState;
import org.apache.commons.lang.ObjectUtils;

class MPSEditorStateWrapper implements FileEditorState {
  private MPSEditorState myEditorState;
  private FileEditorStateLevel myLevel;

  MPSEditorStateWrapper() {
  }

  MPSEditorState getEditorState() {
    return myEditorState;
  }

  void setEditorState(MPSEditorState editorState) {
    myEditorState = editorState;
  }

  public FileEditorStateLevel getLevel() {
    return myLevel;
  }

  public void setLevel(FileEditorStateLevel level) {
    myLevel = level;
  }

  public boolean canBeMergedWith(FileEditorState otherState, FileEditorStateLevel level) {
    return false;
  }

  public int hashCode() {
    return ObjectUtils.hashCode(myEditorState);
  }

  public boolean equals(Object obj) {
    if (!(obj instanceof MPSEditorStateWrapper)) return false;

    MPSEditorStateWrapper w = (MPSEditorStateWrapper) obj;
    return ObjectUtils.equals(myEditorState, w.myEditorState);
  }
}
