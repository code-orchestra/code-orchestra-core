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
package jetbrains.mps.project;

import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class ModuleContext extends StandaloneMPSContext {
  private static final Logger LOG = Logger.getLogger(ModuleContext.class);

  private Project myProject;

  //we need to store module reference this way because generator are recreated on every reload
  //and if we store generator reference here it will be stale
  private ModuleReference myModuleReference;

  public ModuleContext(@NotNull final IModule module, @NotNull final Project project) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        myModuleReference = module.getModuleReference();
      }
    });
    myProject = project;
  }

  @Deprecated
  public ModuleContext(@NotNull final IModule module, @NotNull final MPSProject project) {
    this(module, project.getProject());
  }

  public <T> T getComponent(Class<T> clazz) {
    T component = myProject.getComponent(clazz);
    if (component != null) return component;
    return super.getComponent(clazz);
  }

  public Project getProject() {
    return myProject;
  }

  public IModule getModule() {
    return MPSModuleRepository.getInstance().getModule(myModuleReference);
  }

  public boolean isValid() {
    return getModule() != null;
  }

  @NotNull
  public IScope getScope() {
    IModule module = getModule();
    if (module == null)
      throw new IllegalStateException("Mostly happens when some actions are performed 'later'. Look for 'later' invocations in stacktrace");
    return module.getScope();
  }

  public String toString() {
    return "module context: " + myModuleReference;
  }

  @Nullable
  public static ModuleContext create(final SNode node, Project project) {
    SModel model = ModelAccess.instance().runReadAction(new Computable<SModel>() {
      public SModel compute() {
        return node.getModel();
      }
    });
    return create(model, project);
  }

  @Nullable
  public static ModuleContext create(final SModel model, Project project) {
    SModelDescriptor modelDescriptor = ModelAccess.instance().runReadAction(new Computable<SModelDescriptor>() {
      public SModelDescriptor compute() {
        return model.getModelDescriptor();
      }
    });
    return create(modelDescriptor, project);
  }

  @Nullable
  public static ModuleContext create(@NotNull final SModelDescriptor model, Project project) {

    IModule owningModule = ModelAccess.instance().runReadAction(new Computable<IModule>() {
      public IModule compute() {
        return model.getModule();
      }
    });

    if (owningModule == null) {
      LOG.error("couldn't create module context for node:" +
        "\ncouldn't find owner module for model '" + model.getSModelReference() + "'");
      return null;
    }

    return new ModuleContext(owningModule, project);
  }
}
