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

package jetbrains.mps.project;

import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import jetbrains.mps.smodel.DefaultScope;
import jetbrains.mps.smodel.Language;
import org.jetbrains.annotations.NotNull;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class ProjectScope extends DefaultScope implements ProjectComponent {
  private Project myProject;

  public ProjectScope(Project project) {
    myProject = project;
  }

  protected Set<IModule> getInitialModules() {
    Project[] openProjects = ProjectManager.getInstance().getOpenProjects();
    assert Arrays.asList(openProjects).contains(myProject) : "trying to get scope on a not-yet-loaded project";

    MPSProject mpsProject = myProject.getComponent(MPSProject.class);

    Set<IModule> result = new HashSet<IModule>();
    result.addAll(mpsProject.getProjectModules(IModule.class));

    for (Language l : mpsProject.getProjectModules(Language.class)) {
      result.addAll(l.getGenerators());
    }
    return result;
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }

  @NotNull
  @Override
  public String getComponentName() {
    return getClass().getName();
  }

  @Override
  public void initComponent() {
  }

  @Override
  public void disposeComponent() {
  }
}
