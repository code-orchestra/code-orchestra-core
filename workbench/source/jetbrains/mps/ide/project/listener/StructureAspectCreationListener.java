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
package jetbrains.mps.ide.project.listener;

import jetbrains.mps.ide.findusages.UsagesViewTracker;
import jetbrains.mps.ide.hierarchy.HierarchyViewTool;
import jetbrains.mps.project.listener.ModelCreationListener;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.smodel.LanguageAspect;
import jetbrains.mps.smodel.SModelDescriptor;

public class StructureAspectCreationListener extends ModelCreationListener {
  public boolean isApplicable(SModelDescriptor m) {
    return m.getModule() instanceof Language && LanguageAspect.STRUCTURE.equals(((Language) m.getModule()).getAspectForModel(m));
  }

  public void onCreate(SModelDescriptor m) {
    for (HierarchyViewTool tool : UsagesViewTracker.getHierarchyTools()) {
      tool.onCreateStructureModel(m);
    }
  }
}
