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

import jetbrains.mps.project.structure.model.ModelRootManager;

public class StubPath {
  private String myPath;
  private ModelRootManager myManager;

  public StubPath(String path, ModelRootManager manager) {
    myPath = path;
    myManager = manager;
  }

  public String getPath() {
    return myPath;
  }

  public void setPath(String path) {
    myPath = path;
  }

  public ModelRootManager getManager() {
    return myManager;
  }

  public void setManager(ModelRootManager manager) {
    myManager = manager;
  }

  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    StubPath stubPath = (StubPath) o;

    if (myManager != null ? !myManager.equals(stubPath.myManager) : stubPath.myManager != null) return false;
    if (myPath != null ? !myPath.equals(stubPath.myPath) : stubPath.myPath != null) return false;

    return true;
  }

  public int hashCode() {
    int result = myPath != null ? myPath.hashCode() : 0;
    result = 31 * result + (myManager != null ? myManager.hashCode() : 0);
    return result;
  }

  public String toString() {
    return myPath + "{" + myManager.getClassName() + '}';
  }
}
