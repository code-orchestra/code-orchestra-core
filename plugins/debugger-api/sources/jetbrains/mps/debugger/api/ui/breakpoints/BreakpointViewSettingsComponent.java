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
package jetbrains.mps.debugger.api.ui.breakpoints;

import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.ui.MPSTree.TreeState;
import org.jetbrains.annotations.NotNull;

@State(
  name = "BreakpointViewSettings",
  storages = {
    @Storage(
      id = "other",
      file = "$WORKSPACE_FILE$"
    )
  }
)
public class BreakpointViewSettingsComponent implements PersistentStateComponent<BreakpointViewSettingsComponent.MyState>, ProjectComponent {
  private MyState myState = new MyState();

  public static BreakpointViewSettingsComponent getInstance(Project project) {
    return  project.getComponent(BreakpointViewSettingsComponent.class); 
  }

  @Override
  public MyState getState() {
    return myState;
  }

  @Override
  public void loadState(MyState state) {
    myState = state;
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
    return "Breakpoints Settings";
  }

  @Override
  public void initComponent() {
  }

  @Override
  public void disposeComponent() {
  }

  public int getViewIndex() {
    return myState.myViewIndex;
  }

  public void setViewIndex(int viewIndex) {
    myState.myViewIndex = viewIndex;
  }

  public boolean isGroupByModule() {
    return myState.myGroupByModule;
  }

  public void setGroupByModule(boolean groupByModule) {
    myState.myGroupByModule = groupByModule;
  }

  public boolean isGroupByModel() {
    return myState.myGroupByModel;
  }

  public void setGroupByModel(boolean groupByModel) {
    myState.myGroupByModel = groupByModel;
  }

  public boolean isGroupByRoot() {
    return myState.myGroupByRoot;
  }

  public void setGroupByRoot(boolean groupByRoot) {
    myState.myGroupByRoot = groupByRoot;
  }

  public TreeState getTreeState() {
    return myState.myTreeState;
  }

  public void setTreeState(TreeState treeState) {
    myState.myTreeState = treeState;
  }

  public static class MyState {
    public int myViewIndex = 0;
    public boolean myGroupByModule = true;
    public boolean myGroupByModel = true;
    public boolean myGroupByRoot = true;
    public TreeState myTreeState;
  }
}
