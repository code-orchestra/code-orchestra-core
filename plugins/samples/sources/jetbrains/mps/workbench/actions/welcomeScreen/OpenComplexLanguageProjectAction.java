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
package jetbrains.mps.workbench.actions.welcomeScreen;

import com.intellij.ide.impl.ProjectUtil;
import com.intellij.openapi.actionSystem.AnAction;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.actionSystem.PlatformDataKeys;
import com.intellij.openapi.project.Project;
import com.intellij.platform.ProjectBaseDirectory;
import jetbrains.mps.build.SamplesExtractor;

import java.io.File;

public class OpenComplexLanguageProjectAction extends AnAction {
  public OpenComplexLanguageProjectAction() {
    getTemplatePresentation().setIcon(Icons.OPEN_SAMPLE);
  }

  public void actionPerformed(AnActionEvent e) {
    String projectFile = SamplesExtractor.getInstance().getSamplesPath() + File.separator + "complexLanguage" + File.separator + "Complex.mpr";
    if (!new File(projectFile).exists()) {
      SamplesExtractor.getInstance().extractSamples();
    }
    Project project = ProjectUtil.openProject(projectFile, e.getData(PlatformDataKeys.PROJECT), false);
    if (project != null) {
      ProjectBaseDirectory.getInstance(project).setBaseDir(project.getBaseDir());
    }
  }
}
