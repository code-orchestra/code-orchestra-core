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
package jetbrains.mps.project.structure.modules;

import java.util.ArrayList;
import java.util.List;

public class DevkitDescriptor extends ModuleDescriptor {
  private List<ModuleReference> myExportedLanguages;
  private List<ModuleReference> myExportedSolutions;
  private List<ModuleReference> myExtendedDevkits;

  public DevkitDescriptor() {
    super();
    myExportedLanguages = new ArrayList<ModuleReference>();
    myExportedSolutions = new ArrayList<ModuleReference>();
    myExtendedDevkits = new ArrayList<ModuleReference>();
  }

  public List<ModuleReference> getExportedLanguages() {
    return myExportedLanguages;
  }

  public List<ModuleReference> getExportedSolutions() {
    return myExportedSolutions;
  }

  public List<ModuleReference> getExtendedDevkits() {
    return myExtendedDevkits;
  }

  @Override
  public boolean updateModuleRefs() {
    return RefUpdateUtil.composeUpdates(
      super.updateModuleRefs(),
      RefUpdateUtil.updateModuleRefs(myExportedLanguages),
      RefUpdateUtil.updateModuleRefs(myExportedSolutions),
      RefUpdateUtil.updateModuleRefs(myExtendedDevkits)
    );
  }
}
