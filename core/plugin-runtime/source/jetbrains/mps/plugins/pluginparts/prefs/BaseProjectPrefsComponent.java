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
package jetbrains.mps.plugins.pluginparts.prefs;

import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.project.Project;

import jetbrains.mps.project.MPSProject;
import org.jdom.Element;

import java.util.ArrayList;
import java.util.List;

public abstract class BaseProjectPrefsComponent implements PersistentStateComponent<Element> {
  private List<BasePrefsPage> myPages = new ArrayList<BasePrefsPage>();
  private Project myProject;

  protected BaseProjectPrefsComponent(Project project) {
    myProject = project;
  }

  public List<BasePrefsPage> getPages() {
    return myPages;
  }

  public Project getProject() {
    return myProject;
  }

  public MPSProject getMPSProject() {
    return myProject.getComponent(MPSProject.class);
  }

  public void init() {
    myPages = createPages();
    for (BasePrefsPage page : myPages) {
      page.register();
    }
  }

  public void dispose() {
    for (BasePrefsPage page : myPages) {
      page.unregister();
    }
    myPages.clear();
  }

  protected abstract List<BasePrefsPage> createPages();
}
