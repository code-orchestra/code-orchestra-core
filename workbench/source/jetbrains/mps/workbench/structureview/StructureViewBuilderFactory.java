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

import com.intellij.ide.structureView.StructureViewBuilder;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import jetbrains.mps.plugins.projectplugins.ProjectPluginManager;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import org.jetbrains.annotations.NotNull;

import java.util.List;

public class StructureViewBuilderFactory implements ProjectComponent {
  private Project myProject;

  public StructureViewBuilderFactory(Project project) {
    myProject = project;
  }

  public StructureViewBuilder create(final SNodePointer np) {
    return ModelAccess.instance().runReadAction(new Computable<StructureViewBuilder>() {
      public StructureViewBuilder compute() {
        List<EditorTabDescriptor> tabs = myProject.getComponent(ProjectPluginManager.class).getTabDescriptors();
        SNode node = np.getNode();
        for (EditorTabDescriptor tab : tabs) {
          SNode baseNode = tab.getBaseNode(node);
          if (baseNode != null && baseNode.getName()!=null) {
            return new NodeStructureViewBuilder(myProject, new SNodePointer(baseNode));
          }
        }

        return null;
      }
    });
  }

  public void projectOpened() {

  }

  public void projectClosed() {

  }

  public void initComponent() {

  }

  public void disposeComponent() {

  }

  @NotNull
  public String getComponentName() {
    return StructureViewBuilderFactory.class.getName();
  }
}
