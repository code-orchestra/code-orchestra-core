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

import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import com.intellij.openapi.project.ProjectManagerAdapter;
import com.intellij.openapi.startup.StartupManager;
import com.intellij.openapi.util.Computable;

import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.workbench.dialogs.project.newproject.NewProjectWizard;
import junit.extensions.jfcunit.finder.DialogFinder;

import javax.swing.SwingUtilities;
import java.awt.Component;
import java.io.File;

public class TestUtil {
  public static MPSProject createNewProject(final UITestsBase test) {
    Component dialog = openNewProjectDialog(test, null);

    test.pressButton(dialog, "Next");
    test.flushAWT();

    test.pressButton(dialog, "Next");
    test.flushAWT();

    test.pressButton(dialog, "Finish");
    test.flushAWT();

    MPSProject project = waitProjectLoaded(test);
    test.flushAWT();

    return project;
  }

  public static Component openNewProjectDialog(final UITestsBase test, final Project project) {
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        NewProjectWizard wizard = new NewProjectWizard("New Project", project);
        wizard.show();
      }
    });

    test.flushAWT();

    DialogFinder dialogFinder = new DialogFinder("New Project");
    dialogFinder.setWait(10);
    Component dialog = dialogFinder.find();
    UITestsBase.assertNotNull("Dialog not found", dialog);
    return dialog;
  }

  public static MPSProject waitProjectLoaded(final UITestsBase test) {
    final Project[] ideaProject = new Project[]{null};
    Project[] projects = ProjectManager.getInstance().getOpenProjects();

    if (projects.length != 0) {
      ideaProject[0] = projects[0];
    } else {
      final Project[] project = new Project[]{null};
      final ProjectManager manager = ProjectManager.getInstance();
      manager.addProjectManagerListener(new ProjectManagerAdapter() {
        @Override
        public void projectOpened(Project p) {
          manager.removeProjectManagerListener(this);
          project[0] = p;
        }
      });

      conditionalWaitAndFlush(test,new Computable<Boolean>() {
        public Boolean compute() {
          return project[0] != null;
        }
      });

      ideaProject[0] = project[0];
    }

    conditionalWaitAndFlush(test,new Computable<Boolean>() {
      public Boolean compute() {
        return ideaProject[0].getComponent(MPSProject.class) != null;
      }
    });

    final boolean[] loaded = new boolean[]{false};
    StartupManager.getInstance(ideaProject[0]).registerPostStartupActivity(new Runnable() {
      public void run() {
        loaded[0] = true;
      }
    });

    conditionalWaitAndFlush(test,new Computable<Boolean>() {
      public Boolean compute() {
        return loaded[0];
      }
    });

    DialogFinder finder = new DialogFinder(".*Tip of the Day.*", true);
    finder.setWait(10);
    Component dialog = finder.find();
    if (dialog != null) {
      test.pressButton(dialog, "Close");
    }

    return ideaProject[0].getComponent(MPSProject.class);
  }

  public static void deleteProject(UITestsBase tests, File projectFile) {
    deleteDirectory(projectFile.getParentFile());
  }

  static public boolean deleteDirectory(File file) {
    if (file.exists()) {
      for (File f : file.listFiles()) {
        if (f.isDirectory()) {
          deleteDirectory(f);
        } else {
          f.delete();
        }
      }
    }
    return (file.delete());
  }

  public static void closeProject(final MPSProject createdProject) {
    ThreadUtils.runInUIThreadAndWait(new Runnable() {
      public void run() {
        ProjectManager.getInstance().closeProject(createdProject.getProject());
      }
    });
  }

  public static void conditionalWaitAndFlush(UITestsBase test,Computable<Boolean> cond){
    while (!cond.compute()) {
      test.flushAWT();
      try {
        Thread.sleep(300);
      } catch (InterruptedException e) {
        
      }
    }
    test.flushAWT();
  }
}
