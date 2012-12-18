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

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.fileEditor.FileEditor;
import com.intellij.openapi.fileEditor.FileEditorManager;
import com.intellij.openapi.fileEditor.FileEditorManagerEvent;
import com.intellij.openapi.fileEditor.FileEditorManagerListener;
import com.intellij.openapi.project.DumbService;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.generator.TransientModelsModule.TransientSModelDescriptor;
import jetbrains.mps.ide.IEditor;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.project.IModule;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.reloading.ReloadAdapter;
import jetbrains.mps.reloading.ReloadListener;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.nodesFs.MPSNodeVirtualFile;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import java.util.*;

public class MPSEditorWarningsManager implements ProjectComponent {
  public static final Logger LOG = Logger.getLogger(MPSEditorWarningsManager.class);

  private FileEditorManager myFileEditorManager;
  private ClassLoaderManager myClassLoaderManager;
  private ReloadListener myReloadListener = new MyReloadListener();
  private Project myProject;

  private MyFileEditorManagerListener myFileEditorManagerListener = new MyFileEditorManagerListener();
  private Map<MPSFileNodeEditor, Set<WarningPanel>> myWarnings = new HashMap<MPSFileNodeEditor, Set<WarningPanel>>();

  public MPSEditorWarningsManager(Project project, FileEditorManager fileEditorManager, ClassLoaderManager classLoaderManager) {
    myProject = project;
    myFileEditorManager = fileEditorManager;
    myClassLoaderManager = classLoaderManager;
  }

  public void projectOpened() {
    myFileEditorManager.addFileEditorManagerListener(myFileEditorManagerListener);
  }

  public void projectClosed() {
    myFileEditorManager.removeFileEditorManagerListener(myFileEditorManagerListener);
  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "MPS Editor Warnings Manager";
  }

  public void initComponent() {
    myClassLoaderManager.addReloadHandler(myReloadListener);
  }

  public void disposeComponent() {
    myClassLoaderManager.removeReloadHandler(myReloadListener);
  }

  private void updateWarnings(@NotNull final MPSFileNodeEditor editor) {
    final Project project = editor.getNodeEditor().getOperationContext().getProject();

    DumbService.getInstance(project).smartInvokeLater(new Runnable() {
      public void run() {
        final Runnable task = new Runnable() {
          public void run() {
            doUpdateWarnings(editor, project);
          }
        };
        Boolean aBoolean = ModelAccess.instance().tryRead(new Computable<Boolean>() {
          @Override
          public Boolean compute() {
            task.run();
            return Boolean.TRUE;
          }
        });
        if (aBoolean == null) {
          ModelAccess.instance().runReadInEDT(task);
        }
      }
    });
  }

  private void doUpdateWarnings(final MPSFileNodeEditor editor, Project project) {
    if (myWarnings.containsKey(editor)) {
      for (WarningPanel panel : myWarnings.get(editor)) {
        myFileEditorManager.removeTopComponent(editor, panel);
      }
      myWarnings.remove(editor);
    }
    IEditor nodeEditor = editor.getNodeEditor();
    if (nodeEditor == null) return;

    EditorComponent editorComponent = nodeEditor.getCurrentEditorComponent();
    if (editorComponent != null && editorComponent.isDisposed()) return;

    SNode node = editor.getFile().getNode();
    if (node == null) return;

    SModel smodel = node.getModel();
    if (smodel == null) return;

    final SModelDescriptor model = smodel.getModelDescriptor();
    if (model == null) return;

    if (model instanceof TransientSModelDescriptor) {
      addWarningPanel(editor, "Warning: the node is in a transient model. Your changes won't be saved.");
    }

    IModule module = model.getModule();
    if (module != null && module.isPackaged()) {
      addWarningPanel(editor, "Warning: the node is in a packaged model. Your changes won't be saved");
    }
  }

  private void updateAllWarnings() {
    if (IdeMain.getTestMode() == TestMode.CORE_TEST) return;

    for (FileEditor editor : myFileEditorManager.getAllEditors()) {
      if (editor instanceof MPSFileNodeEditor) {
        updateWarnings((MPSFileNodeEditor) editor);
      }
    }
  }

  private void addWarningPanel(MPSFileNodeEditor editor, String text) {
    addWarningPanel(editor, text, null, null);
  }

  private void addWarningPanel(MPSFileNodeEditor editor, String text, String linkText, Runnable handler) {
    if (!myWarnings.containsKey(editor)) {
      myWarnings.put(editor, new HashSet<WarningPanel>());
    }
    WarningPanel panel = new WarningPanel(text, linkText, handler);
    myFileEditorManager.addTopComponent(editor, panel);
    myWarnings.get(editor).add(panel);
  }

  private class MyFileEditorManagerListener implements FileEditorManagerListener {
    public void fileOpened(FileEditorManager source, VirtualFile file) {
      if (file instanceof MPSNodeVirtualFile) {
        for (FileEditor fe : myFileEditorManager.getEditors(file)) {
          if (fe instanceof MPSFileNodeEditor) {
            updateWarnings((MPSFileNodeEditor) fe);
          }
        }
      }
    }

    public void fileClosed(FileEditorManager source, VirtualFile file) {
      myWarnings.keySet().retainAll(Arrays.asList(source.getAllEditors()));
    }

    public void selectionChanged(FileEditorManagerEvent event) {
      updateAllWarnings();
    }
  }

  private class MyReloadListener extends ReloadAdapter {
    public void onAfterReload() {
      ApplicationManager.getApplication().invokeLater(new Runnable() {
        public void run() {
          if (myProject.isDisposed()) return;
          updateAllWarnings();
        }
      });
    }
  }
}
