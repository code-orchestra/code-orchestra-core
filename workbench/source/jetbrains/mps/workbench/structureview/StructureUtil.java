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
package jetbrains.mps.workbench.structureview;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import jetbrains.mps.plugins.projectplugins.ProjectPluginManager;
import jetbrains.mps.smodel.SNode;

import java.util.ArrayList;
import java.util.List;

public abstract class StructureUtil {
  public static List<EditorTabDescriptor> getApplicableTabs(Project p, SNode node) {
    List<EditorTabDescriptor> result = new ArrayList<EditorTabDescriptor>();
    List<EditorTabDescriptor> tabs = p.getComponent(ProjectPluginManager.class).getTabDescriptors();
    for (EditorTabDescriptor tab : tabs) {
      if (!tab.isApplicable(node)) continue;
      result.add(tab);
    }
    return result;
  }
}
