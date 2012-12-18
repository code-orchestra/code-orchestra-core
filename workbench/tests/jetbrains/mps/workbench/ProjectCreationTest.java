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
package jetbrains.mps.workbench;

import com.intellij.ide.impl.ProjectUtil;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.application.ModalityState;
import com.intellij.openapi.project.Project;
import jetbrains.mps.TestMain;
import jetbrains.mps.ide.IdeMain;
import jetbrains.mps.ide.IdeMain.TestMode;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.vfs.IFileUtils;
import jetbrains.mps.workbench.dialogs.project.newproject.ProjectFactory;
import jetbrains.mps.workbench.dialogs.project.newproject.ProjectFactory.ProjectNotCreatedException;
import jetbrains.mps.workbench.dialogs.project.newproject.ProjectOptions;
import junit.framework.Assert;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.*;

/**
 * Added on Oct 16, 2010
 *
 * @author Evgeny Gerashchenko
 */
public class ProjectCreationTest {
  private static final String PROJECT_NAME = "CreatedTestProject";
  private static final String LANGUAGE_NAMESPACE = "CreatedLanguage";
  private static final String SOLUTION_NAMESPACE = "CreatedSandbox";
  private static final List<String> EMPTY_PROJECT_PATH_LIST = Arrays.asList(
    PROJECT_NAME + "/" + PROJECT_NAME + ".iws",
    PROJECT_NAME + "/" + PROJECT_NAME + MPSExtentions.DOT_MPS_PROJECT
  );
  private static final List<String> PROJECT_WITH_MODULES_PATH_LIST = Arrays.asList(
    PROJECT_NAME + "/" + PROJECT_NAME + ".iws",
    PROJECT_NAME + "/" + PROJECT_NAME + MPSExtentions.DOT_MPS_PROJECT,

    PROJECT_NAME + "/languages/" + LANGUAGE_NAMESPACE + "/" + LANGUAGE_NAMESPACE + MPSExtentions.DOT_LANGUAGE,
    PROJECT_NAME + "/languages/" + LANGUAGE_NAMESPACE + "/languageModels/structure" + MPSExtentions.DOT_MODEL,
    PROJECT_NAME + "/languages/" + LANGUAGE_NAMESPACE + "/languageModels/constraints" + MPSExtentions.DOT_MODEL,
    PROJECT_NAME + "/languages/" + LANGUAGE_NAMESPACE + "/languageModels/editor" + MPSExtentions.DOT_MODEL,
    PROJECT_NAME + "/languages/" + LANGUAGE_NAMESPACE + "/languageModels/behavior" + MPSExtentions.DOT_MODEL,
    PROJECT_NAME + "/languages/" + LANGUAGE_NAMESPACE + "/languageModels/typesystem" + MPSExtentions.DOT_MODEL,

    PROJECT_NAME + "/solutions/" + SOLUTION_NAMESPACE + "/" + SOLUTION_NAMESPACE + MPSExtentions.DOT_SOLUTION,
    PROJECT_NAME + "/solutions/" + SOLUTION_NAMESPACE + "/" + "models/sandbox" + MPSExtentions.DOT_MODEL
  );

  private IFile myTmpDir;
  private Project myProject;


  @Before
  public void setUp() {
    IdeMain.setTestMode(TestMode.CORE_TEST);
    TestMain.configureMPS();
  }

  @After
  public void tearDown() {
    ApplicationManager.getApplication().invokeAndWait(new Runnable() {
      @Override
      public void run() {}
    }, ModalityState.defaultModalityState());
  }

  @Test
  public void emptyProject() {
    invokeTest(new EmptyProjectProvider(), EMPTY_PROJECT_PATH_LIST);
  }

  @Test
  public void projectWithModules() {
    invokeTest(new ProjectWithModulesProvider(), PROJECT_WITH_MODULES_PATH_LIST);
  }

  private void invokeTest(final ProjectOptionsProvider projectOptionsProvider, List<String> expectedPathList) {
    ApplicationManager.getApplication().invokeAndWait(new Runnable() {
      @Override
      public void run() {
        ApplicationManager.getApplication().runWriteAction(new Runnable() {
          @Override
          public void run() {
            myTmpDir = IFileUtils.createTmpDir();

            try {
              ProjectFactory factory = new ProjectFactory(null, projectOptionsProvider.getProjectOptions(myTmpDir));
              myProject = factory.createProject();
              factory.activate();
              myProject.save();
            } catch (ProjectNotCreatedException e) {
              Assert.fail();
            }
          }
        });
      }
    }, ModalityState.defaultModalityState());
    ApplicationManager.getApplication().invokeLater(new Runnable() {
      @Override
      public void run() {
        ProjectUtil.closeAndDispose(myProject);
      }
    });
    checkFilePathList(myTmpDir, expectedPathList);
  }

  private static void checkFilePathList(IFile rootDir, List<String> expectedList) {
    List<String> actualList = collectFilePathList(rootDir);

    Set<String> missing = new HashSet<String>(expectedList);
    missing.removeAll(actualList);

    Set<String> unexpected = new HashSet<String>(actualList);
    unexpected.removeAll(expectedList);

    Assert.assertTrue("Missing files: " + missing + ", unexpected files: " + unexpected,
      missing.isEmpty() && unexpected.isEmpty());
  }

  private static List<String> collectFilePathList(IFile rootDir) {
    ArrayList<String> currentList = new ArrayList<String>();
    collectFilePathList(currentList, rootDir, null);
    return currentList;
  }

  private static void collectFilePathList(List<String> list, IFile rootDir, String prefix) {
    for (IFile file : rootDir.getChildren()) {
      String path = file.getName();
      if (prefix != null) {
        path = prefix + "/" + file.getName();
      }
      if (file.isDirectory() && !file.getChildren().isEmpty()) {
        collectFilePathList(list, file, path);
      } else {
        list.add(path);
      }
    }
  }

  private interface ProjectOptionsProvider {
    ProjectOptions getProjectOptions(IFile containingFile);
  }

  private static class EmptyProjectProvider implements ProjectOptionsProvider {
    @Override
    public ProjectOptions getProjectOptions(IFile containingDir) {
      ProjectOptions options = new ProjectOptions();

      options.setProjectName(PROJECT_NAME);
      options.setProjectPath(containingDir.getDescendant(PROJECT_NAME).getPath());

      options.setCreateNewLanguage(false);
      options.setCreateNewSolution(false);
      options.setCreateModel(false);

      return options;
    }
  }

  private static class ProjectWithModulesProvider implements ProjectOptionsProvider {
    @Override
    public ProjectOptions getProjectOptions(IFile containingFile) {
      IFile projectDir = containingFile.getDescendant(PROJECT_NAME);

      ProjectOptions options = new ProjectOptions();
      options.setProjectName(PROJECT_NAME);
      options.setProjectPath(projectDir.getPath());

      options.setCreateNewLanguage(true);
      options.setLanguageNamespace(LANGUAGE_NAMESPACE);
      options.setLanguagePath(projectDir.getDescendant("languages").getDescendant(LANGUAGE_NAMESPACE).getPath());

      options.setCreateNewSolution(true);
      options.setSolutionNamespace(SOLUTION_NAMESPACE);
      options.setSolutionPath(projectDir.getDescendant("solutions").getDescendant(SOLUTION_NAMESPACE).getPath());
      options.setCreateModel(true);

      return options;
    }
  }
}
