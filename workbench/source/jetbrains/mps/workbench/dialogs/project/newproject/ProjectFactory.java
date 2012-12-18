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
package jetbrains.mps.workbench.dialogs.project.newproject;

import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.ProgressManager;
import com.intellij.openapi.progress.Task;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ex.ProjectManagerEx;
import com.intellij.openapi.startup.StartupManager;
import com.intellij.platform.ProjectBaseDirectory;
import jetbrains.mps.ide.projectPane.ProjectPane;
import jetbrains.mps.library.LanguageDesign_DevKit;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.MPSProjectVersion;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.persistence.SolutionDescriptorPersistence;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.modules.LanguageDescriptor;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.io.File;

/**
 * Added on Oct 16, 2010
 *
 * @author Evgeny Gerashchenko
 */
public class ProjectFactory {
  private ProjectOptions myOptions;
  private Project myCurrentProject;
  private Project myCreatedProject;

  private Language myCreatedLanguage;
  private Solution myCreatedSolution;

  public ProjectFactory(Project currentProject, ProjectOptions options) {
    myCurrentProject = currentProject;
    myOptions = options;
  }

  public Project createProject() throws ProjectNotCreatedException {
    final String[] error = new String[]{null};
    ProgressManager.getInstance().run(new Task.Modal(myCurrentProject, "Creating", false) {
      public void run(@NotNull() ProgressIndicator indicator) {
        indicator.setIndeterminate(true);
        error[0] = createDirs();
        if (error[0] != null) return;
        String projectFilePath = myOptions.getProjectPath() + File.separator + myOptions.getProjectName() + MPSExtentions.DOT_MPS_PROJECT;
        myCreatedProject = ProjectManagerEx.getInstanceEx().newProject(myOptions.getProjectName(), projectFilePath, true, false);
      }
    });

    if (error[0] != null) {
      throw new ProjectNotCreatedException(error[0]);
    }

    myCreatedProject.save();

    //noinspection ConstantConditions
    final MPSProject mpsProject = myCreatedProject.getComponent(MPSProject.class);

    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        if (myOptions.getCreateNewLanguage()) {
          myCreatedLanguage = createNewLanguage(mpsProject);
          mpsProject.addProjectModule(myCreatedLanguage);
          myCreatedLanguage.save();
        }

        if (myOptions.getCreateNewSolution()) {
          myCreatedSolution = createNewSolution(mpsProject);
          myCreatedSolution.save();
          mpsProject.addProjectModule(myCreatedSolution);
        }

        if (myCreatedSolution != null && myCreatedLanguage != null) {
          myCreatedSolution.addUsedLanguage(myCreatedLanguage.getModuleReference());
          myCreatedSolution.save();

          if (myOptions.getCreateModel()) {
            EditableSModelDescriptor model = myCreatedSolution.createModel(SModelFqName.fromString(myCreatedSolution.getModuleReference().getModuleFqName() + ".sandbox"), myCreatedSolution.getSModelRoots().get(0));
            model.getSModel().addLanguage(myCreatedLanguage.getModuleReference());
            model.save();
          }
        }
      }
    });
    return myCreatedProject;
  }

  public void activate() {
    if (myCreatedProject == null) return;
    myCreatedProject.getComponent(MPSProjectVersion.class).setVersion(MPSProjectVersion.CURRENT);

    ProjectBaseDirectory.getInstance(myCreatedProject).setBaseDir(myCreatedProject.getBaseDir());

    ProjectManagerEx projectManager = ProjectManagerEx.getInstanceEx();
    boolean opened = projectManager.openProject(myCreatedProject);

    if (opened) {
      StartupManager.getInstance(myCreatedProject).runWhenProjectIsInitialized(new Runnable() {
        public void run() {
          ProjectPane.getInstance(myCreatedProject).activate();
        }
      });
    }
  }

  @Nullable
  private String createDirs() {
    File projectDirFile = new File(myOptions.getProjectPath());
    if (!(projectDirFile.exists())) {
      if (!projectDirFile.mkdirs()) return "Couldn't create project directory";
    }

    if (myOptions.getCreateNewLanguage()) {
      File languageDirFile = new File(myOptions.getLanguagePath());
      if (!(languageDirFile.exists())) {
        if (!languageDirFile.mkdirs()) return "Couldn't create language directory";
      }
    }

    if (myOptions.getCreateNewSolution()) {
      String path = myOptions.getSolutionPath() + File.separator + myOptions.getSolutionNamespace() + MPSExtentions.DOT_SOLUTION;
      File solutionDescriptorFile = new File(path);
      File dir = solutionDescriptorFile.getParentFile();
      if (!(dir.exists())) {
        if (!dir.mkdirs()) return "Couldn't create solution directory";
      }
    }

    return null;
  }

  private Solution createNewSolution(MPSProject mpsProject) {
    String descriptorFileName = myOptions.getSolutionNamespace() + MPSExtentions.DOT_SOLUTION;
    String descriptorPath = myOptions.getSolutionPath() + File.separator + descriptorFileName;
    IFile descriptorFile = FileSystem.getInstance().getFileByPath(descriptorPath);

    Solution solution = Solution.createSolution(myOptions.getSolutionNamespace(), descriptorFile, mpsProject);
    SolutionDescriptor solutionDescriptor = solution.getModuleDescriptor();

    ModelRoot modelRoot = new ModelRoot();
    modelRoot.setPrefix("");
    modelRoot.setPath(descriptorFile.getParent().getPath());

    solutionDescriptor.getModelRoots().add(modelRoot);

    solution.setSolutionDescriptor(solutionDescriptor,false);

    return solution;
  }

  private Language createNewLanguage(MPSProject mpsProject) {
    String descriptorFileName = NameUtil.shortNameFromLongName(myOptions.getLanguageNamespace()) + MPSExtentions.DOT_LANGUAGE;
    String descriptorPath = myOptions.getLanguagePath() + File.separator + descriptorFileName;
    IFile descriptorFile = FileSystem.getInstance().getFileByPath(descriptorPath);

    Language language = Language.createLanguage(myOptions.getLanguageNamespace(), descriptorFile, mpsProject);
    LanguageDescriptor languageDescriptor = language.getModuleDescriptor();
    languageDescriptor.getUsedDevkits().add(LanguageDesign_DevKit.MODULE_REFERENCE);
    
    LanguageAspect.STRUCTURE.createNew(language, false);
    LanguageAspect.EDITOR.createNew(language, false);
    LanguageAspect.CONSTRAINTS.createNew(language, false);
    LanguageAspect.BEHAVIOR.createNew(language, false);
    LanguageAspect.TYPESYSTEM.createNew(language, false);
    
    language.setLanguageDescriptor(languageDescriptor, false);

    return language;
  }

  public static class ProjectNotCreatedException extends Exception {
    public ProjectNotCreatedException(String message) {
      super(message);
    }
  }
}
