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

import jetbrains.mps.ide.ThreadUtils;
import jetbrains.mps.project.listener.ModelCreationListener;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;

public class LanguageAspectCreationListener extends ModelCreationListener {
  public boolean isApplicable(SModelDescriptor m) {
    return m.getModule() instanceof Language && ((Language) m.getModule()).getAspectForModel(m) != null;
  }

  public void onCreate(final SModelDescriptor model) {
    final EditableSModelDescriptor emd = ((EditableSModelDescriptor) model);
    Language language = (Language) model.getModule();
    LanguageAspect aspect = language.getAspectForModel(model);

    for (ModuleReference impLang : aspect.getAllLanguagesToImport(language)) {
      model.getSModel().addLanguage(impLang);
    }

    if (ThreadUtils.isEventDispatchThread()) {
      emd.save();
    } else {
      ModelAccess.instance().runWriteInEDT(new Runnable() {
        public void run() {
          emd.save();
        }
      });
    }
    language.setLanguageDescriptor(language.getModuleDescriptor(), false);
    language.save();
  }
}
