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
package jetbrains.mps.library;

import com.intellij.openapi.application.Application;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.application.ModalityState;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.project.DumbService;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.project.ProjectScope;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.util.MacrosFactory;
import jetbrains.mps.util.PathManager;
import org.jetbrains.annotations.Nls;

import java.io.File;

@State(
  name = "ProjectLibraryManager",
  storages = {
    @Storage(
      id = "other",
      file = "$PROJECT_FILE$"
    )
  }
)
public class ProjectLibraryManager extends BaseLibraryManager implements ProjectComponent {
  private Project myProject;

  public ProjectLibraryManager(Project project, MPSModuleRepository repo, ProjectScope projectScope, DumbService dumbService) {
    super(repo);
    myProject = project;
  }

  @Nls
  public String getDisplayName() {
    return "Project Libraries";
  }

  @Override
  public void initComponent() {
    if (myProject.isDefault()) {
      return;
    }
    myProject.getComponent(ProjectScope.class);
    if (!ThreadUtils.isEventDispatchThread()) {
      ApplicationManager.getApplication().invokeAndWait(new Runnable() {
        @Override
        public void run() {
          ProjectLibraryManager.super.initComponent();
        }
      }, ModalityState.defaultModalityState());
    }
    else {
      ProjectLibraryManager.super.initComponent();
    }
  }

  @Override
  public void disposeComponent() {
    LibraryInitializer.getInstance().removeContributor(this);
    Application application = ApplicationManager.getApplication();
    if (myProject.isDefault() || application.isUnitTestMode() && application.isDisposeInProgress()) {
      return;
    }
    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        LibraryInitializer.getInstance().update();
      }
    });
  }

  public void projectOpened() {

  }

  public void projectClosed() {

  }

  @Override
  public String getHelpTopic() {
    return "Library_Manager";
  }

  protected String addMacros(String path) {
    return MacrosFactory.projectDescriptor().shrinkPath(path, getAnchorFile());
  }

  protected String removeMacros(String path) {
    return MacrosFactory.projectDescriptor().expandPath(path, getAnchorFile());
  }

  private File getAnchorFile() {
    String projectUrl = myProject.getPresentableUrl();
    if (projectUrl != null) return new File(projectUrl);
    return new File(PathManager.getHomePath());
  }
}
