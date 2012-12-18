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
package jetbrains.mps.uitests.dialogs;

import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.uitests.dialogs.UITestsBase.NoProjectUITestsBase;
import jetbrains.mps.workbench.dialogs.project.newproject.LanguageStep;
import jetbrains.mps.workbench.dialogs.project.newproject.ProjectStep;
import jetbrains.mps.workbench.dialogs.project.newproject.SolutionStep;
import junit.extensions.jfcunit.finder.DialogFinder;
import org.apache.commons.lang.ObjectUtils;

import java.awt.Component;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

public class NewProjectUITest extends NoProjectUITestsBase {
  public void testInitialValues() throws InvocationTargetException, InterruptedException {
    Component dialog = TestUtil.openNewProjectDialog(this,null);

    checkProjectStep();
    pressButton(dialog, "Next");
    flushAWT();

    checkLanguageStep();
    pressButton(dialog, "Next");
    flushAWT();

    checkSolutionStep();
    pressButton(dialog, "Finish");
    flushAWT();

    checkDialogDisposed();
    checkNoAdditionalDialogs();
    flushAWT();

    MPSProject p = TestUtil.waitProjectLoaded(this);
    checkProject(p);
    flushAWT();

    File projectFile = p.getProjectFile();
    TestUtil.closeProject(p);

    flushAWT();

    TestUtil.deleteProject(this, projectFile);

    flushAWT();
  }

  private void checkProject(MPSProject p) {
    List<Language> pl = p.getProjectModules(Language.class);
    int langNum = pl.size();
    assertEquals("Project languages namber: " + langNum, 1, langNum);
    List<Solution> ps = p.getProjectModules(Solution.class);
    int solNum = ps.size();
    assertEquals("Project solutions namber: " + solNum, 1, solNum);

    Solution solution = ps.get(0);
    Language language = pl.get(0);
    List<ModuleReference> languages = solution.getModuleDescriptor().getUsedLanguages();
    boolean imported = false;
    for (ModuleReference langRef:languages){
      if (ObjectUtils.equals(langRef.getModuleFqName(),language.getModuleFqName())){
        imported = true;
      }
    }
    assertTrue("Language is not imported into solution", imported);
  }

  private void checkProjectStep() {
    String name = checkTextField(ProjectStep.PROJECT_NAME);
    String path = checkPathField(ProjectStep.PROJECT_PATH);
    assertTrue("Wrong path generated for project - not ending with a name", path.endsWith(name));
  }

  private void checkLanguageStep() {
    String name = checkTextField(LanguageStep.LANGUAGE_NAME);
    String path = checkPathField(LanguageStep.LANGUAGE_PATH);
    assertTrue("Wrong path generated for language - not ending with a name", path.endsWith(name));

    assertTrue("Create Language checkbox should be initially selected", checkCheckbox(LanguageStep.CREATE_CHECKBOX));
  }

  private void checkSolutionStep() {
    String name = checkTextField(SolutionStep.SOLUTION_NAME);
    String path = checkPathField(SolutionStep.SOLUTION_PATH);
    assertTrue("Wrong path generated for language - not ending with a name", path.endsWith(name));

    assertTrue("Create Solution checkbox should be initially selected", checkCheckbox(SolutionStep.CREATE_CHECKBOX));
  }

  private void checkDialogDisposed() {
    DialogFinder dialogFinder = new DialogFinder("New Project");
    dialogFinder.setWait(2);
    Component dialog = dialogFinder.find();
    assertNull("Dialog is not closed", dialog);
  }

  private void checkNoAdditionalDialogs() {
    DialogFinder dialogFinder = new DialogFinder(".*");
    Component dialog = dialogFinder.find();
    assertNull("No dialog should be shown after wizard has finished", dialog);
  }
}
