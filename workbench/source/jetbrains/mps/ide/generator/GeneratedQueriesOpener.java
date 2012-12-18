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
package jetbrains.mps.ide.generator;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.navigation.NavigationProvider;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.QueryMethodGenerated;

import java.io.File;
import java.lang.reflect.Method;

public class GeneratedQueriesOpener {

  public static boolean openQueryMethod(IOperationContext context, SNode node) {
    String modelName = node.getModel().getModelDescriptor().getLongName();

    Class cls;
    try {
      cls = QueryMethodGenerated.getQueriesGeneratedClassFor(node.getModel().getModelDescriptor(), true);
    } catch (ClassNotFoundException e) {
      return false;
    }

    for (Method m : cls.getMethods()) {
      if (m.getName().endsWith("_" + node.getId())) {
        for (NavigationProvider np : NavigationProvider.EP_NAME.getExtensions()) {
          if (np.openMethod(getProjectPath(context.getProject()), modelName + ".QueriesGenerated", m.getName(), m.getParameterTypes().length)) {
            return true;
          }
        }
        return false;
      }
    }

    return false;
  }

  private static String getProjectPath(Project p) {
    if (p == null) return null;

    File mpsProject = p.getComponent(MPSProject.class).getProjectFile();

    File projectFile = mpsProject.getParentFile();
    return projectFile.getAbsolutePath();
  }
}
