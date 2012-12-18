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

import com.intellij.openapi.components.*;
import com.intellij.openapi.project.Project;
import jetbrains.mps.project.MPSProjectVersion.MyState;
import org.jetbrains.annotations.NotNull;

@State(
  name = "ProjectVersion",
  storages = {
    @Storage(
      id = "other",
      file = "$PROJECT_FILE$"
    )
  }
)
public class MPSProjectVersion extends AbstractProjectComponent implements PersistentStateComponent<MyState>{
  public static final String CURRENT = "2.0";
  private String myVersion = "1.5";

  protected MPSProjectVersion(Project project) {
    super(project);
  }

  public MyState getState() {
    MyState res = new MyState();
    res.version = myVersion;
    return res;
  }

  public void loadState(MyState state) {
    myVersion = state.version;
  }

  public String getVersion() {
    return myVersion;
  }

  public void setVersion(String version) {
    myVersion = version;
  }

  public static class MyState{
    public String version;
  }
}
