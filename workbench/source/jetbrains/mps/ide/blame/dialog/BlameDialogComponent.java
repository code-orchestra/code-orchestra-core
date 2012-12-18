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
package jetbrains.mps.ide.blame.dialog;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.blame.dialog.BlameDialog.MyState;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import javax.swing.SwingUtilities;
import java.awt.Component;
import java.awt.Dialog;
import java.awt.Frame;

@State(
  name = "CharismaBlameDialog",
  storages = {
    @Storage(
      id = "other",
      file = "$APP_CONFIG$/charismaBlameDialog.xml"
    )
  }
)
public class BlameDialogComponent implements ApplicationComponent, PersistentStateComponent<BlameDialog.MyState> {
  private BlameDialog.MyState myDialogState = new MyState();

  @NonNls
  @NotNull
  public String getComponentName() {
    return "Charisma Error Reporter";
  }

  public void initComponent() {
  }

  public void disposeComponent() {
  }

  public MyState getState() {
    return myDialogState;
  }

  public void loadState(MyState state) {
    myDialogState = state;
  }

  public BlameDialog createDialog(Project project, Component component) {
    component = SwingUtilities.getRoot(component);

    BlameDialog result;
    if (component instanceof Dialog) {
      result = new BlameDialog(project, (Dialog) component);
    } else if (component instanceof Frame) {
      result = new BlameDialog(project, (Frame) component);
    } else {
      throw new IllegalArgumentException("Can't show on " + component);
    }

    result.loadState(myDialogState);
    return result;
  }

  public static BlameDialogComponent getInstance() {
    return ApplicationManager.getApplication().getComponent(BlameDialogComponent.class);
  }

}
