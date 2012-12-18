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
package jetbrains.mps.ide.projectPane;

import com.intellij.ide.SelectInContext;
import com.intellij.ide.SelectInTarget;
import com.intellij.ide.projectView.ProjectView;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.wm.ToolWindow;
import com.intellij.openapi.wm.ToolWindowId;
import com.intellij.openapi.wm.ToolWindowManager;

/**
 * User: Alexander Shatalin
 * Date: 20.05.2010
 */
public abstract class AbstractProjectViewSelectInTarget implements SelectInTarget {
  private Project myProject;
  private String myToolWindowId;
  private String myMinorViewId;
  private float myWeight;
  private String myTitle;

  public AbstractProjectViewSelectInTarget(Project project, String id, float weight, String title) {
    this(project, id, id, weight, title);
  }

  public AbstractProjectViewSelectInTarget(Project project, String toolWindowId, String minorViewId, float weight, String title) {
    myProject = project;
    myToolWindowId = toolWindowId;
    myMinorViewId = minorViewId;
    myWeight = weight;
    myTitle = title;
  }

  @Override
  public void selectIn(final SelectInContext context, final boolean requestFocus) {
    final ProjectView projectView = ProjectView.getInstance(myProject);
    ToolWindowManager windowManager = ToolWindowManager.getInstance(myProject);
    ToolWindow projectViewToolWindow = windowManager.getToolWindow(ToolWindowId.PROJECT_VIEW);
    projectViewToolWindow.activate(new Runnable() {
      @Override
      public void run() {
        projectView.changeView(getMinorViewId());
        doSelectIn(context, requestFocus);
      }
    }, requestFocus);
  }

  @Override
  public String getToolWindowId() {
    return myToolWindowId;
  }

  @Override
  public String getMinorViewId() {
    return myMinorViewId;
  }

  @Override
  public float getWeight() {
    return myWeight;
  }

  protected Project getProject() {
    return myProject;
  }

  @Override
  public String toString() {
    return myTitle;
  }

  protected abstract void doSelectIn(SelectInContext context, boolean requestFocus);
}
