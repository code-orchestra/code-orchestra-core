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
package jetbrains.mps.project.structure.project;

import jetbrains.mps.project.structure.project.testconfigurations.BaseTestConfiguration;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class ProjectDescriptor {
  private static final Comparator<Path> MODULE_BY_PATH_COMPARATOR = new Comparator<Path>() {
    public int compare(Path p1, Path p2) {
      return p1.isSamePath(p2) ? 0 : -1;
    }
  };

  private String myName = "";
  private List<Path> myModules = new ArrayList<Path>();
  private List<BaseTestConfiguration> myTestConfigurations = new ArrayList<BaseTestConfiguration>();

  public String getName() {
    return myName;
  }

  public void setName(String name) {
    myName = name;
  }

  public List<Path> getModules() {
    return myModules;
  }

  public void addModule(String path) {
    addModule(new Path(path));
  }

  public void addModule(Path path) {
    add(myModules, path, MODULE_BY_PATH_COMPARATOR);
  }

  public void removeModule(String path) {
    remove(myModules, new Path(path), MODULE_BY_PATH_COMPARATOR);
  }

  public List<BaseTestConfiguration> getTestConfigurations() {
    return myTestConfigurations;
  }

  private static <T> T add(List<T> list, T object, Comparator<T> comp) {
    int i = 0;
    for (; i < list.size(); i++) {
      T item = list.get(i);
      if (comp.compare(item, object) == 0) {
        list.set(i, object);
        return object;
      }
    }
    if (i == list.size()) {
      list.add(object);
      return object;
    }

    throw new RuntimeException("can't happen");
  }

  private static <T> T remove(List<T> list, T object, Comparator<T> comp) {
    int index = -1;
    for (int i = 0; i < list.size(); i++) {
      T item = list.get(i);
      if (comp.compare(item, object) == 0) {
        index = i;
        break;
      }
    }
    if (index != -1) {
      return list.remove(index);
    }
    return null;
  }
}
