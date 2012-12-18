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
package jetbrains.mps.refactoring.framework.paramchooser.mps.internal;

import com.intellij.ide.DataManager;
import com.intellij.ide.util.gotoByName.ChooseByNameModel;
import com.intellij.navigation.NavigationItem;
import com.intellij.openapi.actionSystem.DataContext;
import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.actions.SelectMembersDialog;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.refactoring.framework.RefactoringContext;
import jetbrains.mps.refactoring.framework.paramchooser.mps.IChooserSettings;
import jetbrains.mps.smodel.*;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.choose.models.BaseModelItem;
import jetbrains.mps.workbench.choose.models.BaseModelModel;
import jetbrains.mps.workbench.choose.modules.BaseModuleItem;
import jetbrains.mps.workbench.choose.modules.BaseModuleModel;

import java.util.ArrayList;
import java.util.List;

public abstract class ChooserType<T> {
  public abstract ChooseByNameModel createChooserModel(IChooserSettings<T> settings, RefactoringContext context, String paramName);

  protected List<T> filter(IChooserSettings<T> settings, List<T> list) {
    List<T> result = new ArrayList<T>();
    for (T entity : list) {
      if (settings.met(entity)) {
        result.add(entity);
      }
    }
    return result;
  }

  public static class ModelChooserType extends ChooserType<SModelReference> {
    public ModelChooserType() {
    }

    public ChooseByNameModel createChooserModel(final IChooserSettings<SModelReference> settings, final RefactoringContext context, final String paramName) {
      DataContext dataContext = DataManager.getInstance().getDataContext();
      final Project project = MPSDataKeys.PROJECT.getData(dataContext);

      return new BaseModelModel(project) {
        public NavigationItem doGetNavigationItem(final SModelReference ref) {
          return new BaseModelItem(ref) {
            public void navigate(boolean requestFocus) {
              context.setParameter(paramName, getModelReference());
            }
          };
        }

        public SModelReference[] find(boolean checkboxState) {
          List<SModelDescriptor> modelDescriptors = SModelRepository.getInstance().getModelDescriptors();
          List<SModelReference> modelReferencess = new ArrayList<SModelReference>(modelDescriptors.size());
          for (SModelDescriptor md:modelDescriptors) modelReferencess.add(md.getSModelReference());
          List<SModelReference> filteredModelRefs = filter(settings, modelReferencess);
          return filteredModelRefs.toArray(new SModelReference[filteredModelRefs.size()]);
        }

        public SModelReference[] find(IScope scope) {
          throw new UnsupportedOperationException("must not be used");
        }

        public boolean loadInitialCheckBoxState() {
          return false;
        }

        public String getPromptText() {
          return settings.getTitle();
        }
      };
    }
  }


  public static class ModuleChooserType extends ChooserType<IModule> {
    public ModuleChooserType() {
    }

    public ChooseByNameModel createChooserModel(final IChooserSettings<IModule> settings, final RefactoringContext context, final String paramName) {
      DataContext dataContext = DataManager.getInstance().getDataContext();
      final Project project = MPSDataKeys.PROJECT.getData(dataContext);

      return new BaseModuleModel(project, "module") {
        public NavigationItem doGetNavigationItem(final ModuleReference module) {
          return new BaseModuleItem(module) {
            public void navigate(boolean requestFocus) {
              context.setParameter(paramName, MPSModuleRepository.getInstance().getModule(module));
            }
          };
        }

        public ModuleReference[] find(boolean checkboxState) {
          List<IModule> modules = MPSModuleRepository.getInstance().getAllModules();
          List<ModuleReference> filteredModules = new ArrayList<ModuleReference>();
          for (IModule module : filter(settings, modules)){
            filteredModules.add(module.getModuleReference());
          }
          return filteredModules.toArray(new ModuleReference[filteredModules.size()]);
        }

        public ModuleReference[] find(IScope scope) {
          throw new UnsupportedOperationException("must not be used");
        }

        public boolean loadInitialCheckBoxState() {
          return false;
        }

        public String getPromptText() {
          return settings.getTitle();
        }
      };
    }
  }
}
