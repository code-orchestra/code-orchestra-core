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
package jetbrains.mps.migration20.stages;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.modelchecker.actions.ModelCheckerIssue;
import jetbrains.mps.ide.modelchecker.actions.ModelCheckerSettings;
import jetbrains.mps.ide.modelchecker.actions.ModelCheckerTool_Tool;
import jetbrains.mps.ide.modelchecker.actions.ModelCheckerViewer;
import jetbrains.mps.plugins.projectplugins.ProjectPluginManager;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.smodel.ModelAccess;

import java.util.Set;

public class BrokenRefsFixStage implements MigrationStage {
  private int myProblems = 0;

  public String title() {
    return "Broken References Fix";
  }

  public void execute(MPSProject p) {
    Project ideaProject = p.getProject();
    ModelCheckerTool_Tool tool = ideaProject.getComponent(ProjectPluginManager.class).getTool(ModelCheckerTool_Tool.class);
    if (tool == null) return;

    ModelCheckerSettings mcSettings = ApplicationManager.getApplication().getComponent(ModelCheckerSettings.class);
    try {
      mcSettings.setMigrationMode(true);
      ModelCheckerViewer res = tool.checkProject(ideaProject, ProjectOperationContext.get(ideaProject), false);
      for (final ModelCheckerIssue issue : res.getSearchResults().getResultObjects()) {
        ModelAccess.instance().runWriteActionInCommand(new Runnable() {
          public void run() {
            issue.fix();
          }
        });
      }

      res = tool.checkProject(ideaProject, ProjectOperationContext.get(ideaProject), true);
      Set<ModelCheckerIssue> problems = res.getSearchResults().getResultObjects();
      myProblems = problems.size();
    } finally {
      mcSettings.setMigrationMode(false);
    }
  }

  public boolean needsCommand() {
    return false;
  }

  public String messageBefore() {
    return "Now MPS will try to resolve all broken references in project";
  }

  public String messageAfter() {
    if (myProblems == 0) return null;
    return "References checking and resolving finished. There are " + myProblems + " unresolved references left. \n" +
      "Most probably this means that the module with a reference doesn't import the module with referenced object or the referenced object does not exist anymore. " +
      "We recommend to pause the migration now and correct module dependencies by hand. " +
      "You can also use the \"Fix Missing imports\" action from Logical View's context menu to add these dependencies automatically and Ctrl-R shortcut to add imports one-by-one\n" +
      "After fixing module dependency, continue the migration. It will begin with this step. ";
  }
}
