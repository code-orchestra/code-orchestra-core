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

import jetbrains.mps.project.listener.ModelCreationListener;
import jetbrains.mps.smodel.BootstrapLanguages;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SModelStereotype;

public class TestsModelCreationListener extends ModelCreationListener {
  public boolean isApplicable(SModelDescriptor model) {
    return SModelStereotype.isTestModel(model);
  }

  public void onCreate(SModelDescriptor model) {
    if (!model.getModule().getUsedLanguagesReferences().contains(BootstrapLanguages.UNITTEST)) {
      model.getModule().addUsedLanguage(BootstrapLanguages.UNITTEST);
    }
    model.getSModel().addLanguage(BootstrapLanguages.UNITTEST);
  }
}
