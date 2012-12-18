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
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import com.intellij.openapi.project.Project;
import com.intellij.psi.*;
import com.intellij.psi.search.GlobalSearchScope;

public class GoToConceptDeclaration extends AnAction {
  public void update(AnActionEvent e) {
    super.update(e);
    Project p = e.getData(PlatformDataKeys.PROJECT);
    if (p == null) return;
    PsiElement element = PluginUtil.getCurrentElement(e);
    PsiClass cls = getConceptClass(element);
    if (cls != null) {
      JavaPsiFacade psiFacade = JavaPsiFacade.getInstance(p);
      PsiClass snodeClass = psiFacade.findClass("jetbrains.mps.smodel.SNode", GlobalSearchScope.allScope(p));
      if (snodeClass == null) return;

      if (cls.isInheritor(snodeClass, true)) {
        e.getPresentation().setVisible(true);
        return;
      }
    }
    e.getPresentation().setVisible(false);
  }

  public PsiClass getConceptClass(PsiElement e) {
    if (e == null) return null;

    if (e instanceof PsiTypeElement) {
      PsiTypeElement pte = (PsiTypeElement) e;
      if (pte.getType() instanceof PsiClassType) {
        return ((PsiClassType) pte.getType()).resolve();
      }
    }

    if (e instanceof PsiClass) {
      return (PsiClass) e;
    }

    if (e.getParent() != null) {
      return getConceptClass(e.getParent());
    }

    return null;
  }


  public void actionPerformed(AnActionEvent e) {
    PsiClass cls = getConceptClass(PluginUtil.getCurrentElement(e));
    Project project = (Project) e.getData(DataKeys.PROJECT);
    if (project == null) return;
    ProjectHandler projectHandler = project.getComponent(ProjectHandler.class);
    projectHandler.showConceptDeclaration(cls.getQualifiedName());
  }
}
