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
package jetbrains.mps.workbench.tools;

import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.startup.StartupManager;
import com.intellij.openapi.wm.ToolWindowAnchor;

import javax.swing.Icon;

public abstract class BaseProjectTool extends BaseTool implements ProjectComponent {
  protected BaseProjectTool(Project project, String id, int number, Icon icon, ToolWindowAnchor anchor, boolean sideTool, boolean canCloseContent) {
    super(project, id, number, icon, anchor, sideTool, canCloseContent);
  }

  protected BaseProjectTool(Project project, String id, int number, Icon icon, ToolWindowAnchor anchor, boolean canCloseContent) {
    super(project, id, number, icon, anchor, canCloseContent);
  }

  public void projectOpened() {
  }

  public void projectClosed() {

  }

  public void initComponent() {
    StartupManager.getInstance(getProject()).registerPostStartupActivity(new Runnable() {
      public void run() {
        registerLater();
      }
    });
  }

  public void disposeComponent() {
    unregister();
  }
}
