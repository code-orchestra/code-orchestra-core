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
package jetbrains.mps.build.ant;

import com.intellij.openapi.util.io.FileUtil;
import com.intellij.util.io.ZipUtil;
import jetbrains.mps.BaseMPSTest;
import jetbrains.mps.build.ant.generation.GenerateTask;
import jetbrains.mps.build.ant.generation.workers.GeneratorWorker;
import junit.framework.TestCase;
import org.junit.After;
import org.junit.Test;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class GenerateTaskFilesCreationTest {
  private static final String CONCEPT_NAME = "SomeConcept";
  private final List<File> myTmpDirstoDelete = new ArrayList<File>();

  @After
  public void tearDown() throws Exception {
    BaseMPSTest.waitForEDTTasksToComplete();

    for (File f : myTmpDirstoDelete) {
      FileUtil.delete(f);
    }
    myTmpDirstoDelete.clear();
  }

  @Test
  public void testOneFileForOneConcept() throws IOException {
    String projectName = "FileTestProject";
    String languageName = "FileTestProjectLanguage";

    File destdir = generateProjectFromZipFile(projectName);

    assertStructureGenerated(projectName, languageName, destdir, CONCEPT_NAME);
  }

  @Test
  public void testSeveralFilesForOneConcept() throws IOException {
    String projectName = "TestProjectWithOneConcept";
    String languageName = projectName + "Language";

    File destdir = generateProjectFromZipFile(projectName);

    assertStructureGenerated(projectName, languageName, destdir, CONCEPT_NAME);
    assertEditorGenerated(projectName, languageName, destdir, CONCEPT_NAME);
    assertBehaviorGenerated(projectName, languageName, destdir, CONCEPT_NAME);
  }

  @Test
  public void testLanguageAndSolution() throws IOException {
    String projectName = "TestProjectWithLanguageAndSolution";
    String languageName = projectName + "Language";
    String solutionName = projectName + "LanguageSolution";

    File destdir = generateProjectFromZipFile(projectName);

    assertStructureGenerated(projectName, languageName, destdir, CONCEPT_NAME);
    assertEditorGenerated(projectName, languageName, destdir, CONCEPT_NAME);
    assertBehaviorGenerated(projectName, languageName, destdir, CONCEPT_NAME);
    assertGeneratorGenerated(projectName, languageName, destdir);

    File someConceptInstanceFile = new File(getSolutionSourceFolderPath(destdir, projectName, solutionName) + "SomeInstanceOfSomeConcept.java");
    TestCase.assertTrue(someConceptInstanceFile.exists());
  }

  @Test
  public void testLanguageOnly() throws IOException {
    String projectName = "TestProjectWithLanguageAndSolution";
    String languageName = projectName + "Language";

    File destdir = extractProject(projectName);

    WhatToDo whatToDo = new WhatToDo();
    whatToDo.addModuleFile(new File(getLanguagePath(destdir, projectName, languageName) + File.separator + languageName + ".mpl"));
    doGenerate(whatToDo);

    assertStructureGenerated(projectName, languageName, destdir, CONCEPT_NAME);
    assertEditorGenerated(projectName, languageName, destdir, CONCEPT_NAME);
    assertBehaviorGenerated(projectName, languageName, destdir, CONCEPT_NAME);
    assertGeneratorGenerated(projectName, languageName, destdir);
  }

  private void assertBehaviorGenerated(String projectName, String languageName, File destdir, String conceptName) {
    File someConceptBehaviorFile = new File(getBehaviorPath(destdir, projectName, languageName) + conceptName + "_Behavior.java");
    TestCase.assertTrue(someConceptBehaviorFile.exists());
  }

  private void assertEditorGenerated(String projectName, String languageName, File destdir, String conceptName) {
    File someConceptEditorFile = new File(getEditorPath(destdir, projectName, languageName) + conceptName + "_Editor.java");
    TestCase.assertTrue(someConceptEditorFile.exists());
  }

  private void assertStructureGenerated(String projectName, String languageName, File destdir, String conceptName) {
    File someConceptFile = new File(getStructurePath(destdir, projectName, languageName) + conceptName + ".java");
    TestCase.assertTrue(someConceptFile.exists());
  }

  private void assertGeneratorGenerated(String projectName, String languageName, File destdir) {
    File queriesGeneratedFile = new File(getLanguageSourceFolderPath(destdir, projectName, languageName)
      + "generator" + File.separator
      + "template" + File.separator
      + "main" + File.separator
      + "QueriesGenerated.java");
    TestCase.assertTrue(queriesGeneratedFile.exists());
  }

  private File generateProjectFromZipFile(String projectName) throws IOException {
    File destdir = extractProject(projectName);

    WhatToDo whatToDo = new WhatToDo();
    whatToDo.putProperty(GenerateTask.COMPILE, Boolean.toString(true));
    whatToDo.addProjectFile(new File(destdir.getAbsolutePath() + File.separator + projectName + File.separator + projectName + ".mpr"));
    doGenerate(whatToDo);

    return destdir;
  }

  private File extractProject(String projectName) throws IOException {
    URL resource = GenerateTaskFilesCreationTest.class.getResource(projectName + ".zip");
    File destdir = FileUtil.createTempDirectory(projectName, "");
    myTmpDirstoDelete.add(destdir);
    ZipUtil.extract(new File(resource.getFile()), destdir, new FilenameFilter() {
      public boolean accept(File dir, String name) {
        return true;
      }
    });
    return destdir;
  }

  private void doGenerate(WhatToDo whatToDo) {
    MpsWorker mpsWorker = new GeneratorWorker(whatToDo);
    mpsWorker.work();
  }

  private String getStructurePath(File destdir, String projectName, String languageName) {
    return getLanguageSourceFolderPath(destdir, projectName, languageName)
      + "structure" + File.separator;
  }

  private String getEditorPath(File destdir, String projectName, String languageName) {
    return getLanguageSourceFolderPath(destdir, projectName, languageName)
      + "editor" + File.separator;
  }

  private String getBehaviorPath(File destdir, String projectName, String languageName) {
    return getLanguageSourceFolderPath(destdir, projectName, languageName)
      + "behavior" + File.separator;
  }

  private String getLanguageSourceFolderPath(File destdir, String projectName, String languageName) {
    return getLanguagePath(destdir, projectName, languageName) + File.separator
      + "source_gen" + File.separator + languageName + File.separator;
  }

  private String getLanguagePath(File destdir, String projectName, String languageName) {
    return destdir + File.separator + projectName + File.separator
      + "languages" + File.separator + languageName;
  }

  private String getSolutionSourceFolderPath(File destdir, String projectName, String solutionName) {
    return destdir + File.separator + projectName + File.separator
      + "solutions" + File.separator + solutionName + File.separator
      + "source_gen" + File.separator + solutionName + File.separator + "sandbox" + File.separator;
  }

}
