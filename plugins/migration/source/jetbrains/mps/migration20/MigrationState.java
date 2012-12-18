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
package jetbrains.mps.migration20;

import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.startup.StartupManager;
import com.intellij.openapi.ui.Messages;
import jetbrains.mps.InternalFlag;
import jetbrains.mps.migration20.MigrationState.MyState;
import jetbrains.mps.project.MPSProjectVersion;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

@State(
  name = "MigrationState",
  storages = {
    @Storage(
      id = "other",
      file = "$PROJECT_FILE$"
    )
  }
)
public class MigrationState implements PersistentStateComponent<MyState>, ProjectComponent {
  private MState myState = MState.INITIAL;
  private Project myProject;
  private MPSProjectVersion myVersion;

  public MigrationState(Project project, MPSProjectVersion version) {
    myProject = project;
    myVersion = version;
  }

  public MState getMigrationState() {
    return myState;
  }

  public void setMigrationState(MState state) {
    myState = state;
    if (myState == MState.DONE) {
      myVersion.setVersion(MPSProjectVersion.CURRENT);
    }
  }

  //----------load/save stuff-------------

  public MyState getState() {
    MyState state = new MyState();
    state.myState = myState.name();
    return state;
  }

  public void loadState(MyState state) {
    try {
      setMigrationState(MState.valueOf(state.myState));
    } catch (IllegalArgumentException e) {
      setMigrationState(MState.INITIAL);
    }
  }

  public static class MyState {
    public String myState = MState.INITIAL.name();
  }

  //----------component stuff-------------

  @CodeOrchestraPatch
  public void projectOpened() {
    // RE-2300

    /*
    if (myState != MState.INITIAL) return;
    if (myVersion.getVersion().equals(MPSProjectVersion.CURRENT)) return;
    StartupManager.getInstance(myProject).registerPostStartupActivity(new Runnable() {
      public void run() {
        String message = "MPS detected that this project contains old code that was not migrated to MPS 2.0.\n" +
          "If the code is not migrated, many references will be broken and code will not be generatable.\n" +
          "It is suggested to perform the migration right now or just after the project is opened by executing MainMenu -> Tools -> Start Migration to MPS 2.0";

        List<String> variants = new ArrayList<String>();
        variants.add("Start");
        variants.add("Later");
        if (InternalFlag.isInternalMode()) {
          variants.add("Already migrated");
        }

        int res = Messages.showDialog(myProject,
          message,
          "Migration to 2.0",
          variants.toArray(new String[variants.size()]), 0, Messages.getQuestionIcon()
        );
        if (res == 2) {
          setMigrationState(MState.DONE);
        }
        if (res != 0) return;
        new MigrationHelper(myProject).migrate();
      }
    });
    */
  }

  public void projectClosed() {

  }

  public void initComponent() {

  }

  public void disposeComponent() {

  }

  @NotNull
  public String getComponentName() {
    return MigrationState.class.getSimpleName();
  }
}
