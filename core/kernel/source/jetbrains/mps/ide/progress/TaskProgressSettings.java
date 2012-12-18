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
package jetbrains.mps.ide.progress;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import jetbrains.mps.ide.progress.TaskProgressSettings.MyState;
import jetbrains.mps.logging.Logger;

import java.util.HashMap;
import java.util.Map;

@State(
  name = "TaskProgressSettings",
  storages = {
    @Storage(
      id = "other",
      file = "$APP_CONFIG$/taskProgressSettings.xml"
    )}
)
public class TaskProgressSettings implements PersistentStateComponent<MyState> {
  public static TaskProgressSettings getInstance() {
    return ApplicationManager.getApplication().getComponent(TaskProgressSettings.class);
  }

  private static final Logger LOG = Logger.getLogger(TaskProgressSettings.class);

  private MyState myState = new MyState();

  private long myDefaultTimeMillis = 150;

  public TaskProgressSettings() {

  }

  public long getEstimatedTimeMillis(String... taskNames) {
    long time = 0;
    for (String taskName : taskNames) {
      time = time + getEstimatedTimeMillis(taskName);
    }
    return time;
  }

  public long getEstimatedTimeMillis(String taskName) {
    Long time = myState.myTasksToEstimatedTime.get(taskName);
    if (time != null) {
      return time;
    } else {
      String taskKind = myState.myTasksToTaskKinds.get(taskName);
      if (taskKind != null) {
        Long kindTime = myState.myTaskKindsToEstimatedTime.get(taskKind);
        if (kindTime != null) return kindTime;
      }
    }
    return myDefaultTimeMillis;
  }

  public void registerTaskKind(String taskName, String taskKind) {
    myState.myTasksToTaskKinds.put(taskName, taskKind);
  }


  public void addEstimatedTimeMillis(String taskName, long estimatedTimeMillis) {
    String taskKind = myState.myTasksToTaskKinds.get(taskName);

    long newTime = estimatedTimeMillis;
    Long time = myState.myTasksToEstimatedTime.get(taskName);
    if (time != null) newTime = (time + 2 * newTime) / 3;
    myState.myTasksToEstimatedTime.put(taskName, newTime);

    if (taskKind != null) {
      long newKindTime = newTime;
      Long kindTime = myState.myTaskKindsToEstimatedTime.get(taskKind);
      if (kindTime != null) newKindTime = (kindTime + 2 * newKindTime) / 3;
      myState.myTaskKindsToEstimatedTime.put(taskKind, newKindTime);
    }
  }

  public MyState getState() {
    return myState;
  }

  public void loadState(MyState state) {
    myState = state;
  }

  public static class MyState {
    private Map<String, Long> myTasksToEstimatedTime = new HashMap<String, Long>();
    private Map<String, String> myTasksToTaskKinds = new HashMap<String, String>();
    private Map<String, Long> myTaskKindsToEstimatedTime = new HashMap<String, Long>();

    public Map<String, Long> getTasksToEstimatedTime() {
      return myTasksToEstimatedTime;
    }

    public void setTasksToEstimatedTime(Map<String, Long> tasksToEstimatedTime) {
      myTasksToEstimatedTime = tasksToEstimatedTime;
    }

    public Map<String, String> getTasksToTaskKinds() {
      return myTasksToTaskKinds;
    }

    public void setTasksToTaskKinds(Map<String, String> tasksToTaskKinds) {
      myTasksToTaskKinds = tasksToTaskKinds;
    }

    public Map<String, Long> getTaskKindsToEstimatedTime() {
      return myTaskKindsToEstimatedTime;
    }

    public void setTaskKindsToEstimatedTime(Map<String, Long> taskKindsToEstimatedTime) {
      myTaskKindsToEstimatedTime = taskKindsToEstimatedTime;
    }
  }
}
