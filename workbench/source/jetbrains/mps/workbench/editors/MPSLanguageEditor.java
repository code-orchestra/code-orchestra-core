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

import com.intellij.codeHighlighting.BackgroundEditorHighlighter;
import com.intellij.ide.structureView.StructureViewBuilder;
import com.intellij.openapi.fileEditor.FileEditor;
import com.intellij.openapi.fileEditor.FileEditorLocation;
import com.intellij.openapi.fileEditor.FileEditorState;
import com.intellij.openapi.fileEditor.FileEditorStateLevel;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.UserDataHolderBase;
import jetbrains.mps.ide.hierarchy.LanguageHierarchiesComponent;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.workbench.languagesFs.MPSLanguageVirtualFile;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.JComponent;
import java.beans.PropertyChangeListener;

public class MPSLanguageEditor extends UserDataHolderBase implements FileEditor {
  public MPSLanguageEditor(final Project project, final MPSLanguageVirtualFile file) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        myFile = file;
        myHierarchiesComponent = new LanguageHierarchiesComponent(myFile.getLanguage(), ProjectOperationContext.get(project));
        myHierarchiesComponent.rebuild();
      }
    });
  }

  private MPSLanguageVirtualFile myFile;
  //  private LanguageDiagramComponent2 myHierarchiesComponent;
  private LanguageHierarchiesComponent myHierarchiesComponent;

  @NotNull
  public JComponent getComponent() {
    return myHierarchiesComponent.getExternalComponent();
  }

  @Nullable
  public JComponent getPreferredFocusedComponent() {
    return myHierarchiesComponent.getExternalComponent();
  }

  @NonNls
  @NotNull
  public String getName() {
    return myFile.getName();
  }

  @NotNull
  public FileEditorState getState(@NotNull FileEditorStateLevel level) {
    return new FileEditorState() {
      public boolean canBeMergedWith(FileEditorState otherState, FileEditorStateLevel level) {
        return false;
      }
    };
  }

  public void setState(final @NotNull FileEditorState state) {
    //  myNodeEditor.loadState(state);
  }

  public boolean isModified() {
    return false;
  }

  public boolean isValid() {
    return true;
  }

  public void selectNotify() {
  }

  public void deselectNotify() {
  }

  public void addPropertyChangeListener(@NotNull PropertyChangeListener listener) {
  }

  public void removePropertyChangeListener(@NotNull PropertyChangeListener listener) {
  }

  @Nullable
  public BackgroundEditorHighlighter getBackgroundHighlighter() {
    return null;
  }

  @Nullable
  public FileEditorLocation getCurrentLocation() {
    return null;
  }

  @Nullable
  public StructureViewBuilder getStructureViewBuilder() {
    return null;
  }

  public void dispose() {
  }
}
