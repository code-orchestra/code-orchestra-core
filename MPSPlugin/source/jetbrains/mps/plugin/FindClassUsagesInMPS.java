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

import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.DataKeys;
import com.intellij.openapi.project.Project;
import com.intellij.psi.PsiClass;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiField;
import com.intellij.psi.PsiMethod;

public class FindClassUsagesInMPS extends AnAction {
  public void update(AnActionEvent anActionEvent) {
    super.update(anActionEvent);

    PsiElement element = PluginUtil.getCurrentElement(anActionEvent);
    PsiClass cls = getPsiClass(element);
    if (cls == null) {
      anActionEvent.getPresentation().setVisible(false);
      anActionEvent.getPresentation().setEnabled(false);
    } else {
      anActionEvent.getPresentation().setVisible(true);
      anActionEvent.getPresentation().setEnabled(true);
    }
  }

  private PsiClass getPsiClass(PsiElement element) {
    if (element == null) {
      return null;
    }
    PsiClass cls = PluginUtil.getElement(element, PsiClass.class);
    if (PluginUtil.getElement(element, PsiMethod.class) != null || PluginUtil.getElement(element, PsiField.class) != null) {
      cls = null;
    }
    return cls;
  }

  public void actionPerformed(AnActionEvent anActionEvent) {
    PsiElement element = PluginUtil.getCurrentElement(anActionEvent);

    Project project = anActionEvent.getData(DataKeys.PROJECT);
    if (project == null) return;
    ProjectHandler projectHandler = project.getComponent(ProjectHandler.class);
    PsiClass cls = getPsiClass(element);
    projectHandler.showClassUsages(cls.getQualifiedName());
  }
}
