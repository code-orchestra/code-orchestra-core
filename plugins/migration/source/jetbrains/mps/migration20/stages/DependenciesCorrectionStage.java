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
package jetbrains.mps.migration20.stages;

import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.openapi.wm.WindowManager;
import jetbrains.mps.library.BootstrapLanguages_DevKit;
import jetbrains.mps.library.GeneralPurpose_DevKit;
import jetbrains.mps.library.LanguageDesign_DevKit;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;

public class DependenciesCorrectionStage implements MigrationStage {
  public String title() {
    return "Dependencies Fixup";
  }

  public void execute(MPSProject p) {
    for (Language lang : p.getProjectModules(Language.class)) {
      lang.addUsedDevkit(LanguageDesign_DevKit.MODULE_REFERENCE);
      lang.save();
    }
    for (Language l : p.getProjectModules(Language.class)) {
      for (SModelDescriptor aspect : l.getAspectModelDescriptors()) {
        SModel sModel = aspect.getSModel();
        sModel.addDevKit(GeneralPurpose_DevKit.MODULE_REFERENCE);
        sModel.deleteDevKit(LanguageDesign_DevKit.MODULE_REFERENCE);
        if (sModel.importedDevkits().contains(BootstrapLanguages_DevKit.MODULE_REFERENCE)) {
          sModel.deleteDevKit(BootstrapLanguages_DevKit.MODULE_REFERENCE);
        }
      }
    }
    for (SModelDescriptor model : p.getProjectModels()) {
      if (!(model instanceof EditableSModelDescriptor)) continue;
      if (model.getModule() == null) continue;
      new MissingDependenciesFixer(WindowManager.getInstance().getFrame(p.getProject()), model).fix(false);
    }
    SModelRepository.getInstance().saveAll();
    ClassLoaderManager.getInstance().reloadAll(new EmptyProgressIndicator());
  }

  public boolean needsCommand() {
    return true;
  }

  public String messageBefore() {
    return "Since there were some problems with module dependencies in MPS 1.5, that are now fixed, module imports should be changed correspondingly";
  }

  public String messageAfter() {
    return null;
  }
}
