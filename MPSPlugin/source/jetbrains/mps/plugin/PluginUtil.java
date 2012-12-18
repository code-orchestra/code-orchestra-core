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
package jetbrains.mps.plugin;

import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DataKeys;
import com.intellij.openapi.editor.Editor;
import com.intellij.openapi.project.Project;
import com.intellij.psi.PsiDocumentManager;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiFile;

public class PluginUtil {
  public static PsiElement getCurrentElement(AnActionEvent e) {
    Editor editor = e.getData(DataKeys.EDITOR);
    if (editor == null) return null;
    Project project = e.getData(DataKeys.PROJECT);
    assert project != null;
    PsiFile file = PsiDocumentManager.getInstance(project).getCachedPsiFile(editor.getDocument());
    if (file == null) return null;
    return file.findElementAt(editor.getCaretModel().getOffset());
  }

  @SuppressWarnings("unchecked")
  public static <PE extends PsiElement> PE getElement(PsiElement current, Class<PE> elementClass) {
    if (current == null) return null;
    if (elementClass.isInstance(current)) {
      return (PE) current;
    }
    if (current.getParent() == null) return null;
    return getElement(current.getParent(), elementClass);
  }
}
